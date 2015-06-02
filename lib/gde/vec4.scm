
;; Vector Library
;; Edited by BIS

(declare (unit libgde_vector))
(use srfi-4)

;; Syntax

;; Vector 3
(define (vec3? obj)
  (and
    (f32vector? obj)
    (= (f32vector-length obj) 3)))

(define (make-vec3 . fill)
  (case (length fill)
    ((0) (make-f32vector 3))
    ((1) (make-f32vector 3 (car fill)))
    ((2) (f32vector (car fill) (cadr fill) 0.))
    ((3) (apply f32vector fill))
    (else '())))

(define (vec3-add a b)
  (f32vector
    (+ (f32vector-ref a 0) (f32vector-ref b 0))
    (+ (f32vector-ref a 1) (f32vector-ref b 1))
    (+ (f32vector-ref a 2) (f32vector-ref b 2))))

(define (vec3-sub a b)
  (f32vector
    (- (f32vector-ref a 0) (f32vector-ref b 0))
    (- (f32vector-ref a 1) (f32vector-ref b 1))
    (- (f32vector-ref a 2) (f32vector-ref b 2))))

(define (vec3-dot a b)
  (+ (* (f32vector-ref a 0) (f32vector-ref b 0))
     (* (f32vector-ref a 1) (f32vector-ref b 1))
     (* (f32vector-ref a 2) (f32vector-ref b 2))))

(define (vec3-length v)
  (sqrt (+ (expt (f32vector-ref v 0) 2)
           (expt (f32vector-ref v 0) 2)
           (expt (f32vector-ref v 0) 2))))

(define (vec3-normalise v)
  (let ( (len (vec3-length v)) )
    (f32vector
      (/ (f32vector-ref v 0) len)
      (/ (f32vector-ref v 1) len)
      (/ (f32vector-ref v 2) len))))

(define (vec3-cross a b)
  (f32vector
    (- (* (f32vector-ref a 1) (f32vector-ref b 2))
       (* (f32vector-ref a 2) (f32vector-ref b 1)))
    (- (* (f32vector-ref a 2) (f32vector-ref b 0))
       (* (f32vector-ref a 0) (f32vector-ref b 2)))
    (- (* (f32vector-ref a 0) (f32vector-ref b 1))
       (* (f32vector-ref a 1) (f32vector-ref b 0)))))

;; Vector 4
(define (vec4? obj)
  (and
    (f32vector? obj)
    (= (f32vector-length obj) 4)))

(define (make-vec4 . fill)
  (if (null? fill)
    (make-f32vector 4)
    (make-f32vector 4 (car fill))))

