%{
#include <stdio.h>
#include <string.h>
#include "bachus_tab.h"
#include "bachus.h"
%}
%option noyywrap
%%
[\t ]+                    movelexcolumn(yyleng);
"TRIE"|"Trie"|"trie"      {movelexcolumn(yyleng); return TRIE;}
"RTRIE"|"RTrie"|"rtrie"   {movelexcolumn(yyleng); return RTRIE;}
"LTRIE"|"LTrie"|"ltrie"   {movelexcolumn(yyleng); return LTRIE;}
"PROCESS"|"Process"|"process"   {movelexcolumn(yyleng); return PROCESS;}
"FILE"|"File"|"file"      {movelexcolumn(yyleng); return TRIEFILE;}
"EMPTY"|"NIL"|"LEER"|"empty" {movelexcolumn(yyleng); return EMPTYNODE;}
"$"|"$EOF"|"$END"       {movelexcolumn(yyleng); return ENDTRIE;}
"("                     {movelexcolumn(yyleng); yylval.oper='('; return LBRAK;}
")"                     {movelexcolumn(yyleng); yylval.oper=')'; return RBRAK;}
[0-9]+      {
             yylval.ival = atoi(yytext);
             movelexcolumn(yyleng);
             return INTEGER; 
            }
[A-Za-z][A-Za-z0-9_\-]*    {
                            yylval.sympt = symlook(yytext);
                            movelexcolumn(yyleng);
                            return NAME;
                           }
\*[A-Za-z]*\([^)]{0,50}\)\*      {
                                  yylval.string = strdup(yytext);
                                  movelexcolumn(yyleng); 
                                  return OPERATOR;
                                 }
\"[A-Za-z][A-Za-z0-9]*\.[a-z]+\"                {
                                                 yylval.string = strdup(yytext);
                                                 movelexcolumn(yyleng); 
                                                 return FILENAME;
                                                }
\"[^\"]{1,20}\"           {
                           yylval.sympt = symlook(yytext); /* \"[a-z\-]+\" */
                           movelexcolumn(yyleng); 
                           return MORPH;
                          }
\<[^>]{1,10}\>           {
                           yylval.string = strdup(yytext); 
                           movelexcolumn(yyleng); 
                           return BOUND;
                         }
"//".* ;
#.*         {return COMMENTLINE;}
\n      { 
          return yytext[0];
        }
.       {                         
         movelexcolumn(yyleng);
         return yytext[0];
        }
%%

