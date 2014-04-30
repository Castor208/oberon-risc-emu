CFLAGS = -g -Os -Wall -Wextra -Wconversion -Wno-sign-conversion -Wno-unused-parameter
SDL2_CONFIG = sdl2-config

RISC_CFLAGS = $(CFLAGS) -std=c99 `$(SDL2_CONFIG) --cflags --libs` -lm

RISC_SOURCE = \
	sdl-main.c \
	sdl-ps2.c sdl-ps2.h \
	risc.c risc.h risc-boot.inc \
	risc-fp.c risc-fp.h \
	disk.c disk.h \
	pclink.c pclink.h \
	raw-serial.c raw-serial.h

risc: $(RISC_SOURCE) 
	$(CC) -o $@ $(filter %.c, $^) $(RISC_CFLAGS)

clean:
	rm -f risc
