/* defs for the list routines.. */

/* each list element carries pointer to the previous and */
/* next elements, and a pointer to data.*/
struct list {
	struct list *flink;
	struct list *blink;
	char *data;
};


unsigned int init_list(struct list **ppList);
/* returns non-zero if successful, zero if not */

void destroy_list(struct list **ppList);

unsigned int add_to_list(struct list *pList, char *szIn);
/* allocates space for both the list element and the text */

unsigned int find_in_list(struct list *pList, char *szIn);
/* returns nonzero if present, zero if not. */

void dump_list(struct list *pList);
void fdump_list(FILE *file_fp,struct list *pList, char *leader);
