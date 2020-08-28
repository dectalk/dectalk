/* *******************************************************************************
*						Copyright ©
* Copyright © 2002 Fonix Corporation. All rights reserved.
* Copyright © 2000 Force Computers, Inc., a Solectron Company. All rights reserved.
*
* This software is proprietary to and embodies the confidential
* technology of Fonix Corporation and other parties.
* Possession, use, or copying of this software and media is authorized
* only pursuant to a valid written license from Fonix or an
* authorized sublicensor.
*
* simple encryption/decryption routines.
* COMMENTS	
* Tom Kopec, 13 May 96 
* 001		28Apr97		Licensee changes 
* 002	MGS	02/09/2000	now used for __linux__ and not __osf__ 
* 003  	mfg 09/22/2000	added prototype to support windows CE  
* 004 	CAB	10/16/2000	Changed copyright info
* 005  	mfg 09/22/2000	fixed time.h include to support windows CE versions 
* 006 	mfg 10/25/2000	Temporarly Added _WIN32_WCE_EMULATION to get rid of x86em error
* 007	cab 10/26/2000	Fixed uncomment comment section
* 008   mfg	07/10/2002	Merged into code changes needed for the Mitsubishi CE/SH4 Project
* 009	cab	07/31/2002	Updated copyright info
* 010	cab	08/15/2002	Added comments for fn's
* 011	mfg	10/10/2002	fixed time problem for windows ce
* ********************************************************************************/

/* if the key is meaningless, then the key should be a fairly large prime; */
/* larger than maybe 20000, but small enough to fit in 24 bits. */
#ifndef __osf__
#include <stdio.h>

#ifndef UNDER_CE
#include <time.h>
#else

#ifndef _WIN32_WCE_EMULATION
#if	((UNDER_CE == 300) || (UNDER_CE == 211))
long time(long *); //added prototype to support windows CE mfg 09/22/00
#else
#include <time.h>
#endif
#endif

#endif //UNDER_CE



#define MAXSTR (64) /* the longest DECRYPTED string.. (for safety..) */

extern  void encryptString(const unsigned char *string,unsigned long key,unsigned char *output);
extern  unsigned int decryptString(const unsigned char *input,unsigned long key,unsigned char *string);
extern  void sixencode24(unsigned char *out,unsigned long in);
extern  unsigned int sixdecode24(unsigned long *out,const unsigned char *in);
extern  unsigned long trand(unsigned long in);
extern  unsigned long rot24(unsigned long num,unsigned long rot);
extern  unsigned long unrot24(unsigned long num,unsigned long rot);
extern  unsigned long rot32(unsigned long num,unsigned long rot);

/* ******************************************************************
 *      Function Name: encryptString()
 *
 *      Description:	encrypt the null-terminated string 'string' into a slightly
 *						longer string 'output'. On call, the string 'output' should
 *						be large enough to hold twice the input string + 6 characters.
 *
 *      Arguments:	const unsigned char *string
 *					unsigned long key		
 *					unsigned char *output
 *
 *      Return Value:	void
 *
 *
 *      Comments:
 *
 * *****************************************************************/
