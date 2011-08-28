TARGET = Attributes

CC = gcc
LD = $(CC)
CFLAGS = -isysroot /User/sysroot \
	 -Wall \
	 -std=gnu99 \
	 -c
LDFLAGS = -isysroot /User/sysroot \
	  -w \
	  -dynamiclib \
	  -lobjc \
	  -framework Foundation \
	  -framework UIKit

OBJECTS = Attributes.o AttributesController.o

all: $(OBJECTS)
	$(LD) $(LDFLAGS) -o $(TARGET) $(OBJECTS)

%.o: %.m
	$(CC) $(CFLAGS) -o $@ $^
