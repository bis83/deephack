CC=csc -deploy
AR=ar
AR_OPT=crsv
INCLUDE_PATH=-I ../etc/
TARGET=libgde_gl3.a
OBJS=gl.o gl_compile.o gl_test.o gl_model_light.o gl_blend.o gl_sprite.o

$(TARGET) : $(OBJS)
	$(AR) $(AR_OPT) $(TARGET) $^

%.o : %.scm
	$(CC) -c -o $@ $^ $(INCLUDE_PATH)

.PHONEY : clean
clean :
	rm $(TARGET) $(OBJS)
