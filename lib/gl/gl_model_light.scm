
(declare (unit libgl3_model))
(declare (uses libgde_matrix libsdl2_image libgl3_compile))

(use srfi-4)

(foreign-declare "#include <GL/glew.h>")

(include "gl_enum")

(define gl:model:program 0)
(define gl:model:uniform! '())

(define (gl:model:init)
  ;; Init Program
  (set! gl:model:program
    (gl:linkage
      (lambda (program)
        (gl:attrib-location! program 0 "pos")
        (gl:attrib-location! program 1 "coord")
        (gl:frag-data-location! program 0 "fragColor"))
      (gl:compile gl:vertex-shader
        "#version 330
         in vec3 pos;
         in vec2 coord;
         out vec2 uv;
         uniform mat4 trans;
         uniform mat4 proj;
         void main() {
           gl_Position = proj * trans * vec4(pos, 1);
           uv = coord;
         }")
      (gl:compile gl:fragment-shader
        "#version 330
         in vec2 uv;
         out vec4 fragColor;
         uniform sampler2D tex;
         void main() {
           fragColor = texture(tex, vec2(uv.x, 1-uv.y));
         }")))
  ;; Init Uniform Function
  (let ( [location-trans (gl:get-uniform-location gl:model:program "trans")]
         [location-proj (gl:get-uniform-location gl:model:program "proj")]
         [location-tex (gl:get-uniform-location gl:model:program "tex")]
         [projection (mat4-ortho 640 480 0 100)] )
    (set! gl:model:uniform!
      (lambda (trans tex)
        (gl:active-texture! 0)
        (gl:bind-texture! gl:texture-2d tex)
        (gl:uniform1i location-tex 0)
        (gl:uniform-matrix4fv location-proj 1 #t projection)
        (gl:uniform-matrix4fv location-trans 1 #t trans)))))

(define (gl:model:objlist model) (vector-ref model 0))
(define (gl:model:mtllist model) (vector-ref model 1))

(define (gl:model:obj:name obj) (vector-ref obj 0))
(define (gl:model:obj:vbuffer obj) (vector-ref obj 1))
(define (gl:model:obj:ibuffer obj) (vector-ref obj 2))
(define (gl:model:obj:vao obj) (vector-ref obj 3))
(define (gl:model:obj:icount obj) (vector-ref obj 4))
(define (gl:model:obj:center obj) (vector-ref obj 5))
(define (gl:model:obj:vtype obj) (vector-ref obj 6))
(define (gl:model:obj:matid obj) (vector-ref obj 7))

(define (gl:model:mtl:name mtl) (vector-ref mtl 0))
(define (gl:model:mtl:tex mtl) (vector-ref mtl 1))

;;
;; ( obj-list:( name #v #i vt mi #c )
;;   mtl-list:( name #mm tex ) )
;; 0=pos 1=pos,norm 2=pos,coord 3=pos,coord,norm
;;
(define (gl:model:obj:new obj)
  (define (make-vbuffer)
    (let ( [buf (gl:make-buffer)] )
      (gl:bind-buffer! gl:array-buffer buf)
      (gl:buffer-data!
        gl:array-buffer
        (* (f32vector-length (cadr obj)) (foreign-type-size float))
        (f32vector->blob/shared (cadr obj))
        gl:static-draw)
      buf))
  (define (make-ibuffer)
    (let ( [buf (gl:make-buffer)] )
      (gl:bind-buffer! gl:element-array-buffer buf)
      (gl:buffer-data!
        gl:element-array-buffer
        (* (u16vector-length (caddr obj)) (foreign-type-size short))
        (u16vector->blob/shared (caddr obj))
        gl:static-draw)
      buf))
  (define (make-vao v i)
    (let ( [vao (gl:make-vertex-array)] )
      (gl:bind-vertex-array! vao)
      (gl:bind-buffer! gl:array-buffer v)
      (gl:bind-buffer! gl:element-array-buffer i)
      (gl:enable-vertex-attrib-array! 0)
      (gl:enable-vertex-attrib-array! 1)
      (gl:vertex-attrib-pointer! 0 3 gl:float #f 20 0)
      (gl:vertex-attrib-pointer! 1 2 gl:float #f 20 12)
      (gl:bind-vertex-array! 0)
      vao))
  (let* ( [vbuffer (make-vbuffer)]
          [ibuffer (make-ibuffer)]
          [vao (make-vao vbuffer ibuffer)] )
    (vector
      (car obj)
      vbuffer
      ibuffer
      vao
      (u16vector-length (caddr obj))
      (vec3->mat4-translate (list-ref obj 5))
      (list-ref obj 3)
      (list-ref obj 4))))

(define (gl:model:mtl:new mtl)
  (define (filepath a)
    (if (symbol? a) (symbol->string a) a))
  (define (make-texture tex)
    (and
      (not (null? tex))
      (sdl:image:load (filepath tex))))
  (vector
    (car mtl)
    (make-texture (caddr mtl))))

(define (gl:model:new scheme-obj)
  (vector
    (map gl:model:obj:new (car scheme-obj))
    (list->vector (map gl:model:mtl:new (cadr scheme-obj)))))

(define (gl:model:free! model)
  (for-each
    (lambda (obj)
      (if (= 0 (gl:model:obj:vbuffer obj))
        (gl:free-buffer! (gl:model:obj:vbuffer)))
      (if (= 0 (gl:model:obj:ibuffer obj))
        (gl:free-buffer! (gl:model:obj:ibuffer)))
      (if (= 0 (gl:model:obj:vao obj))
        (gl:free-vertex-array! (gl:model:obj:vao))))
    (gl:model:objlist model))
  (for-each
    (lambda (mtl)
      (unless (null? (gl:model:mtl:tex mtl))
        (gl:free-texture! (gl:model:mtl:tex mtl))))
    (vector->list (gl:model:mtllist model))))

(define (gl:model:obj:draw obj)
  (gl:bind-vertex-array! (gl:model:obj:vao obj))
  (gl:draw-elements!
    gl:triangles
    (gl:model:obj:icount obj)
    gl:unsigned-short
    0)
  (gl:bind-vertex-array! 0))

(define (gl:model:mtl:bind! trans mtl)
  (gl:model:uniform! trans (gl:model:mtl:tex mtl)))

(define (gl:model:draw model trans)
  (gl:use-program! gl:model:program)
  (for-each
    (lambda (obj)
      (gl:model:mtl:bind!
        (mat4-mul trans (gl:model:obj:center obj))
        (vector-ref (gl:model:mtllist model) (gl:model:obj:matid obj)))
      (gl:model:obj:draw obj))
    (gl:model:objlist model))
  (gl:use-program! 0))

