
(declare (unit libgl3_test))
(foreign-declare "#include <GL/glew.h>")

(define gl:tex-test
  (foreign-lambda* void ((int tex))
    "glBindTexture(GL_TEXTURE_2D, tex);
     glEnable(GL_TEXTURE_2D);
     glBegin(GL_QUADS);
     glTexCoord2i(0,0); glVertex2f(-0.5, -0.5);
     glTexCoord2i(1,0); glVertex2f(-0.5, 0.5);
     glTexCoord2i(1,1); glVertex2f(0.5, 0.5);
     glTexCoord2i(0,1); glVertex2f(0.5, -0.5);
     glEnd();"))
