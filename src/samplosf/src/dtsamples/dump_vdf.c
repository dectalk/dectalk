#include <ctype.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>


#define VOICE_SIZE (31*2)

//0x01, 0x00, 0x03, 0x00, 0x64, 0x00, 0x7A, 0x00, 0x64, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0xE4, 0x0C, 0x04, 0x01, 0x42, 0x0E, 0x4A, 0x01
unsigned char paul[] = { 0x00, 0x64, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0xE4, 0x0C, 0x04, 0x01, 0x42, 0x0E, 0x4A, 0x01 };
#define PAUL_OFFSET 7
//40, 0, 0, 100
unsigned char betty[] = { 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00 };
#define BETTY_OFFSET 12

void zap_or_value(FILE *out, char *zapname, int zapval, char *desc, int value)
{
	if (value == zapval) {
		fprintf(out, "\t%s%s", zapname, desc);
	} else {
		fprintf(out, "\t%d%s", value, desc);
	}
}

void print_voice(char *name, unsigned short *voice, int zapf, int zapb, FILE *out)
{
	unsigned short *param = voice;
	char n[128] = { 0 };
	char *pname, *pn;

	fprintf(out, "const short %s[SPDEF] =\n", name);
	fprintf(out, "{\n");
	fprintf(out, "\t%s,\t\t\t\t/* SEX */\n", (*param == 0?"FEMALE":"MALE")); param++;
	fprintf(out, "\t%d,\t\t\t\t/* SM (smoothness in %%, actually spectral tilt offset) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* AS (assertiveness, degree of final f0 fall in %% */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* AP (Average pitch in Hz) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* PR (pitch range in percent of Paul's range) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* BR (breathiness in dB) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* RI (Richness in %%, actually nopen is 100-RI %% of T0) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* NF (additional fixed number of samples in nopen) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* LA (laryngealization, in percent) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* HS (head size, in percent relative to normal for SEX) */\n", *param); param++;
	zap_or_value(out, "ZAPF", zapf, ",\t\t\t\t/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */\n", *param); param++;
	zap_or_value(out, "ZAPB", zapb, ",\t\t\t\t/* B4 (bandwidth in Hz of cascade 4th formant) */\n", *param); param++;
	zap_or_value(out, "ZAPF", zapf, ",\t\t\t\t/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */\n", *param); param++;
	zap_or_value(out, "ZAPB", zapb, ",\t\t\t\t/* B5 (bandwidth in Hz of cascaded 5th formant) */\n", *param); param++;
	zap_or_value(out, "ZAPF", zapf, ",\t\t\t\t/* F7 (frequency in Hz of parallel 4th formant = F7) */\n", *param); param++;
	zap_or_value(out, "ZAPF", zapf, ",\t\t\t\t/* F8 (frequency in Hz of parallel 5th formant = F8) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* GF (gain of frication source in dB) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* GH (gain of aspiration source in dB) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* GV (gain of voicing source in dB ) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* GN (gain of input to cascade nasal pole pair in dB) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* G1 (gain of input to cascade 5th formant in dB) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* G2 (gain of input to cascade 4th formant in dB) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* G3 (gain of input to cascade 3rd formant in dB) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* G4 (gain of input to cascade 2nd formant in dB) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* LO (Loudness, gain input to cascade 1st formant in dB) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* FT (f0-dependent spectral tilt in %% of max) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* BF (baseline f0 fall in Hz) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* LX (lax folds adjacent to voiceless sound -> breathiness) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* QU (quickness of larynx gestures in %% of max quickness) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* HR (hat-pattern fundamental frequency rise in Hz) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* SR (height of max stress-rise impulse of f0 in Hz) */\n", *param); param++;
	fprintf(out, "\t%d,\t\t\t\t/* AGO */\n", 0);
	fprintf(out, "\t%d,\t\t\t\t/* agvo */\n", 0);
	fprintf(out, "\t%d,\t\t\t\t/* aguo */\n", 0);
	fprintf(out, "\t%d,\t\t\t\t/* unvow */\n", 0);
	fprintf(out, "\t%d,\t\t\t\t/* chink area */\n", 0);
	fprintf(out, "\t%d,\t\t\t\t/* open quotient*/\n", 0);
	fprintf(out, "#ifndef FP_VTM\n");
	fprintf(out, "\t%d,\t\t\t\t/* Output gain multiplier  */\n", -1);
	fprintf(out, "#endif\n");

	pn = n;
	pname = name;
	while (*pname != '\0') {
		*pn = toupper(*pname);
		pn++;
		pname++;
	}
	
	fprintf(out, "}; /* %s */\n\n", n);
}

