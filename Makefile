LD = gcc
CC = gcc

CFLAGS := \
	-Isrc/include \
	-Wall \
	-Wextra \
	-std=gnu99 \

CFILES := $(shell find src/ -name '*.c')
OFILES := $(CFILES:.c=.o)

TARGET = proman

all: clean compile install

compile: ld
	@ echo "Compiled!"
	
ld: $(OFILES)
	@ echo "[ LD ] -  $^"
	@ $(LD) $^ -o $(TARGET)

%.o: %.c
	@ echo "[ CC ] -  $<"
	@ $(CC) $(CFLAGS) -c $< -o $@

clean:
	@ echo "[ CLEAN ]"
	@ rm -rf $(OFILES) $(TARGET)

install:
	@ sudo cp ./proman /usr/bin
	@ echo "Installed!"