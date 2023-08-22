

gcc -c ../asm/example.S -o ../temp/example.o
gcc ../temp/example.o -o ../bin/example
cd ../bin
./example
