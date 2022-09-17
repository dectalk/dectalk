#include <stdio.h>

int main(int argc, char *argv[]) {
	FILE *in;
	unsigned char c;
	int count = 0;

	if (argc != 2) {
		printf("usage: linec [filename.in]\n");
		return 0x7FFF;
	}
	if ((in = fopen(argv[1],"rb")) == 0) {
		printf("Unable to open file [%s] for line counting!\n",argv[1]);
		return 0x7FFF;
	}
	c = fgetc(in);
	while (!feof(in)) {
		if (c == 10)	count++;
		c = fgetc(in);
		if (count == 0x7FFE) {	// We have more lines than we need...
			fclose(in);
			return count;
		}
	}
	fclose(in);
	return count;
}
