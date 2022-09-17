/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: suffdic.c,v $
 * Revision 1.2.2.2  1994/11/07  22:54:05  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  20:34:27  Krishna_Mangipudi]
 *
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
 * $EndLog$
 */
/*
**++
** FACILITY:  Workstation Multimedia  (WMM)  v1.0 
** 
** FILE NAME:   
** MODULE NAME: 
**
** MODULE DESCRIPTION: 
** 
** DESIGN OVERVIEW: 
** 
**--
*/
/*       GSUFFDIC.C
 *  build the German suffix dictionary 
 */

#include  <stdio.h>
#include  <ctype.h>
#include  <fcntl.h>
#include  <string.h>
#include  <sys/types.h>
#include  <sys/stat.h>
#include  <time.h>
#include  "port.h"
//#include  "defs.h"
//#include  "ls_dict.h"
#include  "dic.h"

 /*
 * general defines ...
 */

#ifdef MSDOS
#define	true	1
#define	false 0
#define	failure 1
#define	success 0


#define _BIGENDIAN_
#ifdef _BIGENDIAN_
unsigned int fix_endian(unsigned int in)
{
	unsigned int temp=0;

	temp|=((in&0x000000ff)<<24);
	temp|=((in&0x0000ff00)<<8);
	temp|=((in&0x00ff0000)>>8);
	temp|=((in&0xff000000)>>24);

	return(temp);
}


#endif
struct	suff_rule
{
  U32  next;
  S32  fc;
  char rule[256];
};

#endif

S32 get_fc();
char *get_dep();


#define	SF_END           0xff    /* End of rule */
#define	SF_STRIP         0xfe    /* Strip type  - */
#define	SF_FC            0xfd    /* Form class tag only  + */
#define	SF_REPLACE       0xfc    /* Start of replacement rule / */
#define	SF_REPLACE_WITH  0xfb    /* Substitute on replacement rule : */
#define	SF_REPLACE_END   0xfa    /* End of substitute rule */
#define	SF_RECURSE       0xf9    /* Retry rules again # */
#define	SF_PHONES        0xf8    /* Start of phonemene field  % */
#define	SF_PHONES_END    0xf7    /* End of phonemene field */

unsigned char	suffix_table[10000];
U32     suffix_index[27];
S32 input_line;
char line[256];

#define	RL	(*rl)
/*
 *  function protos ...
 */

char *squish_white(char *);
error_exit(char *,char *);

