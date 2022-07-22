# by Mykhailo Kapitanov <xoomoh@luny.pl>
# Odessa / Ukraine 2022

APP = libsdl
VER = 1.2.15

CC = gcc
AR = ar
RM = del

OBJ += SDL.o
OBJ += SDL_RLEaccel.o
OBJ += SDL_active.o
OBJ += SDL_audio.o
OBJ += SDL_audiocvt.o
OBJ += SDL_audiodev.o
OBJ += SDL_blit.o
OBJ += SDL_blit_0.o
OBJ += SDL_blit_1.o
OBJ += SDL_blit_A.o
OBJ += SDL_blit_N.o
OBJ += SDL_bmp.o
OBJ += SDL_cdrom.o
OBJ += SDL_cpuinfo.o
OBJ += SDL_cursor.o
OBJ += SDL_dibaudio.o
OBJ += SDL_dibevents.o
OBJ += SDL_dibvideo.o
OBJ += SDL_diskaudio.o
OBJ += SDL_dummyaudio.o
OBJ += SDL_dx5audio.o
OBJ += SDL_dx5events.o
OBJ += SDL_dx5video.o
OBJ += SDL_dx5yuv.o
OBJ += SDL_error.o
OBJ += SDL_events.o
OBJ += SDL_expose.o
OBJ += SDL_fatal.o
OBJ += SDL_gamma.o
OBJ += SDL_getenv.o
OBJ += SDL_iconv.o
OBJ += SDL_joystick.o
OBJ += SDL_keyboard.o
OBJ += SDL_malloc.o
OBJ += SDL_mixer.o
OBJ += SDL_mixer_MMX.o
OBJ += SDL_mixer_MMX_VC.o
OBJ += SDL_mixer_m68k.o
OBJ += SDL_mmjoystick.o
OBJ += SDL_mouse.o
OBJ += SDL_nullevents.o
OBJ += SDL_nullvideo.o
OBJ += SDL_pixels.o
OBJ += SDL_qsort.o
OBJ += SDL_quit.o
OBJ += SDL_resize.o
OBJ += SDL_rwops.o
OBJ += SDL_stdlib.o
OBJ += SDL_stretch.o
OBJ += SDL_string.o
OBJ += SDL_surface.o
OBJ += SDL_syscdrom.o
OBJ += SDL_syscond.o
OBJ += SDL_sysevents.o
OBJ += SDL_sysjoystick.o
OBJ += SDL_sysloadso.o
OBJ += SDL_sysmouse.o
OBJ += SDL_sysmutex.o
OBJ += SDL_syssem.o
OBJ += SDL_systhread.o
OBJ += SDL_systimer.o
OBJ += SDL_syswm.o
OBJ += SDL_thread.o
OBJ += SDL_timer.o
OBJ += SDL_video.o
OBJ += SDL_wave.o
OBJ += SDL_win32_main.o
OBJ += SDL_wingl.o
OBJ += SDL_yuv.o
OBJ += SDL_yuv_mmx.o
OBJ += SDL_yuv_sw.o

INC += -I inc
INC += -I inc/audio
INC += -I inc/audio/dummy
INC += -I inc/cdrom
INC += -I inc/cdrom/dummy
INC += -I inc/events
INC += -I inc/joystick
INC += -I inc/joystick/dummy
INC += -I inc/thread
INC += -I inc/thread/generic
INC += -I inc/timer
INC += -I inc/timer/dummy
INC += -I inc/video
INC += -I inc/video/dummy

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
