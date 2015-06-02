
(declare (uses libgl3 libgl3_compile))
(declare (unit libgl3_sprite))

(use srfi-4)

(foreign-declare "#include <GL/glew.h>")
(include "gl_enum")

(define gl:sprite:viewport (make-f32vector 4))
(define gl:sprite:quad '())
(define gl:sprite:program '())
(define gl:sprite:uniform! '())

(define (gl:sprite:init)
  ;; INIT VIEWPORT
  (gl:get-floatv gl:viewport gl:sprite:viewport)
  ;; INIT BUFFER
  (let ( (bufdata '#f32(-1 -1 1 -1 -1 1 1 1)) )
    (set! gl:sprite:quad (gl:make-buffer))
    (gl:bind-buffer! gl:array-buffer gl:sprite:quad)
    (gl:buffer-data!
      gl:array-buffer
      (* (f32vector-length bufdata) (foreign-type-size float))
      (f32vector->blob/shared bufdata)
      gl:static-draw))
  ;; INIT PROGRAM
  (set! gl:sprite:program
    (gl:linkage
      (lambda (program)
        (gl:attrib-location! program 0 "pos")
        (gl:frag-data-location! program 0 "fragColor"))
      (gl:compile
        gl:vertex-shader
        "#version 330
         in vec2 pos;
         uniform vec2 aspect;
         uniform mat4 trans;
         uniform mat4 proj;
         uniform vec4 uv;
         out vec2 coord;
         void main() {
           gl_Position =
             proj * trans * vec4(vec2(pos.x * aspect.x, pos.y * aspect.y), 0, 1);
           switch(gl_VertexID) {
             case 0: coord = vec2(uv[0], uv[1]+uv[3]); break;
             case 1: coord = vec2(uv[0]+uv[2], uv[1]+uv[3]); break;
             case 2: coord = vec2(uv[0], uv[1]); break;
             case 3: coord = vec2(uv[0]+uv[2], uv[1]); break;
           }
         }")
      (gl:compile
        gl:fragment-shader
        "#version 330
         in vec2 coord;
         out vec4 fragColor;
         uniform sampler2D tex;
         void main() {
           fragColor = texture(tex, coord);
         }")))
  (begin
    (gl:use-program! gl:sprite:program)
    (let ( (location-tex (gl:get-uniform-location gl:sprite:program "tex"))
           (location-uv (gl:get-uniform-location gl:sprite:program "uv"))
           (location-trans (gl:get-uniform-location gl:sprite:program "trans"))
           (location-proj (gl:get-uniform-location gl:sprite:program "proj"))
           (projection (mat4-ortho 640 480 0 1))
           (location-aspect (gl:get-uniform-location gl:sprite:program "aspect")) )
      (set! gl:sprite:uniform!
        (lambda (sprite trans)
          (gl:active-texture! 0)
          (gl:bind-texture! gl:texture-2d (gl:sprite:texture sprite))
          (gl:uniform1i location-tex 0)
          (gl:uniform4fv location-uv 1 (gl:sprite:uv sprite))
          (gl:uniform2fv location-aspect 1 (gl:sprite:aspect sprite))
          (gl:uniform-matrix4fv location-trans 1 #t trans)
          (gl:uniform-matrix4fv location-proj 1 #t projection))))
    (gl:use-program! 0))
  #t)

(define (gl:sprite:new tex x y w h)
  (define tex-width
    (foreign-lambda* int ()
      "int i;
       glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_WIDTH, &i);
       C_return(i);"))
  (define tex-height
    (foreign-lambda* int ()
      "int i;
       glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_HEIGHT, &i);
       C_return(i);"))
  (gl:bind-texture! gl:texture-2d tex)
  (let ( (aspect-x (tex-width))
         (aspect-y (tex-height)) )
    (vector
      tex
      (f32vector
        (/ x aspect-x)
        (/ y aspect-y)
        (/ w aspect-x)
        (/ h aspect-y))
      (f32vector (/ w 2) (/ h 2))
      )))
(define (gl:sprite:texture sprite)
  (vector-ref sprite 0))
(define (gl:sprite:uv sprite)
  (vector-ref sprite 1))
(define (gl:sprite:aspect sprite)
  (vector-ref sprite 2))

(define (gl:sprite:draw sprite trans)
  (gl:use-program! gl:sprite:program)
  (gl:sprite:uniform! sprite trans)
  (gl:bind-buffer! gl:array-buffer gl:sprite:quad)
  (gl:enable-vertex-attrib-array! 0)
  (gl:vertex-attrib-pointer! 0 2 gl:float #f 0 0)
  (gl:draw-arrays! gl:triangle-strip 0 4)
  (gl:use-program! 0))

