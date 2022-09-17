#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <memory.h>
#include <string.h>

#define FALSE	0
#define TRUE	1

#define MAX_STORE	50

unsigned char original[MAX_STORE][128];
unsigned char names[MAX_STORE][128];

typedef long BOOL;
typedef unsigned long int U32;

unsigned char namelist[][128] = {
	"bruckert", "lin", "kevinb", "schnee", "leeber", "kopec", "shin", "robinson",
	"gemma", "rgemma", "lazar", "lazare", "hayes", "hayessu", "EOL"
};

unsigned long int GetChecksum(unsigned long int seed, int revcnt) {
	unsigned long int nameSum;
	unsigned long int CommentChecksum;
	BOOL carry;
	int name;
	int cnt;

	CommentChecksum = 0xA55AA55A;

	for (name = 0; name < revcnt; name++) {
		nameSum = 0;
		for (cnt = 0; cnt < (int) strlen((char*) names[name]); cnt++) {
			nameSum += (cnt * (U32) names[name][cnt]) + ((U32) names[name][cnt] << 16);
		}
		carry = ((CommentChecksum & 0x80000000) ? TRUE : FALSE);
		CommentChecksum = ((CommentChecksum << 1) + carry) ^ nameSum;
	}

	/* Seed random number back to original seed */
	srand(seed);

	CommentChecksum = (CommentChecksum << 1) ^ rand();
	return CommentChecksum;
}

int NextName(unsigned char *name) {		// Returns index to next name, -1 on EOL or error
	int i = 0;

	while (strcmp((char*) namelist[i], (char*) name) != 0 && strcmp((char*) namelist[i],"EOL") != 0)		i++;
	if (strcmp((char*) namelist[i],"EOL") == 0)		return -1;
	if (strcmp((char*) namelist[i+1],"EOL") == 0)	return -1;
	return i+1;
}

BOOL RecurseChanges(int level, int maxdepth, U32 seed, U32 Checksum) {
	BOOL ret;
	int newname;

	if (level == maxdepth) {
		if (GetChecksum(seed,maxdepth) == Checksum)		return TRUE;
		return FALSE;
	}
	ret = RecurseChanges(level + 1, maxdepth, seed, Checksum);
	if (ret == TRUE)		return TRUE;
	newname = NextName(names[level]);
	while (newname != -1) {
		strcpy((char*) names[level], (char*) namelist[newname]);
		ret = RecurseChanges(level + 1, maxdepth, seed, Checksum);
		if (ret == TRUE)	return TRUE;
		newname = NextName(names[level]);
	}
	strcpy((char*) names[level], (char*) namelist[0]);
	return FALSE;
}

void FindChanges(unsigned short int revcnt, unsigned long int seed, unsigned long int FileCommentChecksum) {
	int name;

	if (revcnt > MAX_STORE) {
		printf("Revision list too long, increase the MAX_STORE heap\n");
		return;
	}
	memcpy(original, names, MAX_STORE * 128);
	printf("Revision Control System  v1.0  Checksum Comment Recovery System\n");
	printf("---------------------------------------------------------------\n");
	printf("Rebuilding revision control list...\n");

	/* Assign namelist[0] to each element */
	for (name = 0; name < revcnt; name++)	strcpy((char*) names[name], (char*) namelist[0]);

	/* Run recursion test */
	if (RecurseChanges(0, revcnt, seed, FileCommentChecksum) == FALSE) {
		printf("Unable to rebuild revision control list...\n");
		return;
	}
	printf("Revision control list rebuilt.\n\n");
	for (name = 0; name < revcnt; name++) {
		if (strcmp((char*) original[name], (char*) names[name]) == 0)	printf("  [%s] (Original comment)\n",names[name]);
		else															printf("  %s -> %s\n",names[name],original[name]);
	}
	printf("End of revision control list.\n");
	return;
}

void main(int argc, char *argv[]) {
	FILE *in;
	char temp[1024];
	BOOL bInComment = FALSE;
	unsigned long int CommentChecksum;
	unsigned long int seed;
	unsigned long int FileCommentChecksum;
	unsigned short int seedHigh, seedLow;
	unsigned short int checkHigh, checkLow, revs, revcnt = 0;
	int cnt;
	int name, nameCnt;

	CommentChecksum = 0xA55AA55A;

	if (argc != 2) {
		printf("usage: %s [filename]\n",argv[0]);
		return;
	}
	if ((in = fopen(argv[1],"rt")) == NULL) {
		printf("file %s unavailable.\n",argv[1]);
		return;
	}
	name = 0;

	fgets(temp, 1024, in);
	while (!feof(in)) {
		if (memcmp(temp, " * {{END_COMMENT_BLOCK}}",24) == 0)		bInComment = FALSE;
		if (memcmp(temp, " * {{COMMENT_BLOCK ", 19) == 0) {
			bInComment = FALSE;
			sscanf(temp, " * {{COMMENT_BLOCK %04X %04X %04X %04X %04X}}", &seedHigh, &seedLow, &checkHigh, &checkLow, &revs);
			FileCommentChecksum = (checkHigh << 16) + checkLow;
			seed = (seedHigh << 16) + seedLow;
		}
		if (bInComment && memcmp(temp, " * NULL BLOCK", 13) != 0) {
			nameCnt = 0;
			for (cnt = 3; cnt < (int) strlen(temp) && temp[cnt+1] != '-'; cnt++) {
				names[name][nameCnt++] = temp[cnt];
			}
			names[name][nameCnt] = '\0';
			name++;
			revcnt++;
		}
		if (memcmp(temp, " * {{START_COMMENT_BLOCK}}",26) == 0)		bInComment = TRUE;
		fgets(temp, 1024, in);
	}
	fclose(in);

	CommentChecksum = GetChecksum(seed, revcnt);
	revs ^= rand();
	
	if (CommentChecksum != FileCommentChecksum || revcnt != revs) {
		printf("Checksum failure. Comment area modified.\n");
		if (revcnt < revs)		printf(" * Comments deleted.\n");
		else if (revcnt > revs)	printf(" * Comments added.\n");
		else					printf(" * Comments modified.\n");
		printf("Analyzing changes . . .\n");
		FindChanges(revs, seed, FileCommentChecksum);
		return;
	}
	printf("Checksum ok.\n");
	return;
}

/*  Save Algorithm
 *
	CommentChecksum = 0xA55AA55A;
	if (revs == NULL) {
		CFprintf(fp, " * NULL BLOCK\r\n");
	} else {
		revcnt = base.dwReserved / sizeof(RevisionStruct);
		for (rev = 0; rev < revcnt; rev++) {
			CFprintf(fp, " * %s - %s\r\n",revs[rev].name, revs[rev].reason);
			nameSum = 0;
			for (cnt = 0; cnt < strlen((char*)revs[rev].name); cnt++) {
				nameSum += (cnt * (U32) revs[rev].name[cnt]) + ((U32) revs[rev].name[cnt] << 16);
			}
			carry = ((CommentChecksum & 0x80000000) ? TRUE : FALSE);
			CommentChecksum = ((CommentChecksum << 1) + carry) ^ nameSum;
		}
	}
	CommentChecksum = (CommentChecksum << 1) ^ rand();
	revcnt ^= rand();
 *
 */
