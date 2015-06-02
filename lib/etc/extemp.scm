
;; expand template macro
(define-syntax expand-template
  (lambda (form rename compare)
    (let ( (t (eval `(lambda ,(cadr form) ,(caddr form))))
           (l (cdddr form)) )
      (append
        (list (rename 'begin))
        (map (lambda (i) (apply t i)) l)))))

