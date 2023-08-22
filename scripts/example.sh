#!/bin/bash

#clang -c ../asm/example.S -o ../temp/example.o
#clang ../temp/example.o -o ../bin/example

fmt=""
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        fmt="-felf64"
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        fmt="-fmacho64"
fi

yasm --parser="gas" $fmt ../asm/example.S -o ../temp/example.o
clang ../temp/example.o -o ../bin/example
cd ../bin
./example
