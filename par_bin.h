/* defines for the the binary format */

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


#define get_short(ptr) ((U16)\
                       ((((U8 *)(ptr))[1] << 8)  | \
                        (((U8 *)(ptr))[0])))


#define get_long(ptr) ((U32)\
                       ((((U8 *)(ptr))[3] << 24)  | \
                        (((U8 *)(ptr))[2] << 16)  | \
                        (((U8 *)(ptr))[1] << 8)  | \
                        (((U8 *)(ptr))[0])))

#ifndef DEBUG
#define  par_copy_return_value(dest,src) memcpy(dest,src,sizeof(return_value_t))
#endif

