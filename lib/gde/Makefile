CC=csc -deploy
AR=ar
AR_OPT=crsv
INCLUDE_PATH=-I ../etc/
TARGET=libgde.a
OBJS=gde.o mat4.o vec4.o

$(TARGET) : $(OBJS)
	$(AR) $(AR_OPT) $(TARGET) $^

%.o : %.scm
	$(CC) -c -o $@ $^ $(INCLUDE_PATH)

.PHONEY : clean
clean :
	rm $(TARGET) $(OBJS)
