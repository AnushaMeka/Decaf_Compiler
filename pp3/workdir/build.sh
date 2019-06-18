#!/bin/bash

yacc -d -t ../parser.y
cp y.tab.h ../
cp y.tab.c ../

flex ../scanner.l
cp lex.yy.c ../

g++ -c -x c++ ../lex.yy.c

g++ -c -x c++ ../y.tab.c

g++ -c ../main.cc ../errors.cc ../utility.cc ../ast_decl.cc ../ast_expr.cc ../ast_stmt.cc ../ast_type.cc ../ast.cc

g++ -o driver main.o errors.o utility.o lex.yy.o y.tab.o ast_decl.o ast_expr.o ast_stmt.o ast_type.o ast.o

echo "Build successful and Generated .o files successfully."

echo "Running ./exec.sh <sample file filepath> genetares output for single sample file to standard output screen."

echo "========================================="
echo "example:  ./exec.sh ../samples/bad1.decaf"
echo "========================================="
