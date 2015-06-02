
(declare (uses libgde))
(declare (uses libgde_matrix))
(declare (uses game-logic game-view))

(foreign-declare "#include <SDL2/SDL_main.h>")
(include "lib/sdl/sdl_enum")

;; ENTRY POINT
(gde:init)

(sdl:attribute! sdl:gl-depth-size 16)
(gde:window "THE DEEP HACKER" 640 480 60
  game-view-init
  game-view-event-dispatch
  game-view-idle
  game-view-free!)
(gde:quit)

