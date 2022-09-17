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
     SETSOUNDSET = 258,
     REPLACE = 259,
     NAME = 260,
     COMMENTLINE = 261,
     MORPH = 262,
     NIL = 263,
     SCHNIPP = 264,
     INTEGER = 265,
     LBRAK = 266,
     RBRAK = 267
   };
#endif
/* Tokens.  */
#define SETSOUNDSET 258
#define REPLACE 259
#define NAME 260
#define COMMENTLINE 261
#define MORPH 262
#define NIL 263
#define SCHNIPP 264
#define INTEGER 265
#define LBRAK 266
#define RBRAK 267




#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 8 "ruleparse.y"
typedef union YYSTYPE {
  int ival;
  char oper;
  char *string;
  struct symtab *sympt;
} YYSTYPE;
/* Line 1447 of yacc.c.  */
#line 69 "ruleparse.tab.h"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;



