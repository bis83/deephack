
;;
;; OpenGL Shader Language Compile Helper
;;

(declare (uses libgl3))
(declare (unit libgl3_compile))

(foreign-declare "#include <GL/glew.h>")
(include "gl_enum")

(define (gl:compile type src)
  (define status-check
    (foreign-lambda* bool ((unsigned-int shader))
      "int compiled;
       glGetShaderiv(shader, GL_COMPILE_STATUS, &compiled);
       C_return(compiled == GL_TRUE);"))
  (define error-report
    (foreign-lambda* void ((unsigned-int shader))
      "GLsizei length=0;
       GLchar *tmp = 0;
       glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &length);
       if(length > 0) {
         tmp = malloc(length);
         if(tmp) {
           glGetShaderInfoLog(shader, length, &length, tmp);
           fputs(tmp, stderr);
         }
         free(tmp);
       }"))
  (let ( (shader (gl:make-shader type)) )
    (gl:shader-source! shader src)
    (gl:compile-shader! shader)
    (if (status-check shader)
      shader
      (begin
        (error-report shader)
        (gl:free-shader! shader)
        0))))

(define (gl:linkage proc . shader)
  (define status-check
    (foreign-lambda* bool ((unsigned-int program))
      "int linked;
       glGetProgramiv(program, GL_LINK_STATUS, &linked);
       C_return(linked == GL_TRUE);"))
  (define error-report
    (foreign-lambda* void ((unsigned-int program))
      "GLsizei length=0;
       GLchar *tmp = 0;
       glGetProgramiv(program, GL_INFO_LOG_LENGTH, &length);
       if(length > 0) {
         tmp = malloc(length);
         if(tmp) {
           glGetProgramInfoLog(program, length, &length, tmp);
           fputs(tmp, stderr);
         }
         free(tmp);
       }"))
  (let ( (program (gl:make-program)) )
    (for-each
      (lambda (i) (gl:attach-shader! program i))
      shader)
    (proc program)
    (gl:link-program! program)
    (if (status-check program)
      program
      (begin
        (error-report program)
        (gl:free-program! program)
        0))))

