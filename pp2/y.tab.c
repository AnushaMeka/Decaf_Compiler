/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 1



/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     T_Void = 258,
     T_Bool = 259,
     T_Int = 260,
     T_Double = 261,
     T_String = 262,
     T_Class = 263,
     T_LessEqual = 264,
     T_GreaterEqual = 265,
     T_Equal = 266,
     T_NotEqual = 267,
     T_Dims = 268,
     T_Increment = 269,
     T_Decrement = 270,
     T_And = 271,
     T_Or = 272,
     T_Null = 273,
     T_Extends = 274,
     T_This = 275,
     T_Interface = 276,
     T_Implements = 277,
     T_While = 278,
     T_For = 279,
     T_If = 280,
     T_Else = 281,
     T_Return = 282,
     T_Break = 283,
     T_Switch = 284,
     T_Case = 285,
     T_Default = 286,
     T_New = 287,
     T_NewArray = 288,
     T_Print = 289,
     T_ReadInteger = 290,
     T_ReadLine = 291,
     T_Static = 292,
     T_InstanceOf = 293,
     T_Identifier = 294,
     T_StringConstant = 295,
     T_IntConstant = 296,
     T_DoubleConstant = 297,
     T_BoolConstant = 298,
     UMINUS = 299,
     NOELSE = 300
   };
#endif
/* Tokens.  */
#define T_Void 258
#define T_Bool 259
#define T_Int 260
#define T_Double 261
#define T_String 262
#define T_Class 263
#define T_LessEqual 264
#define T_GreaterEqual 265
#define T_Equal 266
#define T_NotEqual 267
#define T_Dims 268
#define T_Increment 269
#define T_Decrement 270
#define T_And 271
#define T_Or 272
#define T_Null 273
#define T_Extends 274
#define T_This 275
#define T_Interface 276
#define T_Implements 277
#define T_While 278
#define T_For 279
#define T_If 280
#define T_Else 281
#define T_Return 282
#define T_Break 283
#define T_Switch 284
#define T_Case 285
#define T_Default 286
#define T_New 287
#define T_NewArray 288
#define T_Print 289
#define T_ReadInteger 290
#define T_ReadLine 291
#define T_Static 292
#define T_InstanceOf 293
#define T_Identifier 294
#define T_StringConstant 295
#define T_IntConstant 296
#define T_DoubleConstant 297
#define T_BoolConstant 298
#define UMINUS 299
#define NOELSE 300




/* Copy the first part of user declarations.  */
#line 11 "../parser.y"


/* Just like lex, the text within this first region delimited by %{ and %}
 * is assumed to be C/C++ code and will be copied verbatim to the y.tab.c
 * file ahead of the definitions of the yyparse() function. Add other header
 * file inclusions or C++ variable declarations/prototypes that are needed
 * by your code here.
 */
#include "scanner.h" // for yylex
#include "parser.h"
#include "errors.h"

