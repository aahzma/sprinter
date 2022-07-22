# by Mykhailo Kapitanov <xoomoh@luny.pl>
# Odessa / Ukraine 2022

APP = libpng
VER = 1.6.37

CC = gcc
AR = ar
RM = del

OBJ += png.o
OBJ += pngerror.o
OBJ += pngget.o
OBJ += pngmem.o
OBJ += pngpread.o
OBJ += pngread.o
OBJ += pngrio.o
OBJ += pngrtran.o
OBJ += pngrutil.o
OBJ += pngset.o
OBJ += pngtrans.o
OBJ += pngwio.o
OBJ += pngwrite.o
OBJ += pngwtran.o
OBJ += pngwutil.o

INC = -I inc

CFLG =
AFLG = -cr

all: banner $(OBJ)
	@echo Creating $(APP).a
	@$(AR) $(AFLG) $(APP).a $(OBJ)

banner:
	@echo Building $(APP)-$(VER)

clean:
	@echo Cleaning $(APP)
	@$(RM) $(OBJ) 2> nul

distclean: clean
	@$(RM) $(APP).a 2> nul

%.o: %.c
	@echo Compiling $<
	@$(CC) $(CFLG) $(INC) -c $< -o $@
