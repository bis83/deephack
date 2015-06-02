
(declare (unit libsdl2_image))
(foreign-declare "#include <stdio.h>")
(foreign-declare "#include <GL/glew.h>")
(foreign-declare "#include <SDL2/SDL_image.h>")

;; Functions
(define sdl:image:init
  (foreign-lambda* bool ()
    "const int flags =IMG_INIT_PNG;
     C_return(IMG_Init(flags) == flags);"))
(define sdl:image:quit
  (foreign-lambda void "IMG_Quit"))

(define sdl:image:load
  (foreign-lambda* unsigned-int ((c-string filepath))
    "SDL_Surface *surf;
     GLuint texture;
     GLenum format;
     GLint color;
     surf = IMG_Load(filepath);
     if(!surf) return 0;
     color = surf->format->BytesPerPixel;
     if(color == 4) {
       if(surf->format->Rmask == 0x000000ff)
         format = GL_RGBA;
       else
         format = GL_BGRA;
     } else if(color == 3) {
       if(surf->format->Rmask == 0x000000ff)
         format = GL_RGB;
       else
         format = GL_BGR;
     }
     glGenTextures(1, &texture);
     glBindTexture(GL_TEXTURE_2D, texture);
     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
     glTexImage2D(GL_TEXTURE_2D, 0, color, surf->w, surf->h, 0, format, GL_UNSIGNED_BYTE, surf->pixels);
     SDL_FreeSurface(surf);
     C_return(texture);"))