void yyerror(const char *msg); // standard error-handling routine



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 41 "../parser.y"
{
    int integerConstant;
    bool boolConstant;
    char *stringConstant;
    double doubleConstant;
    char identifier[MaxIdentLen+1]; // +1 for terminating null
    Decl *decl;
    List<Decl*> *declList;
    Type *type;
    VarDecl *varDecl;
    FnDecl *fnDecl;
    Identifier *identObj;
    List<NamedType*> *nTList;
    ClassDecl *classDecl;
    NamedType *extendsClause;
    InterfaceDecl *ifaceDecl;
    List<VarDecl*> *varDecls;
    List<Stmt*> *statements;
    Stmt* stmt;
    PrintStmt *printStmt;
    List<Expr*> *exprList;
    Expr *expr;
    StmtBlock *stmtBlock;
    LValue *lvalue;
    Call *call;
    IfStmt *ifStmt;
    WhileStmt *whileStmt;
    ForStmt *forStmt;
    ReturnStmt *returnStmt;
    BreakStmt *breakStmt;
    SwitchStmt *switchStmt;
    List<CaseStmt*> *caseStmts;
    CaseStmt *caseStmt;
    DefaultStmt *defaultStmt;
}
/* Line 193 of yacc.c.  */
#line 238 "y.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} YYLTYPE;
# define yyltype YYLTYPE /* obsolescent; will be withdrawn */
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 263 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
	     && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
    YYLTYPE yyls;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE) + sizeof (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  22
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   846

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  65
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  40
/* YYNRULES -- Number of rules.  */
#define YYNRULES  112
/* YYNRULES -- Number of states.  */
#define YYNSTATES  227

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   300

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    54,     2,     2,     2,    53,     2,     2,
      60,    61,    51,    49,    58,    50,    56,    52,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    64,    57,
      47,    46,    48,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    55,     2,    59,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    62,     2,    63,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     8,    10,    12,    14,    16,    18,
      21,    24,    26,    30,    32,    36,    41,    43,    45,    47,
      49,    51,    54,    56,    57,    59,    66,    73,    81,    82,
      85,    86,    89,    91,    95,    96,    99,   101,   103,   109,
     110,   113,   120,   127,   132,   133,   136,   137,   140,   142,
     145,   147,   149,   151,   153,   155,   157,   159,   161,   163,
     167,   173,   181,   187,   195,   204,   213,   223,   226,   230,
     233,   239,   247,   256,   258,   261,   266,   270,   274,   276,
     278,   281,   284,   286,   288,   292,   296,   300,   304,   308,
     312,   315,   319,   323,   327,   331,   335,   339,   343,   347,
     350,   354,   358,   361,   368,   373,   380,   381,   383,   385,
     387,   389,   391
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      66,     0,    -1,    67,    -1,    67,    68,    -1,    68,    -1,
      69,    -1,    76,    -1,    77,    -1,    83,    -1,    70,    57,
      -1,    73,    74,    -1,    70,    -1,    71,    58,    70,    -1,
      74,    -1,   101,    56,    74,    -1,   101,    55,   101,    59,
      -1,     5,    -1,     6,    -1,     4,    -1,     7,    -1,    74,
      -1,    73,    13,    -1,    39,    -1,    -1,    71,    -1,    73,
      74,    60,    75,    61,    86,    -1,     3,    74,    60,    75,
      61,    86,    -1,     8,    74,    78,    79,    62,    81,    63,
      -1,    -1,    19,    74,    -1,    -1,    22,    80,    -1,    74,
      -1,    80,    58,    74,    -1,    -1,    81,    82,    -1,    69,
      -1,    76,    -1,    21,    74,    62,    84,    63,    -1,    -1,
      84,    85,    -1,    73,    74,    60,    75,    61,    57,    -1,
       3,    74,    60,    75,    61,    57,    -1,    62,    87,    88,
      63,    -1,    -1,    87,    69,    -1,    -1,    89,    88,    -1,
      57,    -1,   101,    57,    -1,    91,    -1,    92,    -1,    93,
      -1,    95,    -1,    94,    -1,    96,    -1,    97,    -1,    86,
      -1,   101,    -1,    90,    58,   101,    -1,    25,    60,   101,
      61,    89,    -1,    25,    60,   101,    61,    89,    26,    89,
      -1,    23,    60,   101,    61,    89,    -1,    24,    60,    57,
     101,    57,    61,    89,    -1,    24,    60,   101,    57,   101,
      57,    61,    89,    -1,    24,    60,    57,   101,    57,   101,
      61,    89,    -1,    24,    60,   101,    57,   101,    57,   101,
      61,    89,    -1,    27,    57,    -1,    27,   101,    57,    -1,
      28,    57,    -1,    34,    60,    90,    61,    57,    -1,    29,
      60,   101,    61,    62,    98,    63,    -1,    29,    60,   101,
      61,    62,    98,   100,    63,    -1,    99,    -1,    98,    99,
      -1,    30,    41,    64,    88,    -1,    31,    64,    88,    -1,
      72,    46,   101,    -1,   104,    -1,    72,    -1,    72,    14,
      -1,    72,    15,    -1,    20,    -1,   102,    -1,    60,   101,
      61,    -1,   101,    49,   101,    -1,   101,    50,   101,    -1,
     101,    51,   101,    -1,   101,    52,   101,    -1,   101,    53,
     101,    -1,    50,   101,    -1,   101,    47,   101,    -1,   101,
       9,   101,    -1,   101,    48,   101,    -1,   101,    10,   101,
      -1,   101,    11,   101,    -1,   101,    12,   101,    -1,   101,
      16,   101,    -1,   101,    17,   101,    -1,    54,   101,    -1,
      35,    60,    61,    -1,    36,    60,    61,    -1,    32,    74,
      -1,    33,    60,   101,    58,    73,    61,    -1,    74,    60,
     103,    61,    -1,   101,    56,    74,    60,   103,    61,    -1,
      -1,    90,    -1,    41,    -1,    42,    -1,    43,    -1,    40,
      -1,    18,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   174,   174,   186,   187,   191,   192,   193,   194,   198,
     202,   206,   207,   211,   212,   213,   217,   218,   219,   220,
     221,   222,   226,   230,   231,   235,   236,   240,   244,   245,
     249,   250,   254,   255,   259,   260,   264,   265,   269,   273,
     274,   278,   279,   283,   287,   288,   292,   293,   297,   298,
     299,   300,   301,   302,   303,   304,   305,   306,   310,   311,
     315,   316,   320,   324,   325,   326,   327,   331,   332,   336,
     340,   344,   345,   349,   350,   354,   358,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,   376,   377,   378,   379,   380,   381,   382,   383,   384,
     385,   386,   387,   388,   392,   393,   397,   398,   402,   403,
     404,   405,   406
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "T_Void", "T_Bool", "T_Int", "T_Double",
  "T_String", "T_Class", "T_LessEqual", "T_GreaterEqual", "T_Equal",
  "T_NotEqual", "T_Dims", "T_Increment", "T_Decrement", "T_And", "T_Or",
  "T_Null", "T_Extends", "T_This", "T_Interface", "T_Implements",
  "T_While", "T_For", "T_If", "T_Else", "T_Return", "T_Break", "T_Switch",
  "T_Case", "T_Default", "T_New", "T_NewArray", "T_Print", "T_ReadInteger",
  "T_ReadLine", "T_Static", "T_InstanceOf", "T_Identifier",
  "T_StringConstant", "T_IntConstant", "T_DoubleConstant",
  "T_BoolConstant", "UMINUS", "NOELSE", "'='", "'<'", "'>'", "'+'", "'-'",
  "'*'", "'/'", "'%'", "'!'", "'['", "'.'", "';'", "','", "']'", "'('",
  "')'", "'{'", "'}'", "':'", "$accept", "Program", "DeclList", "Decl",
  "VariableDecl", "Variable", "VariableList", "LValue", "Type",
  "Identifier", "Formals", "FunctionDecl", "ClassDecl", "ExtendsClause",
  "ImplementsClause", "InterfaceList", "FieldList", "Field",
  "InterfaceDecl", "PrototypeList", "Prototype", "StmtBlock",
  "VariableDeclList", "StmtList", "Stmt", "ExprList", "IfStmt",
  "WhileStmt", "ForStmt", "ReturnStmt", "BreakStmt", "PrintStmt",
  "SwitchStmt", "CaseStmts", "CaseStmt", "DefaultStmt", "Expr", "Call",
  "Actuals", "Constant", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,    61,    60,    62,    43,
      45,    42,    47,    37,    33,    91,    46,    59,    44,    93,
      40,    41,   123,   125,    58
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    65,    66,    67,    67,    68,    68,    68,    68,    69,
      70,    71,    71,    72,    72,    72,    73,    73,    73,    73,
      73,    73,    74,    75,    75,    76,    76,    77,    78,    78,
      79,    79,    80,    80,    81,    81,    82,    82,    83,    84,
      84,    85,    85,    86,    87,    87,    88,    88,    89,    89,
      89,    89,    89,    89,    89,    89,    89,    89,    90,    90,
      91,    91,    92,    93,    93,    93,    93,    94,    94,    95,
      96,    97,    97,    98,    98,    99,   100,   101,   101,   101,
     101,   101,   101,   101,   101,   101,   101,   101,   101,   101,
     101,   101,   101,   101,   101,   101,   101,   101,   101,   101,
     101,   101,   101,   101,   102,   102,   103,   103,   104,   104,
     104,   104,   104
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     1,     2,
       2,     1,     3,     1,     3,     4,     1,     1,     1,     1,
       1,     2,     1,     0,     1,     6,     6,     7,     0,     2,
       0,     2,     1,     3,     0,     2,     1,     1,     5,     0,
       2,     6,     6,     4,     0,     2,     0,     2,     1,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
       5,     7,     5,     7,     8,     8,     9,     2,     3,     2,
       5,     7,     8,     1,     2,     4,     3,     3,     1,     1,
       2,     2,     1,     1,     3,     3,     3,     3,     3,     3,
       2,     3,     3,     3,     3,     3,     3,     3,     3,     2,
       3,     3,     2,     6,     4,     6,     0,     1,     1,     1,
       1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,    18,    16,    17,    19,     0,     0,    22,     0,
       2,     4,     5,     0,     0,    20,     6,     7,     8,     0,
      28,     0,     1,     3,     9,    21,    10,    23,     0,    30,
      39,    23,    11,    24,     0,     0,    29,     0,     0,     0,
       0,     0,    10,     0,    32,    31,    34,     0,    38,     0,
      40,     0,    12,    44,    26,     0,     0,     0,     0,    25,
      46,    33,    27,    36,    37,    35,    23,    23,   112,    82,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   111,   108,   109,   110,     0,     0,    48,     0,    45,
      79,    13,    57,     0,    46,    50,    51,    52,    54,    53,
      55,    56,     0,    83,    78,     0,     0,     0,     0,     0,
      67,    13,     0,    69,     0,   102,     0,     0,     0,     0,
      90,    99,     0,    80,    81,     0,   106,    43,    47,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    49,     0,     0,     0,     0,     0,
       0,    68,     0,     0,     0,    58,   100,   101,    84,    77,
     107,     0,    92,    94,    95,    96,    97,    98,    91,    93,
      85,    86,    87,    88,    89,     0,    14,    42,    41,     0,
       0,     0,     0,     0,     0,     0,     0,   104,    15,   106,
      62,     0,     0,    60,     0,     0,    59,    70,     0,     0,
       0,     0,     0,     0,     0,    73,   103,   105,    63,     0,
       0,     0,    61,     0,     0,    71,    74,     0,    65,    64,
       0,    46,    46,    72,    66,    75,    76
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     9,    10,    11,    12,    13,    33,    90,    34,   111,
      35,    16,    17,    29,    38,    45,    56,    65,    18,    39,
      50,    92,    60,    93,    94,   160,    95,    96,    97,    98,
      99,   100,   101,   204,   205,   217,   102,   103,   161,   104
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -93
static const yytype_int16 yypact[] =
{
     353,   -34,   -93,   -93,   -93,   -93,   -34,   -34,   -93,    11,
     353,   -93,   -93,     6,    44,   -93,   -93,   -93,   -93,   -31,
      27,     7,   -93,   -93,   -93,   -93,     5,    19,   -34,    46,
     -93,    19,   -93,    12,    44,    10,   -93,   -34,    13,    15,
      16,    19,   -93,    18,   -93,    31,   -93,   -34,   -93,    44,
     -93,    18,   -93,   -93,   -93,   -34,    81,    32,    48,   -93,
     135,   -93,   -93,   -93,   -93,   -93,    19,    19,   -93,   -93,
      49,    50,    51,   734,    57,    55,   -34,    63,    64,    65,
      67,   -93,   -93,   -93,   -93,   786,   786,   -93,   786,   -93,
      47,     4,   -93,    68,   641,   -93,   -93,   -93,   -93,   -93,
     -93,   -93,   403,   -93,   -93,    71,    72,   786,   760,   786,
     -93,    74,   452,   -93,   786,   -93,   786,   786,    75,    76,
     -20,   -20,   189,   -93,   -93,   786,   786,   -93,   -93,   786,
     786,   786,   786,   786,   786,   786,   786,   786,   786,   786,
     786,   786,   786,   -34,   -93,    78,    88,   204,   786,   463,
     252,   -93,   267,   391,   -28,   534,   -93,   -93,   -93,   534,
      70,    77,   238,   238,   554,   554,   602,   544,   238,   238,
      66,    66,   -20,   -20,   -20,   378,    87,   -93,   -93,   641,
     474,   786,   641,    86,    19,   786,    92,   -93,   -93,   786,
     -93,   672,   523,   131,   142,    -9,   534,   -93,   100,   641,
     315,   703,   641,   124,   -15,   -93,   -93,   -93,   -93,   641,
     641,   330,   -93,   109,   115,   -93,   -93,   117,   -93,   -93,
     641,   641,   641,   -93,   -93,   -93,   -93
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -93,   -93,   -93,   171,   -48,    85,   -93,   -93,     3,     0,
     -22,   126,   -93,   -93,   -93,   -93,   -93,   -93,   -93,   -93,
     -93,   -11,   -93,   -92,     9,    69,   -93,   -93,   -93,   -93,
     -93,   -93,   -93,   -93,   -21,   -93,   -35,   -93,     1,   -93
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -21
static const yytype_int16 yytable[] =
{
      15,    19,   128,    14,    25,     8,    20,    21,    63,    40,
      15,    22,    89,    14,    26,   203,   214,   -20,    47,     2,
       3,     4,     5,     2,     3,     4,     5,    15,    36,    27,
     185,    15,    54,   186,    42,   142,   143,    44,   112,    15,
      59,    15,    49,   -20,   105,   106,    28,    57,   215,    58,
     120,   121,   206,   122,     8,    61,    15,    25,     8,    14,
      91,   123,   124,    24,   126,    31,    15,    15,    37,    30,
      41,    43,   147,   149,   150,    46,   115,    51,    48,   152,
      53,   153,   155,     8,     1,     2,     3,     4,     5,    55,
     159,   155,    66,   125,   162,   163,   164,   165,   166,   167,
     168,   169,   170,   171,   172,   173,   174,   175,    67,   107,
     108,   109,    32,   180,   113,   114,    32,   139,   140,   141,
       8,   142,   143,   116,   117,   118,    52,   119,   185,   225,
     226,   127,   145,   146,   126,   177,   156,   157,   187,     2,
       3,     4,     5,   176,    62,   178,   192,   189,   194,   197,
     196,    32,    32,    68,   155,    69,   200,   202,    70,    71,
      72,   207,    73,    74,    75,   213,   211,    76,    77,    78,
      79,    80,   203,   221,     8,    81,    82,    83,    84,   222,
     223,    23,    64,   216,    15,    85,   154,   195,   190,    86,
     198,   193,    87,     0,     0,    88,     0,    53,   129,   130,
     131,   132,     0,     0,     0,   133,   134,     0,   208,     0,
       0,   212,     0,   129,   130,   131,   132,     0,   218,   219,
     133,   134,     0,     0,     0,     0,     0,     0,     0,   224,
       0,     0,     0,     0,     0,     0,   135,   136,   137,   138,
     139,   140,   141,     0,   142,   143,     0,   -21,   -21,     0,
     158,   135,   136,   137,   138,   139,   140,   141,     0,   142,
     143,   129,   130,   131,   132,   179,     0,     0,   133,   134,
       0,     0,     0,     0,     0,     0,   129,   130,   131,   132,
       0,     0,     0,   133,   134,   -21,   -21,   137,   138,   139,
     140,   141,     0,   142,   143,     0,     0,     0,     0,   135,
     136,   137,   138,   139,   140,   141,     0,   142,   143,     0,
       0,     0,     0,   182,   135,   136,   137,   138,   139,   140,
     141,     0,   142,   143,   129,   130,   131,   132,   183,     0,
       0,   133,   134,     0,     0,     0,     0,     0,     0,   129,
     130,   131,   132,     0,     0,     0,   133,   134,     0,     0,
       0,     0,     0,     0,     0,     0,     1,     2,     3,     4,
       5,     6,   135,   136,   137,   138,   139,   140,   141,     0,
     142,   143,     0,     0,     7,     0,   209,   135,   136,   137,
     138,   139,   140,   141,     0,   142,   143,   129,   130,   131,
     132,   220,     8,     0,   133,   134,     0,     0,     0,     0,
     129,   130,   131,   132,     0,     0,     0,   133,   134,     0,
       0,     0,   129,   130,   131,   132,     0,     0,     0,   133,
     134,     0,     0,     0,     0,   135,   136,   137,   138,   139,
     140,   141,     0,   142,   143,     0,     0,   188,   135,   136,
     137,   138,   139,   140,   141,     0,   142,   143,     0,   184,
     135,   136,   137,   138,   139,   140,   141,     0,   142,   143,
     144,   129,   130,   131,   132,     0,     0,     0,   133,   134,
       0,     0,   129,   130,   131,   132,     0,     0,     0,   133,
     134,     0,     0,   129,   130,   131,   132,     0,     0,     0,
     133,   134,     0,     0,     0,     0,     0,     0,     0,   135,
     136,   137,   138,   139,   140,   141,     0,   142,   143,   151,
     135,   136,   137,   138,   139,   140,   141,     0,   142,   143,
     181,   135,   136,   137,   138,   139,   140,   141,     0,   142,
     143,   191,   129,   130,   131,   132,     0,     0,     0,   133,
     134,     0,     0,   129,   130,   131,   132,     0,     0,     0,
     133,   134,     0,   129,   130,   131,   132,     0,     0,     0,
     133,     0,     0,   129,   130,   -21,   -21,     0,     0,     0,
     135,   136,   137,   138,   139,   140,   141,     0,   142,   143,
     201,   135,   136,   137,   138,   139,   140,   141,     0,   142,
     143,   135,   136,   137,   138,   139,   140,   141,     0,   142,
     143,   135,   136,   137,   138,   139,   140,   141,     0,   142,
     143,   129,   130,   131,   132,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   135,
     136,   137,   138,   139,   140,   141,     0,   142,   143,    68,
       0,    69,     0,     0,    70,    71,    72,     0,    73,    74,
      75,     0,     0,    76,    77,    78,    79,    80,     0,     0,
       8,    81,    82,    83,    84,     0,     0,     0,     0,     0,
      68,    85,    69,     0,     0,    86,     0,     0,    87,     0,
       0,    88,     0,    53,    76,    77,     0,    79,    80,     0,
       0,     8,    81,    82,    83,    84,     0,     0,     0,     0,
       0,    68,    85,    69,     0,     0,    86,     0,     0,     0,
       0,     0,    88,   199,     0,    76,    77,     0,    79,    80,
       0,     0,     8,    81,    82,    83,    84,     0,     0,     0,
       0,     0,    68,    85,    69,     0,     0,    86,     0,     0,
       0,     0,     0,    88,   210,     0,    76,    77,     0,    79,
      80,     0,     0,     8,    81,    82,    83,    84,    68,     0,
      69,     0,     0,     0,    85,     0,     0,     0,    86,     0,
       0,   110,    76,    77,    88,    79,    80,     0,     0,     8,
      81,    82,    83,    84,    68,     0,    69,     0,     0,     0,
      85,     0,     0,     0,    86,     0,     0,   148,    76,    77,
      88,    79,    80,     0,     0,     8,    81,    82,    83,    84,
       0,     0,     0,     0,     0,     0,    85,     0,     0,     0,
      86,     0,     0,     0,     0,     0,    88
};

static const yytype_int16 yycheck[] =
{
       0,     1,    94,     0,    13,    39,     6,     7,    56,    31,
      10,     0,    60,    10,    14,    30,    31,    13,     3,     4,
       5,     6,     7,     4,     5,     6,     7,    27,    28,    60,
      58,    31,    43,    61,    34,    55,    56,    37,    73,    39,
      51,    41,    39,    39,    66,    67,    19,    47,    63,    49,
      85,    86,    61,    88,    39,    55,    56,    13,    39,    56,
      60,    14,    15,    57,    60,    60,    66,    67,    22,    62,
      58,    61,   107,   108,   109,    62,    76,    61,    63,   114,
      62,   116,   117,    39,     3,     4,     5,     6,     7,    58,
     125,   126,    60,    46,   129,   130,   131,   132,   133,   134,
     135,   136,   137,   138,   139,   140,   141,   142,    60,    60,
      60,    60,    27,   148,    57,    60,    31,    51,    52,    53,
      39,    55,    56,    60,    60,    60,    41,    60,    58,   221,
     222,    63,    61,    61,    60,    57,    61,    61,    61,     4,
       5,     6,     7,   143,    63,    57,   181,    60,    62,    57,
     185,    66,    67,    18,   189,    20,   191,    26,    23,    24,
      25,    61,    27,    28,    29,    41,   201,    32,    33,    34,
      35,    36,    30,    64,    39,    40,    41,    42,    43,    64,
      63,    10,    56,   204,   184,    50,   117,   184,   179,    54,
     189,   182,    57,    -1,    -1,    60,    -1,    62,     9,    10,
      11,    12,    -1,    -1,    -1,    16,    17,    -1,   199,    -1,
      -1,   202,    -1,     9,    10,    11,    12,    -1,   209,   210,
      16,    17,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   220,
      -1,    -1,    -1,    -1,    -1,    -1,    47,    48,    49,    50,
      51,    52,    53,    -1,    55,    56,    -1,     9,    10,    -1,
      61,    47,    48,    49,    50,    51,    52,    53,    -1,    55,
      56,     9,    10,    11,    12,    61,    -1,    -1,    16,    17,
      -1,    -1,    -1,    -1,    -1,    -1,     9,    10,    11,    12,
      -1,    -1,    -1,    16,    17,    47,    48,    49,    50,    51,
      52,    53,    -1,    55,    56,    -1,    -1,    -1,    -1,    47,
      48,    49,    50,    51,    52,    53,    -1,    55,    56,    -1,
      -1,    -1,    -1,    61,    47,    48,    49,    50,    51,    52,
      53,    -1,    55,    56,     9,    10,    11,    12,    61,    -1,
      -1,    16,    17,    -1,    -1,    -1,    -1,    -1,    -1,     9,
      10,    11,    12,    -1,    -1,    -1,    16,    17,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     3,     4,     5,     6,
       7,     8,    47,    48,    49,    50,    51,    52,    53,    -1,
      55,    56,    -1,    -1,    21,    -1,    61,    47,    48,    49,
      50,    51,    52,    53,    -1,    55,    56,     9,    10,    11,
      12,    61,    39,    -1,    16,    17,    -1,    -1,    -1,    -1,
       9,    10,    11,    12,    -1,    -1,    -1,    16,    17,    -1,
      -1,    -1,     9,    10,    11,    12,    -1,    -1,    -1,    16,
      17,    -1,    -1,    -1,    -1,    47,    48,    49,    50,    51,
      52,    53,    -1,    55,    56,    -1,    -1,    59,    47,    48,
      49,    50,    51,    52,    53,    -1,    55,    56,    -1,    58,
      47,    48,    49,    50,    51,    52,    53,    -1,    55,    56,
      57,     9,    10,    11,    12,    -1,    -1,    -1,    16,    17,
      -1,    -1,     9,    10,    11,    12,    -1,    -1,    -1,    16,
      17,    -1,    -1,     9,    10,    11,    12,    -1,    -1,    -1,
      16,    17,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    47,
      48,    49,    50,    51,    52,    53,    -1,    55,    56,    57,
      47,    48,    49,    50,    51,    52,    53,    -1,    55,    56,
      57,    47,    48,    49,    50,    51,    52,    53,    -1,    55,
      56,    57,     9,    10,    11,    12,    -1,    -1,    -1,    16,
      17,    -1,    -1,     9,    10,    11,    12,    -1,    -1,    -1,
      16,    17,    -1,     9,    10,    11,    12,    -1,    -1,    -1,
      16,    -1,    -1,     9,    10,    11,    12,    -1,    -1,    -1,
      47,    48,    49,    50,    51,    52,    53,    -1,    55,    56,
      57,    47,    48,    49,    50,    51,    52,    53,    -1,    55,
      56,    47,    48,    49,    50,    51,    52,    53,    -1,    55,
      56,    47,    48,    49,    50,    51,    52,    53,    -1,    55,
      56,     9,    10,    11,    12,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    47,
      48,    49,    50,    51,    52,    53,    -1,    55,    56,    18,
      -1,    20,    -1,    -1,    23,    24,    25,    -1,    27,    28,
      29,    -1,    -1,    32,    33,    34,    35,    36,    -1,    -1,
      39,    40,    41,    42,    43,    -1,    -1,    -1,    -1,    -1,
      18,    50,    20,    -1,    -1,    54,    -1,    -1,    57,    -1,
      -1,    60,    -1,    62,    32,    33,    -1,    35,    36,    -1,
      -1,    39,    40,    41,    42,    43,    -1,    -1,    -1,    -1,
      -1,    18,    50,    20,    -1,    -1,    54,    -1,    -1,    -1,
      -1,    -1,    60,    61,    -1,    32,    33,    -1,    35,    36,
      -1,    -1,    39,    40,    41,    42,    43,    -1,    -1,    -1,
      -1,    -1,    18,    50,    20,    -1,    -1,    54,    -1,    -1,
      -1,    -1,    -1,    60,    61,    -1,    32,    33,    -1,    35,
      36,    -1,    -1,    39,    40,    41,    42,    43,    18,    -1,
      20,    -1,    -1,    -1,    50,    -1,    -1,    -1,    54,    -1,
      -1,    57,    32,    33,    60,    35,    36,    -1,    -1,    39,
      40,    41,    42,    43,    18,    -1,    20,    -1,    -1,    -1,
      50,    -1,    -1,    -1,    54,    -1,    -1,    57,    32,    33,
      60,    35,    36,    -1,    -1,    39,    40,    41,    42,    43,
      -1,    -1,    -1,    -1,    -1,    -1,    50,    -1,    -1,    -1,
      54,    -1,    -1,    -1,    -1,    -1,    60
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,     4,     5,     6,     7,     8,    21,    39,    66,
      67,    68,    69,    70,    73,    74,    76,    77,    83,    74,
      74,    74,     0,    68,    57,    13,    74,    60,    19,    78,
      62,    60,    70,    71,    73,    75,    74,    22,    79,    84,
      75,    58,    74,    61,    74,    80,    62,     3,    63,    73,
      85,    61,    70,    62,    86,    58,    81,    74,    74,    86,
      87,    74,    63,    69,    76,    82,    60,    60,    18,    20,
      23,    24,    25,    27,    28,    29,    32,    33,    34,    35,
      36,    40,    41,    42,    43,    50,    54,    57,    60,    69,
      72,    74,    86,    88,    89,    91,    92,    93,    94,    95,
      96,    97,   101,   102,   104,    75,    75,    60,    60,    60,
      57,    74,   101,    57,    60,    74,    60,    60,    60,    60,
     101,   101,   101,    14,    15,    46,    60,    63,    88,     9,
      10,    11,    12,    16,    17,    47,    48,    49,    50,    51,
      52,    53,    55,    56,    57,    61,    61,   101,    57,   101,
     101,    57,   101,   101,    90,   101,    61,    61,    61,   101,
      90,   103,   101,   101,   101,   101,   101,   101,   101,   101,
     101,   101,   101,   101,   101,   101,    74,    57,    57,    61,
     101,    57,    61,    61,    58,    58,    61,    61,    59,    60,
      89,    57,   101,    89,    62,    73,   101,    57,   103,    61,
     101,    57,    26,    30,    98,    99,    61,    61,    89,    61,
      61,   101,    89,    41,    31,    63,    99,   100,    89,    89,
      61,    64,    64,    63,    89,    88,    88
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value, Location); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
#endif
{
  if (!yyvaluep)
    return;
  YYUSE (yylocationp);
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  YY_LOCATION_PRINT (yyoutput, *yylocationp);
  YYFPRINTF (yyoutput, ": ");
  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yylsp, yyrule)
    YYSTYPE *yyvsp;
    YYLTYPE *yylsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       , &(yylsp[(yyi + 1) - (yynrhs)])		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, yylsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yylocationp)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    YYLTYPE *yylocationp;
#endif
{
  YYUSE (yyvaluep);
  YYUSE (yylocationp);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;
/* Location data for the look-ahead symbol.  */
YYLTYPE yylloc;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;

  /* The location stack.  */
  YYLTYPE yylsa[YYINITDEPTH];
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;
  /* The locations where the error started and ended.  */
  YYLTYPE yyerror_range[2];

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;
  yylsp = yyls;
#if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
  /* Initialize the default location before parsing starts.  */
  yylloc.first_line   = yylloc.last_line   = 1;
  yylloc.first_column = yylloc.last_column = 0;
#endif

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;
	YYLTYPE *yyls1 = yyls;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yyls1, yysize * sizeof (*yylsp),
		    &yystacksize);
	yyls = yyls1;
	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);
	YYSTACK_RELOCATE (yyls);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;
  *++yylsp = yylloc;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

  /* Default location.  */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 174 "../parser.y"
    { 
                                      (yylsp[(1) - (1)]); 
                                      /* pp2: The @1 is needed to convince 
                                       * yacc to set up yylloc. You can remove 
                                       * it once you have other uses of @n*/
                                      Program *program = new Program((yyvsp[(1) - (1)].declList));
                                      // if no errors, advance to next phase
                                      if (ReportError::NumErrors() == 0) 
                                          program->Print(0);
                                    }
    break;

  case 3:
