

gcc -c ../asm/example.S -o ../temp/example.o
gcc ../temp/example.o -o ../temp/example
cd ../temp
./example
