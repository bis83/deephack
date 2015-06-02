;
; [ SDL2 Chicken Scheme Bindings ]
; Edited by BIS ( 2012 / 09 / 06 )
; Requred ( (CLIB -lsdl2) (CLIB -lsdl_mixer) (CLIB -lsdl_image) )
;
(declare (unit libsdl2))
(foreign-declare "#include <SDL2/SDL.h>")

;; TypeDefinision
(define-foreign-type sdl:window (c-pointer (struct "SDL_Window")))
(define-foreign-type sdl:context c-pointer)
(define-foreign-type sdl:event (c-pointer (union "SDL_Event")))
(define-foreign-type sdl:joystick (c-pointer (struct "_SDL_Joystick")))

; Including SDL_ENUM
(include "sdl_enum")

;; System Functions
(define sdl:init
  (foreign-lambda* bool ()
    "C_return(SDL_Init(SDL_INIT_VIDEO | SDL_INIT_JOYSTICK) == 0);"))
(define sdl:quit!
  (foreign-lambda void "SDL_Quit"))
(define sdl:tick
  (foreign-lambda unsigned-int32 "SDL_GetTicks"))
(define (sdl:sleep time)
  ((foreign-lambda void "SDL_Delay" unsigned-int32) (inexact->exact time)))

(define sdl:attribute
  (foreign-lambda* int ( [int attr] )
    "int ret;
     SDL_GL_GetAttribute(attr, &ret);
     return ret;"))
(define sdl:attribute!
  (foreign-lambda int "SDL_GL_SetAttribute" int int))

;; Window Functions
(define sdl:make-window
  (foreign-lambda*
    sdl:window
    ( (c-string t) (int x) (int y) (int w) (int h) )
    "C_return(SDL_CreateWindow(t,x,y,w,h,SDL_WINDOW_OPENGL));"))
(define sdl:free-window!
  (foreign-lambda void "SDL_DestroyWindow" sdl:window))
(define sdl:make-context
  (foreign-lambda sdl:context "SDL_GL_CreateContext" sdl:window))
(define sdl:free-context!
  (foreign-lambda void "SDL_GL_DeleteContext" sdl:context))
(define sdl:make-current!
  (foreign-lambda void "SDL_GL_MakeCurrent" sdl:window sdl:context))
(define sdl:swap-window!
  (foreign-lambda void "SDL_GL_SwapWindow" sdl:window))

;; Event Functions
(define sdl:make-event
  (foreign-lambda* sdl:event ()
    "C_return((SDL_Event*)malloc(sizeof(SDL_Event)));"))
(define sdl:free-event!
  (foreign-lambda* void ( (sdl:event e) ) "free(e);"))
(define sdl:poll-event!
  (foreign-lambda bool "SDL_PollEvent" sdl:event))
(define sdl:event.type
  (foreign-lambda* int ( (sdl:event e) ) "C_return(e->type);"))
(define sdl:event.key.state
  (foreign-lambda* byte ( (sdl:event e) ) "C_return(e->key.state);"))
(define sdl:event.key.repeat
  (foreign-lambda* byte ( (sdl:event e) ) "C_return(e->key.repeat);"))
(define sdl:event.key.sym
  (foreign-lambda* int ( (sdl:event e) ) "C_return(e->key.keysym.sym);"))
(define sdl:event.jbtn.which
  (foreign-lambda* int ( (sdl:event e) ) "C_return(e->jbutton.which);"))
(define sdl:event.jbtn.index
  (foreign-lambda* int ( (sdl:event e) ) "C_return(e->jbutton.button);"))
(define sdl:event.jaxis.which
  (foreign-lambda* int ( (sdl:event e) ) "C_return(e->jaxis.which);"))
(define sdl:event.jaxis.index
  (foreign-lambda* int ( (sdl:event e) ) "C_return(e->jaxis.axis);"))
(define sdl:event.jaxis.value
  (foreign-lambda* double ( (sdl:event e) ) "C_return(e->jaxis.value / 32768.0);"))

(define sdl:post-quit
  (foreign-lambda* void ()
    "SDL_Event ev={0}; ev.type=SDL_QUIT; SDL_PushEvent(&ev);"))
(define sdl:quit-requested?
  (foreign-lambda bool "SDL_QuitRequested"))

;; JoyStick FUnctions
(define sdl:num-joysticks
  (foreign-lambda int "SDL_NumJoysticks"))
(define sdl:joystick-opened?
  (foreign-lambda bool "SDL_JoystickOpened" int))
(define sdl:make-joystick
  (foreign-lambda sdl:joystick "SDL_JoystickOpen" int))
(define sdl:free-joystick!
  (foreign-lambda void "SDL_JoystickClose" sdl:joystick))
(define sdl:joystick.name
  (foreign-lambda c-string "SDL_JoystickName" int))
(define sdl:joystick.num-buttons
  (foreign-lambda int "SDL_JoystickNumButtons" sdl:joystick))
(define sdl:joystick.num-axes
  (foreign-lambda int "SDL_JoystickNumAxes" sdl:joystick))
(define sdl:joystick.button
  (foreign-lambda byte "SDL_JoystickGetButton" sdl:joystick int))
(define sdl:joystick.axis
  (foreign-lambda short "SDL_JoystickGetAxis" sdl:joystick int))
(define sdl:update-joystick
  (foreign-lambda void "SDL_JoystickUpdate"))
(define sdl:joystick-event-state
  (foreign-lambda int "SDL_JoystickEventState" int))

