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




#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 7 "bachus.y"
typedef union YYSTYPE {
  int ival;
  char oper;
  char *string;
  struct symtab *sympt;
} YYSTYPE;
/* Line 1447 of yacc.c.  */
#line 97 "bachus.tab.h"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;



