
#define SORTTRIE_NIL         NIL    // same as NULL but sounds better
#define SORTTRIE_EMPTY       0      // empty, silch, nix in it, just the epsilon node
#define SORTTRIE_ENDOFLEX    1      // end of lexeme

#define SORTTRIE_INCOMPLETE  4      // string could be matched but is not a complete Lexeme
#define SORTTRIE_NOCONTINUE  8      // string could only be matched incompletly or not at all.
#define SORTTRIE_NORIGHT     16     // last search went to the right  
#define SORTTRIE_NODOWN      32     // last search went in the downwards direction
#define LONG_MORPH_FIRST 128       // used if multiple morphs match.
#define LONG_MORPH_LAST  256       // used if multiple morphs match.
#define MORPH_ORDER_MASK 384 
//#define CONSTSTRING "const"
//#define MAX_TOKEN_LENGTH 100
#define MAX_SEQUENCE_LENGTH 100
#define SORTTRIE_CHUNK_SIZE 10     
#define SLENDOFLEX 1
#define SLNOEXIT 0

//typedef unsigned char ASCIILETTER;
//typedef int U16;
//#define NIL 0

typedef 
struct  _sort_trie_node
{
    char  letter;           // a single letter to compare against
    unsigned char  info;    // see enum above.
    U16  addinfo;           // (additional information) indicates that there is a phoneme defined
    U16  bigdown;
    U16  down;              // down: alternative node (address of other TrieNode)
    U16  right;             // right: continuation node (address of other TrieNode)
}
SrtNode;

typedef struct string_collection_pool
{
  U16          nstrings;            // number of strings in the pool
  int          buflen;              // size of pool
  ASCIILETTER  *bigbuffer;          // pooled phoneme strings
  U16          *ptarray;            // pointer array
} StringPool;



typedef
struct _address_to_info_list
{
    U16 addr;
    U16 straddr;
    U16 rulenumber;
    struct _address_to_info_list *next;
}
AssociatedInfo;


typedef
struct sorted_letter_tree
{
    U16  size;           // number of nodes allocated.
    U16  nempty;         // number of still free nodes
    U16  increments;     // chunk size for allocation
    U16  last;           // next new node
    U16  current;        // so far that's all the state it has.
    U16  stopcondition;  // to signal why something was found or not.
    U16  searchposition; // signal how far in the search string we are proceeded.
    U16  nnodes;         // number of valid nodes.
    U16  type;
    SrtNode  *Nodes;     // array of nodes
    U16  *downlongarray;   // array of integers for long relative pointers.
    U16  nlongdown;
    StringPool *phonemepool;  // a reference to the global string pool of phonemes.
    AssociatedInfo *assoc_first;
    AssociatedInfo *assoc_last;
} SortTrie;


typedef 
struct _string_and_index
{
    char *word;
    int  indx;
    char *phones;
    U16  rule;
    struct _string_and_index *next;
} 
strindx;

typedef
struct _sequence_array
{
    int nwords;
    strindx **words;
    struct _sequence_array *next;
}
seqarray;

typedef
struct _sequence_set
{
    int n;
    char *name;
    seqarray *first_seq;
    seqarray *last_seq;
}
sequenceset;

typedef 
struct _sortable_word_list
{
    int n;
    strindx *first_word;
    strindx *last_word;
}
swordlist;

// sequenceset *sequencesets[10];



typedef 
struct _sequence_pile
{
    int            nseq;
    int            nmaxseq;
    swordlist      wl;
    sequenceset     **sequencesets;
}
seqpile;


typedef struct _string_dictionary_entry
{
    char *name;
    char *name2;
    int  ident;
    struct  _string_dictionary_entry *next;
}
stdictword;

typedef struct _string_dictionary
{
    int numwords;
    stdictword *first;
    stdictword *last;
}
stdict;

stdict *new_stringdictionary();
int add_new_pair_to_dict(stdict *d, char *name, char *name2, int ident);
char *translate_from_stdict(stdict *d, char *name, int *ident);
char *translate_backwards_from_stdict(stdict *d, char *name, int *ident);
void read_stdict(stdict *d);
void enumerate_dict(stdict *d);

SortTrie *file2extendedsorttrie(const char *filename, const U16 type, StringPool *phonemepool);
void compressed_dump_sorttrie(FILE *fid, SortTrie *Lt, const char *name, StringPool *strpool,  const char *associatedname);
void make_file_header(FILE *outstr, const char *title);
void list_compressed_sorttrie(FILE *fid, SortTrie *Lt, const char *name,  StringPool *strpool,  const char *associatedname);
seqpile *new_seqpile(int n);
