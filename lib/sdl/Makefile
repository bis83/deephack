CC=csc -deploy
AR=ar
AR_OPT=crsv
INCLUDE_PATH=-I ../etc/
TARGET=libgde_sdl2.a
OBJS=sdl.o sdl_image.o sdl_mixer.o

$(TARGET) : $(OBJS)
	$(AR) $(AR_OPT) $(TARGET) $^

%.o : %.scm
	$(CC) -c -o $@ $^ $(INCLUDE_PATH)

.PHONEY : clean
clean :
	rm $(TARGET) $(OBJS)
