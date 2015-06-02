; [ Gundown Engine ]
; Edited by BIS ( 2012 / 09 / 06 )
; Required (gl sdl)
;

(declare (uses libgl3 libgl3_compile libgl3_test libgl3_model libgl3_blend libgl3_sprite))
(declare (uses libsdl2 libsdl2_image libsdl2_mixer))
(declare (unit libgde))

(include "../sdl/sdl_enum")

(define (gde:init)
  (and
    (sdl:init)
    (sdl:joystick-event-state sdl:enable)
    (sdl:image:init)
    (sdl:mixer:init)))

(define (gde:quit)
  (and
    (sdl:image:quit)
    (sdl:image:quit)
    (sdl:quit!)))

(define (gde:frame-count fps)
  (let (
    (now (sdl:tick))
    (prev (sdl:tick))
    (cnt 0)
    (mspf (/ 1000 fps)))
    (lambda ()
      (set! now (sdl:tick))
      (if (< now (+ prev (* cnt mspf)))
        (sdl:sleep (inexact->exact (floor (- (+ prev (* cnt mspf)) now)))))
      (set! cnt (+ cnt 1))
      (if (> (- now prev) 1000)
        (begin
          (set! prev now)
          (set! cnt 0)))
      cnt)))

(define (gde:window name w h fps init update view quit)
  (let* (
    (win (sdl:make-window name 100 100 w h))
    (ctx (sdl:make-context win))
    (fc  (gde:frame-count fps))
    (ev  (sdl:make-event)))
    ; INIT
    (sdl:make-current! win ctx)
    (when (gl:glew!)
      (gl:sprite:init)
      (gl:model:init))
    (init)
    ; MAIN LOOP
    (let loop ()
      (if (sdl:poll-event! ev)
        (or
          (and (= (sdl:event.type ev) sdl:keydown)
               (= (sdl:event.key.sym ev) sdlk-esc)
               (sdl:post-quit))
          (= (sdl:event.type ev) sdl:quit)
          (begin
            (update ev)
            (loop)))
        (begin
          (fc)
          (sdl:make-current! win ctx)
          (view)
          (sdl:swap-window! win)
          (loop))))
    ; ATEXIT
    (quit)
    (sdl:free-event! ev)
    (sdl:free-context! ctx)
    (sdl:free-window! win)))

(define (gde:joystick-open-all)
  (map
    (lambda  (i) (sdl:make-joystick i))
    (iota (sdl:num-joysticks))))