#line 186 "../parser.y"
    { ((yyval.declList)=(yyvsp[(1) - (2)].declList))->Append((yyvsp[(2) - (2)].decl)); }
    break;

  case 4:
#line 187 "../parser.y"
    { ((yyval.declList) = new List<Decl*>)->Append((yyvsp[(1) - (1)].decl)); }
    break;

  case 5:
#line 191 "../parser.y"
    { (yyval.decl)=(yyvsp[(1) - (1)].varDecl); }
    break;

  case 6:
#line 192 "../parser.y"
    { (yyval.decl)=(yyvsp[(1) - (1)].fnDecl); }
    break;

  case 7:
#line 193 "../parser.y"
    { (yyval.decl)=(yyvsp[(1) - (1)].classDecl); }
    break;

  case 8:
#line 194 "../parser.y"
    { (yyval.decl)=(yyvsp[(1) - (1)].ifaceDecl); }
    break;

  case 9:
#line 198 "../parser.y"
    { (yyval.varDecl)=(yyvsp[(1) - (2)].varDecl); }
    break;

  case 10:
#line 202 "../parser.y"
    { (yyval.varDecl)=new VarDecl((yyvsp[(2) - (2)].identObj), (yyvsp[(1) - (2)].type)); }
    break;

  case 11:
