# madokaOS
hobby OS based on Higuchi Madoka

- tools used for kernel: g++, binutils, libc6-dev-i386, gcc-multilib, g++-multilib
- tools used for ISO: grub-pc-bin, xorriso

<h2>Use QEMU</h2>
```
qemu-system-i386 -cdrom madokaOS.iso
```

<h2>Clean way to build and run the OS</h2>
```
make clean //to clean any residues
./ISO.sh //to automate creation of ISO file
qemu-system-i386 -cdrom madokaOS.iso //use after creation of iso file
```