void encryptString( const unsigned char *string, unsigned long key, unsigned char *output )
{
	unsigned long ran1;
	unsigned long tmplong;
	unsigned short outat=0; /* placekeeper in the output string.. */
	unsigned short inat=0;  /* same for input string */
	unsigned short done=0;  /* flags end of input string.. */
	unsigned short csum=0;  /* input checksum) */
	unsigned char vpar=0;   /* input vertical parity */
	
	ran1 = trand((long)time(NULL));
	ran1 &= 0xFFFFFF; /* 24 bits, so it fits in a quad of sixels*/  
	sixencode24(output,ran1);
	outat += 4; /* end of step 1. */
			 
	/* get a new random number (step 3) */
	ran1 = trand(ran1);

	/* calculate the check bits (step 2) */
	inat=0;
	while(string[inat] != '\0')
	{	csum += string[inat];
		vpar ^= string[inat++];
	}
	inat=0;
	/* put together the check bits and write them out. */
	tmplong = ((((unsigned long)csum<<8)&0xffff00))
			 | ((unsigned long)vpar&0xff);
	tmplong = tmplong ^ ran1;
	sixencode24(&output[outat],tmplong);
	outat += 4;
#ifndef ACI_LICENSE
	// just use the old algorithm
#else
	ran1 = trand(ran1);	// ACI algorithm
#endif // ACI_LICENSE

	while (!done && (string[inat]!='\0'))
	{	/* generate the new key (step b) */
		key = trand(key);                      
		/* rotate the random number (step c) */
#ifndef ACI_LICENSE
		ran1 = rot32(ran1,key&0xf);         // old algorithm
#else
		ran1 = trand(rot32(ran1,key&0x1f));	// ACI algorithm
#endif //ACI_LICENSE
		/* generate the new key (step d) */
		key = trand(key);
		/* pack into a triplet.. (step a)*/
		{	unsigned short i;
			tmplong=0;       
			for (i=0;i<3;i++)
			{	tmplong >>= 8;
				if (!done)      
				{	tmplong |= ((unsigned long)string[inat++]<<16);
					if (string[inat] == '\0')
					{	done++;
					}
				}
			}   
		}
		/* rotate the triplet (step e)*/
		tmplong = rot24(tmplong,key&0x1f);
		sixencode24(&output[outat],tmplong^ran1); /* step f */
		outat += 4; /* move ahead.. */    
	} /* while still work to do.. */
	/* terminate the output */
	output[outat]='\0';
	
} /* encryptString() */
						

/* ******************************************************************
 *      Function Name: decryptString()
 *
 *      Description:	undo what encryptString does.
 *						returns non-zero if successful, zero if something is wrong.
 *
 *      Arguments:	const unsigned char *input		The key to decryptString
 *					unsigned long key				The key		
 *					unsigned char *string
 *
 *      Return Value:	void
 *
 *
 *      Comments:
 *
 * *****************************************************************/
unsigned int decryptString( const unsigned char *input, unsigned long key, unsigned char *string)
{
	unsigned long ran1;
	unsigned long tmplong;
	unsigned int retval=1;
	unsigned short outat=0,inat=0;
	unsigned short csum=0, csumin;
	unsigned short vpar=0, vparin;

	/* recover the salt.. (step 1) */
	retval = sixdecode24(&ran1, input);
	inat += 4;
	if (!retval)
	{	/* oops.. couldn't read the input ..*/
		return(retval);                     
	}        
		
	/* update the random number.. (step 2)*/
	ran1 = trand(ran1);                     
	/* get the check bits.. */
	retval = sixdecode24(&tmplong,&input[inat]);
	if (!retval)
	{	/* oops.. couldn't read the input ..*/
		return(retval);                     
	}        
	inat += 4;
	/* recover the check info.. */
	tmplong = tmplong ^ ran1;
	csumin = (unsigned short)((unsigned long)tmplong>>8);
	vparin = (unsigned char)(tmplong&0xff); 
#ifndef ACI_LICENSE
	// nothing new
#else
	ran1 = trand(ran1); //ACI algorithm
#endif //ACI_LICENSE

	while (input[inat] != '\0')
	{	key = trand(key);   /* make new key (step b)*/
#ifndef ACI_LICENSE
		ran1 = rot32(ran1,key&0xf); /* new ran1 (step c) */
#else
		ran1 = trand(rot32(ran1,key&0x1f));
#endif //ACI_LICENSE
		key = trand(key);   /* new key (step d) */
		/* get three bytes (step a) */
		retval = sixdecode24(&tmplong,&input[inat]);
		if (!retval)
			return(retval); /* decode error. */
		/* decode it.. */
		tmplong = tmplong ^ ran1;   /* step e */
		/* unrotate it */
		tmplong = unrot24(tmplong,key&0x1f); /* step f */
		/* finally, concatenate it.. */
		{	int i;
			for (i=0;i<3;i++)
			{	string[outat++] = (unsigned char)(tmplong&0xff);
				tmplong >>= 8;
			}
		}                        
		inat+= 4;
	} /* while input. */
	string[outat]='\0';
	/* now, recompute the check bits and make sure the data*/
	/* is good.. */
	inat=0;
	while((string[inat] != '\0') && (inat<MAXSTR))
	{	csum += string[inat];
		vpar ^= string[inat++];
	}
	
	if ((csum == csumin) && (vpar == vparin))
		return(1);
	else
		return(0); /* fail. */
	
} /* decryptString */


