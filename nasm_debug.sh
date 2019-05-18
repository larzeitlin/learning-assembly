#!/bin/bash

nasm -g -f elf64 -l $1.lst $1.asm && ld -g -o $1 $1.o
