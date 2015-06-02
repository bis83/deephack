CC=csc -deploy
WIN_CC=gcc
LIB_SDL=`sdl2-config --libs` -lSDL2_image -lSDL2_mixer
LIB_WIN_SDL=$(LIB_SDL)
LIB_GL=-lGLEW
LIB_WIN_GL=-lglew32 -lopengl32
LIB_GDE_SDL=./lib/sdl/libgde_sdl2.a
LIB_GDE_GL=./lib/gl/libgde_gl3.a
LIB_GDE=./lib/gde/libgde.a
LIB_SYSTEM=$(LIB_GDE) $(LIB_GDE_GL) $(LIB_GDE_SDL)
LIBS=$(LIB_SDL) $(LIB_GL) $(LIB_SYSTEM)
WIN_LIBS=$(LIB_SYSTEM) $(LIB_WIN_GL) $(LIB_WIN_SDL) -lchicken
INCLUDE_PATH=-I lib/etc/
TARGET=a.out
WIN_TARGET=a.exe
WIN_TARGET2=gundown.exe
OBJS=main.o gamelogic.o gameview.o

$(TARGET) : $(OBJS) $(LIB_SYSTEM)
	$(CC) -o $@ $(OBJS) $(LIBS)

$(WIN_TARGET) : $(OBJS) $(LIB_SYSTEM)
	$(WIN_CC) -mwindows -o $@ $(OBJS) $(WIN_LIBS)

$(WIN_TARGET2) : $(OBJS) $(LIB_SYSTEM)
	csc -gui -o $@ $(OBJS) $(LIB_SYSTEM) -lSDL2 -lSDL2_image -lglew32 -lopengl32 -lchicken

%.o : %.scm
	$(CC) -c -o $@ $^ $(INCLUDE_PATH)

.PHONEY : clean
clean :
	rm $(TARGET) $(WIN_TARGET) $(OBJS)
