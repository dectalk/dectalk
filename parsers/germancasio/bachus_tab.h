typedef union{
  int ival;
  char oper;
  char *string;
  struct symtab *sympt;
} YYSTYPE;
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


extern YYSTYPE yylval;
