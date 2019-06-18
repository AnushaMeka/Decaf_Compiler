#!/bin/bash

flex ../scanner.l
cp lex.yy.c ../
g++ -c -x c++ ../lex.yy.c
g++ -c ../main.cc ../error.cc ../usage.cc
g++ -o driver main.o error.o usage.o lex.yy.o

echo "Build successful and Generated .o files successfully."

echo "Running ./ecec.sh <sample file filepath> genetares output for single sample file to standard output screen."  
