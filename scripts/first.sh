#!/bin/bash

fmt=""
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        fmt="-felf64"
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        fmt="-fmacho64"
fi

yasm --parser="gas" $fmt ../examples/first.S -o ../temp/first.o
clang ../temp/first.o -o ../bin/first
cd ../bin
./first
