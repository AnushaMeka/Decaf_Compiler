#include <string.h>
#include <stdio.h>
#include "usage.h"
#include "error.h"
#include "scanner.h"
#include "locLine.h"

static void PrintAToken(TokenType token, const char *text, YYSTYPE value,
                          yyltype loc)
{
  char buffer[] = {'\'', (char)token, '\'', '\0'};
  const char *name = token >= T_Void ? gTokenNames[token - T_Void] : buffer;
  
  printf("%-12s line %d cols %d-%d is %s ", text,
	   loc.first_line, loc.first_column, loc.last_column, name);
  
  switch(token) {
    case T_IntConstant:     
      printf("(value = %d)\n", value.integerConstant); break;
    case T_DoubleConstant:   
      printf("(value = %g)\n", value.doubleConstant); break;
    case T_StringConstant:  
      printf("(value = %s)\n", value.stringConstant); break;
    case T_BoolConstant:    
      printf("(value = %s)\n", value.boolConstant ? "true" : "false"); break;
    case T_Identifier:
	if (strcmp(text, value.identifier)) {
	  printf("(truncated to %s)\n", value.identifier);
	  break;
	}
    default:
      printf("\n"); break;
  }
}

int main(int argc, char *argv[])
{
    ParseArguments(argc, argv);
    InitScanner();
    TokenType token;
    while ((token = (TokenType)yylex()) != 0) 
        PrintAToken(token, yytext, yylval, yylloc);
    return (NotifyError::NumErrors() == 0? 0 : -1);
}

