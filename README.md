# madokaOS
hobby OS based on Higuchi Madoka

- tools used for kernel: g++, binutils, libc6-dev-i386, gcc-multilib, g++-multilib
- tools used for ISO: grub-pc-bin, xorriso

### Use QEMU
```
qemu-system-i386 -cdrom madokaOS.iso
```

### Clean way to build and run the OS
```
make clean //to clean any residues
./ISO.sh //to automate creation of ISO file
qemu-system-i386 -cdrom madokaOS.iso //use after creation of iso file
```