# by Mykhailo Kapitanov <xoomoh@luny.pl>
# Odessa / Ukraine 2022

APP = zpring
VER = 20211206

CC = g++
RM = del

OBJ += bios.o
OBJ += network.o
OBJ += unigraf.o
OBJ += z80.o
OBJ += z80_ops.o
OBJ += zpring.o

INC += -Iinc
INC += -Iinc/z80
INC += -IlibSDL2/inc

DEF += -DNETWORK
DEF += -DWIN95
DEF += -DSDL -DSDL2
DEF += -Dmain=SDL_main

LIB += -l:libws2_32.a
LIB += -LlibSDL2 -l:libmingw32.a -l:libSDL2main.a -l:libSDL2.a
LIB += -mconsole -mwindows
LIB += -Wl,--dynamicbase -Wl,--high-entropy-va -Wl,--nxcompat
LIB += -l:libm.a -l:libdinput8.a -l:libdxguid.a -l:libdxerr8.a -l:libuser32.a -l:libgdi32.a -l:libwinmm.a -l:libimm32.a -l:libole32.a -l:liboleaut32.a -l:libshell32.a -l:libsetupapi.a -l:libversion.a -l:libuuid.a

CFLG +=
LFLG += -static -static-libgcc -static-libstdc++

all: banner $(OBJ)
	@echo Linking $(APP)
	@$(CC) $(LFLG) $(OBJ) $(LIB) -o $(APP).exe

banner:
	@echo Building $(APP)-$(VER)

clean:
	@echo Cleaning $(APP)
	@$(RM) $(OBJ) 2> nul

distclean: clean
	@$(RM) $(APP).exe 2> nul

%.o: %.cpp
	@echo Compiling $<
	@$(CC) $(CFLG) $(INC) $(DEF) -c $< -o $@