#line 206 "../parser.y"
    { ((yyval.varDecls)=new List<VarDecl*>)->Append((yyvsp[(1) - (1)].varDecl)); }
    break;

  case 12:
#line 207 "../parser.y"
    { ((yyval.varDecls)=(yyvsp[(1) - (3)].varDecls))->Append((yyvsp[(3) - (3)].varDecl)); }
    break;

  case 13:
#line 211 "../parser.y"
    { (yyval.lvalue)=new FieldAccess(NULL, (yyvsp[(1) - (1)].identObj)); }
    break;

  case 14:
#line 212 "../parser.y"
    { (yyval.lvalue)=new FieldAccess((yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].identObj)); }
    break;

  case 15:
#line 213 "../parser.y"
    { (yyval.lvalue)=new ArrayAccess((yyloc), (yyvsp[(1) - (4)].expr), (yyvsp[(3) - (4)].expr)); }
    break;

  case 16:
#line 217 "../parser.y"
    { (yyval.type)=Type::intType; }
    break;

  case 17:
#line 218 "../parser.y"
    { (yyval.type)=Type::doubleType; }
    break;

  case 18:
#line 219 "../parser.y"
    { (yyval.type)=Type::boolType; }
    break;

  case 19:
#line 220 "../parser.y"
    { (yyval.type)=Type::stringType; }
    break;

  case 20:
