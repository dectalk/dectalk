
/*  A Bison parser, made from bachus.y with Bison version GNU Bison version 1.24
  */

#define YYBISON 1  /* Identify Bison output.  */

#define	NAME	258
#define	COMMENTLINE	259
#define	LTRIE	260
#define	TRIE	261
#define	RTRIE	262
#define	PROCESS	263
#define	TRIEFILE	264
#define	ENDTRIE	265
#define	MORPH	266
#define	EMPTYNODE	267
#define	FILENAME	268
#define	BOUND	269
#define	OPERATOR	270
#define	INTEGER	271
#define	LBRAK	272
#define	RBRAK	273

#line 1 "bachus.y"

#define  _this_is_main_bachus_
#include "bachus.h"
#include <string.h>
#include <stdio.h>

#line 7 "bachus.y"
typedef union{
  int ival;
  char oper;
  char *string;
  struct symtab *sympt;
} YYSTYPE;

#ifndef YYLTYPE
typedef
  struct yyltype
    {
      int timestamp;
      int first_line;
      int first_column;
      int last_line;
      int last_column;
      char *text;
   }
  yyltype;

#define YYLTYPE yyltype
#endif

#include <stdio.h>

#ifndef __cplusplus
#ifndef __STDC__
#define const
#endif
#endif



#define	YYFINAL		67
#define	YYFLAG		-32768
#define	YYNTBASE	28

#define YYTRANSLATE(x) ((unsigned)(x) <= 273 ? yytranslate[x] : 40)

static const char yytranslate[] = {     0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,    20,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    19,    25,     2,    27,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
    21,    22,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
    24,     2,    26,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,    23,     2,     2,     2,     2,     2,     2,
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
     2,     2,     2,     2,     2,     1,     2,     3,     4,     5,
     6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
    16,    17,    18
};

#if YYDEBUG != 0
static const short yyprhs[] = {     0,
     0,     3,     7,     8,     9,    15,    17,    19,    21,    23,
    24,    25,    31,    32,    36,    40,    42,    44,    46,    48,
    50,    52,    53,    63,    64,    72,    77,    82,    90,    93,
    97
};

static const short yyrhs[] = {    29,
    20,     0,    28,    29,    20,     0,     0,     0,     3,    21,
    22,    30,    31,     0,    31,     0,    39,     0,     4,     0,
    35,     0,     0,     0,    35,    32,    23,    33,    31,     0,
     0,    23,    34,    31,     0,    35,    19,    35,     0,    36,
     0,     3,     0,    11,     0,    14,     0,    15,     0,    12,
     0,     0,    17,    37,    35,    18,    24,    16,    25,    16,
    26,     0,     0,     3,    38,    24,    16,    25,    16,    26,
     0,     6,     3,    21,    13,     0,     7,     3,    21,    13,
     0,     5,    27,    16,    27,     3,    21,    13,     0,     8,
     3,     0,     9,    21,    13,     0,    10,     0
};

#endif

#if YYDEBUG != 0
static const short yyrline[] = { 0,
    19,    20,    22,    23,    24,    24,    25,    26,    28,    29,
    29,    30,    30,    31,    32,    33,    34,    35,    36,    37,
    38,    40,    40,    41,    41,    43,    44,    45,    46,    47,
    48
};

static const char * const yytname[] = {   "$","error","$undefined.","NAME","COMMENTLINE",
"LTRIE","TRIE","RTRIE","PROCESS","TRIEFILE","ENDTRIE","MORPH","EMPTYNODE","FILENAME",
"BOUND","OPERATOR","INTEGER","LBRAK","RBRAK","'+'","'\\n'","'='","'>'","'|'",
"'['","','","']'","'.'","STATEMENT","RULE","@1","RIGHTSIDE","@2","@3","@4","EXPRESSION",
"REPEATED","@5","@6","DECLARATION",""
};
#endif

static const short yyr1[] = {     0,
    28,    28,    29,    30,    29,    29,    29,    29,    31,    32,
    33,    31,    34,    31,    35,    35,    35,    35,    35,    35,
    35,    37,    36,    38,    36,    39,    39,    39,    39,    39,
    39
};

