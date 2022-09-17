/* A Bison parser, made by GNU Bison 2.1.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005 Free Software Foundation, Inc.

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

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

/* Written by Richard Stallman by simplifying the original so called
   ``semantic'' parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NAME = 258,
     COMMENTLINE = 259,
     LTRIE = 260,
     TRIE = 261,
     RTRIE = 262,
     PROCESS = 263,
     TRIEFILE = 264,
     ENDTRIE = 265,
     MORPH = 266,
     SKIPWORD = 267,
     SKIPLETTER = 268,
     ENDSIN = 269,
     EMPTYNODE = 270,
     SEQOR = 271,
     SEQAND = 272,
     SEQNOT = 273,
     SEQ = 274,
     DEF = 275,
     FILENAME = 276,
     BOUND = 277,
     OPERATOR = 278,
     INTEGER = 279,
     LBRAK = 280,
     RBRAK = 281
   };
#endif
/* Tokens.  */
#define NAME 258
#define COMMENTLINE 259
#define LTRIE 260
#define TRIE 261
#define RTRIE 262
#define PROCESS 263
#define TRIEFILE 264
#define ENDTRIE 265
#define MORPH 266
#define SKIPWORD 267
#define SKIPLETTER 268
#define ENDSIN 269
#define EMPTYNODE 270
#define SEQOR 271
#define SEQAND 272
#define SEQNOT 273
#define SEQ 274
#define DEF 275
#define FILENAME 276
#define BOUND 277
#define OPERATOR 278
#define INTEGER 279
#define LBRAK 280
#define RBRAK 281




/* Copy the first part of user declarations.  */
#line 1 "bachus.y"

#define  _this_is_main_bachus_
#include "bachus.h"
#include <string.h>
#include <stdio.h>


/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
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

#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 7 "bachus.y"
typedef union YYSTYPE {
  int ival;
  char oper;
  char *string;
  struct symtab *sympt;
} YYSTYPE;
/* Line 196 of yacc.c.  */
#line 151 "bachus.tab.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 219 of yacc.c.  */
#line 163 "bachus.tab.c"

#if ! defined (YYSIZE_T) && defined (__SIZE_TYPE__)
# define YYSIZE_T __SIZE_TYPE__
#endif
#if ! defined (YYSIZE_T) && defined (size_t)
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T) && (defined (__STDC__) || defined (__cplusplus))
# include <stddef.h> /* INFRINGES ON USER NAME SPACE */
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T)
# define YYSIZE_T unsigned int
#endif

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

#if ! defined (yyoverflow) || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if defined (__STDC__) || defined (__cplusplus)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     define YYINCLUDED_STDLIB_H
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning. */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2005 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM ((YYSIZE_T) -1)
#  endif
#  ifdef __cplusplus
extern "C" {
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if (! defined (malloc) && ! defined (YYINCLUDED_STDLIB_H) \
	&& (defined (__STDC__) || defined (__cplusplus)))
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if (! defined (free) && ! defined (YYINCLUDED_STDLIB_H) \
	&& (defined (__STDC__) || defined (__cplusplus)))
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifdef __cplusplus
}
#  endif
# endif
#endif /* ! defined (yyoverflow) || YYERROR_VERBOSE */


#if (! defined (yyoverflow) \
     && (! defined (__cplusplus) \
	 || (defined (YYSTYPE_IS_TRIVIAL) && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short int yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short int) + sizeof (YYSTYPE))			\
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined (__GNUC__) && 1 < __GNUC__
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
      while (0)
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
    while (0)

#endif

#if defined (__STDC__) || defined (__cplusplus)
   typedef signed char yysigned_char;
#else
   typedef short int yysigned_char;
#endif