#line 221 "../parser.y"
    { (yyval.type)=new NamedType((yyvsp[(1) - (1)].identObj)); }
    break;

  case 21:
#line 222 "../parser.y"
    { (yyval.type)=new ArrayType((yylsp[(1) - (2)]), (yyvsp[(1) - (2)].type)); }
    break;

  case 22:
#line 226 "../parser.y"
    { (yyval.identObj)=new Identifier((yylsp[(1) - (1)]), (yyvsp[(1) - (1)].identifier)); }
    break;

  case 23:
#line 230 "../parser.y"
    { (yyval.varDecls)=new List<VarDecl*>; }
    break;

  case 24:
#line 231 "../parser.y"
    { (yyval.varDecls)=(yyvsp[(1) - (1)].varDecls); }
    break;

  case 25:
#line 235 "../parser.y"
    { (yyval.fnDecl)=new FnDecl((yyvsp[(2) - (6)].identObj), (yyvsp[(1) - (6)].type), (yyvsp[(4) - (6)].varDecls)); (yyval.fnDecl)->SetFunctionBody((yyvsp[(6) - (6)].stmtBlock)); }
    break;

  case 26:
#line 236 "../parser.y"
    { (yyval.fnDecl)=new FnDecl((yyvsp[(2) - (6)].identObj), Type::voidType, (yyvsp[(4) - (6)].varDecls)); (yyval.fnDecl)->SetFunctionBody((yyvsp[(6) - (6)].stmtBlock)); }
    break;

  case 27:
