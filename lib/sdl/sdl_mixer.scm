
(declare (unit libsdl2_mixer))
(foreign-declare "#include <SDL2/SDL_mixer.h>")

(include "sdl_enum")

(define-foreign-type sdl:mixer:chunk (c-pointer (struct "Mix_Chunk")))
(define-foreign-type sdl:mixer:music (c-pointer (struct "_Mix_Music")))

;; Function
(define (sdl:mixer:init)
  (and
    ((foreign-lambda* bool ()
      "const int flags = MIX_INIT_OGG;
       C_return(flags == Mix_Init(flags));"))
    ((foreign-lambda* bool ()
      "C_return(Mix_OpenAudio(MIX_DEFAULT_FREQUENCY, MIX_DEFAULT_FORMAT, 2, 1024)==0);"))))
(define (sdl:mixer:quit)
  ((foreign-lambda void "Mix_CloseAudio"))
  ((foreign-lambda void "Mix_Quit")))

(define sdl:mixer:load
  (foreign-lambda sdl:mixer:chunk "Mix_LoadWAV" c-string))
(define sdl:mixer:free-chunk!
  (foreign-lambda void "Mix_FreeChunk" sdl:mixer:chunk))

(define sdl:mixer:allocate-channels!
  (foreign-lambda int "Mix_AllocateChannels" int))
(define sdl:mixer:volume
  (foreign-lambda int "Mix_Volume" int int))
(define sdl:mixer:play
  (foreign-lambda int "Mix_PlayChannel" int sdl:mixer:chunk int))
(define sdl:mixer:pause
  (foreign-lambda void "Mix_Pause" int))

(define sdl:mixer:music:load
  (foreign-lambda sdl:mixer:music "Mix_LoadMUS" c-string))
(define sdl:mixer:music:free!
  (foreign-lambda void "Mix_FreeMusic" sdl:mixer:music))
(define sdl:mixer:music:volume
  (foreign-lambda int "Mix_VolumeMusic" int))
(define sdl:mixer:music:play
  (foreign-lambda int "Mix_PlayMusic" sdl:mixer:music int))
(define sdl:mixer:music:pause
  (foreign-lambda void "Mix_PauseMusic"))