/* YYFINAL -- State number of the termination state. */
#define YYFINAL  24
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   139

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  43
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  33
/* YYNRULES -- Number of rules. */
#define YYNRULES  68
/* YYNRULES -- Number of states. */
#define YYNSTATES  137

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   281

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    40,     2,     2,     2,    35,    36,     2,
       2,     2,     2,    27,    38,    28,    29,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    31,    30,
       2,    32,    41,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    37,     2,    39,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    33,    42,    34,     2,     2,     2,     2,
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
      25,    26
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned char yyprhs[] =
{
       0,     0,     3,     5,     8,     9,    13,    14,    18,    19,
      23,    25,    31,    32,    39,    40,    47,    48,    51,    53,
      54,    59,    63,    64,    69,    70,    75,    76,    80,    81,
      86,    88,    92,   100,   103,   107,   109,   110,   116,   118,
     119,   120,   126,   127,   131,   135,   136,   141,   143,   145,
     147,   149,   151,   153,   155,   157,   159,   164,   165,   175,
     176,   184,   185,   193,   198,   203,   211,   214,   218
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const yysigned_char yyrhs[] =
{
      44,     0,    -1,    45,    -1,    44,    45,    -1,    -1,    49,
      46,    30,    -1,    -1,    62,    47,    30,    -1,    -1,    75,
      48,    30,    -1,     4,    -1,    20,    31,     3,    32,    21,
      -1,    -1,    20,    31,     3,    31,    50,    52,    -1,    -1,
      19,    31,     3,    31,    51,    52,    -1,    -1,    53,    55,
      -1,    60,    -1,    -1,    52,    29,    54,    55,    -1,    52,
      29,    60,    -1,    -1,    55,    16,    56,    55,    -1,    -1,
      55,    17,    57,    55,    -1,    -1,    18,    58,    55,    -1,
      -1,    33,    59,    55,    34,    -1,    61,    -1,    35,    22,
      35,    -1,    36,     3,    37,    24,    38,    24,    39,    -1,
      36,     3,    -1,    40,    36,     3,    -1,     3,    -1,    -1,
       3,    32,    41,    63,    64,    -1,    68,    -1,    -1,    -1,
      68,    65,    42,    66,    64,    -1,    -1,    42,    67,    64,
      -1,    68,    27,    68,    -1,    -1,    68,    28,    69,    68,
      -1,    70,    -1,    71,    -1,     3,    -1,    11,    -1,    22,
      -1,    23,    -1,    15,    -1,    12,    -1,    13,    -1,    14,
      33,     3,    34,    -1,    -1,    25,    72,    68,    26,    37,
      24,    38,    24,    39,    -1,    -1,     3,    73,    37,    24,
      38,    24,    39,    -1,    -1,    13,    74,    37,    24,    38,
      24,    39,    -1,     6,     3,    32,    21,    -1,     7,     3,
      32,    21,    -1,     5,    29,    24,    29,     3,    32,    21,
      -1,     8,     3,    -1,     9,    32,    21,    -1,    10,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned char yyrline[] =
{
       0,    24,    24,    25,    27,    27,    28,    28,    29,    29,
      30,    32,    35,    35,    36,    36,    38,    38,    39,    40,
      40,    41,    43,    43,    44,    44,    45,    45,    46,    46,
      49,    51,    52,    53,    54,    56,    58,    58,    62,    63,
      63,    63,    64,    64,    66,    67,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    78,    80,    80,    81,
      81,    82,    82,    84,    85,    86,    87,    88,    89
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "NAME", "COMMENTLINE", "LTRIE", "TRIE",
  "RTRIE", "PROCESS", "TRIEFILE", "ENDTRIE", "MORPH", "SKIPWORD",
  "SKIPLETTER", "ENDSIN", "EMPTYNODE", "SEQOR", "SEQAND", "SEQNOT", "SEQ",
  "DEF", "FILENAME", "BOUND", "OPERATOR", "INTEGER", "LBRAK", "RBRAK",
  "'+'", "'-'", "'.'", "';'", "':'", "'='", "'{'", "'}'", "'%'", "'&'",
  "'['", "','", "']'", "'!'", "'>'", "'|'", "$accept", "STATEMENT", "RULE",
  "@1", "@2", "@3", "SEQUENCEDECL", "@4", "@5", "SEQUENCE", "@6", "@7",
  "SEQEXPRESSION", "@8", "@9", "@10", "@11", "SEQOTHER", "WORDGRAMMARNAME",
  "RULEDECLARATION", "@12", "RIGHTSIDE", "@13", "@14", "@15", "EXPRESSION",
  "@16", "ENDSINFORM", "REPEATED", "@17", "@18", "@19", "DECLARATION", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const unsigned short int yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,    43,    45,    46,
      59,    58,    61,   123,   125,    37,    38,    91,    44,    93,
      33,    62,   124
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    43,    44,    44,    46,    45,    47,    45,    48,    45,
      45,    49,    50,    49,    51,    49,    53,    52,    52,    54,
      52,    52,    56,    55,    57,    55,    58,    55,    59,    55,
      55,    60,    60,    60,    60,    61,    63,    62,    64,    65,
      66,    64,    67,    64,    68,    69,    68,    68,    68,    68,
      68,    68,    68,    68,    68,    68,    70,    72,    71,    73,
      71,    74,    71,    75,    75,    75,    75,    75,    75
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     2,     0,     3,     0,     3,     0,     3,
       1,     5,     0,     6,     0,     6,     0,     2,     1,     0,
       4,     3,     0,     4,     0,     4,     0,     3,     0,     4,
       1,     3,     7,     2,     3,     1,     0,     5,     1,     0,
       0,     5,     0,     3,     3,     0,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     0,     9,     0,
       7,     0,     7,     4,     4,     7,     2,     3,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       0,     0,    10,     0,     0,     0,     0,     0,    68,     0,
       0,     0,     2,     4,     6,     8,     0,     0,     0,     0,
      66,     0,     0,     0,     1,     3,     0,     0,     0,    36,
       0,     0,     0,    67,     0,     0,     5,     7,     9,     0,
       0,    63,    64,    14,    12,     0,    49,    50,    54,    55,
       0,    53,    51,    52,    57,    42,    37,    38,    47,    48,
       0,    16,    16,    11,     0,     0,     0,     0,     0,     0,
      45,     0,     0,     0,     0,     0,    15,     0,    18,    13,
       0,     0,     0,     0,    43,    44,     0,    40,    65,     0,
      33,     0,    19,    35,    26,    28,    17,    30,     0,     0,
      56,     0,    46,     0,    31,     0,    34,     0,    21,     0,
       0,    22,    24,     0,     0,     0,    41,     0,    20,    27,
       0,     0,     0,     0,     0,     0,     0,    29,    23,    25,
      60,    62,     0,     0,     0,    32,    58
};

/* YYDEFGOTO[NTERM-NUM]. */
static const yysigned_char yydefgoto[] =
{
      -1,    11,    12,    26,    27,    28,    13,    62,    61,    76,
      77,   107,    96,   121,   122,   109,   110,    78,    97,    14,
      39,    56,    71,   103,    68,    57,    86,    58,    59,    67,
      64,    65,    15
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -68
static const yysigned_char yypact[] =
{
      46,   -19,   -68,   -11,    25,    28,    37,    39,   -68,    29,
      44,    38,   -68,   -68,   -68,   -68,    35,    55,    45,    48,
     -68,    60,    79,    80,   -68,   -68,    54,    56,    57,   -68,
      59,    64,    68,   -68,    61,    -2,   -68,   -68,   -68,    -3,
      87,   -68,   -68,   -68,   -68,    70,    58,   -68,   -68,    62,
      63,   -68,   -68,   -68,   -68,   -68,   -68,    36,   -68,   -68,
      65,    32,    32,   -68,    66,    67,    90,    12,    -3,    12,
     -68,    52,    77,    78,    98,    69,    73,    -1,   -68,    73,
      82,    83,    74,   -21,   -68,    81,    12,   -68,   -68,    75,
      76,   108,    32,   -68,   -68,   -68,    53,   -68,    84,    85,
     -68,    88,   -68,    -3,   -68,    91,   -68,    -1,   -68,    -1,
      -1,   -68,   -68,    92,    93,    94,   -68,    86,    53,   -68,
     -13,    -1,    -1,    89,    95,    97,    96,   -68,   -68,   -68,
     -68,   -68,   102,    99,   100,   -68,   -68
};

/* YYPGOTO[NTERM-NUM].  */
static const yysigned_char yypgoto[] =
{
     -68,   -68,   101,   -68,   -68,   -68,   -68,   -68,   -68,    71,
     -68,   -68,   -48,   -68,   -68,   -68,   -68,    22,   -68,   -68,
     -68,   -67,   -68,   -68,   -68,   -53,   -68,   -68,   -68,   -68,
     -68,   -68,   -68
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -62
static const short int yytable[] =
{
      46,    84,    93,   111,   112,   101,    69,    70,    47,    48,
      49,    50,    51,    16,    83,    46,    85,    94,    17,    52,
      53,   127,    54,    47,    48,    49,    50,    51,    18,    44,
      45,    19,    95,   102,    52,    53,   116,    54,    24,    55,
      20,     1,     2,     3,     4,     5,     6,     7,     8,     1,
       2,     3,     4,     5,     6,     7,     8,     9,    10,   118,
      22,   119,   120,    69,    70,     9,    10,    73,    74,   111,
     112,    21,    75,   128,   129,    23,    29,    31,   -39,    30,
      32,    33,    34,    35,    36,    41,    37,    38,    40,    42,
      60,    63,    43,    82,    87,   -59,    66,    72,    88,   -61,
      89,    90,    92,    80,    81,    91,    98,    99,   100,    70,
     104,   106,    25,   105,   108,   117,   123,   124,   125,     0,
     133,     0,   113,   114,   126,   115,   134,     0,   130,     0,
       0,     0,     0,    79,   131,   132,     0,     0,   135,   136
};

static const yysigned_char yycheck[] =
{
       3,    68,     3,    16,    17,    26,    27,    28,    11,    12,
      13,    14,    15,    32,    67,     3,    69,    18,    29,    22,
      23,    34,    25,    11,    12,    13,    14,    15,     3,    31,
      32,     3,    33,    86,    22,    23,   103,    25,     0,    42,
       3,     3,     4,     5,     6,     7,     8,     9,    10,     3,
       4,     5,     6,     7,     8,     9,    10,    19,    20,   107,
      31,   109,   110,    27,    28,    19,    20,    35,    36,    16,
      17,    32,    40,   121,   122,    31,    41,    32,    42,    24,
      32,    21,     3,     3,    30,    21,    30,    30,    29,    21,
       3,    21,    31,     3,    42,    37,    33,    32,    21,    37,
      22,     3,    29,    37,    37,    36,    24,    24,    34,    28,
      35,     3,    11,    37,    92,    24,    24,    24,    24,    -1,
      24,    -1,    38,    38,    38,    37,    24,    -1,    39,    -1,
      -1,    -1,    -1,    62,    39,    38,    -1,    -1,    39,    39
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     3,     4,     5,     6,     7,     8,     9,    10,    19,
      20,    44,    45,    49,    62,    75,    32,    29,     3,     3,
       3,    32,    31,    31,     0,    45,    46,    47,    48,    41,
      24,    32,    32,    21,     3,     3,    30,    30,    30,    63,
      29,    21,    21,    31,    31,    32,     3,    11,    12,    13,
      14,    15,    22,    23,    25,    42,    64,    68,    70,    71,
       3,    51,    50,    21,    73,    74,    33,    72,    67,    27,
      28,    65,    32,    35,    36,    40,    52,    53,    60,    52,
      37,    37,     3,    68,    64,    68,    69,    42,    21,    22,
       3,    36,    29,     3,    18,    33,    55,    61,    24,    24,
      34,    26,    68,    66,    35,    37,     3,    54,    60,    58,
      59,    16,    17,    38,    38,    37,    64,    24,    55,    55,
      55,    56,    57,    24,    24,    24,    38,    34,    55,    55,
      39,    39,    38,    24,    24,    39,    39
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
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (0)


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (N)								\
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
    while (0)
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
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
} while (0)

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)		\
do {								\
  if (yydebug)							\
    {								\
      YYFPRINTF (stderr, "%s ", Title);				\
      yysymprint (stderr,					\
                  Type, Value);	\
      YYFPRINTF (stderr, "\n");					\
    }								\
} while (0)

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yy_stack_print (short int *bottom, short int *top)
#else
static void
yy_stack_print (bottom, top)
    short int *bottom;
    short int *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (/* Nothing. */; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yy_reduce_print (int yyrule)
#else
static void
yy_reduce_print (yyrule)
    int yyrule;
#endif
{
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu), ",
             yyrule - 1, yylno);
  /* Print the symbols being reduced, and their result.  */
  for (yyi = yyprhs[yyrule]; 0 <= yyrhs[yyi]; yyi++)
    YYFPRINTF (stderr, "%s ", yytname[yyrhs[yyi]]);
  YYFPRINTF (stderr, "-> %s\n", yytname[yyr1[yyrule]]);
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (Rule);		\
} while (0)

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
#  if defined (__GLIBC__) && defined (_STRING_H)
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
#   if defined (__STDC__) || defined (__cplusplus)
yystrlen (const char *yystr)
#   else
yystrlen (yystr)
     const char *yystr;
#   endif
{
  const char *yys = yystr;

  while (*yys++ != '\0')
    continue;

  return yys - yystr - 1;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined (__GLIBC__) && defined (_STRING_H) && defined (_GNU_SOURCE)
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
#   if defined (__STDC__) || defined (__cplusplus)
yystpcpy (char *yydest, const char *yysrc)
#   else
yystpcpy (yydest, yysrc)
     char *yydest;
     const char *yysrc;
#   endif
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
      size_t yyn = 0;
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

#endif /* YYERROR_VERBOSE */



#if YYDEBUG
/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yysymprint (FILE *yyoutput, int yytype, YYSTYPE *yyvaluep)
#else
static void
yysymprint (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvaluep;

  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);


# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  switch (yytype)
    {
      default:
        break;
    }
  YYFPRINTF (yyoutput, ")");
}

#endif /* ! YYDEBUG */
/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvaluep;

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
# if defined (__STDC__) || defined (__cplusplus)
int yyparse (void *YYPARSE_PARAM);
# else
int yyparse ();
# endif
#else /* ! YYPARSE_PARAM */
#if defined (__STDC__) || defined (__cplusplus)
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



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
# if defined (__STDC__) || defined (__cplusplus)
int yyparse (void *YYPARSE_PARAM)
# else
int yyparse (YYPARSE_PARAM)
  void *YYPARSE_PARAM;
# endif
#else /* ! YYPARSE_PARAM */
#if defined (__STDC__) || defined (__cplusplus)
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

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  short int yyssa[YYINITDEPTH];
  short int *yyss = yyssa;
  short int *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK   (yyvsp--, yyssp--)

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* When reducing, the number of symbols on the RHS of the reduced
     rule.  */
  int yylen;

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

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed. so pushing a state here evens the stacks.
     */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack. Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	short int *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

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
	short int *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


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

/* Do appropriate processing given the current state.  */
/* Read a look-ahead token if we need one and don't already have one.  */
/* yyresume: */

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

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;


  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  yystate = yyn;
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


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 4:
#line 27 "bachus.y"
    {;}
    break;

  case 6:
#line 28 "bachus.y"
    {;}
    break;

  case 8:
#line 29 "bachus.y"
    {;}
    break;

  case 11:
#line 32 "bachus.y"
    { make_association((yyvsp[-2].sympt)->name,(yyvsp[0].string)); 
                                             progbuild(SQNC_NEWDEF,(yyvsp[-2].sympt)->name); 
                                             progbuild(SQNC_SEQFILE,(yyvsp[0].string)); ;}
    break;

  case 12:
#line 35 "bachus.y"
    {progbuild(SQNC_NEWDEF,(yyvsp[-1].sympt)->name);;}
    break;

  case 13:
#line 35 "bachus.y"
    {progbuild(SQNC_ENDDEF,0);;}
    break;

  case 14:
#line 36 "bachus.y"
    {progbuild(SQNC_NEWSEQ,(yyvsp[-1].sympt)->name);;}
    break;

  case 15:
#line 36 "bachus.y"
    {progbuild(SQNC_ENDSEQ,0);;}
    break;

  case 16:
#line 38 "bachus.y"
    {progbuild(SQNC_EXPR,0);;}
    break;

  case 17:
#line 38 "bachus.y"
    {progbuild(SQNC_EXPREND,0);;}
    break;

  case 19:
#line 40 "bachus.y"
    {progbuild(SQNC_EXPR,0);;}
    break;

  case 20:
#line 40 "bachus.y"
    {progbuild(SQNC_EXPREND,0);;}
    break;

  case 22:
#line 43 "bachus.y"
    {progbuild(SQNC_OR,0);;}
    break;

  case 24:
#line 44 "bachus.y"
    {progbuild(SQNC_AND,0);;}
    break;

  case 26:
#line 45 "bachus.y"
    {progbuild(SQNC_NOT,0);;}
    break;

  case 28:
#line 46 "bachus.y"
    {progbuild(SQNC_PARLEFT,0);;}
    break;

  case 29:
#line 48 "bachus.y"
    {progbuild(SQNC_PARRIGHT,0);;}
    break;

  case 31:
#line 51 "bachus.y"
    {progbuild(SQNC_ACTION,(yyvsp[-1].string));;}
    break;

  case 33:
#line 53 "bachus.y"
    {progbuild(SQNC_CITE,(yyvsp[0].sympt)->name);;}
    break;

  case 34:
#line 54 "bachus.y"
    {progbuild(SQNC_CITENOT,(yyvsp[0].sympt)->name);;}
    break;

  case 35:
#line 56 "bachus.y"
    {progbuild(SQNC_WGNAME,(yyvsp[0].sympt)->name);;}
    break;

  case 36:
#line 58 "bachus.y"
    {  buildtree(STARTNODE,(yyvsp[-2].sympt)->name,(yyvsp[-2].sympt)->value,0); 
                                  buildtree(NEWPATH,NULL,lex_line(),0); 
                               ;}
    break;

  case 38:
#line 62 "bachus.y"
    {buildtree(ENDOFPATH,NULL,0,0);;}
    break;

  case 39:
#line 63 "bachus.y"
    {buildtree(ENDOFPATH,NULL,0,0);;}
    break;

  case 40:
#line 63 "bachus.y"
    {buildtree(NEWPATH,NULL,lex_line(),0);;}
    break;

  case 42:
#line 64 "bachus.y"
    {buildtree(NEWPATH,NULL,lex_line(),0);;}
    break;

  case 44:
#line 66 "bachus.y"
    {;}
    break;

  case 45:
#line 67 "bachus.y"
    {buildtree(WORDBOUNDARY,0,0,0);;}
    break;

  case 46:
#line 67 "bachus.y"
    {;}
    break;

  case 49:
#line 70 "bachus.y"
    { buildtree(RIGHTNODE,(yyvsp[0].sympt)->name,(yyvsp[0].sympt)->value,0);;}
    break;

  case 50:
#line 71 "bachus.y"
    { buildtree(SINGLEMORPH,(yyvsp[0].sympt)->name,(yyvsp[0].sympt)->value,0);;}
    break;

  case 51:
#line 72 "bachus.y"
    { buildtree(BOUNDACTION,(yyvsp[0].string),0,0);;}
    break;

  case 52:
#line 73 "bachus.y"
    { buildtree(OPERATORNAME,(yyvsp[0].string),0,0); printf("operator found %s\n",(yyvsp[0].string)); ;}
    break;

  case 53:
#line 74 "bachus.y"
    { buildtree(NOPNODE,0,0,0);;}
    break;

  case 54:
#line 75 "bachus.y"
    { buildtree(SKIPNODE,0,0,0);;}
    break;

  case 55:
#line 76 "bachus.y"
    { buildtree(SKIPLETTERNODE,0,0,0);;}
    break;

  case 56:
#line 78 "bachus.y"
    {buildtree(ENDSINNODE, (yyvsp[-1].sympt)->name, (yyvsp[-1].sympt)->value,0);;}
    break;

  case 57:
#line 80 "bachus.y"
    {buildtree(LOOPNODE,NULL,0,0);;}
    break;

  case 58:
#line 80 "bachus.y"
    {buildtree(JUMPNODE,NULL,(yyvsp[-3].ival),(yyvsp[-1].ival));;}
    break;

  case 59:
#line 81 "bachus.y"
    {buildtree(LOOPNODE,NULL,0,0); buildtree(RIGHTNODE,(yyvsp[0].sympt)->name,(yyvsp[0].sympt)->value,0);;}
    break;

  case 60:
#line 81 "bachus.y"
    {buildtree(JUMPNODE,NULL,(yyvsp[-3].ival),(yyvsp[-1].ival));;}
    break;

  case 61:
#line 82 "bachus.y"
    {buildtree(LOOPNODE,NULL,0,0); buildtree(SKIPLETTERNODE,0,0,0);;}
    break;

  case 62:
#line 82 "bachus.y"
    {buildtree(JUMPNODE,NULL,(yyvsp[-3].ival),(yyvsp[-1].ival));;}
    break;

  case 63:
#line 84 "bachus.y"
    {buildtree(TRIENAME,(yyvsp[0].string),(yyvsp[-2].sympt)->value,LONG_MORPH_FIRST); printf("TRIE FILE for symbol %s(%d) is %s\n",(yyvsp[-2].sympt)->name,(yyvsp[-2].sympt)->value,(yyvsp[0].string));;}
    break;

  case 64:
#line 85 "bachus.y"
    {buildtree(TRIENAME,(yyvsp[0].string),(yyvsp[-2].sympt)->value,LONG_MORPH_LAST); printf("RTRIE FILE for symbol %s(%d) is %s\n",(yyvsp[-2].sympt)->name,(yyvsp[-2].sympt)->value,(yyvsp[0].string));;}
    break;

  case 65:
#line 86 "bachus.y"
    {buildtree(LTRIENAME,(yyvsp[0].string),(yyvsp[-2].sympt)->value,(yyvsp[-4].ival)); printf("LTRIE FILE for symbol %s(%d) is %s with arg %i\n",(yyvsp[-2].sympt)->name,(yyvsp[-2].sympt)->value,(yyvsp[0].string),(yyvsp[-4].ival));;}
    break;

  case 66:
#line 87 "bachus.y"
    {buildtree(PROCESSNAME,(yyvsp[0].sympt)->name,0,0); printf("PROCESS FILE for symbol %s(%d)\n",(yyvsp[0].sympt)->name,(yyvsp[0].sympt)->value);;}
    break;

  case 67:
#line 88 "bachus.y"
    {printf(" GENERATES FILE %s\n",(yyvsp[0].string));;}
    break;

  case 68:
#line 89 "bachus.y"
    {printf("done\n"); return(1);;}
    break;


      default: break;
    }

/* Line 1126 of yacc.c.  */
#line 1516 "bachus.tab.c"

  yyvsp -= yylen;
  yyssp -= yylen;


  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


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
#if YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (YYPACT_NINF < yyn && yyn < YYLAST)
	{
	  int yytype = YYTRANSLATE (yychar);
	  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
	  YYSIZE_T yysize = yysize0;
	  YYSIZE_T yysize1;
	  int yysize_overflow = 0;
	  char *yymsg = 0;
#	  define YYERROR_VERBOSE_ARGS_MAXIMUM 5
	  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
	  int yyx;

#if 0
	  /* This is so xgettext sees the translatable formats that are
	     constructed on the fly.  */
	  YY_("syntax error, unexpected %s");
	  YY_("syntax error, unexpected %s, expecting %s");
	  YY_("syntax error, unexpected %s, expecting %s or %s");
	  YY_("syntax error, unexpected %s, expecting %s or %s or %s");
	  YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
#endif
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
	  int yychecklim = YYLAST - yyn;
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
		yysize_overflow |= yysize1 < yysize;
		yysize = yysize1;
		yyfmt = yystpcpy (yyfmt, yyprefix);
		yyprefix = yyor;
	      }

	  yyf = YY_(yyformat);
	  yysize1 = yysize + yystrlen (yyf);
	  yysize_overflow |= yysize1 < yysize;
	  yysize = yysize1;

	  if (!yysize_overflow && yysize <= YYSTACK_ALLOC_MAXIMUM)
	    yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg)
	    {
	      /* Avoid sprintf, as that infringes on the user's name space.
		 Don't have undefined behavior even if the translation
		 produced a string with the wrong number of "%s"s.  */
	      char *yyp = yymsg;
	      int yyi = 0;
	      while ((*yyp = *yyf))
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
	      yyerror (yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    {
	      yyerror (YY_("syntax error"));
	      goto yyexhaustedlab;
	    }
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror (YY_("syntax error"));
    }



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
	  yydestruct ("Error: discarding", yytoken, &yylval);
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
  if (0)
     goto yyerrorlab;

yyvsp -= yylen;
  yyssp -= yylen;
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


      yydestruct ("Error: popping", yystos[yystate], yyvsp);
      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token. */
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
		 yytoken, &yylval);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK;
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  return yyresult;
}


