
#define RULE_SECTION		1
#define DICT_SECTION		2
#define NO_SECTION			-1
#define SECTION_MARKER		'['
#define DICT_ENTRY_DELIM	'~'

#define MAX_RULES			32767
#define MAX_SECTIONS		100
#define MAX_DICT_ENTRY		50
#define MAX_INPUT_LINE		500

typedef struct descriptors_t
{
	U8 small_desc;
	U16 large_desc;
} desc_t;

typedef struct action_entry
{
	U16		operation;
	U8		next_type;
	U8		num_desc;
	desc_t	descript[65];
	U8		data_number;
	U8		data[256];
	U8		end_of_match;
	U8		end_of_hit;
	U8		end_of_action;
	U16		macro_num;
	U8		sections[256];
} action_rule_t;

struct rule_struct_comp
{
  S16 special_rule;                      /* 0 normal rule  1 stop  2 return  3 goto  4 goret */
  S16 special_value;                     /* the data for the special rule */
  S32 lang_flag;                         /* the langauge flag */
  S32 mode_flag;                         /* the mode flag */
  S16 rule_number;                       /* the rule number */
  S16 next_hit_rule;                     /* the rule to go to on a hit */
  S16 next_miss_rule;                    /* the rule to go to on a miss */
  S16 next_goret_hit;                    /* the rule to subroutine to on a hit */
  S16 next_goret_miss;                   /* the rule to subroutine to on a miss */
  S16  dict_flag;                        /* the dictionary hit miss flag */
  unsigned char rule[PAR_MAX_RULE_LENGTH]; /* the rest of the rule, left as is */
  action_rule_t newrule[PAR_MAX_RULE_LENGTH]; /* the new format for the rules */
  S32 binary_rule_length;
  unsigned char binary_data[PAR_MAX_RULE_LENGTH*5];
};

typedef struct rule_struct_comp rule_comp_t;
typedef struct rule_struct_comp *prule_comp_t;

struct rule_node_s
{
  prule_comp_t data;
  struct rule_node_s *next;
};

/* the compilers dictionary entries */
typedef struct rule_node_s *rule_node;

struct dict_entry_s_comp
{
  unsigned char search_graph[MAX_DICT_ENTRY];
  unsigned char out_graph[MAX_DICT_ENTRY];
};

typedef struct dict_entry_s_comp *dict_entry_comp;

/* a node on a dictioanries entriy list */
struct dict_node_s
{
  dict_entry_comp data;
  struct dict_node_s *next;
};

typedef struct dict_node_s *dict_node;

/* a node on the global list of dictioanries */
struct dict_names_s
{
  char dict_name[MAX_DICT_ENTRY];
  int dic_number;
  int num_entries;
  struct dict_names_s *next;
  dict_node dict_entries;
};
 
typedef struct dict_names_s *dict_names;

/* function prototypes */
void match_rule(char *rule,int *index,int state,dict_names dict_list,char end);
void match_string(char *rule,int *index,int char_type);
void match_standard(char *rule,int *index);
void match_digit(char *rule,int *index);
void match_set(char *rule,int *index);
void update_rule_macro(char *rule,dict_names dict_list);
void perform_action(char *rule,int *index,int state,dict_names dict_list);



/* defines for the the binary format */

/* rule header flags */
#define SPECIAL_RULE_MASK		0xE000		/* 1110 0000 0000 0000 */
#define BIN_STOP_VALUE			0x2000		/* 0010 0000 0000 0000 */
#define BIN_RETURN_VALUE		0x4000		/* 0100 0000 0000 0000 */
#define BIN_GOTO_VALUE			0x6000		/* 0110 0000 0000 0000 */
#define BIN_GORET_VALUE			0x8000		/* 1000 0000 0000 0000 */
#define BIN_HIT_VALUE			0x1000		/* 0001 0000 0000 0000 */
#define BIN_MISS_VALUE			0x0800		/* 0000 1000 0000 0000 */
#define BIN_GORET_HIT_VALUE		0x0400		/* 0000 0100 0000 0000 */
#define BIN_GORET_MISS_VALUE	0x0200		/* 0000 0010 0000 0000 */
#define BIN_COPY_HIT_VALUE		0x0100		/* 0000 0001 0000 0000 */
#define BIN_DICT_HIT_VALUE		0x0080		/* 0000 0000 1000 0000 */
#define BIN DICT_MISS_VALUE		0x0040		/* 0000 0000 0100 0000 */

/* Operations */
#define BIN_OPERATION_MASK	0x1F

#define BIN_END_OF_RULE			0x00
#define BIN_ALPHANUMERIC		0x01
#define BIN_ANY_ALPHABET		0x02
#define BIN_ANY_CHARACTER		0x03
#define BIN_CLAUSE_BOUNDRY		0x04
#define	BIN_CONSONANT			0x05
#define BIN_LOWER				0x06
#define BIN_NON_ALPHABET		0x07
#define BIN_NUMBER				0x08
#define	BIN_PUNCT_SOME			0x09
#define BIN_PUNCTUATION			0x0A
#define BIN_UPPER				0x0B
#define BIN_VOWEL				0x0C
#define BIN_VOWEL_NON_Y			0x0D
#define BIN_WHITESPACE			0x0E
#define BIN_DIGIT				0x0F
#define BIN_EXACT				0x10
#define BIN_HEXADECIMAL			0x11
#define BIN_RESTORE				0x12
#define BIN_SETS				0x13
#define BIN_COPY				0x14
#define BIN_DELETE				0x15
#define BIN_OPTIONAL			0x16
#define BIN_SAVE				0x17
#define BIN_MACRO				0x18
#define BIN_REPLACE				0x19
#define BIN_INSERT				0x1A
#define BIN_AFTER				0x1B
#define BIN_BEFORE				0x1C
#define BIN_DICTIONARY			0x1D
#define BIN_STATUS				0x1E
#define BIN_WORD				0x1F

