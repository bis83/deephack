
(define display*
  (lambda (out . args)
    (for-each (lambda (a) (display a out)) args)))

(call-with-input-file "../gl/gl_enum.scm"
  (lambda (in)
    (let ( (enum (read in)) )
      (call-with-output-file "../gl/gl_enum2.scm"
        (lambda (out)
          (display* out "(foreign-declare \"#include <GL/glew.h>\")" #\newline)
          (display* out "(include \"extemp\")" #\newline #\newline)
          (display* out "(expand-template (a b) `(define-foreign-variable ,a int ,b)" #\newline)
          (for-each
            (lambda (i)
              (display* out "  (" (list-ref i 1) " \"" (list-ref i 3) "\")" )
              (newline out))
            enum)
          (display* out "  )" #\newline))))))
