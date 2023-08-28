#!/bin/bash

#clang -c ../asm/example.S -o ../temp/example.o
#clang ../temp/example.o -o ../bin/example

fmt=""
asm=""
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      # Linux
      fmt="-felf64"
      asm="../asm/example_linux.S"
elif [[ "$OSTYPE" == "darwin"* ]]; then
      # Mac OSX
      fmt="-fmacho64"
      asm="../asm/example_macos.S"
fi

yasm --parser="gas" $fmt $asm -o ../temp/example.o
clang ../temp/example.o -o ../bin/example
cd ../bin
./example