static const short yyr2[] = {     0,
     2,     3,     0,     0,     5,     1,     1,     1,     1,     0,
     0,     5,     0,     3,     3,     1,     1,     1,     1,     1,
     1,     0,     9,     0,     7,     4,     4,     7,     2,     3,
     1
};

static const short yydefact[] = {     3,
    17,     8,     0,     0,     0,     0,     0,    31,    18,    21,
    19,    20,    22,    13,     3,     0,     6,     9,    16,     7,
     0,     0,     0,     0,     0,    29,     0,     0,     0,     0,
     1,     0,     0,     4,     0,     0,     0,     0,    30,    17,
     0,    14,     2,    15,    11,     0,     0,     0,    26,    27,
     0,     0,     5,     0,     0,     0,    12,     0,     0,     0,
    25,    28,     0,     0,    23,     0,     0
};

static const short yydefgoto[] = {    15,
    16,    46,    17,    33,    52,    29,    18,    19,    28,    22,
    20
};

static const short yypact[] = {    22,
    -2,-32768,   -25,    10,    18,    35,    19,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,     0,    21,-32768,    -3,-32768,-32768,
    38,    33,    45,    41,    42,-32768,    51,    39,    32,    46,
-32768,    39,    44,-32768,    49,    43,    55,    56,-32768,    47,
    40,-32768,-32768,-32768,-32768,    32,    48,    69,-32768,-32768,
    50,    32,-32768,    59,    57,    60,-32768,    53,    64,    58,
-32768,-32768,    65,    54,-32768,    82,-32768
};

static const short yypgoto[] = {-32768,
    70,-32768,   -28,-32768,-32768,-32768,    20,-32768,-32768,-32768,
-32768
};


#define	YYLAST		85


static const short yytable[] = {    66,
    42,    23,     1,     2,     3,     4,     5,     6,     7,     8,
     9,    10,    24,    11,    12,    32,    13,    53,    21,   -10,
    25,   -24,    14,    57,     1,     2,     3,     4,     5,     6,
     7,     8,     9,    10,    40,    11,    12,    26,    13,    27,
    31,    40,     9,    10,    14,    11,    12,    41,    13,     9,
    10,    44,    11,    12,    14,    13,    35,    51,    32,    34,
    36,    37,    38,    39,    47,    43,    45,    49,    50,    48,
   -24,    55,    54,    56,    58,    60,    62,    59,    61,    65,
    64,    67,    63,     0,    30
};

static const short yycheck[] = {     0,
    29,    27,     3,     4,     5,     6,     7,     8,     9,    10,
    11,    12,     3,    14,    15,    19,    17,    46,    21,    23,
     3,    24,    23,    52,     3,     4,     5,     6,     7,     8,
     9,    10,    11,    12,     3,    14,    15,     3,    17,    21,
    20,     3,    11,    12,    23,    14,    15,    28,    17,    11,
    12,    32,    14,    15,    23,    17,    24,    18,    19,    22,
    16,    21,    21,    13,    16,    20,    23,    13,    13,    27,
    24,     3,    25,    24,    16,    16,    13,    21,    26,    26,
    16,     0,    25,    -1,    15
};
/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */
#line 3 "bison.simple"

/* Skeleton output parser for bison,
   Copyright (C) 1984, 1989, 1990 Free Software Foundation, Inc.

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
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

#ifndef alloca
#ifdef __GNUC__
#define alloca __builtin_alloca
#else /* not GNU C.  */
#if (!defined (__STDC__) && defined (sparc)) || defined (__sparc__) || defined (__sparc) || defined (__sgi)
#include <alloca.h>
#else /* not sparc */
#if defined (MSDOS) && !defined (__TURBOC__)
#include <malloc.h>
#else /* not MSDOS, or __TURBOC__ */
#if defined(_AIX)
#include <malloc.h>
 #pragma alloca
#else /* not MSDOS, __TURBOC__, or _AIX */
#ifdef __hpux
#ifdef __cplusplus
extern "C" {
void *alloca (unsigned int);
};
#else /* not __cplusplus */
void *alloca ();
#endif /* not __cplusplus */
#endif /* __hpux */
#endif /* not _AIX */
#endif /* not MSDOS, or __TURBOC__ */
#endif /* not sparc.  */
#endif /* not GNU C.  */
#endif /* alloca not defined.  */

