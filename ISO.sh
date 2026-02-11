#!/bin/bash

# Run this script to automate the creation of ISO file

set -e

echo "[1/4] Cleaning..."
make clean || true

echo "[2/4] Building kernel..."
make

echo "[3/4] preparing iso tree..."
rm -rf iso
mkdir -p iso/boot/grub
cp madokaOS.bin iso/boot/

cat > iso/boot/grub/grub.cfg <<EOF
set timeout=0
set default =0

menuentry "madokaOS" {
    multiboot /boot/madokaOS.bin
    boot
}
EOF

echo "[4/4] building ISO..."
grub-mkrescue -o madokaOS.iso iso > /dev/null 2>&1

if [ -f "madokaOS.iso" ]; then
    echo "ISO created"
fi