
;; SRFI-4 Scheme Matrix Library in libgde
;; Edited by BIS

(declare (uses libgde_vector))
(declare (unit libgde_matrix))
(use srfi-1 srfi-4)

;; SYNTAX
(define-syntax matrix4-iterator
  (lambda (form rename compare)
    (let ( (itr (cadr form))
           (cmd (cddr form)) )
     `(do ((,itr 0 (+ ,itr 1)))
          ((= ,itr 16))
          ,@cmd))))

(define-syntax matrix4-iterator-map
  (lambda (form rename compare)
    (let ( (itr (cadr form))
           (cmd (cddr form))
           (out (gensym)) )
      `(let ( (,out (make-mat4)) )
         (matrix4-iterator ,itr (f32vector-set! ,out ,itr (begin ,@cmd)))
         ,out))))

(define (matrix4-apply proc idx mats)
  (apply proc (map (lambda (i) (f32vector-ref i idx)) mats)))

;; Matrix 4x4
(define (mat4? m)
  (and (f32vector? m) (= (f32vector-length m) 16)))

(define (make-mat4 . fill)
  (if (null? fill)
    (make-f32vector 16 0)
    (make-f32vector 16 (car fill))))

(define (mat4-copy m)
  (matrix4-iterator-map i (f32vector-ref m i)))

(define (mat4-add . mats)
  (matrix4-iterator-map i
    (matrix4-apply + i mats)))

(define (mat4-sub . mats)
  (matrix4-iterator-map i
    (matrix4-apply - i mats)))

(define (mat4-add! . mats)
  (matrix4-iterator i
    (f32vector-set! (car mats) i
      (matrix4-apply + i mats))))

(define (mat4-sub! . mats)
  (matrix4-iterator i
    (f32vector-set! (car mats) i
      (matrix4-apply - i mats))))

(define (mat4-mul . mats)
  (let-syntax
    ((multiply (lambda (form rename compar)
      (let ( (sa (cadr form)) (sb (caddr form)) )
        (define (a-index i j) (+ j (* 4 (inexact->exact (floor (/ i 4))))))
        (define (b-index i j) (+ (modulo i 4) (* j 4)))
        (define (tabulate-map i proc)
          (map proc (list-tabulate i values)))
        (define (element-list)
          (define (i-loop i)
            (define (j-loop j)
              `(* (f32vector-ref ,sa ,(a-index i j))
                  (f32vector-ref ,sb ,(b-index i j))))
            `(+ ,@(tabulate-map 4 j-loop)))
          (tabulate-map 16 i-loop))
        `(f32vector ,@(element-list))))))
    (fold-right (lambda (a b) (multiply a b)) mat4-identity mats)))

(define (mat4-transpose m)
  (define ($m i) (f32vector-ref m i))
  (f32vector
    ($m 0) ($m 4) ($m 8) ($m 12)
    ($m 1) ($m 5) ($m 9) ($m 13)
    ($m 2) ($m 6) ($m 10) ($m 14)
    ($m 3) ($m 7) ($m 11) ($m 15)))

(define (mat4-inverse m)
  (define ($m i) (f32vector-ref m i))
  '())

(define (mat4-translate x y z)
  (f32vector
    1. 0. 0. x
    0. 1. 0. y
    0. 0. 1. z
    0. 0. 0. 1.))

(define (vec3->mat4-translate v)
  (mat4-translate
    (f32vector-ref v 0)
    (f32vector-ref v 1)
    (f32vector-ref v 2)))


(define (mat4-scale x y z)
  (f32vector
    x  0. 0. 0.
    0. y  0. 0.
    0. 0. z  0.
    0. 0. 0. 1.))

(define (mat4-yaw-pitch-roll y p r)
  (f32vector
    (* (cos r) (cos p))
    (- (* (cos r) (sin p) (sin y)) (* (sin r) (cos y)))
    (+ (* (cos r) (sin p) (cos y)) (* (sin r) (sin y)))
    0
    (* (sin r) (cos p))
    (+ (* (sin r) (sin p) (sin y)) (* (cos r) (cos y)))
    (- (* (sin r) (sin p) (cos y)) (* (cos r) (sin y)))
    0
    (- (sin p))
    (* (cos p) (sin y))
    (* (cos p) (cos y))
    0
    0
    0
    0
    1))

(define (mat4-rotate-z r)
  (f32vector
    (cos r) (- (sin r)) 0 0
    (sin r)     (cos r) 0 0
          0           0 1 0
          0           0 0 1))

(define (mat4-lookup eye at up)
  (let* ( (z (vec3-normalize (vec3-sub at eye)))
          (x (vec3-normalize (vec3-cross up z)))
          (y (vec3-cross x x)) )
    (f32vector
      (f32vector-ref x 0) (f32vector-ref y 0) (f32vector-ref z 0) 0
      (f32vector-ref x 1) (f32vector-ref y 1) (f32vector-ref z 1) 0
      (f32vector-ref x 2) (f32vector-ref y 2) (f32vector-ref z 2) 0
      (- (vec3-dot eye x)) (- (vec3-dot eye y)) (- (vec3-dot eye z)) 1)))

(define (mat4-perspective fovy aspect near far)
  (let* ( (sy (/ (tan fovy)))
          (sx (/ sy aspect))
          (sz (/ far (- far near))) )
    (f32vector
      sx 0. 0. 0.
      0. sy 0. 0.
      0. 0. sz 1.
      0. 0. (- (* sz near)) 0.)))

(define (mat4-ortho w h zn zf)
  (f32vector
    (/ 2 w)       0                0 0
          0 (/ 2 h)                0 0
          0       0    (/ (- zf zn)) 0
          0       0 (/ zn (- zn zf)) 1))

(define mat4-identity
  '#f32(1. 0. 0. 0.
        0. 1. 0. 0.
        0. 0. 1. 0.
        0. 0. 0. 1.))