/* operation flags */
#define BIN_OPERATION_FLAG_MASK	0xE0
#define BIN_LOOK_TO_DISABLE		0x80
#define BIN_LOOK_FROM_DISABLE	0x40
#define BIN_DIGIT_RANGE			0x20 /* this is a shared bit with different meanings */
#define BIN_CASE_INSEN			0x20 /* depending on the opertaion */
#define BIN_DICT_HIT_FAIL		0x80
#define BIN_DICT_MISS_FAIL		0x40
#define BIN_CONDITIONAL_REPLACE	0x80


/* number of size descriptor flags */
#define BIN_SIZE_DESC_MASK		0x3F
#define BIN_SIZE_DESC_FLAG_MASK	0xC0
#define BIN_COMPLIMENT			0x80
#define BIN_LARGE_DESC			0x40


/* size descriptor flags */
#define BIN_MAX_SMALL_DESC		0x3F
#define BIN_SMALL_DESC_FLG_MASK	0xC0
#define BIN_SMALL_ANY_NUMBER	0x80
#define BIN_SMALL_CONTINUE		0x40

#define BIN_MAX_LARGE_DESC		0x3FFF
#define BIN_LARGE_DESC_FLG_MASK	0xC000
#define BIN_LARGE_ANY_NUMBER	0x8000
#define BIN_LARGE_CONTINUE		0x4000


/* rule header values */
#define BIN_SPECIAL_RULE_MASK	0xE000
#define BIN_IS_SPECIAL			0x8000
#define BIN_STOP				0x2000
#define BIN_RETURN				0x4000
#define BIN_GOTO				0xA000
#define BIN_GORET				0xC000


#define BIN_NEXT_HIT			0x1000
#define BIN_NEXT_MISS			0x0800
#define BIN_GORET_HIT			0x0400
#define BIN_GORET_MISS			0x0200
#define BIN_COPY_HIT			0x0100
#define BIN_DICT_HIT			0x0080
#define BIN_DICT_MISS			0x0040




int par_get_int_length(int i);
__int64 par_convert_hex_number(unsigned char *string,int num);
void par_print_rule_error(unsigned char *current_rule,int pos);
int par_get_char_type(unsigned char c);
int par_get_state(unsigned char c);

void convert_rule_to_binary(rule_node p);
void convert_all_rules_to_binary(rule_node list);
int bin_convert_to_ambi(int i);
int bin_lookup_ambiguous(int cur_type,int from_reverse,int new_type,int to_reverse);
int check_types(action_rule_t *newrule, int prev_index,int cur_index,int prev_old_type);
void add_section_to_set(action_rule_t *newrule,int index,int cur_index);
void set_next_type(action_rule_t *newrule,int index,int type_index);
void set_restore_number(action_rule_t *newrule,int index,int number);
void set_hex_number(action_rule_t *newrule, int index,int number);
void set_string_data(action_rule_t *newrule, int index, char *string,int length);
void set_dict_miss_fail(action_rule_t *newrule,int index);
void set_dict_hit_fail(action_rule_t *newrule,int index);
void set_end_of_hit(action_rule_t *newrule,int index,int cur_index);
void set_end_of_action(action_rule_t *newrule,int index,int cur_index);
void set_end_of_match(action_rule_t *newrule,int index,int cur_index);
void set_macro_number(action_rule_t *newrule,int index,int number);
void set_dictionary_number(action_rule_t *newrule,int index,int number);
void set_save_data_target(action_rule_t *newrule,int index,int number);
void convert_desc_to_large(action_rule_t *newrule,int index);
void set_descriptor_number(action_rule_t *newrule,int index,int value,int next);
void set_continue(action_rule_t *newrule,int index,int next);
void set_any_number(action_rule_t *newrule,int index,int next);
int get_desc_index(action_rule_t *newrule,int index);
void add_descriptor_to_list(action_rule_t *newrule,int index);
void set_large_desc(action_rule_t *newrule, int index);
void set_compliment(action_rule_t *newrule, int index);
void add_conditional_to_action(action_rule_t *newrule,int index,int number);
void set_conditional_replace(action_rule_t *newrule,int index);
void set_case_insen(action_rule_t *newrule,int index);
void set_digit_range(action_rule_t *newrule,int index);
void set_lookahead_to(action_rule_t *newrule,int index);
void set_lookahead_from(action_rule_t *newrule,int index);
void set_binary_operation(action_rule_t *newrule,int index,int op);
void assign_operation(action_rule_t *newrule,int type, int in_op,int index);
void bin_match_set(char *rule,action_rule_t *newrule,int *index);
void bin_match_digit(char *rule,action_rule_t *newrule,int *index);
void bin_match_standard(char *rule,action_rule_t *newrule,int *index);
void bin_match_string(char *rule,action_rule_t *newrule,int *index,int char_type);
void bin_perform_action(char *rule,action_rule_t *newrule, int in_index,int *index,int state);
void bin_match_rule(char *rule,action_rule_t *newrule,int *index,int state,char end);


#define set_short(ptr,val) ((((U8 *)(ptr))[0] = (((U16)(val)) ) & 0x00ff), \
		            (((U8 *)(ptr))[1] = (((U16 )(val)) >> 8 ) & 0x00ff))

#define set_byte(ptr,val) (((U8 *)(ptr))[0]=(val))