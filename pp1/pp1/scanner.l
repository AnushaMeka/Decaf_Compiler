%{
#include <ctype.h>
#include <string.h>
//#include <stdbool.h>
#include "scanner.h"
#include "usage.h" // for PrintDebug()
#include "error.h"
#include <vector>
using namespace std;

YYSTYPE yylval;  // manually declared for pp1, later Yacc provides
struct yyltype yylloc; // manually dclared for pp1, later Yacc provides

static int curLineNum, curColNum;
vector<const char*> savedLines;

static void DoBeforeEachAction(); 
#define YY_USER_ACTION DoBeforeEachAction();
#define TAB_SIZE 4
%}

%s N
%x COPY COMM 
%option stack
%option noyywrap

 /* Definition */
WHITESPACE          ([ \t]+)
NEWLINE             (\r|\n|\r\n)
SINGLE_COMMENT      ("//"[^\r\n]*)
BEG_COMMENT         ("/*")
END_COMMENT         ("*/")
IDENTIFIER          ([A-Za-z][A-Za-z0-9_]*)
DEC_INTEGER         ([0-9]+)
HEX_INTEGER         (0[xX][0-9A-Fa-f]+)
INTEGER             ({DEC_INTEGER}|{HEX_INTEGER})
BEG_STRING          (\"[^"\n]*)
STRING              ({BEG_STRING}\")
EXPONENT            ([Ee][+-]?{DEC_INTEGER})
DOUBLE_NUM          ([0-9]+\.[0-9]*)
DOUBLE_SCI          ({DOUBLE_NUM}{EXPONENT})
OPERATOR            ([-+/*%=.,;!<>()[\]{}:])

%%
<COPY>.*           { char curLine[512]; 
                     savedLines.push_back(strdup(yytext)); 
                     curColNum = 1; 
                     yy_pop_state();
                     yyless(0); }
<COPY><<EOF>>      { yy_pop_state(); }                     
<*>{NEWLINE}       { curLineNum++; 
                     curColNum = 1;
                     if(YYSTATE==COPY)
                        savedLines.push_back("");
                     else
                        yy_push_state(COPY); }
[ ]+               { /* ignore all spaces */ }
<*>[\t]            { curColNum += TAB_SIZE-curColNum%TAB_SIZE + 1; }      

 /* Comments */
{SINGLE_COMMENT}            { /* Just ignore */ }
{BEG_COMMENT}               { BEGIN(COMM); }
<COMM>{END_COMMENT}         { BEGIN(N); }
<COMM><<EOF>>               { 
                                NotifyError::NonterminalComment(); 
                                return 0;
                            }
<COMM>.                     { /* Just ignore */ }                            

 /* Keywords */
"int"              { return T_Int; }
"double"           { return T_Double; }
"bool"             { return T_Bool; }
"string"           { return T_String; }
"void"             { return T_Void;}
"break"            { return T_Break; }
"class"            { return T_Class; }
"else"             { return T_Else; }
"extends"          { return T_Extends; }
"for"              { return T_For; }
"if"               { return T_If; }
"new"              { return T_New; }
"null"             { return T_Null; }
"return"           { return T_Return; }
"this"             { return T_This; }
"while"            { return T_While; }
"static"           { return T_Static; }
"Print"            { return T_Print; }
"ReadInteger"      { return T_ReadInteger; }
"ReadLine"         { return T_ReadLine; }
"instanceof"       { return T_InstanceOf; }
"NewArray"         { return T_NewArray; }
"implements"       { return T_Implements; }
"interface"        { return T_Interface; }
"switch"           { return T_Switch; }
"case"             { return T_Case; }
"default"          { return T_Default; }

 /* Operator and Separator */
"<="               { return T_LessEqual; }
">="               { return T_GreaterEqual; }
"=="               { return T_Equal; }
"!="               { return T_NotEqual; }
"&&"               { return T_And; }
"||"               { return T_Or; }
"[]"               { return T_Dims; }
"++"               { return T_Increment; }
"--"               { return T_Decrement; }
{OPERATOR}         { return yytext[0]; }

 /* Constants */
"true"              { yylval.boolConstant = (yytext[0]=='t'); return T_BoolConstant; }
"false"             { yylval.boolConstant = (yytext[0]=='t');  return T_BoolConstant; }
{DEC_INTEGER}       { yylval.integerConstant = strtol(yytext, NULL, 10); return T_IntConstant; }
{HEX_INTEGER}       { yylval.integerConstant = strtol(yytext, NULL, 16); return T_IntConstant; }
{DOUBLE_NUM}        { yylval.doubleConstant = atof(yytext); return T_DoubleConstant; }
{DOUBLE_SCI}        { yylval.doubleConstant = atof(yytext); return T_DoubleConstant; }
{STRING}            { yylval.stringConstant = strdup(yytext); return T_StringConstant; }
{BEG_STRING}        { NotifyError::NonterminalString(&yylloc, yytext); }

 /* Identifier */
{IDENTIFIER}       { if(strlen(yytext)>MaxIdentLen)
                        NotifyError::LongIdentifier(&yylloc, yytext);
                     strncpy(yylval.identifier, yytext, MaxIdentLen);
                     yylval.identifier[MaxIdentLen] = '\0';
                     return T_Identifier; }

 /* Default rule (error) */
.                   { 
                        NotifyError::UnrecognizedChar(&yylloc, yytext[0]); 
                    }
%%
void InitScanner()
{
    PrintDebugKey("lex", "Initializing scanner");
    // yy_flex_debug = false;
    yy_flex_debug = IsDebugOn("lex");
    BEGIN(N);
    yy_push_state(COPY); // copy first line at start
    curLineNum = 1;
    curColNum = 1;
}

static void DoBeforeEachAction()
{
    yylloc.first_line = curLineNum;
    yylloc.first_column = curColNum;
    yylloc.last_column = curColNum + yyleng - 1;
    curColNum += yyleng;
}
