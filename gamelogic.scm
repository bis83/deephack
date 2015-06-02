
(declare (unit game-logic))

(use extras srfi-1)

;; Game Logic Events
(define game-logic-events '())
(define (game-logic-events-push event)
  (set! game-logic-events (cons event game-logic-events)))
(define (game-logic-events-clear)
  (set! game-logic-events '()))

;; Static Data
(define ix-list (iota 13))
(define iy-list (iota 9))

;; Game Logic Data
;; Game Rocks is 12 x 9
;; (so a rock size in screen (2.0 / 12, 2.0 / 9)
(define player-score 12261)
(define player-hiscore 12261)
(define player-life 0)
(define player-pos-x 0)
(define player-pos-y 0)
(define player-dir 0)
(define rocks '())
(define display-bias 0.)
(define wait 0)
(define gameover #f)
(define game-start #f)
(define speed 0.01)
(define spped-up #f)

(define (game-logic-init)
  (set! player-pos-x 5)
  (set! player-pos-y 4)
  (set! player-dir 1)
  (set! player-life (* 3 60 60))
  (set! player-score 12261)
  (game-logic-fill-rocks)
  (set! display-bias 0.)
  (set! wait 0)
  (set! speed 0.01)
  (set! speed-up #f)
  (set! gameover #f)
  (set! game-start #f)
  (game-logic-events-clear)
  (game-logic-events-push '(RESTART)))

(define (game-logic-gameover!)
  (set! gameover #t)
  (set! wait 120)
  (if (> player-score player-hiscore)
    (set! player-hiscore player-score))
  (game-logic-events-push '(STOP)))

;;Game Logic Update
(define (game-logic-update up down right start)
  (define (scene-gamestart)
    (when start
      (set! game-start #t)
      (game-logic-events-push '(PLAY))))
  (define (scene-gameover)
    (cond
      ((> wait 0) (set! wait (- wait 1)))
      (start (game-logic-init))))
  (define (scene-main)
    (cond
      ((> wait 0) (set! wait (- wait 1)))
      (up (game-logic-drill-up))
      (down (game-logic-drill-down))
      (right (game-logic-drill-right))
      (start (game-logic-drill-speed-up)))
    (game-logic-drill-attack)
    (game-logic-drill-speed-down)
    (game-logic-drill-life)
    (game-logic-rocks-bias))
  (cond
    ((not game-start) (scene-gamestart))
    (gameover (scene-gameover))
    (else (scene-main))))

;;Drill Tank Operator
(define (game-logic-drill-up)
  (if (> player-pos-y 0) (set! player-dir 0)))

(define (game-logic-drill-right)
  (set! player-dir 1))

(define (game-logic-drill-down)
  (if (< player-pos-y 8) (set! player-dir 2)))

(define (game-logic-drill-speed-up)
  (when (< speed 0.5)
    (game-logic-events-push '(BOOST))
    (set! speed-up #t)
    (set! speed (+ speed 0.01))))

(define (game-logic-rocks-damage rock d)
  (vector-set! rock 1 (- (vector-ref rock 1) d)))

(define (game-logic-rocks-exist? rock)
  (> (vector-ref rock 1) 0))

(define (game-logic-drill-attack)
  (define (rock val)
    (when (and (not (null? val)) (game-logic-rocks-exist? val))
      (game-logic-rocks-damage val (+ (* 100 speed) (if speed-up 50 0)))
      (set! speed-up #f)
      (game-logic-events-push '(DAMAGE))
      (when (not (game-logic-rocks-exist? val))
        (set! player-pos-x (game-logic-drill-next-x player-pos-x player-pos-y player-dir))
        (set! player-pos-y (game-logic-drill-next-y player-pos-y player-dir))
        (if (or (= player-pos-y 0) (= player-pos-y 8)) (set! player-dir 1))
        (game-logic-events-push '(BREAK))
        (game-logic-events-push '(MOVE)))))
  (rock (game-logic-drill-next player-pos-x player-pos-y player-dir)))

(define (game-logic-drill-life)
  (set! player-life (- player-life 1))
  (if (= player-life (* 60 60))
    (game-logic-events-push '(CRISIS)))
  (if (<= player-life 0) (game-logic-gameover!)))

(define (game-logic-drill-speed-down)
  (if (and (zero? (modulo player-life 30))
           (> speed 0.01))
    (set! speed (- speed 0.01))))

(define (game-logic-rocks-bias)
  (set! display-bias (+ speed display-bias))
  (set! player-score (+ player-score (* 100 speed)))
  (when (>= display-bias 1.0)
    (game-logic-rocks-next)
    (set! display-bias 0.)))

(define (game-logic-drill-next-x x y dir)
  (define x-bias (if (or (= dir 1) (even? y)) 1 0))
  (+ x x-bias))

(define (game-logic-drill-next-y y dir)
  (+ dir -1 y))

(define (game-logic-drill-next x y dir)
  (cond
    ((>= x 11) '())
    (else (game-logic-rocks-ref
            (game-logic-drill-next-x x y dir)
            (game-logic-drill-next-y y dir)))))

;;Rock Map Operator
(define (game-logic-fill-rocks)
  (set! rocks
    (apply circular-list
      (map
        (lambda (i)
          (let ( [vec (make-vector 9)] )
            (for-each
              (lambda (i) (vector-set! vec i (vector 0 50)))
              iy-list)
            vec))
        ix-list)))
  (for-each
    (lambda (v) (vector-set! (vector-ref v 4) 1 0))
    (take rocks 6)))

(define (game-logic-rocks-ref x y)
  (vector-ref (list-ref rocks x) y))

(define (game-logic-rocks-rand v)
  (define (rand-rock val r)
    (cond
      ((< r 10)
        (vector-set! val 0 1)
        (vector-set! val 1 1000))
      (else
        (vector-set! val 0 0)
        (vector-set! val 1 50))))
  (for-each
    (lambda (i) (rand-rock (vector-ref v i) (random 100)))
    iy-list))

(define (game-logic-rocks-next)
  (set! player-pos-x (- player-pos-x 1))
  (if (< player-pos-x 0)
    (game-logic-gameover!))
  (game-logic-rocks-rand (car rocks))
  (set! rocks (cdr rocks)))