/* ******************************************************************
 *      Function Name: sixencode24()
 *
 *      Description:	encode the low 24 bits of the input as four printable ascii characters.
 *
 *      Arguments:	unsigned char *out
 *					unsigned long in
 *
 *      Return Value:	void
 *
 *
 *      Comments:
 *
 * *****************************************************************/						
/* handy routines .. */
 void sixencode24(unsigned char *out, unsigned long in)
 {	
	unsigned short i;
	/* encode low-sixel-first */
	
	for (i=0;i<4;i++)
	{	*out = (unsigned char)(in&0x3f); /* strip out the bits */
		if (*out <0x0a) *out +=0x30;
		else if (*out < 0x27) *out += 0x34;
		else *out += 0x3a;
		out++;  
		in = in >>6;
	}
 }               
 
/* ******************************************************************
 *      Function Name: sixdecode24()
 *
 *      Description:	undo what sixencode24 does.
 *						return zero if bad chars.
 *
 *      Arguments:	unsigned long *out
 *					const unsigned *in
 *
 *      Return Value:	unsigned int
 *
 *
 *      Comments:
 *
 * *****************************************************************/
 unsigned int sixdecode24(unsigned long *out, const unsigned char *in)
 {	
	unsigned long temp=0;
	unsigned short j;
	short i; /* must be signed for the backward loop.. */     
	unsigned int retval=1; /* assume success.. */
	
	for (i=3;(i>=0) && retval;i--)
	{	if ((in[i] > 'z') || (in[i] < '0'))
		{	return(0);
		}
		temp <<= 6;
		if (in[i] > 0x60) j = in[i]-0x3a;
		else if (in[i] > 0x3d) j = in[i]-0x34;
		else if (in[i] > 0x2f) j = in[i]-0x30;
		else return(0);
		temp |= j; 
	}
				 
	*out = temp;
	return(1);
}

/* ******************************************************************
 *      Function Name: trand()
 *
 *      Description:
 *
 *      Arguments:	unsigned long in
 *
 *      Return Value:	unsigned long
 *
 *
 *      Comments:
 *
 * *****************************************************************/						
unsigned long trand(unsigned long in)
{	/* pseudorandom numbers.. */
#ifndef ACI_LICENSE
	in = ((in * 23311L)+1) % 65533U;	// old algorithm
#else
	in = ((in * 43313L)+1);				// ACI algorithm
#endif
	return(in);
}

/* ******************************************************************
 *      Function Name: rot24()
 *
 *      Description:
 *
 *      Arguments:	unsigned long num
 *					unsigned long rot
 *
 *      Return Value:	unsigned long
 *
 *
 *      Comments:
 *
 * *****************************************************************/						
unsigned long rot24(unsigned long num, unsigned long rot)
{	unsigned long temp1, temp2;

	rot = rot%24;
	
	temp1 = (num<<rot)&0xffffff;
	temp2 = ((num&0xffffff)>>(24-rot));
	return(temp1|temp2);
}    

/* ******************************************************************
 *      Function Name: unrot24()
 *
 *      Description:
 *
 *      Arguments:	unsigned long *num
 *					unsigned long rot
 *
 *      Return Value:	unsigned int
 *
 *
 *      Comments:
 *
 * *****************************************************************/						
unsigned long unrot24(unsigned long num, unsigned long rot)
{	unsigned long temp1, temp2;

	rot = rot%24;
	temp1 = ((num&0xffffff)>>rot);
	temp2 = (num<<(24-rot))&0xffffff;
	return(temp1|temp2);
}

/* ******************************************************************
 *      Function Name: rot32()
 *
 *      Description:
 *
 *      Arguments:	unsigned long num
 *					unsigned long rot
 *
 *      Return Value:	unsigned long
 *
 *
 *      Comments:
 *
 * *****************************************************************/						
unsigned long rot32(unsigned long num, unsigned long rot)
{	unsigned long temp1, temp2;

	rot = rot%32;
	temp1 = num<<rot;
	temp2 = num>>(32-rot);
	return(temp1|temp2);
}

#endif //__osf__