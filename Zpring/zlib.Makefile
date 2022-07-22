# by Mykhailo Kapitanov <xoomoh@luny.pl>
# Odessa / Ukraine 2022

APP = libz
VER = 1.2.11

CC = gcc
AR = ar
RM = del

OBJ += adler32.o
OBJ += compress.o
OBJ += crc32.o
OBJ += deflate.o
OBJ += gzclose.o
OBJ += gzlib.o
OBJ += gzread.o
OBJ += gzwrite.o
OBJ += infback.o
OBJ += inffast.o
OBJ += inflate.o
OBJ += inftrees.o
OBJ += trees.o
OBJ += uncompr.o
OBJ += zutil.o

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
