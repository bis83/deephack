
(define display*
  (lambda (out . args)
    (for-each (lambda (a) (display a out)) args)))

(call-with-input-file "gl_enum.scm"
  (lambda (in)
    (let ( (enum (read in)) )
      (call-with-output-file "gl_enum2.scm"
        (lambda (out)
          (for-each
            (lambda (i)
              (display* out "(define-foreign-variable " (car i) " int \"" (cadr i) "\")")
              (newline out))
            enum))))))
