;
; [ OpenGL & GLEW Chicken Scheme Bindings ]
; Edited by BIS ( 2012 / 09 / 06 )
; Required ((CLIB -lglew) (CLIB -lgl))
;

(declare (unit libgl3))
(use srfi-4)

(foreign-declare "#include<GL/glew.h>")
(include "gl_enum")

;; Foreign Variable Type

;; Function
(define gl:glew!
  (foreign-lambda* bool ()
    "C_return(glewInit()==GLEW_OK);"))

; Clear
(define gl:clear!
  (foreign-lambda void "glClear" unsigned-int))
; Clear Color
(define gl:clear-color!
  (foreign-lambda void "glClearColor" float float float float))
(define gl:clear-depth!
  (foreign-lambda void "glClearDepth" double))
(define gl:clear-stencil!
  (foreign-lambda void "glClearStencil" int))
(define gl:clear-bufferiv!
  (foreign-lambda void "glClearBufferiv" int int (c-pointer (const int))))
(define gl:clear-bufferuiv!
  (foreign-lambda void "glClearBufferuiv" int int (c-pointer (const unsigned-int))))
(define gl:clear-bufferfv!
  (foreign-lambda void "glClearBufferfv" int int (c-pointer (const float))))
(define gl:clear-bufferfi!
  (foreign-lambda void "glClearBufferfi" int int float int))

