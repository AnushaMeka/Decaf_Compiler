#!/bin/bash

# flex ../scanner.l
#cp lex.yy.c ../

#g++ -c -x c++ ../lex.yy.c

flex ../scanner.l
cp lex.yy.c ../


g++ -c -x c++ ../lex.yy.c

yacc -d -t ../parser.y
cp y.tab.h ../
cp y.tab.c ../

g++ -c -x c++ ../y.tab.c

g++ -c ../main.cc ../errors.cc ../utility.cc ../ast_decl.cc ../ast_expr.cc ../ast_stmt.cc ../ast_type.cc ../ast.cc

g++ -o driver main.o errors.o utility.o lex.yy.o y.tab.o ast_decl.o ast_expr.o ast_stmt.o ast_type.o ast.o
