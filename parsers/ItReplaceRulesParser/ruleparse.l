%{
#include <stdio.h>
#include <string.h>
#include "ruleparse.tab.h"
#include "ruleparse.h"
%}
%option noyywrap
%%
[\t ]+                       {movelexcolumn(yyleng);}
[\n]                         {nextlexline();}
"SET"|"set"|"Set"           {movelexcolumn(yyleng); return SETSOUNDSET;}
"REPLACE"|"replace"|"REP"   {movelexcolumn(yyleng); return REPLACE;}
"NIL"|"nil"                 {movelexcolumn(yyleng); return NIL;}
\"[^\"]{1,20}\"           {
                           yylval.sympt = symlook(yytext);
                           movelexcolumn(yyleng); 
                           return MORPH;
                          }
[A-Za-z]{1,20}           {
                            yylval.sympt = symlook(yytext);
                            movelexcolumn(yyleng);
                            return NAME;
                           }

"//".* ;
"//"|#.*\n   {nextlexline(); return COMMENTLINE;}
.       {                         
         movelexcolumn(yyleng);
         return yytext[0];
        }
%%