; Texture
(define gl:make-texture
  (foreign-lambda* unsigned-int ()
    "GLuint t=0;
     glGenTextures(1, &t);
     C_return(t);"))
(define gl:free-texture!
  (foreign-lambda* void ( (unsigned-int t) )
    "glDeleteTextures(1, &t);"))
(define gl:is-texture?
  (foreign-lambda bool "glIsTexture" unsigned-int))
(define gl:bind-texture!
  (foreign-lambda void "glBindTexture" int unsigned-int))
(define gl:tex-image-2d!
  (foreign-lambda void "glTexImage2D" unsigned-int int int int int int int int (const c-pointer))) 
(define gl:tex-parameteri!
  (foreign-lambda void "glTexParameteri" int int int))
(define gl:tex-parameterf!
  (foreign-lambda void "glTexParameterf" int int float))
(define gl:active-texture!
  (foreign-lambda* void ((int i)) "glActiveTexture(GL_TEXTURE0+i);"))
(define gl:copy-tex-image-1d!
  (foreign-lambda void "glCopyTexImage1D" int int int int int int int))
(define gl:copy-tex-image-2d!
  (foreign-lambda void "glCopyTexImage2D" int int int int int int int int))
(define gl:copy-tex-subimage-1d!
  (foreign-lambda void "glCopyTexSubImage1D" int int int int int int))
(define gl:copy-tex-subimage-2d!
  (foreign-lambda void "glCopyTexSubImage2D" int int int int int int int int))
(define gl:copy-tex-subimage-3d!
  (foreign-lambda void "glCopyTexSubImage3D" int int int int int int int int int))
(define gl:generate-mipmap!
  (foreign-lambda void "glGenerateMipmap" int))

; Buffer
(define gl:make-buffer
  (foreign-lambda* unsigned-int ()
    "GLuint b=0;
     glGenBuffers(1, &b);
     C_return(b);"))
(define gl:free-buffer!
  (foreign-lambda* void ( (unsigned-int b) )
    "glDeleteBuffers(1, &b);"))
(define gl:is-buffer?
  (foreign-lambda bool "glIsBuffer" unsigned-int))
(define gl:bind-buffer!
  (foreign-lambda* void ( (int target) (unsigned-int buffer) )
    "glBindBuffer(target, buffer);"))
(define gl:buffer-data!
  (foreign-lambda void "glBufferData" int int blob int))
(define gl:buffer-subdata!
  (foreign-lambda void "glBufferSubData" int int int blob))
(define gl:map-buffer!
  (foreign-lambda c-pointer "glMapBuffer" int int))
(define gl:map-buffer-range!
  (foreign-lambda c-pointer "glMapBufferRange" int int int int))
(define gl:unmap-buffer!
  (foreign-lambda bool "glUnmapBuffer" int))
(define gl:copy-buffer-subdata!
  (foreign-lambda void "glCopyBufferSubData" int int int int int))

; Vertex Array
(define gl:make-vertex-array
  (foreign-lambda* unsigned-int ()
    "GLuint v=0;
     glGenVertexArrays(1, &v);
     C_return(v);"))
(define gl:free-vertex-array!
  (foreign-lambda* void ((unsigned-int v))
    "glDeleteVertexArrays(1, &v);"))
(define gl:is-vertex-array?
  (foreign-lambda bool "glIsVertexArray" unsigned-int))
(define gl:bind-vertex-array!
  (foreign-lambda* void ((unsigned-int array))
    "glBindVertexArray(array);"))
(define gl:enable-vertex-attrib-array!
  (foreign-lambda void "glEnableVertexAttribArray" unsigned-int))
(define gl:disable-vertex-attrib-array!
  (foreign-lambda void "glDisableVertexAttribArray" unsigned-int))
(define gl:vertex-attrib-pointer!
  (foreign-lambda void "glVertexAttribPointer" unsigned-int int int bool int int))
(define gl:vertex-attrib-ipointer!
  (foreign-lambda void "glVertexAttribIPointer" unsigned-int int int int int))

; Framebuffer
(define gl:make-framebuffer
  (foreign-lambda* unsigned-int ()
    "GLuint f=0;
     glGenFramebuffers(1, &f);
     C_return(f);"))
(define gl:free-framebuffer
  (foreign-lambda* void ((unsigned-int f))
    "glDeleteFramebuffers(1, &f);"))
(define gl:is-framebuffer?
  (foreign-lambda bool "glIsFramebuffer" unsigned-int))
(define gl:bind-framebuffer!
  (foreign-lambda* void ((int target)(unsigned-int frame))
    "glBindFramebuffer(target, frame);"))
(define gl:check-framebuffer-status!
  (foreign-lambda int "glCheckFramebufferStatus" int))
(define gl:framebuffer-renderbuffer!
  (foreign-lambda void "glFramebufferRenderbuffer" int int int unsigned-int))
(define gl:framebuffer-texture!
  (foreign-lambda void "glFramebufferTexture" int int unsigned-int int))
(define gl:framebuffer-texture-layer!
  (foreign-lambda void "glFramebufferTextureLayer" int int unsigned-int int int))

; Renderbuffer
(define gl:make-renderbuffer
  (foreign-lambda* unsigned-int ()
    "GLuint r=0;
     glGenRenderbuffers(1, &r);
     C_return(r);"))
(define gl:free-renderbuffer!
  (foreign-lambda* void ((unsigned-int r))
    "glDeleteRenderbuffers(1, &r);"))
(define gl:is-renderbuffer?
  (foreign-lambda bool "glIsRenderbuffer" unsigned-int))
(define gl:bind-renderbuffer!
  (foreign-lambda void "glBindRenderbuffer" int unsigned-int))
(define gl:renderbuffer-storage!
  (foreign-lambda void "glRenderbufferStorage" int int int int))
(define gl:renderbuffer-storage-multisample!
  (foreign-lambda void "glRenderbufferStorageMultisample" int int int int int))

; Sampler
(define gl:make-sampler
  (foreign-lambda* unsigned-int ()
    "GLuint s=0;
     glGenSamplers(1, &s);
     C_return(s);"))
(define gl:free-sampler!
  (foreign-lambda* void ((unsigned-int s))
    "glDeleteSamplers(1, &s);"))
(define gl:is-sampler?
  (foreign-lambda bool "glIsSampler" unsigned-int))
(define gl:bind-sampler!
  (foreign-lambda void "glBindSampler" unsigned-int unsigned-int))
(define gl:sampler-parameterf!
  (foreign-lambda void "glSamplerParameterf" unsigned-int int float))
(define gl:sampler-parameteri!
  (foreign-lambda void "glSamplerParameteri" unsigned-int int int))

; Shader
(define gl:make-shader
  (foreign-lambda unsigned-int "glCreateShader" int))
(define gl:free-shader!
  (foreign-lambda void "glDeleteShader" unsigned-int))
(define gl:is-shader?
  (foreign-lambda bool "glIsShader" unsigned-int))
(define gl:shader-source!
  (foreign-lambda* void ( (unsigned-int shader) ((const c-string) src) )
    "glShaderSource(shader, 1, &src, NULL);"))
(define gl:compile-shader!
  (foreign-lambda void "glCompileShader" unsigned-int))

; Program
(define gl:make-program
  (foreign-lambda unsigned-int "glCreateProgram"))
(define gl:free-program!
  (foreign-lambda void "glDeleteProgram" unsigned-int))
(define gl:is-program?
  (foreign-lambda bool "glIsProgram" unsigned-int))
(define gl:attach-shader!
  (foreign-lambda void "glAttachShader" unsigned-int unsigned-int))
(define gl:attrib-location!
  (foreign-lambda void "glBindAttribLocation" unsigned-int unsigned-int (const c-string)))
(define gl:frag-data-location!
  (foreign-lambda void "glBindFragDataLocation" unsigned-int unsigned-int (const c-string)))
(define gl:link-program!
  (foreign-lambda void "glLinkProgram" unsigned-int))
(define gl:use-program!
  (foreign-lambda void "glUseProgram" unsigned-int))

; Uniform
(define gl:uniform1f
  (foreign-lambda void "glUniform1f" int float))
(define gl:uniform2f
  (foreign-lambda void "glUniform2f" int float float))
(define gl:uniform3f
  (foreign-lambda void "glUniform3f" int float float float))
(define gl:uniform4f
  (foreign-lambda void "glUniform4f" int float float float float))
(define gl:uniform1i
  (foreign-lambda void "glUniform1i" int int))
(define gl:uniform2i
  (foreign-lambda void "glUniform2i" int int int))
(define gl:uniform3i
  (foreign-lambda void "glUniform3i" int int int int))
(define gl:uniform4i
  (foreign-lambda void "glUniform4i" int int int int int))
(define gl:uniform1ui
  (foreign-lambda void "glUniform1ui" int unsigned-int))
(define gl:uniform2ui
  (foreign-lambda void "glUniform2ui" int unsigned-int unsigned-int))
(define gl:uniform3ui
  (foreign-lambda void "glUniform3ui" int unsigned-int unsigned-int unsigned-int))
(define gl:uniform4ui
  (foreign-lambda void "glUniform4ui" int unsigned-int unsigned-int unsigned-int unsigned-int))
(define gl:uniform1fv
  (foreign-lambda void "glUniform1fv" int int (const f32vector)))
(define gl:uniform2fv
  (foreign-lambda void "glUniform2fv" int int (const f32vector)))
(define gl:uniform3fv
  (foreign-lambda void "glUniform3fv" int int (const f32vector)))
(define gl:uniform4fv
  (foreign-lambda void "glUniform4fv" int int (const f32vector)))
(define gl:uniform1iv
  (foreign-lambda void "glUniform1iv" int int (const s32vector)))
(define gl:uniform2iv
  (foreign-lambda void "glUniform2iv" int int (const s32vector)))
(define gl:uniform3iv
  (foreign-lambda void "glUniform3iv" int int (const s32vector)))
(define gl:uniform4iv
  (foreign-lambda void "glUniform4iv" int int (const s32vector)))
(define gl:uniform1uiv
  (foreign-lambda void "glUniform1uiv" int int (const u32vector)))
(define gl:uniform2uiv
  (foreign-lambda void "glUniform2uiv" int int (const u32vector)))
(define gl:uniform3uiv
  (foreign-lambda void "glUniform3uiv" int int (const u32vector)))
(define gl:uniform4uiv
  (foreign-lambda void "glUniform4uiv" int int (const u32vector)))
(define gl:uniform-matrix2fv
  (foreign-lambda void "glUniformMatrix2fv" int int bool (const f32vector)))
(define gl:uniform-matrix3fv
  (foreign-lambda void "glUniformMatrix3fv" int int bool (const f32vector)))
(define gl:uniform-matrix4fv
  (foreign-lambda void "glUniformMatrix4fv" int int bool (const f32vector)))
(define gl:uniform-matrix2x3fv
  (foreign-lambda void "glUniformMatrix2x3fv" int int bool (const f32vector)))
(define gl:uniform-matrix3x2fv
  (foreign-lambda void "glUniformMatrix3x2fv" int int bool (const f32vector)))
(define gl:uniform-matrix2x4fv
  (foreign-lambda void "glUniformMatrix2x4fv" int int bool (const f32vector)))
(define gl:uniform-matrix4x2fv
  (foreign-lambda void "glUniformMatrix4x2fv" int int bool (const f32vector)))
(define gl:uniform-matrix3x4fv
  (foreign-lambda void "glUniformMatrix3x4fv" int int bool (const f32vector)))
(define gl:uniform-matrix4x3fv
  (foreign-lambda void "glUniformMatrix4x3fv" int int bool (const f32vector)))

; Blend
(define gl:blend-color!
  (foreign-lambda void "glBlendColor" float float float float))
(define gl:blend-equation!
  (foreign-lambda void "glBlendEquation" int))
(define gl:blend-equation-separate!
  (foreign-lambda void "glBlendEquationSeparate" int int))
(define gl:blend-func!
  (foreign-lambda void "glBlendFunc" int int))
(define gl:blend-func-separate!
  (foreign-lambda void "glBlendFuncSeparate" int int int int))

; Depth-Stencil
(define gl:depth-func!
  (foreign-lambda void "glDepthFunc" int))
(define gl:depth-mask!
  (foreign-lambda void "glDepthMask" bool))
(define gl:depth-range!
  (foreign-lambda void "glDepthRange" double double))
(define gl:stencil-func!
  (foreign-lambda void "glStencilFunc" int int unsigned-int))
(define gl:stencil-func-separate!
  (foreign-lambda void "glStencilFuncSeparate" int int int unsigned-int))
(define gl:stencil-mask!
  (foreign-lambda void "glStencilMask" unsigned-int))
(define gl:stencil-mask-separate!
  (foreign-lambda void "glStencilMaskSeparate" int unsigned-int))
(define gl:stencil-op!
  (foreign-lambda void "glStencilOp" int int int))
(define gl:stencil-op-separate!
  (foreign-lambda void "glStencilOpSeparate" int int int int))

; Get
(define gl:get-booleanv
  (foreign-lambda void "glGetBooleanv" int u8vector))
(define gl:get-doublev
  (foreign-lambda void "glGetDoublev" int f64vector))
(define gl:get-floatv
  (foreign-lambda void "glGetFloatv" int f32vector))
(define gl:get-integerv
  (foreign-lambda void "glGetIntegerv" int s32vector))
(define gl:get-integer64v
  (foreign-lambda void "glGetInteger64v" int c-pointer))
(define gl:get-booleaniv
  (foreign-lambda void "glGetBooleani_v" int unsigned-int u8vector))
(define gl:get-integeriv
  (foreign-lambda void "glGetIntegeri_v" int unsigned-int s32vector))
(define gl:get-integer64iv
  (foreign-lambda void "glGetInteger64i_v" int unsigned-int c-pointer))
(define gl:get-active-attrib
  (foreign-lambda void "glGetActiveAttrib"
   unsigned-int unsigned-int integer64 c-pointer s32vector s32vector c-string))
(define gl:get-active-uniform
  (foreign-lambda void "glGetActiveUniform"
  unsigned-int unsigned-int integer64 c-pointer s32vector s32vector c-string))
(define gl:get-active-uniform-blockiv
  (foreign-lambda void "glGetActiveUniformBlockiv" unsigned-int unsigned-int int s32vector))
(define gl:get-active-uniform-block-name
  (foreign-lambda void "glGetActiveUniformBlockName" unsigned-int unsigned-int integer64 c-pointer c-string))
(define gl:get-active-uniform-name
  (foreign-lambda void "glGetActiveUniformName" unsigned-int unsigned-int integer64 c-pointer c-string))
(define gl:get-active-uniformsiv
  (foreign-lambda void "glGetActiveUniformsiv" unsigned-int integer64 (const u32vector) int s32vector))
(define gl:get-attached-shaders
  (foreign-lambda void "glGetAttachedShaders" unsigned-int integer64 c-pointer u32vector))
(define gl:get-attrib-location
  (foreign-lambda void "glGetAttribLocation" unsigned-int (const c-string)))
(define gl:get-buffer-parameteriv
  (foreign-lambda void "glGetBufferParameteriv" int int s32vector))
(define gl:get-buffer-pointerv
  (foreign-lambda void "glGetBufferPointerv" int int pointer-vector))
(define gl:get-buffer-subdata
  (foreign-lambda void "glGetBufferSubData" int integer64 unsigned-int c-pointer))
(define gl:get-compressed-tex-image
  (foreign-lambda void "glGetCompressedTexImage" int int c-pointer))
(define gl:get-error
  (foreign-lambda int "glGetError"))
(define gl:get-frag-data-index
  (foreign-lambda int "glGetFragDataIndex" unsigned-int (const c-pointer)))
(define gl:get-frag-data-location
  (foreign-lambda int "glGetFragDataLocation" unsigned-int (const c-pointer)))
(define gl:get-framebuffer-attachment-parameteriv
  (foreign-lambda void "glGetFramebufferAttachmentParameteriv" int int int s32vector))
(define gl:get-multisamplefv
  (foreign-lambda void "glGetMultisamplefv" int unsigned-int f32vector))
(define gl:get-programiv
  (foreign-lambda void "glGetProgramiv" unsigned-int int s32vector))
(define gl:get-program-infolog
  (foreign-lambda void "glGetProgramInfoLog" unsigned-int unsigned-int (c-pointer unsigned-int) s8vector))
(define gl:get-renderbuffer-parameteriv
  (foreign-lambda void "glGetRenderbufferParameteriv" int int s32vector))
(define gl:get-sampler-parameterfv
  (foreign-lambda void "glGetSamplerParameterfv" unsigned-int int f32vector))
(define gl:get-sampler-parameteriv
  (foreign-lambda void "glGetSamplerParameteriv" unsigned-int int s32vector))
(define gl:get-shaderiv
  (foreign-lambda void "glGetShaderiv" unsigned-int int s32vector))
(define gl:get-shader-infolog
  (foreign-lambda void "glGetShaderInfoLog" unsigned-int unsigned-int (c-pointer unsigned-int) s8vector))
(define gl:get-shader-source
  (foreign-lambda void "glGetShaderSource" unsigned-int unsigned-int (c-pointer unsigned-int) s8vector))
(define gl:get-string
  (foreign-lambda c-string "glGetString" int))
(define gl:get-stringi
  (foreign-lambda c-string "glGetStringi" int unsigned-int))
(define gl:get-tex-image
  (foreign-lambda void "glGetTexImage" int int int int c-pointer))
(define gl:get-tex-parameterfv
  (foreign-lambda void "glGetTexParameterfv" int int f32vector))
(define gl:get-tex-parameteriv
  (foreign-lambda void "glGetTexParameteriv" int int s32vector))
(define gl:get-transform-feedback-varying
  (foreign-lambda void "glGetTransformFeedbackVarying"
   unsigned-int unsigned-int int s32vector (c-pointer int) s32vector c-string))
(define gl:get-uniformfv
  (foreign-lambda void "glGetUniformfv" unsigned-int int f32vector))
(define gl:get-uniformiv
  (foreign-lambda void "glGetUniformiv" unsigned-int int s32vector))
(define gl:get-uniform-block-index
  (foreign-lambda void "glGetUniformBlockIndex" unsigned-int (const c-string)))
(define gl:get-uniform-indices
  (foreign-lambda void "glGetUniformIndices" unsigned-int int (const (c-pointer c-string)) u32vector))
(define gl:get-uniform-location
  (foreign-lambda int "glGetUniformLocation" unsigned-int (const c-string)))

; Misc
(define gl:viewport!
  (foreign-lambda void "glViewport" int int int int))
(define gl:scissor!
  (foreign-lambda void "glScissor" int int int int))
(define gl:point-parameteri!
  (foreign-lambda void "glPointParameteri" int int))
(define gl:point-parameterf!
  (foreign-lambda void "glPointParameterf" int float))
(define gl:point-size!
  (foreign-lambda void "glPointSize" float))
(define gl:polygon-mode!
  (foreign-lambda void "glPolygonMode" int int))
(define gl:polygon-offset!
  (foreign-lambda void "glPolygonOffset" float float))
(define gl:line-width!
  (foreign-lambda void "glLineWidth" float))
(define gl:logic-op!
  (foreign-lambda void "glLogicOp" int))
(define gl:front-face!
  (foreign-lambda void "glFrontFace" int))
(define gl:cull-face!
  (foreign-lambda void "glCullFace" int))
(define gl:color-mask!
  (foreign-lambda void "glColorMask" bool bool bool bool))
(define gl:color-maski!
  (foreign-lambda void "glColorMaski" unsigned-int bool bool bool bool))
(define gl:enable!
  (foreign-lambda void "glEnable" int))
(define gl:enablei!
  (foreign-lambda void "glEnablei" int unsigned-int))
(define gl:disable!
  (foreign-lambda void "glDisable" int))
(define gl:disablei!
  (foreign-lambda void "glDisablei" int unsigned-int))

; Draw
(define gl:draw-arrays!
  (foreign-lambda void "glDrawArrays" int int unsigned-int))
(define gl:draw-elements!
  (foreign-lambda void "glDrawElements" int unsigned-int int int))

