INCLUDES = include

GPPPARAMS = -I$(INCLUDES) -m32 -ffreestanding -nostdlib -fno-builtin -fno-rtti -fno-exceptions \
			-fno-leading-underscore -fno-pie -no-pie -fno-use-cxa-atexit
ASMPARAMS = --32
LDPARAMS = -m elf_i386

OBJDIR = obj

objects = $(OBJDIR)/loader.o \
		  $(OBJDIR)/kernel.o \
		  $(OBJDIR)/gdt.o	 \
		  $(OBJDIR)/port.o

all: madokaOS.bin

$(OBJDIR)/%.o: src/%.cpp
		@mkdir -p $(OBJDIR)
		g++ $(GPPPARAMS) -o $@ -c $<

$(OBJDIR)/%.o: src/%.s
		@mkdir -p $(OBJDIR)
		as $(ASMPARAMS) -o $@ $<

madokaOS.bin: linker.ld $(objects)
		ld $(LDPARAMS) -T $< -o $@ $(objects)

install: madokaOS.bin	
		sudo cp $< /boot/madokaOS.bin

run: madokaOS.iso
	qemu-system-i386 -cdrom madokaOS.iso



clean:
	rm -rf $(OBJDIR) madokaOS.bin madokaOS.iso iso

.PHONY: all clean install