#line 240 "../parser.y"
    {   (yyval.classDecl)=new ClassDecl((yyvsp[(2) - (7)].identObj), (yyvsp[(3) - (7)].extendsClause), (yyvsp[(4) - (7)].nTList), (yyvsp[(6) - (7)].declList)); }
    break;

  case 28:
#line 244 "../parser.y"
    { (yyval.extendsClause)=NULL; }
    break;

  case 29:
#line 245 "../parser.y"
    { (yyval.extendsClause)=new NamedType((yyvsp[(2) - (2)].identObj)); }
    break;

  case 30:
#line 249 "../parser.y"
    { (yyval.nTList)=new List<NamedType*>; }
    break;

  case 31:
#line 250 "../parser.y"
    { (yyval.nTList)=(yyvsp[(2) - (2)].nTList);  }
    break;

  case 32:
#line 254 "../parser.y"
    { ((yyval.nTList)=new List<NamedType*>)->Append(new NamedType((yyvsp[(1) - (1)].identObj))); }
    break;

  case 33:
#line 255 "../parser.y"
    { ((yyval.nTList)=(yyvsp[(1) - (3)].nTList))->Append(new NamedType((yyvsp[(3) - (3)].identObj))); }
    break;

  case 34:
#line 259 "../parser.y"
    { (yyval.declList)=new List<Decl*>; }
    break;

  case 35:
#line 260 "../parser.y"
    { ((yyval.declList)=(yyvsp[(1) - (2)].declList))->Append((yyvsp[(2) - (2)].decl)); }
    break;

  case 36:
#line 264 "../parser.y"
    { (yyval.decl)=(yyvsp[(1) - (1)].varDecl); }
    break;

  case 37:
#line 265 "../parser.y"
    { (yyval.decl)=(yyvsp[(1) - (1)].fnDecl); }
    break;

  case 38:
#line 269 "../parser.y"
    { (yyval.ifaceDecl)=new InterfaceDecl((yyvsp[(2) - (5)].identObj), (yyvsp[(4) - (5)].declList)); }
    break;

  case 39:
#line 273 "../parser.y"
    { (yyval.declList)=new List<Decl*>; }
    break;

  case 40:
#line 274 "../parser.y"
    { ((yyval.declList)=(yyvsp[(1) - (2)].declList))->Append((yyvsp[(2) - (2)].decl)); }
    break;

  case 41:
#line 278 "../parser.y"
    { (yyval.decl)=new FnDecl((yyvsp[(2) - (6)].identObj), (yyvsp[(1) - (6)].type), (yyvsp[(4) - (6)].varDecls));  }
    break;

  case 42:
#line 279 "../parser.y"
    { (yyval.decl)=new FnDecl((yyvsp[(2) - (6)].identObj), Type::voidType, (yyvsp[(4) - (6)].varDecls)); }
    break;

  case 43:
#line 283 "../parser.y"
    { (yyval.stmtBlock)=new StmtBlock((yyvsp[(2) - (4)].varDecls), (yyvsp[(3) - (4)].statements)); }
    break;

  case 44:
#line 287 "../parser.y"
    { (yyval.varDecls)=new List<VarDecl*>; }
    break;

  case 45:
