#ifndef WORD_LIST_H
#define WORD_LIST_H

#include <windows.h>
#include <mmsystem.h>

#include "usa_def.h"
#include "uk_def.h"
#include "spa_def.h"
#include "ger_def.h"
#include "fr_def.h"
#include "la_def.h"
#include "ttsapi.h"

typedef struct words_t
{
	unsigned char *graph;
	char homo;
	char *phone;
	unsigned int fc;
	int priority;
	int wordnumber;
	int in_sub_list;
} words_t; 

typedef struct words_t *pwords_t;

typedef struct comment_t
{
	unsigned char *comment;
} comment_t; 

typedef struct comment_t *pcomment_t;

typedef union line_t
{
	words_t	word;
	comment_t comment;
} line_t; 

typedef union line_t *pline_t;

typedef struct list_t
{
	int is_comment;
	struct list_t *prev;
	struct list_t *next;
	line_t line;
} list_t; 

typedef struct list_t *plist_t;

#endif