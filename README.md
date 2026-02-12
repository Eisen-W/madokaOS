# madokaOS
hobby OS based on Higuchi Madoka

- tools used for kernel: g++, binutils, libc6-dev-i386, gcc-multilib, g++-multilib
- tools used for ISO: grub-pc-bin, xorriso

Install QEMU (specifically i386) to run the OS:
```
sudo apt install qemu-system
```

### Clean way to build and run the OS
```
make clean      //to clean any residues
./ISO.sh        //to automate creation of ISO file
make run        //use after creation of iso file
```