/* This is the parser code that is written into each bison parser
  when the %semantic_parser declaration is not specified in the grammar.
  It was written by Richard Stallman by simplifying the hairy parser
  used when %semantic_parser is specified.  */

/* Note: there must be only one dollar sign in this file.
   It is replaced by the list of actions, each action
   as one case of the switch.  */

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0
#define YYACCEPT	return(0)
#define YYABORT 	return(1)
#define YYERROR		goto yyerrlab1
/* Like YYERROR except do call yyerror.
   This remains here temporarily to ease the
   transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */
#define YYFAIL		goto yyerrlab
#define YYRECOVERING()  (!!yyerrstatus)
#define YYBACKUP(token, value) \
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    { yychar = (token), yylval = (value);			\
      yychar1 = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { yyerror ("syntax error: cannot back up"); YYERROR; }	\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

#ifndef YYPURE
#define YYLEX		yylex()
#endif

#ifdef YYPURE
#ifdef YYLSP_NEEDED
#ifdef YYLEX_PARAM
#define YYLEX		yylex(&yylval, &yylloc, YYLEX_PARAM)
#else
#define YYLEX		yylex(&yylval, &yylloc)
#endif
#else /* not YYLSP_NEEDED */
#ifdef YYLEX_PARAM
#define YYLEX		yylex(&yylval, YYLEX_PARAM)
#else
#define YYLEX		yylex(&yylval)
#endif
#endif /* not YYLSP_NEEDED */
#endif

/* If nonreentrant, generate the variables here */

#ifndef YYPURE

int	yychar;			/*  the lookahead symbol		*/
YYSTYPE	yylval;			/*  the semantic value of the		*/
				/*  lookahead symbol			*/

#ifdef YYLSP_NEEDED
YYLTYPE yylloc;			/*  location data for the lookahead	*/
				/*  symbol				*/
#endif

int yynerrs;			/*  number of parse errors so far       */
#endif  /* not YYPURE */

#if YYDEBUG != 0
int yydebug;			/*  nonzero means print parse trace	*/
/* Since this is uninitialized, it does not stop multiple parsers
   from coexisting.  */
#endif

/*  YYINITDEPTH indicates the initial size of the parser's stacks	*/

#ifndef	YYINITDEPTH
#define YYINITDEPTH 200
#endif

/*  YYMAXDEPTH is the maximum size the stacks can grow to
    (effective only if the built-in stack extension method is used).  */

#if YYMAXDEPTH == 0
#undef YYMAXDEPTH
#endif

#ifndef YYMAXDEPTH
#define YYMAXDEPTH 10000
#endif

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
int yyparse (void);
#endif

#if __GNUC__ > 1		/* GNU C and GNU C++ define this.  */
#define __yy_memcpy(FROM,TO,COUNT)	__builtin_memcpy(TO,FROM,COUNT)
#else				/* not GNU C or C++ */
#ifndef __cplusplus

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (from, to, count)
     char *from;
     char *to;
     int count;
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
    *t++ = *f++;
}

#else /* __cplusplus */

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (char *from, char *to, int count)
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
    *t++ = *f++;
}

#endif
#endif

#line 192 "bison.simple"

/* The user can define YYPARSE_PARAM as the name of an argument to be passed
   into yyparse.  The argument should have type void *.
   It should actually point to an object.
   Grammar actions can access the variable by casting it
   to the proper pointer type.  */

#ifdef YYPARSE_PARAM
#define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
#else
#define YYPARSE_PARAM
#define YYPARSE_PARAM_DECL
#endif

