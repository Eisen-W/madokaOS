GPPPARAMS = -m32 -ffreestanding -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore -fno-pie -no-pie
ASMPARAMS = --32
LDPARAMS = -m elf_i386

OBJDIR = obj

objects = $(OBJDIR)/loader.o \
		  $(OBJDIR)/kernel.o	

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

clean:
	rm -rf $(OBJDIR) madokaOS.bin madokaOS.iso iso

.PHONY: all clean install