/* This code is to be included into builder.c */

#ifndef _BACHUSOPERATOR_H_
#define _BACHUSOPERATOR_H_

#define NUMBER_OF_BACHUS_OPERATORS 7

typedef 
struct _operator_list{
  char* name;
  operatornumber index;
} operatorlist;

const operatorlist operatordictionary[]={
{"longer", OPlonger},
{"shorter",OPshorter},
{"startvowel",OPstartvowel},
{"startcons", OPstartcons},
{"syllabify", OPsyllabify},
{"grammar", OPgrammar},
{"special", OPspezial},
{"break",OPbreak}};

/* special codes:  1 capitalized
                   2 has hyphen(s)
                   4 has dot(s)
		   8 has apostrophe(s)
*/

#endif
