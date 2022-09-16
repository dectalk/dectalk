/* linked-list routines.. */


#include <malloc.h>
#include <string.h>
#include <stdio.h> /* for dump.. */
#include "lists.h"

unsigned int init_list(struct list **ppList)

{
/* returns non-zero if successful, zero if not */
	struct list *listptr=NULL;

	/* create a first element, which is null.. */
	listptr = malloc(sizeof(struct list));
	if (listptr == NULL)
		return (0);
	listptr->flink = NULL;
	listptr->blink = NULL;
	listptr->data = NULL;
	*ppList = listptr;
	return (1);

}

void destroy_list(struct list **ppList)
{
	struct list *here=*ppList;
	struct list *prev=NULL;

	while (here != NULL)
	{
		if (here->data != NULL)
		{
			free(here->data);
			here->data = NULL;
		}
		prev = here;
		here = here->flink;
		free(prev);
	}

	*ppList = NULL;

}


unsigned int add_to_list(struct list *pList, char *szIn)
/* allocates space for both the list element and the text */
{
	struct list *listptr=NULL;
	struct list *listelem=0;
	unsigned int uiTxtLen=0;

	uiTxtLen = strlen(szIn)+1;

	/* create a first element, which is null.. */
	listelem = malloc(sizeof(struct list));
	if (listelem == NULL)
		return (0);
	listelem->flink = NULL;
	listelem->blink = NULL;
	listelem->data = malloc(uiTxtLen);
	if (listelem->data == NULL)
	{
		/* failed to allocate the data element.. */
		free(listelem);
		return(0);
	}
	strcpy(listelem->data, szIn);

	/* ok, the element is all set up, now thread it on.. */
	listptr = pList;
	while (listptr->flink != NULL)
	{

		if (strcmp(listptr->flink->data,listelem->data)>0)
			break; /* it goes here */

		listptr = listptr->flink;

	}

	listelem->flink = listptr->flink;
	listelem->blink = listptr;

	listptr->flink = listelem;
	if (listelem->flink != NULL)
		listelem->flink->blink = listelem;
	return (1);

}

unsigned int find_in_list(struct list *listptr, char *szIn)
/* returns nonzero if present, zero if not. */
{
	int iResult = 0;
	while((listptr=listptr->flink) != NULL)
	{
		if ((iResult=strcmp(listptr->data, szIn)) > 0)
			return(0); /* not found. */
		if (iResult==0)
			return(1); /* found. */
	}
	return(0); /* not found. */

}

void fdump_list(FILE *file_fp, struct list *listptr, char *leader)
{
	if (listptr == NULL)
	{
		fprintf(file_fp,"Empty List.\n");
		return;
	}
	while((listptr = listptr->flink) != NULL)
	{
		fprintf(file_fp,"%s%s\n",
			leader, listptr->data);
	}
	return;
}

void dump_list(struct list *listptr)
{
	fdump_list(stdout,listptr,"");
}