#line 91 "bachus.y"
 

static struct symtab *sp;
struct symtab *
symlook(s)
char *s;
{
	int count;
	count=0;
	for(sp = symtab; sp < &symtab[NSYMS]; sp++)        /* defined in bachus.h */
	  {
	    /* is it already here? */
	    count++;
	    if(sp->name && !strcmp(sp->name, s))  return sp;
	    /* is it free */
	    if(!sp->name) {
	      sp->name = strdup(s);
	      sp->value=count;
	      return sp;
	    }
	    /* otherwise continue to next */
	}
	yyerror("Too many symbols");
	exit(1);	/* cannot continue */
} /* symlook */

WalkCNTXT Walkercntxt;  

main(int ac, char **av)
{
  ASCIILETTER *retbuff;
  int eofcond=0;
  int ret;
  BOOL succ;
  extern FILE *yyin;
  char *nameextension;
  wordgrammarinfo WGinfo;
  int  ltriecount;
  lettertriename *ltf;
  FILE *wordsfid;

  numseqcmd =0;

  SequencePile = new_seqpile(100);  // space for a hundred of these.
  AssociationDict = new_stringdictionary();
  SequenceReserve = new_stringdictionary();

  if (ac>1)
    {
      if((yyin = fopen(av[1], "r")) == NULL) 
	{
	perror(av[1]);
	exit(1);
	}
      if (av[2] != NULL) nameextension = av[2];
      else nameextension = BACHUSSTRING;
    }
  else
    {
      if((yyin = fopen("experiment.ger", "r")) == NULL) 
	{
	perror(av[1]);
	exit(1);
	}
      nameextension = BACHUSSTRING;
    }
 

  //  yyin = fopen("wordgrammar.ger", "r");

  buildtree(INITIALIZE,NULL,0,0);  /* initialize the builder that's called as actions in the grammar, see above.*/


  yyparse();

  for (sp=symtab; sp < &symtab[NSYMS]; sp++) {
    if (sp->name) printf(" %d %s\n",sp->value,sp->name);}

  if (buildtree(DUMPALL,NULL,0,0) == 1)
    {
      make_ltries(); 
      printf("Make ltries was called\n");
    }
  else
    {
      printf("Incomplete grammar - check missing declarations\n");
      exit(1);
    }

  translate_sequences();
  sequence_progbuild("bachussequence.c","comments.h",SequenceReserve);
      
  buildtree(FILEDUMP,nameextension,0,0);
  buildtree(DUMPALL,NULL,0,0);
  ltriecount=0;

 for(ltf = LTrieFiles; ltf < &LTrieFiles[NTRIEFILES]; ltf++) 
    {
      if (ltf->triename)
	{
	  ltriecount++;
	}
    }

 printf("counted %i LTries\n",ltriecount);
 //WGinfo.notries = ltriecount; /* not usually used*/

 // WGinfo.nnodes = STGT.nnodes;
  WGinfo.GtNodes = STGT.Nodes;
  WGinfo.Ltreelist = LTrieList;
  WGinfo.MorphDict = &MorphDict;
  

#ifdef OLDVERSION_WITH_DIRECT_TEST
#ifdef FROMTYPED
   while (!eofcond)
    {
      printf("BACHUS>");
/*      ret = scanf("%s",bp); */
      retbuff = fgets(bp,80,stdin);
      if (retbuff==NULL || strlen(retbuff)<=1)
	{
	  eofcond=1;
	}
      else
	{
	  ret = strlen(retbuff);
	  // printf("ret = %i\n",ret);
	  if (ret>0)  retbuff[ret-1]='\0';
	  if (ret==0)
	  {
	      eofcond=1;
	      break;
	  }
	  //  printf("  %s\n",retbuff);
	  //  walk_word(bp,&STGT,LTrieList,&MorphDict);
	  //  succ = morphemize_word(bp,outword,outphones, &WGinfo,&HyphenTOK);
	  succ = morphemize_phrase(retbuff,outword,outphones, &Walkercntxt, &WGinfo);

	  // if (succ) printf("%s [%s] -> /%s/ \n",retbuff,outword,outphones);
	  // else printf("## %s\n",retbuff);
	}
    }
#else
   wordsfid = fopen(av[2], "r");
   if (wordsfid == NULL)
     {
       printf("could not open file\n");
       exit(1);
     }
   while (!eofcond)
     {
       ret = fscanf(wordsfid,"%s",bp);
       if (strlen(bp)==0 | ret <= 0)
	 {
	   eofcond=1;
	 }
       else
	 {
	   //	   printf("%s\n",bp);
	  succ = morphemize_word(bp,outword,outphones, &WGinfo,&HyphenTOK);
	  //if (succ) printf("%s [%s] -> /%s/ \n",bp,outword,outphones);
	  //else printf("## %s\n",bp);	  
	 }
     }
#endif
#endif  // OLDVERSION_WITH_DIRECT_TEST

#ifndef FROMTYPED
#ifdef GRAMMAR_EVALUATION
buildtree(STATISTICS,NULL,0,0);   // print how often a rule was used
#endif
#endif

}

yyerror(char *s)
{
  fprintf(stderr, "Error parsing line %d columns %d-%d : %s\n",lex_line(),lex_lastcol(),lex_column(), s);
}


