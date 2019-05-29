#!/bin/bash
nasm -f bin 32bit_main.asm -o 32bit_main.bin
qemu-system-x86_64 32bit_main.bin