#line 288 "../parser.y"
    { ((yyval.varDecls)=(yyvsp[(1) - (2)].varDecls))->Append((yyvsp[(2) - (2)].varDecl)); }
    break;

  case 46:
#line 292 "../parser.y"
    { (yyval.statements)=new List<Stmt*>; }
    break;

  case 47:
#line 293 "../parser.y"
    { ((yyval.statements)=(yyvsp[(2) - (2)].statements))->InsertAt((yyvsp[(1) - (2)].stmt), 0); }
    break;

  case 48:
#line 297 "../parser.y"
    { (yyval.stmt)=new EmptyExpr(); }
    break;

  case 49:
#line 298 "../parser.y"
    { (yyval.stmt)=(yyvsp[(1) - (2)].expr); }
    break;

  case 50:
#line 299 "../parser.y"
    { (yyval.stmt)=(yyvsp[(1) - (1)].ifStmt); }
    break;

  case 51:
#line 300 "../parser.y"
    { (yyval.stmt)=(yyvsp[(1) - (1)].whileStmt); }
    break;

  case 52:
#line 301 "../parser.y"
    { (yyval.stmt)=(yyvsp[(1) - (1)].forStmt); }
    break;

  case 53:
#line 302 "../parser.y"
    { (yyval.stmt)=(yyvsp[(1) - (1)].breakStmt); }
    break;

  case 54:
#line 303 "../parser.y"
    { (yyval.stmt)=(yyvsp[(1) - (1)].returnStmt); }
    break;

  case 55:
#line 304 "../parser.y"
    { (yyval.stmt)=(yyvsp[(1) - (1)].printStmt); }
    break;

  case 56:
#line 305 "../parser.y"
    { (yyval.stmt)=(yyvsp[(1) - (1)].switchStmt); }
    break;

  case 57:
#line 306 "../parser.y"
    { (yyval.stmt)=(yyvsp[(1) - (1)].stmtBlock); }
    break;

  case 58:
#line 310 "../parser.y"
    { ((yyval.exprList)=new List<Expr*>)->Append((yyvsp[(1) - (1)].expr)); }
    break;

  case 59:
#line 311 "../parser.y"
    { ((yyval.exprList)=(yyvsp[(1) - (3)].exprList))->Append((yyvsp[(3) - (3)].expr)); }
    break;

  case 60:
#line 315 "../parser.y"
    { (yyval.ifStmt)=new IfStmt((yyvsp[(3) - (5)].expr), (yyvsp[(5) - (5)].stmt), NULL); }
    break;

  case 61:
#line 316 "../parser.y"
    { (yyval.ifStmt)=new IfStmt((yyvsp[(3) - (7)].expr), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); }
    break;

  case 62:
#line 320 "../parser.y"
    { (yyval.whileStmt)=new WhileStmt((yyvsp[(3) - (5)].expr), (yyvsp[(5) - (5)].stmt)); }
    break;

  case 63:
#line 324 "../parser.y"
    { (yyval.forStmt)=new ForStmt(new EmptyExpr(), (yyvsp[(4) - (7)].expr), new EmptyExpr(), (yyvsp[(7) - (7)].stmt)); }
    break;

  case 64:
#line 325 "../parser.y"
    { (yyval.forStmt)=new ForStmt((yyvsp[(3) - (8)].expr), (yyvsp[(5) - (8)].expr), new EmptyExpr(), (yyvsp[(8) - (8)].stmt)); }
    break;

  case 65:
#line 326 "../parser.y"
    { (yyval.forStmt)=new ForStmt(new EmptyExpr(), (yyvsp[(4) - (8)].expr), (yyvsp[(6) - (8)].expr), (yyvsp[(8) - (8)].stmt)); }
    break;

  case 66:
#line 327 "../parser.y"
    { (yyval.forStmt)=new ForStmt((yyvsp[(3) - (9)].expr), (yyvsp[(5) - (9)].expr), (yyvsp[(7) - (9)].expr), (yyvsp[(9) - (9)].stmt)); }
    break;

  case 67:
#line 331 "../parser.y"
    { (yyval.returnStmt)=new ReturnStmt((yyloc), new EmptyExpr()); }
    break;

  case 68:
#line 332 "../parser.y"
    { (yyval.returnStmt)=new ReturnStmt((yylsp[(2) - (3)]), (yyvsp[(2) - (3)].expr)); }
    break;

  case 69:
#line 336 "../parser.y"
    { (yyval.breakStmt)=new BreakStmt((yylsp[(1) - (2)])); }
    break;

  case 70:
#line 340 "../parser.y"
    { (yyval.printStmt)=new PrintStmt((yyvsp[(3) - (5)].exprList)); }
    break;

  case 71:
#line 344 "../parser.y"
    { (yyval.switchStmt)=new SwitchStmt((yyvsp[(3) - (7)].expr), (yyvsp[(6) - (7)].caseStmts), NULL); }
    break;

  case 72:
#line 345 "../parser.y"
    { (yyval.switchStmt)=new SwitchStmt((yyvsp[(3) - (8)].expr), (yyvsp[(6) - (8)].caseStmts), (yyvsp[(7) - (8)].defaultStmt)); }
    break;

  case 73:
#line 349 "../parser.y"
    { ((yyval.caseStmts)=new List<CaseStmt*>)->Append((yyvsp[(1) - (1)].caseStmt)); }
    break;

  case 74:
#line 350 "../parser.y"
    { ((yyval.caseStmts)=(yyvsp[(1) - (2)].caseStmts))->Append((yyvsp[(2) - (2)].caseStmt)); }
    break;

  case 75:
#line 354 "../parser.y"
    { (yyval.caseStmt)=new CaseStmt(new IntConstant((yylsp[(2) - (4)]), (yyvsp[(2) - (4)].integerConstant)), (yyvsp[(4) - (4)].statements)); }
    break;

  case 76:
#line 358 "../parser.y"
    { (yyval.defaultStmt)=new DefaultStmt((yyvsp[(3) - (3)].statements)); }
    break;

  case 77:
#line 362 "../parser.y"
    { (yyval.expr)=new AssignExpr((yyvsp[(1) - (3)].lvalue), new Operator((yylsp[(2) - (3)]), "="), (yyvsp[(3) - (3)].expr)); }
    break;

  case 78:
#line 363 "../parser.y"
    { (yyval.expr)=(yyvsp[(1) - (1)].expr); }
    break;

  case 79:
#line 364 "../parser.y"
    { (yyval.expr)=(yyvsp[(1) - (1)].lvalue); }
    break;

  case 80:
#line 365 "../parser.y"
    { (yyval.expr)=new PostfixExpr((yyvsp[(1) - (2)].lvalue), new Operator((yylsp[(2) - (2)]), "++")); }
    break;

  case 81:
#line 366 "../parser.y"
    { (yyval.expr)=new PostfixExpr((yyvsp[(1) - (2)].lvalue), new Operator((yylsp[(2) - (2)]), "--")); }
    break;

  case 82:
