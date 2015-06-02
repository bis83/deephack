;;
;; wavefront obj format ?
;;
;; # - comment line
;; mtllib - material library filename
;; o - object declaration
;; g - group declaration
;; v - a vertex position data
;; vn - a vertex normal data 
;; vt - a vertex texture coord data
;; f - face data ( pos-index/coord-index/norm-index )
;; usemtl - material name
;; s - smooth on/off
;;
;; newmtl - material name
;; Ka - ambient
;; Kd - diffuse
;; Ks - specular
;; Ns - specular conefficient
;; Ni - shiness
;; Tr or d - transparent
;; illum - illumination model
;; map_xxx - texture map name (only support map_Kd)
;;
;; Reading Object
;; RO is wavefront-obj reading data format.
;; It will be converted to scheme-obj.
;; [ scheme-obj will be converted to gl:model ]
;; ( vlist:(x y z)
;;   nlist:(x y z)
;;   tlist:(u v)
;;   objlist:(obj-name
;;            mat-name
;;            facelist:(v t n))
;;   mtllist:(mtl-name (Ka Kd Ks Ns Ni Tr map_Kd)) )
;;
;; scheme-obj
;; will be contverted to gl:model
;; ( ( (Obj-Name #f32-Vsrc #u16-Isrc v-type mtl-id center-pos) ... )
;;   ( (Mtl-Name #f32(Ka:rgb Kd:rgb Ks:rgb Ns Ni Tr) texture-name) ... ) )
;;

(use extras srfi-1 srfi-4 srfi-13 srfi-14)

(define (string->face str)
  (let ( [type6 (string-contains str "//")] )
    (if type6
      (set! str (string-replace str type6 (+ type6 1) " 0 ")))
    (map string->number (string-tokenize str char-set:digit))))

(define (vertex-type sample)
  (cond
    ((= (length sample) 1) 0)
    ((= (length sample) 2) (if (zero? (cadr sample)) 1 2))
    (else 3)))

(define (mtl-matrix mtl-param)
  (define (Kx match)
    (cdr (or (find (cut command=? match <>) mtl-param) '(0 1 1 1))))
  (define (X match)
    (cadr (or (find (cut command=? match <>) mtl-param) '(0 1))))
  (list->f32vector (append (Kx "Ka") (Kx "Kd") (Kx "Ks") (list (X "Ns") (X "Ni") (X "d")))))

(define (mtl-texture mtl-param)
  (let ( [a (find command-map_Kd? mtl-param)] )
    (if a (cadr a) '())))

(define (scope pred l)
  (+ 1 (or (list-index command-o? (cdr l))
           (length (cdr l)))))

(define (filtering* src . preds)
  (if (null? preds) src
    (apply filtering* ((car preds) src) (cdr preds))))

(define (command=? cmd-name cmd) (string= (car cmd) cmd-name))
(define (command-o? cmd) (command=? "o" cmd))
(define (command-f? cmd) (command=? "f" cmd))
(define (command-mtllib? cmd) (command=? "mtllib" cmd))
(define (command-usemtl? cmd) (command=? "usemtl" cmd))
(define (command-newmtl? cmd) (command=? "newmtl" cmd))
(define (command-map_Kd? cmd) (command=? "map_Kd" cmd))

(define (filter-buffer match commands)
  (filtering* commands
    (lambda (i) (filter (cut command=? match <>) i))
    (lambda (i) (map cdr i))
    (lambda (i) (map (cut map string->number <>) i))))

(define (filter-object commands)
  (define (command-o cmd)
    (define (command-o-body start)
      (define (command-o-facelist)
        (filtering* start
          (lambda (i) (take i (scope command-o? i)))
          (lambda (i) (filter command-f? i))
          (lambda (i) (map cdr i))
          (lambda (i) (map (cut map string->face <>) i))))
      (list
        (cadr cmd)
        (cadr (find command-usemtl? start))
        (command-o-facelist)))
    (and
      (command-o? cmd)
      (command-o-body (memq cmd commands))))
  (filter-map command-o commands))

(define (filter-material commands)
  (define (command-mtllib cmd)
    (and
      (command-mtllib? cmd)
      (call-with-input-file (cadr cmd) read-wavfront-mtl)))
  (apply append (filter-map command-mtllib commands)))

(define (filter-newmtl commands)
  (define (command-newmtl cmd)
    (define (command-newmtl-body start)
      (define (command-newmtl-params)
        (filtering* start
          (lambda (i) (take i (scope command-newmtl? i)))
          (lambda (i) (remove command-newmtl? i))
          (lambda (i)
            (map
              (lambda (j)
                (if (command-map_Kd? j) j
                  (cons (car j) (map string->number (cdr j)))))
              i))))
      (list
        (cadr cmd)
        (command-newmtl-params)))
    (and
      (command-newmtl? cmd)
      (command-newmtl-body (memq cmd commands))))
  (filter-map command-newmtl commands))

(define (read-commands port)
  (remove null? (map string-tokenize (read-lines port))))

(define (read-wavfront-obj port)
  (let ( [commands (read-commands port)] )
    (list
      (filter-buffer "v" commands)
      (filter-buffer "vn" commands)
      (filter-buffer "vt" commands)
      (filter-object commands)
      (filter-material commands))))

(define (read-wavfront-mtl port)
  (let ( [commands (read-commands port)] )
    (filter-newmtl commands)))

(define (calc-index-dictionary object)
  (remove null? (apply lset-union equal? (caddr object))))

(define (calc-center-position index-dictionary positions)
  (define (sum-xyz)
    (fold (lambda (a b) (map + a b)) '(0 0 0)
      (map
        (lambda (idx) (list-ref positions (- (car idx) 1)))
          index-dictionary)))
  (map / (sum-xyz) (make-list 3 (length index-dictionary))))

(define (scheme-obj positions normals coords objects materials)
  (define (mtl-id mtl-name)
    (list-index (cut command=? mtl-name <>) materials))
  (define (scheme-obj-obj obj)
    (let* ( [index-dictionary (calc-index-dictionary obj)]
            [center-position (calc-center-position index-dictionary positions)] )
      (define (cons-vertex point)
        (define (filter-vertex idx type)
          (or
            (zero? idx)
            (case type
              ((0) (map - (list-ref positions (- idx 1)) center-position))
              ((1) (list-ref coords (- idx 1)))
              ((2) (list-ref normals (- idx 1))))))
        (filtering* point
          (lambda (i) (filter-map filter-vertex i (iota (length i))))
          (lambda (i) (apply append i))))
      (define (vertex-buffer)
        (filtering* index-dictionary
          (lambda (i) (map cons-vertex i))
          (lambda (i) (apply append i))
          (lambda (i) (list->f32vector i))))
      (define (index point)
        (list-index (lambda (i) (equal? i point)) index-dictionary))
      (define (index-buffer)
        (filtering* (caddr obj)
          (lambda (i) (map (lambda (face) (map index face)) i))
          (lambda (i) (apply append i))
          (lambda (i) (list->u16vector i))))
      (list
        (car obj)
        (vertex-buffer)
        (index-buffer)
        (vertex-type (caar (caddr obj)))
        (mtl-id (cadr obj))
        (list->f32vector center-position))))
  (define (scheme-obj-mtl mtl)
    (list
      (car mtl)
      (mtl-matrix (cadr mtl))
      (mtl-texture (cadr mtl))))
  (list
    (map scheme-obj-obj objects)
    (map scheme-obj-mtl materials)))

(define (reading-obj->scheme-obj reading-obj)
  (apply scheme-obj reading-obj))

(define (wavfront-obj->scheme-obj filepath)
  (reading-obj->scheme-obj (call-with-input-file filepath read-wavfront-obj)))

;; Entry Point
(when (= (length (argv)) 3)
  (call-with-output-file (caddr (argv))
    (lambda (out)
      (display
        (wavfront-obj->scheme-obj (cadr (argv)))
        out))))