int main(int argc, char **argv)
{
	int fd;
	FILE *out = stdout;
	struct stat statbuf;
	unsigned char *dt;
	unsigned char *needle;
	unsigned char *paul1 = NULL;
	unsigned char *paul2 = NULL;
	unsigned short *voices = NULL;
	int voice_length;
	int voice_num = 18;
	int zapf = -1;
	int zapb = -1;
	int i,j;

	if (argc != 2) {
		fprintf(stderr, "Syntax: %s dectalk_binary\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	fd = open(argv[1], O_RDONLY);
	if (fd == -1) {
		perror("Can't open input file");
		exit(EXIT_FAILURE);
	}

	fprintf(stderr,"opened %s\n", argv[1]);

	if (fstat(fd, &statbuf) == -1) {
		perror("Can't stat input file");
		exit(EXIT_FAILURE);
	}

	dt = mmap(NULL, statbuf.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
	if (dt == MAP_FAILED) {
		perror("Can't mmap input file");
		exit(EXIT_FAILURE);
	}

	fprintf(stderr,"Mapped %zd bytes\n", statbuf.st_size);

	needle = dt;
	while (needle < dt + statbuf.st_size - VOICE_SIZE + PAUL_OFFSET) {
		if (!memcmp(needle, paul, sizeof(paul))) {
			fprintf(stderr,"Found paul at: 0x%08lx\n", needle-dt);
			if (paul1 == NULL) {
				paul1 = needle;
			} else if (paul2 == NULL) {
				paul2 = needle;

				fprintf(stderr,"Difference: %ld\n", paul2-paul1);
				if ((paul2-paul1) < VOICE_SIZE * 9) {
					fprintf(stderr,"Does not fit all voices!\n");
				} else if ((paul2-paul1) > VOICE_SIZE * 16) {
					fprintf(stderr,"Too far apart!\n");
				} else if ((paul2-paul1)%9) {
					fprintf(stderr,"Difference not divisible by 9!\n");
				} else {
					voices = (unsigned short*)(paul1 - PAUL_OFFSET);
					voice_length = (paul2-paul1)/9;
					/* sanity check */
					if (!memcmp(paul1 - PAUL_OFFSET + voice_length + BETTY_OFFSET, betty, sizeof(betty))) {
						break;
					} else {
						fprintf(stderr, "betty not at expected location, ignoring this paul!\n");
						voices = NULL;
					}
				}
				paul1 = paul2;
				paul2 = NULL;
				// find start of betty for length!
			}
		}
		needle++;
	}

	if (voices == NULL && paul1 != NULL) {
		fprintf(stderr,"only one paul found, let's see if betty is around\n");
		for (i = BETTY_OFFSET; i < VOICE_SIZE+BETTY_OFFSET; i++) {
			if (!memcmp(paul1-PAUL_OFFSET+VOICE_SIZE+i, betty, sizeof(betty))) {
				fprintf(stderr,"found betty at offset %d\n", i-(BETTY_OFFSET));
				voices = (unsigned short*)(paul1 - PAUL_OFFSET);
				voice_length = VOICE_SIZE+i-BETTY_OFFSET;
				voice_num /= 2;
				break;
			}
		}
	}

	if (voices == NULL) {
		fprintf(stderr, "Can't find voice definition in binary!\n");
		exit(EXIT_FAILURE);
	}

	fprintf(stderr,"number of voices: %d, bytes per voice: %d\n", voice_num, voice_length);
	
	for (j = 0; j < voice_num; j++) {
		for (i = 0; i < VOICE_SIZE/2; i++) {
			if ((zapf < 2500) &&
			    ((voices[(j*(voice_length/2))+i] == 2500) ||
			     (voices[(j*(voice_length/2))+i] == 2048))) {
				zapf = 2500;
				zapb = 2048;
			} else if ((zapf < 6000) && (voices[(j*(voice_length/2))+i] == 6000)) {
				zapf = 6000;
				zapb = 6000;
			}
			fprintf(stderr,"%u, ", voices[(j*(voice_length/2))+i]);
		}
		fprintf(stderr,"\n\n");
	}

	fprintf(stderr, "ZAPF: %d\n", zapf);
	fprintf(stderr, "ZAPB: %d\n", zapb);

	fprintf(out, "/*\n * Extracted from: %s\n */\n", argv[1]);

	print_voice("paul_8", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("betty_8", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("harry_8", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("frank_8", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("kit_8", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("ursula_8", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("rita_8", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("wendy_8", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("dennis_8", voices, zapf, zapb, out); voices += (voice_length/2);

	if (voice_num == 9) {
		voices = (unsigned short*)(paul1 - PAUL_OFFSET);
	}

	print_voice("paul", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("betty", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("harry", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("frank", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("kit", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("ursula", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("rita", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("wendy", voices, zapf, zapb, out); voices += (voice_length/2);
	print_voice("dennis", voices, zapf, zapb, out); voices += (voice_length/2);

	exit(EXIT_SUCCESS);
}