#line 367 "../parser.y"
    { (yyval.expr)=new This((yylsp[(1) - (1)])); }
    break;

  case 83:
#line 368 "../parser.y"
    { (yyval.expr)=(yyvsp[(1) - (1)].call); }
    break;

  case 84:
#line 369 "../parser.y"
    { (yyval.expr)=(yyvsp[(2) - (3)].expr); }
    break;

  case 85:
#line 370 "../parser.y"
    { (yyval.expr)=new ArithmeticExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), "+"), (yyvsp[(3) - (3)].expr)); }
    break;

  case 86:
#line 371 "../parser.y"
    { (yyval.expr)=new ArithmeticExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), "-"), (yyvsp[(3) - (3)].expr)); }
    break;

  case 87:
#line 372 "../parser.y"
    { (yyval.expr)=new ArithmeticExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), "*"), (yyvsp[(3) - (3)].expr)); }
    break;

  case 88:
#line 373 "../parser.y"
    { (yyval.expr)=new ArithmeticExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), "/"), (yyvsp[(3) - (3)].expr)); }
    break;

  case 89:
#line 374 "../parser.y"
    { (yyval.expr)=new ArithmeticExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), "%"), (yyvsp[(3) - (3)].expr)); }
    break;

  case 90:
#line 375 "../parser.y"
    { (yyval.expr)=new ArithmeticExpr(new Operator((yylsp[(1) - (2)]), "-"), (yyvsp[(2) - (2)].expr)); }
    break;

  case 91:
#line 376 "../parser.y"
    { (yyval.expr)=new RelationalExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), "<"), (yyvsp[(3) - (3)].expr)); }
    break;

  case 92:
#line 377 "../parser.y"
    { (yyval.expr)=new RelationalExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), "<="), (yyvsp[(3) - (3)].expr)); }
    break;

  case 93:
#line 378 "../parser.y"
    { (yyval.expr)=new RelationalExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), ">"), (yyvsp[(3) - (3)].expr)); }
    break;

  case 94:
#line 379 "../parser.y"
    { (yyval.expr)=new RelationalExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), ">="), (yyvsp[(3) - (3)].expr)); }
    break;

  case 95:
#line 380 "../parser.y"
    { (yyval.expr)=new EqualityExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), "=="), (yyvsp[(3) - (3)].expr)); }
    break;

  case 96:
#line 381 "../parser.y"
    { (yyval.expr)=new EqualityExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), "!="), (yyvsp[(3) - (3)].expr)); }
    break;

  case 97:
#line 382 "../parser.y"
    { (yyval.expr)=new LogicalExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), "&&"), (yyvsp[(3) - (3)].expr)); }
    break;

  case 98:
#line 383 "../parser.y"
    { (yyval.expr)=new LogicalExpr((yyvsp[(1) - (3)].expr), new Operator((yylsp[(2) - (3)]), "||"), (yyvsp[(3) - (3)].expr)); }
    break;

  case 99:
#line 384 "../parser.y"
    { (yyval.expr)=new LogicalExpr(new Operator((yylsp[(1) - (2)]), "!"), (yyvsp[(2) - (2)].expr)); }
    break;

  case 100:
#line 385 "../parser.y"
    { (yyval.expr)=new ReadIntegerExpr((yyloc)); }
    break;

  case 101:
#line 386 "../parser.y"
    { (yyval.expr)=new ReadLineExpr((yyloc)); }
    break;

  case 102:
#line 387 "../parser.y"
    { (yyval.expr)=new NewExpr((yyloc), new NamedType((yyvsp[(2) - (2)].identObj))); }
    break;

  case 103:
#line 388 "../parser.y"
    { (yyval.expr)=new NewArrayExpr((yyloc), (yyvsp[(3) - (6)].expr), (yyvsp[(5) - (6)].type)); }
    break;

  case 104:
#line 392 "../parser.y"
    { (yyval.call)=new Call((yyloc), NULL, (yyvsp[(1) - (4)].identObj), (yyvsp[(3) - (4)].exprList)); }
    break;

  case 105:
#line 393 "../parser.y"
    { (yyval.call)=new Call((yyloc), (yyvsp[(1) - (6)].expr), (yyvsp[(3) - (6)].identObj), (yyvsp[(5) - (6)].exprList)); }
    break;

  case 106:
#line 397 "../parser.y"
    { (yyval.exprList)=new List<Expr*>; }
    break;

  case 107:
#line 398 "../parser.y"
    { (yyval.exprList)=(yyvsp[(1) - (1)].exprList); }
    break;

  case 108:
#line 402 "../parser.y"
    { (yyval.expr)=new IntConstant((yylsp[(1) - (1)]), (yyvsp[(1) - (1)].integerConstant)); }
    break;

  case 109:
#line 403 "../parser.y"
    { (yyval.expr)=new DoubleConstant((yylsp[(1) - (1)]), (yyvsp[(1) - (1)].doubleConstant)); }
    break;

  case 110:
#line 404 "../parser.y"
    {   (yyval.expr)=new BoolConstant((yylsp[(1) - (1)]), (yyvsp[(1) - (1)].boolConstant)); }
    break;

  case 111:
#line 405 "../parser.y"
    {   (yyval.expr)=new StringConstant((yylsp[(1) - (1)]), (yyvsp[(1) - (1)].stringConstant)); }
    break;

  case 112:
#line 406 "../parser.y"
    {   (yyval.expr)=new NullConstant((yylsp[(1) - (1)])); }
    break;


/* Line 1267 of yacc.c.  */
#line 2381 "y.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }

  yyerror_range[0] = yylloc;

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval, &yylloc);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  yyerror_range[0] = yylsp[1-yylen];
  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;

      yyerror_range[0] = *yylsp;
      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;

  yyerror_range[1] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the look-ahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, (yyerror_range - 1), 2);
  *++yylsp = yyloc;

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval, &yylloc);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp, yylsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 409 "../parser.y"


/* The closing %% above marks the end of the Rules section and the beginning
 * of the User Subroutines section. All text from here to the end of the
 * file is copied verbatim to the end of the generated y.tab.c file.
 * This section is where you put definitions of helper functions.
 */

/* Function: InitParser
 * --------------------
 * This function will be called before any calls to yyparse().  It is designed
 * to give you an opportunity to do anything that must be done to initialize
 * the parser (set global variables, configure starting state, etc.). One
 * thing it already does for you is assign the value of the global variable
 * yydebug that controls whether yacc prints debugging information about
 * parser actions (shift/reduce) and contents of state stack during parser.
 * If set to false, no information is printed. Setting it to true will give
 * you a running trail that might be helpful when debugging your parser.
 * Please be sure the variable is set to false when submitting your final
 * version.
 */
void InitParser()
{
   PrintDebug("parser", "Initializing parser");
//    yydebug = false;
   yydebug = IsDebugOn("parser");
}