int
yyparse(YYPARSE_PARAM)
     YYPARSE_PARAM_DECL
{
  register int yystate;
  register int yyn;
  register short *yyssp;
  register YYSTYPE *yyvsp;
  int yyerrstatus;	/*  number of tokens to shift before error messages enabled */
  int yychar1 = 0;		/*  lookahead token as an internal (translated) token number */

  short	yyssa[YYINITDEPTH];	/*  the state stack			*/
  YYSTYPE yyvsa[YYINITDEPTH];	/*  the semantic value stack		*/

  short *yyss = yyssa;		/*  refer to the stacks thru separate pointers */
  YYSTYPE *yyvs = yyvsa;	/*  to allow yyoverflow to reallocate them elsewhere */

#ifdef YYLSP_NEEDED
  YYLTYPE yylsa[YYINITDEPTH];	/*  the location stack			*/
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;

#define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)
#else
#define YYPOPSTACK   (yyvsp--, yyssp--)
#endif

  int yystacksize = YYINITDEPTH;

#ifdef YYPURE
  int yychar;
  YYSTYPE yylval;
  int yynerrs;
#ifdef YYLSP_NEEDED
  YYLTYPE yylloc;
#endif
#endif

  YYSTYPE yyval;		/*  the variable used to return		*/
				/*  semantic values from the action	*/
				/*  routines				*/

  int yylen;

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Starting parse\n");
#endif

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss - 1;
  yyvsp = yyvs;
#ifdef YYLSP_NEEDED
  yylsp = yyls;
#endif

/* Push a new state, which is found in  yystate  .  */
/* In all cases, when you get here, the value and location stacks
   have just been pushed. so pushing a state here evens the stacks.  */
yynewstate:

  *++yyssp = yystate;

  if (yyssp >= yyss + yystacksize - 1)
    {
      /* Give user a chance to reallocate the stack */
      /* Use copies of these so that the &'s don't force the real ones into memory. */
      YYSTYPE *yyvs1 = yyvs;
      short *yyss1 = yyss;
#ifdef YYLSP_NEEDED
      YYLTYPE *yyls1 = yyls;
#endif

      /* Get the current used size of the three stacks, in elements.  */
      int size = yyssp - yyss + 1;

#ifdef yyoverflow
      /* Each stack pointer address is followed by the size of
	 the data in use in that stack, in bytes.  */
#ifdef YYLSP_NEEDED
      /* This used to be a conditional around just the two extra args,
	 but that might be undefined if yyoverflow is a macro.  */
      yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yyls1, size * sizeof (*yylsp),
		 &yystacksize);
#else
      yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yystacksize);
#endif

      yyss = yyss1; yyvs = yyvs1;
#ifdef YYLSP_NEEDED
      yyls = yyls1;
#endif
#else /* no yyoverflow */
      /* Extend the stack our own way.  */
      if (yystacksize >= YYMAXDEPTH)
	{
	  yyerror("parser stack overflow");
	  return 2;
	}
      yystacksize *= 2;
      if (yystacksize > YYMAXDEPTH)
	yystacksize = YYMAXDEPTH;
      yyss = (short *) alloca (yystacksize * sizeof (*yyssp));
      __yy_memcpy ((char *)yyss1, (char *)yyss, size * sizeof (*yyssp));
      yyvs = (YYSTYPE *) alloca (yystacksize * sizeof (*yyvsp));
      __yy_memcpy ((char *)yyvs1, (char *)yyvs, size * sizeof (*yyvsp));
#ifdef YYLSP_NEEDED
      yyls = (YYLTYPE *) alloca (yystacksize * sizeof (*yylsp));
      __yy_memcpy ((char *)yyls1, (char *)yyls, size * sizeof (*yylsp));
#endif
#endif /* no yyoverflow */

      yyssp = yyss + size - 1;
      yyvsp = yyvs + size - 1;
#ifdef YYLSP_NEEDED
      yylsp = yyls + size - 1;
#endif

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Stack size increased to %d\n", yystacksize);
#endif

      if (yyssp >= yyss + yystacksize - 1)
	YYABORT;
    }

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Entering state %d\n", yystate);
#endif

  goto yybackup;
 yybackup:

