
(declare (unit game-view))
(declare (uses game-logic))

(use srfi-1 srfi-26)

(include "lib/gl/gl_enum")
(include "lib/sdl/sdl_enum")

;; MODEL LIST
(define game-view-model-drill '())
(define game-view-model-rock '())

;; SPRITE LIST
(define game-view-sprite-texture '())
(define game-view-sprite-texture-scene '())
(define game-view-sprite-back '())
(define game-view-sprite-hud '())
(define game-view-sprite-spped-bar '())
(define game-view-sprite-life-bar '())
(define game-view-sprite-depth-bar '())
(define game-view-sprite-number '())
(define game-view-sprite-start '())
(define game-view-sprite-gameover '())
(define game-view-sprite-booster '())
(define game-view-sprite-destroy '())

;; SOUND LIST
(define game-view-music '())
(define game-view-sounds '())

;; EFFECT LIST
(define game-view-effect-booster '())
(define game-view-effect-destroy '())

;; MISC VARIABLES
(define clear-bits (+ gl:color-buffer-bit gl:depth-buffer-bit))

(define joys '())
(define key-up #f)
(define key-right #f)
(define key-down #f)
(define joy-up #f)
(define joy-right #f)
(define joy-down #f)
(define key-space #f)
(define joy-anybtn #f)
(define btn-limit #f)

(define (game-view-init)
  (set! game-view-music (sdl:mixer:music:load "rsc/uchiu.ogg"))
  (set! game-view-sounds
    (map
      (lambda (name) (sdl:mixer:load name))
      '("rsc/tank.wav" "rsc/drill.wav" "rsc/break.wav" "rsc/booster.wav"
        "rsc/lifea.wav" "rsc/lifeb.wav" "rsc/lifec.wav"
        "rsc/start.wav" "rsc/restart.wav")))
  (sdl:mixer:allocate-channels! 32)
  (sdl:mixer:volume -1 64)
  (gl:clear-color! 0.1 0.1 0.1 0.)
  (gl:clear-depth! 1.0)
  (set! game-view-model-drill
    (call-with-input-file "rsc/drill3.scm" (lambda (port) (gl:model:new (read port)))))
  (set! game-view-model-rock
    (map
      (lambda (name)
        (call-with-input-file name
          (lambda (port) (gl:model:new (read port)))))
      '("rsc/rockA.scm" "rsc/rockB.scm")))
  (set! game-view-sprite-texture (sdl:image:load "rsc/drillui.png"))
  (set! game-view-sprite-back (gl:sprite:new game-view-sprite-texture 0 480 640 480))
  (set! game-view-sprite-hud (gl:sprite:new game-view-sprite-texture 0 0 640 480))
  (set! game-view-sprite-speed-bar (gl:sprite:new game-view-sprite-texture 640 0 64 4))
  (set! game-view-sprite-life-bar (gl:sprite:new game-view-sprite-texture 640 4 4 20))
  (set! game-view-sprite-depth-bar (gl:sprite:new game-view-sprite-texture 640 24 16 16))
  (set! game-view-sprite-number
    (map
      (lambda (i)
        (gl:sprite:new game-view-sprite-texture (+ 640 (* i 20)) 40 20 32))
      (iota 10)))
  (set! game-view-sprite-texture-scene (sdl:image:load "rsc/title.png"))
  (set! game-view-sprite-start (gl:sprite:new game-view-sprite-texture-scene 0 0 640 480))
  (set! game-view-sprite-gameover (gl:sprite:new game-view-sprite-texture-scene 0 480 640 480))
  (set! game-view-sprite-effect-booster (gl:sprite:new game-view-sprite-texture 640 72 8 8))
  (set! game-view-sprite-effect-destroy (gl:sprite:new game-view-sprite-texture 648 72 8 8))
  (set! joys (gde:joystick-open-all))
  (game-logic-init))

(define (game-view-free!)
  (sdl:mixer:music:free! game-view-music)
  (map (cut sdl:mixer:free-chunk! <>) game-view-sounds)
  (map (cut sdl:free-joystick! <>) joys)
  (gl:free-texture! game-view-sprite-texture-scene)
  (gl:free-texture! game-view-sprite-texture)
  (gl:model:free! game-view-model-drill)
  (map gl:model:free! game-view-model-rock))

(define (game-view-idle)
  (game-logic-update
    (or key-up joy-up)
    (or key-down joy-down)
    (or key-right joy-right)
    (and (not btn-limit) (or key-space joy-anybtn)))
  (game-view-logic-events)
  (when (and game-start (not gameover))
    (game-view-effect-booster-set! 2 30)
    (game-view-effect-update))
  (cond
    ((or key-space joy-anybtn) (set! btn-limit #t))
    (else (set! btn-limit #f)))
  (game-view-redisplay))

(define (game-view-logic-events)
  (for-each
    (lambda (e)
      (cond
        ((eq? (car e) 'RESTART)
          (set! game-view-effect-booster '())
          (set! game-view-effect-destroy '())
          (sdl:mixer:play 3 (list-ref game-view-sounds 8) 0)
          (sdl:mixer:play 2 (list-ref game-view-sounds 4) -1))
        ((eq? (car e) 'PLAY)
          (sdl:mixer:music:play game-view-music -1)
          (sdl:mixer:play 0 (list-ref game-view-sounds 0) -1)
          (sdl:mixer:play 1 (list-ref game-view-sounds 1) -1)
          (sdl:mixer:play 3 (list-ref game-view-sounds 7) 0))
        ((eq? (car e) 'STOP)
          (sdl:mixer:pause -1)
          (sdl:mixer:music:pause)
          (sdl:mixer:play 2 (list-ref game-view-sounds 6) -1))
        ((eq? (car e) 'MOVE)
          (sdl:mixer:play 1 (list-ref game-view-sounds 1) -1))
        ((eq? (car e) 'DAMAGE)
          (game-view-effect-destroy-set! 4 30))
        ((eq? (car e) 'BREAK)
          (game-view-effect-destroy-set! 50 50)
          (sdl:mixer:play 4 (list-ref game-view-sounds 2) 0))
        ((eq? (car e) 'BOOST)
          (game-view-effect-booster-set! 50 40)
          (sdl:mixer:play 5 (list-ref game-view-sounds 3) 0))
        ((eq? (car e) 'CRISIS)
          (sdl:mixer:play 2 (list-ref game-view-sounds 5) -1))
        ))
    game-logic-events)
  (set! game-logic-events '()))

(define (game-view-redisplay)
  (gl:clear! clear-bits)
  (gl:disable! gl:depth-test)
  (gl:blend:none)
  (gl:sprite:draw game-view-sprite-back mat4-identity)
  (gl:enable! gl:depth-test)
  (for-each
    (lambda (v i)
      (for-each
        (lambda (j)
          (game-view-draw-rock i j (vector-ref v j)))
        (iota 9)))
    rocks
    (iota 13))
  (game-view-draw-drilltank player-pos-x player-pos-y (- 40 (* 40 player-dir)))
  (gl:blend:add)
  (gl:disable! gl:depth-test)
  (game-view-draw-effect)
  (gl:blend:alpha)
  (game-view-draw-ui))

(define (game-view-event-dispatch e)
  (select (sdl:event.type e)
    ((sdl:keydown)
      (select (sdl:event.key.sym e)
        ((sdlk-space)
          (set! key-space #t))
        ((sdlk-up)
          (set! key-up #t))
        ((sdlk-right)
          (set! key-right #t))
        ((sdlk-down)
          (set! key-down #t))))
    ((sdl:keyup)
      (select (sdl:event.key.sym e)
        ((sdlk-space)
          (set! key-space #f))
        ((sdlk-up)
          (set! key-up #f))
        ((sdlk-right)
          (set! key-right #f))
        ((sdlk-down)
          (set! key-down #f))))
    ((sdl:joybuttondown)
      (set! joy-anybtn #t))
    ((sdl:joybuttonup)
      (set! joy-anybtn #f))
    ((sdl:joyaxismotion)
      (case (sdl:event.jaxis.index e)
        ((0)
          (cond
            ((> (sdl:event.jaxis.value e) 0.5)
              (set! joy-right #t))
            (else
              (set! joy-right #f))))
        ((1)
          (cond
            ((> (sdl:event.jaxis.value e) 0.5)
              (set! joy-up #f)
              (set! joy-down #t))
            ((< (sdl:event.jaxis.value e) -0.5)
              (set! joy-down #f)
              (set! joy-up #t))
            (else
              (set! joy-down #f)
              (set! joy-up #f))))))
    ((sdl:windowevent)
      '())))

(define (game-view-effect-booster-set! count r)
  (let ( [d3 (* 2 3.1415 (/ (- 30 (* 30 player-dir)) 360))] )
    (set! game-view-effect-booster
      (append
        (map
          (lambda (i)
            (let ( [d (* (/ (random 360) 360) 2 3.1415)]
                   [d2 (* (/ (random 100) 100) r)] )
              (vector
                (+ (- (+ (* player-pos-x 60) (* display-bias -60)) 300 (if (odd? player-pos-y) 30 0))
                   (* d2 (cos d))
                   (* -50 (cos d3)))
                (+ (- 245 (* player-pos-y 60) (- 2 (random 4)))
                   (* 0.5 d2 (sin d))
                   (* -50 (sin d3)))
                (+ 5 (random 35)))))
          (iota count))
        game-view-effect-booster))))

(define (game-view-effect-destroy-set! count r)
  (let ( [d3 (* 2 3.1415 (/ (- 30 (* 30 player-dir)) 360))] )
    (set! game-view-effect-destroy
      (append
        (map
          (lambda (i)
            (let ( [d (* (/ (random 360) 360) 2 3.1415)]
                   [d2 (* (/ (random 100) 100) r)] )
              (vector
                (+ (- (+ (* player-pos-x 60) (* display-bias -60)) 300 (if (odd? player-pos-y) 30 0))
                   (* 0.75 d2 (cos d))
                   (* 40 (cos d3)))
                (+ (- 240 (* player-pos-y 60) (- 2 (random 4)))
                   (* d2 (sin d))
                   (* 40 (sin d3)))
                (+ 4 (random 10)))))
          (iota count))
        game-view-effect-destroy))))

(define (game-view-effect-update)
  (set! game-view-effect-booster
    (filter-map
      (lambda (item)
        (if (> (vector-ref item 2) 0)
          (begin
            (vector-set! item 2 (- (vector-ref item 2) 1))
            (vector-set! item 0 (- (vector-ref item 0) (* speed 50)))
            item)
          #f))
      game-view-effect-booster))
  (set! game-view-effect-destroy
    (filter-map
      (lambda (item)
        (if (> (vector-ref item 2) 0)
          (begin
            (vector-set! item 2 (- (vector-ref item 2) 1))
            (vector-set! item 0 (- (vector-ref item 0) (* speed 50)))
            item)
          #f))
      game-view-effect-destroy)))

(define (game-view-draw-drilltank x y dir)
  (gl:model:draw game-view-model-drill
    (mat4-mul
      (mat4-translate
        (- (+ (* x 60) (* display-bias -60)) 300 (if (odd? y) 30 0) (- 2 (random 4)))
        (- 240 (* y 60) (- 2 (random 4)))
        50.)
      (mat4-yaw-pitch-roll 0. 0. (/ (* 2 3.141592 dir) 360))
      (mat4-scale 20. 20. 20.))))

(define (game-view-draw-rock x y v)
  (if (> (vector-ref v 1) 0)
    (let ( [s (* 25)] )
      (gl:model:draw (list-ref game-view-model-rock (vector-ref v 0))
        (mat4-mul
          (mat4-translate
            (- (+ (* x 60) (* display-bias -60)) 300 (if (odd? y) 30 0))
            (- 240 (* y 60))
            50.)
          (mat4-scale s s s))))))

(define (game-view-draw-effect)
  (for-each
    (lambda (item)
      (gl:sprite:draw
        game-view-sprite-effect-booster
        (mat4-translate (vector-ref item 0) (vector-ref item 1) 0.5)))
    game-view-effect-booster)
  (for-each
    (lambda (item)
      (gl:sprite:draw
        game-view-sprite-effect-destroy
        (mat4-translate (vector-ref item 0) (vector-ref item 1) 0.3)))
    game-view-effect-destroy))

(define (draw-number-sprite x y val)
  (define (draw-number x y n)
    (gl:sprite:draw
      (list-ref game-view-sprite-number n)
      (mat4-translate x y 0)))
  (fold
    (lambda (k i p)
      (let ( [n (inexact->exact (floor (/ p k)))] )
        (draw-number (+ x (* i 20)) y n)
        (modulo p k)))
    val
   '(1000000 100000 10000 1000 100 10 1)
   (iota 7)))

(define (game-view-draw-ui)
  (gl:sprite:draw game-view-sprite-hud mat4-identity)
  (do ( [i 0 (+ i 1)]
        [n (/ player-life 180)] )
      ((>= i n) (values))
      (gl:sprite:draw
        game-view-sprite-life-bar
        (mat4-translate (- (* 6 i) 178) -228 0)))
  (do ( [i 0 (+ i 1)]
        [n (* speed 100)] )
      ((>= i n) (values))
      (gl:sprite:draw
        game-view-sprite-speed-bar
        (mat4-translate -244 (- (* 6 i) 214) 0)))
  (gl:sprite:draw
    game-view-sprite-depth-bar
    (mat4-translate 312 (- 220 (* 450 (/ player-score 2600000))) 0))
  (draw-number-sprite 140 208 player-score)
  (cond
    ((not game-start)
      (gl:sprite:draw game-view-sprite-start mat4-identity))
    (gameover
      (gl:sprite:draw game-view-sprite-gameover mat4-identity)
      (draw-number-sprite -240 -40 player-score)
      (draw-number-sprite 100 -40 player-hiscore)
      )))

