
(declare (unit libgl3_blend))

(include "gl_enum")

(define (gl:blend:none)
  (gl:disable! gl:blend)
  (gl:blend-func! gl:one gl:zero))

(define (gl:blend:alpha)
  (gl:enable! gl:blend)
  (gl:blend-func! gl:src-alpha gl:one-minus-src-alpha))

(define (gl:blend:add)
  (gl:enable! gl:blend)
  (gl:blend-func! gl:one gl:one))