/* Do appropriate processing given the current state.  */
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* yychar is either YYEMPTY or YYEOF
     or a valid token in external form.  */

  if (yychar == YYEMPTY)
    {
#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Reading a token: ");
#endif
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with */

  if (yychar <= 0)		/* This means end of input. */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more */

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Now at end of input.\n");
#endif
    }
  else
    {
      yychar1 = YYTRANSLATE(yychar);

#if YYDEBUG != 0
      if (yydebug)
	{
	  fprintf (stderr, "Next token is %d (%s", yychar, yytname[yychar1]);
	  /* Give the individual parser a way to print the precise meaning
	     of a token, for further debugging info.  */
#ifdef YYPRINT
	  YYPRINT (stderr, yychar, yylval);
#endif
	  fprintf (stderr, ")\n");
	}
#endif
    }

  yyn += yychar1;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != yychar1)
    goto yydefault;

  yyn = yytable[yyn];

  /* yyn is what to do for this token type in this state.
     Negative => reduce, -yyn is rule number.
     Positive => shift, yyn is new state.
       New state is final state => don't bother to shift,
       just return success.
     0, or most negative number => error.  */

  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrlab;

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Shift the lookahead token.  */

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Shifting token %d (%s), ", yychar, yytname[yychar1]);
#endif

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  /* count tokens shifted since error; after three, turn off error status.  */
  if (yyerrstatus) yyerrstatus--;

  yystate = yyn;
  goto yynewstate;

/* Do the default action for the current state.  */
yydefault:

  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;

/* Do a reduction.  yyn is the number of a rule to reduce with.  */
yyreduce:
  yylen = yyr2[yyn];
  if (yylen > 0)
    yyval = yyvsp[1-yylen]; /* implement default value of the action */