main(argc,argv)
int argc;
char *argv[];
{

	FILE *ftab,*fdic;
	char fnam_t[80];
	char fnam_d[80];
	struct	suff_rule	*rl;
    S32     cl,nl,ind;
    S32     i,j,total_bytes; 

/*
 *  check out the input line parameters ...
 */

	if (argc < 2)
		{
		printf("  Usage : suffdic <rulename> <outname>");
		exit(1);
		}

/*
 *  open the build file ...
 */

	strcpy(fnam_t,argv[1]);
	i = strcspn(fnam_t,".");
	strcpy(&fnam_t[i],".tab");
	if ((ftab=fopen(fnam_t,"r")) == NULL)
		{
		printf("  Can't open suffix table : %s",fnam_t);
		exit(1);
		}

	if(argc > 2)
		strcpy(fnam_d,argv[2]);
	else
		strcpy(fnam_d,argv[1]);

	i = strcspn(fnam_d,".");
	strcpy(&fnam_d[i],".c");
	if ((fdic=fopen(fnam_d,"w")) == NULL)
		{
		printf("  Can't open suffix dictionary 'c' file : %s",fnam_d);
		exit(1);
		}

	printf("\nStarting suffix stripper table compile ...\n");
	total_bytes = 0;
	input_line = 0;
	while(fgets(line,sizeof(line),ftab))
	  {
	  input_line += 1;
	  printf("\r  Processing line : %d",input_line);
	  rl = (struct suff_rule *)&suffix_table[total_bytes];

/*
 * all rules strings start with + or -, so treat the rest as comments ...
 */
	  if(line[0] != '+' && line[0] != '-')
	    continue;
/*
 *  first isolate the form class out ...
 */

	  RL.fc = get_fc(line);

#ifdef _BIGENDIAN_
	  RL.fc = fix_endian(RL.fc);

#endif		
/*
 *  copy the suffix string in backwards ...
 */
#ifdef MSDOS
          /* total_bytes += remove_suffix(&RL.rule,&line[0])+6;*/
          total_bytes += remove_suffix(RL.rule,&line[0]);
          total_bytes += sizeof(U32) + sizeof(S32);
#else
          total_bytes += remove_suffix(RL.rule,&line[0]);
          total_bytes += sizeof(U32) + sizeof(S32);
#endif

	  RL.next =	total_bytes;
	  }
	total_bytes += 2;
	RL.next = 0xffff;

/*
 *  init the index list ...
 */

	for(i=0;i<27;i++)
		suffix_index[i] = 0xffff;

/*
 *  now, chain the rules on the list ...
 */

	nl = 0;
	while(nl != 0xffff)
		{
		rl = (struct suff_rule *)&suffix_table[nl];
	   if(RL.rule[0] < 'a' || RL.rule[0] > 'z')
			ind = 26;
		else
		   ind = RL.rule[0] - 'a';
		if((cl=suffix_index[ind]) == 0xffff)
			suffix_index[ind] = nl;
	   else 
			{
                        while(*(S32 *)&suffix_table[cl] != 0xffff)
                                cl = *(S32 *)&suffix_table[cl];
                        *(S32 *)&suffix_table[cl] = nl;
			}
		nl = RL.next;
		RL.next = 0xffff;
		}
#ifdef _BIGENDIAN_

	for (i=0;i<27;i++)
	{
		nl=suffix_index[i];
		while (nl!=0xffff)
		{
			rl=(struct suff_rule *)&suffix_table[nl];
			nl=RL.next;
			RL.next=fix_endian(RL.next);
		}
	}
#endif
/*
 *  write out the file header ...
 */

	fprintf(fdic,"/*");
	fprintf(fdic,"\n *  Suffix stripping rule file.");
	fprintf(fdic,"\n *  Generated from : %s",fnam_t);
	fprintf(fdic,"\n *  Written to file : %s",fnam_d);
#ifdef MSDOS
	_strdate(line); 
	fprintf(fdic,"\n *  Created on : %s ",line);
	_strtime(line);
	fprintf(fdic,"at %s",line);
#endif
	fprintf(fdic,"\n */");

        fprintf(fdic,"\nU32 suffix_index[] = {");
	for(j=0;j<26;j+= i)
		{
		fprintf(fdic,"\n");
		for(i=0;i<5 && i+j<26;i++)
			fprintf(fdic,"  0x%04X,",suffix_index[i+j]);
		}
	fprintf(fdic,"  0x%04X };\n",suffix_index[26]);

	fprintf(fdic,"\nunsigned char suffix_table[] = {");
	for(j=0;j<total_bytes-1;j+= i)
		{
		fprintf(fdic,"\n");
		for(i=0;i<10 && i+j<total_bytes-1;i++)
			fprintf(fdic,"  0x%02X,",suffix_table[i+j]);
		}
	/* GL 10/02/1997  add two 0x00 at the end */
	fprintf(fdic,"  0x%02X,  0x00,  0x00 };\n\n",suffix_table[total_bytes-1]);
	printf("\n  %d total bytes written\n",total_bytes+54);
	fclose(fdic);
	fclose(ftab);
}


/*
 *  get_fc() is used to return the form class of the string in the 
 *  table ...
 */

char *fc_strings[] = {
	"adj", "adv", "art",	"aux", "be", "bev", "conj", "ed",
	"have", "ing", "noun", "pos", "prep", "pron", "subconj",
	"that", "to", "verb", "who", "neg", "inter", "ref", "part",
	"func", "cont", "char","refr", "void", "void", "mark", "cont", "homo" }; 


S32 get_fc(buff)
char *buff;
{
	S32	fc;
	int	i;
	char	*fcs,*cps;

	fc = 0;
	while(buff = strchr(buff,'*'))
	  {
	  buff++;
	  for(i=0;i<32;i++)
	    {
	    cps = buff;
	    fcs = fc_strings[i];
	    while(*fcs != '\0' && *cps == *fcs)
	      {
	      cps++ ; fcs++;
	      }
		 if(*fcs == '\0' && (*cps == ']' || *cps == ' ' || *cps == '\t' || *cps == '\0' || *cps == '\n'))
	      {
	      fc |= (1L<<i);
	      break;
		   }
	    }											  
	  if(i == 32)
			error_exit("Illegal form class specified",buff);
	  }
	return(fc);
}

/*
 * This macro takes an integer offset and 'aligns' it to the strictest
 * alignment required by the target machine.
 * On all current target machines, alignment on double (8 bytes) is sufficient.
 */
#define ALIGN(nbytes) \
((nbytes) + ((sizeof(double) - ((nbytes) % sizeof(double))) % sizeof(double)))

