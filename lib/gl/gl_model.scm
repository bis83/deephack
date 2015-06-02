
(declare (unit libgl3_model))
(declare (uses libgde_matrix libsdl2_image libgl3_compile))

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
        (gl:attrib-location! program 2 "norm")
        (gl:frag-data-location! program 0 "fragColor"))
      (gl:compile gl:vertex-shader
        "#version 330
         in vec3 pos;
         in vec2 coord;
         in vec3 norm;
         out vec2 uv;
         out vec3 normal;
         uniform mat4 trans;
         void main() {
           gl_Position = trans * vec4(pos, 1);
           uv = coord;
           normal = norm;
         }")
      (gl:compile gl:fragment-shader
        "#version 330
         in vec2 uv;
         in vec3 normal;
         out vec4 fragColor;
         uniform sampler2D tex;
         uniform struct {
           vec3 ka;
           vec3 kd;
           vec3 ks;
           float ns;
           float ni;
           float tr;
         } material;
         void main() {
           vec4 tex_kd = texture(tex, uv);
           fragColor = vec4(tex_kd.rgb, 1);
         }")))
  ;; Init Uniform Function
  (let ( [location-material (gl:get-uniform-location gl:model:program "material")]
         [location-trans (gl:get-uniform-location gl:model:program "trans")]
         [location-tex (gl:get-uniform-location gl:model:program "tex")] )
    (set! gl:model:uniform!
      (lambda (trans material tex)
        (gl:active-texture! 0)
        (gl:bind-texture! gl:texture-2d tex)
        (gl:uniform1i location-tex 0)
        (gl:uniform-matrix4fv location-trans 1 #t trans)
        (gl:uniform3fv location-material 4 material)))))

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
(define (gl:model:mtl:material mtl) (vector-ref mtl 1))
(define (gl:model:mtl:ka mtl) (subf32vector (vector-ref mtl 1) 0 3))
(define (gl:model:mtl:kd mtl) (subf32vector (vector-ref mtl 1) 3 6))
(define (gl:model:mtl:ks mtl) (subf32vector (vector-ref mtl 1) 6 9))
(define (gl:model:mtl:ns mtl) (f32vector-ref (vector-ref mtl 1) 9))
(define (gl:model:mtl:ni mtl) (f32vector-ref (vector-ref mtl 1) 10))
(define (gl:model:mtl:tr mtl) (f32vector-ref (vector-ref mtl 1) 11))
(define (gl:model:mtl:tex mtl) (vector-ref mtl 2))

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
        (gl:static-draw))
      buf))
  (define (make-vao)
    (let ( [vao (gl:make-vertex-array)] )
      (gl:bind-vertex-array! vao)
      (gl:enable-vertex-attrib-array 0)
      (gl:enable-vertex-attrib-array 1)
      (gl:enable-vertex-attrib-array 2)
      (gl:vertex-attrib-ipointer 0 3 gl:float 0 0)
      (gl:vertex-attrib-ipointer 1 2 gl:float 0 12)
      (gl:vertex-attrib-ipointer 2 3 gl:float 0 20)
      vao))
  (let* ( [vbuffer (make-vbuffer)]
          [ibuffer (make-ibuffer)]
          [vao (make-vao)] )
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
  (define (make-texture tex)
    (and
      (not (null? tex))
      (sdl:image:load tex)))
  (vector
    (car mtl)
    (cadr mtl)
    (make-texture (caddr mtl))))
(define (gl:model:new scheme-obj)
  (map gl:model:obj:new (car scheme-obj))
  (list->vector (map gl:model:mtl:new (cadr scheme-obj))))

(define (gl:model:free! model)
  '())

(define (gl:model:obj:draw obj)
  (gl:bind-array-buffer! (gl:model:obj:vao obj))
  (gl:draw-element!
    gl:triangles
    (gl:model:obj:icount obj)
    gl:unsigned-short
    0)
  (gl:bind-array-buffer! 0))

(define (gl:model:mtl:bind! trans mtl)
  (gl:model:uniform!
    trans
    (gl:model:mtl:material mtl)
    (gl:model:mtl:tex mtl)))

(define (gl:model:draw model trans)
  (for-each
    (lambda (obj)
      (gl:model:mat:bind!
        (mat4-mul (gl:model:obj:center obj) trans)
        (vector-ref (gl:model:mtllist model) (gl:model:obj:matid obj)))
      (gl:model:obj:draw obj))
    (gl:model:objlist obj)))