#if YYDEBUG != 0
  if (yydebug)
    {
      int i;

      fprintf (stderr, "Reducing via rule %d (line %d), ",
	       yyn, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (i = yyprhs[yyn]; yyrhs[i] > 0; i++)
	fprintf (stderr, "%s ", yytname[yyrhs[i]]);
      fprintf (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif


  switch (yyn) {

case 1:
#line 19 "bachus.y"
{nextlexline(); ;
    break;}
case 2:
#line 20 "bachus.y"
{nextlexline();;
    break;}
case 3:
#line 22 "bachus.y"
{;
    break;}
case 4:
#line 23 "bachus.y"
{buildtree(STARTNODE,yyvsp[-2].sympt->name,yyvsp[-2].sympt->value,0); buildtree(NEWPATH,NULL,lex_line(),0); ;
    break;}
case 6:
#line 24 "bachus.y"
{;
    break;}
case 7:
#line 25 "bachus.y"
{;
    break;}
case 8:
#line 26 "bachus.y"
{;
    break;}
case 9:
#line 28 "bachus.y"
{buildtree(ENDOFPATH,NULL,0,0);;
    break;}
case 10:
#line 29 "bachus.y"
{buildtree(ENDOFPATH,NULL,0,0);;
    break;}
case 11:
#line 29 "bachus.y"
{buildtree(NEWPATH,NULL,lex_line(),0);;
    break;}
case 13:
#line 30 "bachus.y"
{buildtree(NEWPATH,NULL,lex_line(),0);;
    break;}
case 15:
#line 32 "bachus.y"
{;
    break;}
case 17:
#line 34 "bachus.y"
{ buildtree(RIGHTNODE,yyvsp[0].sympt->name,yyvsp[0].sympt->value,0);;
    break;}
case 18:
#line 35 "bachus.y"
{ buildtree(SINGLEMORPH,yyvsp[0].sympt->name,yyvsp[0].sympt->value,0);;
    break;}
case 19:
#line 36 "bachus.y"
{ buildtree(BOUNDACTION,yyvsp[0].string,0,0);;
    break;}
case 20:
#line 37 "bachus.y"
{ buildtree(OPERATORNAME,yyvsp[0].string,0,0); printf("operator found %s\n",yyvsp[0].string); ;
    break;}
case 21:
#line 38 "bachus.y"
{ buildtree(NOPNODE,0,0,0);;
    break;}
case 22:
#line 40 "bachus.y"
{buildtree(LOOPNODE,NULL,0,0);;
    break;}
case 23:
#line 40 "bachus.y"
{buildtree(JUMPNODE,NULL,yyvsp[-3].ival,yyvsp[-1].ival);;
    break;}
case 24:
#line 41 "bachus.y"
{buildtree(LOOPNODE,NULL,0,0); buildtree(RIGHTNODE,yyvsp[0].sympt->name,yyvsp[0].sympt->value,0);;
    break;}
case 25:
#line 41 "bachus.y"
{buildtree(JUMPNODE,NULL,yyvsp[-3].ival,yyvsp[-1].ival);;
    break;}
case 26:
#line 43 "bachus.y"
{buildtree(TRIENAME,yyvsp[0].string,yyvsp[-2].sympt->value,LONG_MORPH_FIRST); printf("TRIE FILE for symbol %s(%d) is %s\n",yyvsp[-2].sympt->name,yyvsp[-2].sympt->value,yyvsp[0].string);;
    break;}
case 27:
#line 44 "bachus.y"
{buildtree(TRIENAME,yyvsp[0].string,yyvsp[-2].sympt->value,LONG_MORPH_LAST); printf("RTRIE FILE for symbol %s(%d) is %s\n",yyvsp[-2].sympt->name,yyvsp[-2].sympt->value,yyvsp[0].string);;
    break;}
case 28:
#line 45 "bachus.y"
{buildtree(LTRIENAME,yyvsp[0].string,yyvsp[-2].sympt->value,yyvsp[-4].ival); printf("LTRIE FILE for symbol %s(%d) is %s with arg %i\n",yyvsp[-2].sympt->name,yyvsp[-2].sympt->value,yyvsp[0].string,yyvsp[-4].ival);;
    break;}
case 29:
#line 46 "bachus.y"
{buildtree(PROCESSNAME,yyvsp[0].sympt->name,0,0); printf("PROCESS FILE for symbol %s(%d)\n",yyvsp[0].sympt->name,yyvsp[0].sympt->value);;
    break;}
case 30:
#line 47 "bachus.y"
{printf(" GENERATES FILE %s\n",yyvsp[0].string);;
    break;}
case 31:
#line 48 "bachus.y"
{printf("done\n"); return(1);;
    break;}
}
   /* the action file gets copied in in place of this dollarsign */
#line 487 "bison.simple"

  yyvsp -= yylen;
  yyssp -= yylen;
#ifdef YYLSP_NEEDED
  yylsp -= yylen;
#endif

#if YYDEBUG != 0
  if (yydebug)
    {
      short *ssp1 = yyss - 1;
      fprintf (stderr, "state stack now");
      while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
      fprintf (stderr, "\n");
    }
#endif

  *++yyvsp = yyval;

#ifdef YYLSP_NEEDED
  yylsp++;
  if (yylen == 0)
    {
      yylsp->first_line = yylloc.first_line;
      yylsp->first_column = yylloc.first_column;
      yylsp->last_line = (yylsp-1)->last_line;
      yylsp->last_column = (yylsp-1)->last_column;
      yylsp->text = 0;
    }
  else
    {
      yylsp->last_line = (yylsp+yylen-1)->last_line;
      yylsp->last_column = (yylsp+yylen-1)->last_column;
    }
#endif

  /* Now "shift" the result of the reduction.
     Determine what state that goes to,
     based on the state we popped back to
     and the rule number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTBASE] + *yyssp;
  if (yystate >= 0 && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTBASE];

  goto yynewstate;

yyerrlab:   /* here on detecting error */

  if (! yyerrstatus)
    /* If not already recovering from an error, report this error.  */
    {
      ++yynerrs;

#ifdef YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (yyn > YYFLAG && yyn < YYLAST)
	{
	  int size = 0;
	  char *msg;
	  int x, count;

	  count = 0;
	  /* Start X at -yyn if nec to avoid negative indexes in yycheck.  */
	  for (x = (yyn < 0 ? -yyn : 0);
	       x < (sizeof(yytname) / sizeof(char *)); x++)
	    if (yycheck[x + yyn] == x)
	      size += strlen(yytname[x]) + 15, count++;
	  msg = (char *) malloc(size + 15);
	  if (msg != 0)
	    {
	      strcpy(msg, "parse error");

	      if (count < 5)
		{
		  count = 0;
		  for (x = (yyn < 0 ? -yyn : 0);
		       x < (sizeof(yytname) / sizeof(char *)); x++)
		    if (yycheck[x + yyn] == x)
		      {
			strcat(msg, count == 0 ? ", expecting `" : " or `");
			strcat(msg, yytname[x]);
			strcat(msg, "'");
			count++;
		      }
		}
	      yyerror(msg);
	      free(msg);
	    }
	  else
	    yyerror ("parse error; also virtual memory exceeded");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror("parse error");
    }

  goto yyerrlab1;
yyerrlab1:   /* here on error raised explicitly by an action */

  if (yyerrstatus == 3)
    {
      /* if just tried and failed to reuse lookahead token after an error, discard it.  */

      /* return failure if at end of input */
      if (yychar == YYEOF)
	YYABORT;

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Discarding token %d (%s).\n", yychar, yytname[yychar1]);
#endif

      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token
     after shifting the error token.  */

  yyerrstatus = 3;		/* Each real token shifted decrements this */

  goto yyerrhandle;

yyerrdefault:  /* current state does not do anything special for the error token. */

#if 0
  /* This is wrong; only states that explicitly want error tokens
     should shift them.  */
  yyn = yydefact[yystate];  /* If its default is to accept any token, ok.  Otherwise pop it.*/
  if (yyn) goto yydefault;
#endif

yyerrpop:   /* pop the current state because it cannot handle the error token */

  if (yyssp == yyss) YYABORT;
  yyvsp--;
  yystate = *--yyssp;
#ifdef YYLSP_NEEDED
  yylsp--;
#endif

#if YYDEBUG != 0
  if (yydebug)
    {
      short *ssp1 = yyss - 1;
      fprintf (stderr, "Error: state stack now");
      while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
      fprintf (stderr, "\n");
    }
#endif

yyerrhandle:

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yyerrdefault;

  yyn += YYTERROR;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != YYTERROR)
    goto yyerrdefault;

  yyn = yytable[yyn];
  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrpop;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrpop;

  if (yyn == YYFINAL)
    YYACCEPT;

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Shifting error token, ");
#endif

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  yystate = yyn;
  goto yynewstate;
}
#line 50 "bachus.y"
 

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



main(int ac, char **av)
{
  GERLETTER bp[100], outword[100], outphones[100];
  int eofcond=0;
  int ret;
  BOOL succ;
  extern FILE *yyin;
  char *nameextension;
  wordgrammarinfo WGinfo;
  WalkCNTXT BachusContxt;
  int  ltriecount;
  lettertriename *ltf;

  FILE *wordsfid;

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
    }
  else
    {
      printf("Incomplete grammar - check missing declarations\n");
      exit(1);
    }

      
  buildtree(FILEDUMP,nameextension,0,0);

  ltriecount=0;

 for(ltf = LTrieFiles; ltf < &LTrieFiles[NTRIEFILES]; ltf++) 
    {
      if (ltf->triename)
	{
	  ltriecount++;
	}
    }

#if 0
 printf("counted %i LTries\n",ltriecount);
  WGinfo.notries = ltriecount; /* not usually used*/

  WGinfo.nnodes = STGT.nnodes;
  WGinfo.GtNodes = STGT.Nodes;
  WGinfo.Ltreelist = LTrieList;
  WGinfo.MorphDict = &MorphDict;
  

#ifdef FROMTYPED
   while (!eofcond)
    {
      printf("BACHUS>");
      ret = scanf("%s",bp);
      if (strlen(bp)==0 | ret <= 0)
	{
	  eofcond=1;
	}
      else
	{
	  printf("  %s\n",bp);
	  //  walk_word(bp,&STGT,LTrieList,&MorphDict);
	  //  succ = morphemize_word(bp,outword,outphones, &WGinfo,&HyphenTOK);
	  succ = morphemize_word(bp,outword,outphones,&BachusContxt, &WGinfo);

	  if (succ) printf("%s [%s] -> /%s/ \n",bp,outword,outphones);
	  else printf("## %s\n",bp);
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
	  if (succ) printf("%s [%s] -> /%s/ \n",bp,outword,outphones);
	  else printf("## %s\n",bp);	  
	 }
     }
#endif

#ifndef FROMTYPED
#ifdef GRAMMAR_EVALUATION
buildtree(STATISTICS,NULL,0,0);   // print how often a rule was used
#endif
#endif

#endif 
}

yyerror(char *s)
{
  fprintf(stderr, "Error parsing line %d columns %d-%d : %s\n",lex_line(),lex_lastcol(),lex_column(), s);
}