remove_suffix(rp,lp)
char *lp,*rp;
{
	char *sp,*np;
	char am,cm;
	char	ts[25];
	int     i, nbytes;

	np = rp;

/*
 *  search to end of suffix ...
 */

	lp++;
	while(*lp != ' ' && *lp != '\t')
	  lp++;
/*
 *  copy the suffix in backwards ...
 */

	for(sp = lp-1;*sp != '+' && *sp != '-';sp -= 1)
	  *np++ = (*sp) & 0x7f;
/*
 *  if the rule is a simple form class tag, just exit ...
 */

	if(*sp == '-')
		{
		*np++ = SF_STRIP;
/*
 *  if a suffix strip, copy everything else but white space up to
 *  the fc tag ...
 */ 
		while(*lp != '*' && *lp != '\0')
			{
	    	if(*lp == '%')
	      	{
	      	*np++ = SF_PHONES;
				lp += 1;
	      	lp = get_dep(&am,&cm,lp);
	      	*np++ = am;
	      	*np++ = cm;
				while(*lp != ' ' && *lp != '\t')
					*np++ = toph(lp++);
				*np++ = SF_PHONES_END;
	      	}
		 	if(*lp == '/')
				{
				*np++ = SF_REPLACE;
				lp += 1;
				for(i=0;*lp != ':' && *lp != '\0';lp++)
					{
	    			if(*lp == ' ' || *lp == '\t')
						error_exit("No white space allowed in replacement field",lp);
					else
						ts[i++] = *lp;
					}
				if(*lp == '\0')
					error_exit("No replace string start specifier found",lp);
				while(i>0)
					*np++ = ts[--i];
				*np++ = SF_REPLACE_WITH;
				lp += 1;
				while(*lp != ' ' && *lp != '\t' && *lp != '#')
					*np++ = *lp++;
				if(*lp == '#')
					{
					*np++ = SF_REPLACE_END;
					*np++ = SF_RECURSE;
					lp += 1;
					if(*lp != ' ' && *lp != '\t')
						error_exit("Recurse must be end of replace rule",lp);
					}
				else
				  *np++ = SF_REPLACE_END;
	   		}
			lp += 1;
			}
		if(*lp == '\0')
			error_exit("End of line found before form class field",lp);
		}
	else
		*np++ = SF_FC;
	*np++ = SF_END;

	/* now assure proper alignment */
	nbytes = (np - rp);
	while( nbytes < ALIGN(nbytes) ) {
		*np++ = '\0';
		nbytes++;
	}

	return( nbytes );
}


/*
 *  get_dep() isolates a pron dependency field ...
 */

char *pd[] = {"cons","voc","both","voice","sib","obs","td","back","long"}; 

#define	PCONS		0x01			/* Consonant					*/
#define	PVOC		0x02			/* Vowel							*/
#define	PBOTH		0x04			/* Both (like "L", "R")		*/
#define	PVOICE	0x08			/* Voiced						*/
#define	PSIB		0x10			/* Sibalent						*/
#define	POBS		0x20			/* Obstruent					*/
#define	PTD		0x40			/* has t or d sound */
#define PBACK           0x80                    /* back vowel */
#define PLONG           0x100                   /* long vowel */

char *get_dep(am,cm,lp)
char *am,*cm,*lp;
{
	char *pds,*cps;
	int i;

	*am = *cm = 0;
	lp = squish_white(lp);
	if(*lp != '[')
		return(lp);

	do {
		lp += 1;
	   if(*lp == '+' || *lp == '-')
			{
	      for(i=0;i<7;i++)
	      	{
	      	cps = lp+1;
				pds = pd[i];
				while(*pds != '\0' && *cps == *pds)
					{
					cps++ ; pds++;
					}
				if(*pds == '\0')
					{
					*am |= (char)(1<<i);
					if(*lp == '+')
	              *cm |= (char)(1<<i);
	          	break;
		       	}
	        	}
			if(i == 7)
				error_exit("Illegal dependencies specified",lp+1);
			}
		} while(*lp != ']' &&  *lp != '\0');

	if(*lp == '\0')
		error_exit("No dependency terminator",lp);
	return(lp+1);
}

char *squish_white(s)
char *s;
{
	while(*s == ' ' || *s == '\t')
		s++;
	return(s);
}

error_exit(str,bad)
char *str;
char *bad;
{
	int	i;

	printf("\nSuffix compiler error found on line %d",input_line);
	printf("\n  --> %s",str);
	printf("\n  --> %s",line);
	if(bad)
		{
		printf("  --> ");
		for(i=0;&line[i] != bad;i++)
			printf(" ");
		printf("^");
		}
	exit(1);
}

