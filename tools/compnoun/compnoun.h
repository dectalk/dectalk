/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © Force Computers Incorporated 2000, a Solectron Company. All rights reserved.
 *    (c) Digital Equipment Corporation 1998. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	compnoun.h
 *    Author:       Matthew Schnee
 *    Creation Date:05/12/1998
 *
 *    Functionality:
 * 		Text preprocessor main file
 *
 ***********************************************************************
 *    Revision History:                    
 *
 *	Rev	Who		Date		Description
 *	---	-----	-----------	---------------------------------------
 *  001 CAB		10/18/2000	Changed copyright info
 */


#ifdef BLD_DECTALK_DLL
struct comp_noun_conjunction_s
{
	int length;
	char conj[4];
};

typedef struct comp_noun_conjunction_s comp_noun_conjunction;

/* this is the structure that will be used for the running code */
#pragma pack(1)
struct short_entry
{
	char character;
	short entry;
};
#pragma pack()

#pragma pack(1)
struct comp_noun_table_entry_s
{
	char word_ending;
	char length;
	union data
	{
		short entries[256];
		char rest_of_word[256];
		struct short_entry sentry[256];
	};
};
#pragma pack()

typedef struct comp_noun_table_entry_s comp_noun_table_entry;

int break_down_word(comp_noun_table_entry *head,unsigned char *input,unsigned char *output);
int find_word_in_dict(comp_noun_table_entry *head, unsigned char *word, int *positions, int depth,int *num_pos);

#else //#ifdef DLB_DECTALK_DLL
/* this is the srructure that the compiler will use to create the initial table */

struct compiler_table_entry_s
{
	char word_ending;
	char length;
	int written;
	int index_number;
	struct compiler_table_entry_s **chars;
};

typedef struct compiler_table_entry_s compiler_table_entry;
typedef struct compiler_table_entry_s *pcompiler_table_entry;

struct compiler_table_string_s
{
	char word_ending;
	char length;
	int written;
	int index_number;
	unsigned char *rest;
};

typedef struct compiler_table_string_s compiler_table_string;
typedef struct compiler_table_string_s *pcompiler_table_string;

#pragma pack(1)
struct data_short_entry
{
	char character;
	short entry;
};
#pragma pack()

struct compiler_short_entry
{
	char character;
	struct compiler_table_entry_s *schar;
};

struct compiler_table_short_entry_s
{
	char word_ending;
	char length;
	int written;
	int index_number;
	struct compiler_short_entry *schars;
};

typedef struct compiler_table_short_entry_s compiler_table_short_entry;
typedef struct compiler_table_short_entry_s *pcompiler_table_short_entry;

struct compiler_conjunction_s
{
	int length;
	char conj[4];
};

typedef struct compiler_conjunction_s compiler_conjunction;


compiler_table_entry *create_entry(void);
void add_entry_to_table(compiler_table_entry *head,unsigned char *input_string);
void calculate_used_space(compiler_table_entry *head);
int remove_singular_ends(compiler_table_entry *head,unsigned char *end);
void dump_dictionary(compiler_table_entry *head, unsigned char *in_word);
int break_down_word(compiler_table_entry *head,unsigned char *input,unsigned char *output);
int find_word_in_dict(compiler_table_entry *head, unsigned char *word, int *positions, int depth,int *num_pos);
int compress_nodes(compiler_table_entry *head);


int my_strlen(unsigned char *word);

void output_binary_format(void);
void output_text_format(void);
void set_indexes_in_table(compiler_table_entry *head);
void fill_index_data_table(compiler_table_entry *head);


void add_end_to_existing(compiler_table_string *p);
compiler_table_string *check_existing_ends(unsigned char *word);

int count_singular_middles(compiler_table_entry *head,unsigned char *middle);


#define UNUSED_ENTRY	((compiler_table_entry *)-1)

#endif


