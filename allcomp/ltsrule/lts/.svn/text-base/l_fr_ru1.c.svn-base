/*
***********************************************************************
*                                                                      
*                           Copyright ©                              
*    Copyright © 2000-2001 Force Computers Inc.,a ASolectron company. All rights reserved.
*    © Digital Equipment Corporation 1996, 1997. All rights reserved.        
*
*    Restricted Rights: Use, duplication, or disclosure by the U.S.    
*    Government is subject to restrictions as set forth in subparagraph
*    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
*    52.227-14 Alt. III, as applicable.                                
*                                                                      
*    This software is proprietary to and embodies the confidential     
*    technology of Force Computers Incorporated and other parties.    
*    Possession, use, or copying of this software and media is authorized
*    only pursuant to a valid written license from Force or an        
*    authorized sublicensor.                                            
*                                                                       
*********************************************************************** 
*    File Name:	l_fr_ru1.c
*    Author:                                   
*    Creation Date:
*                                                                             
*    Functionality:                                                           
*    Language dependent LTS Rule code                                                                             
*                                                                             
***********************************************************************       
*                                                                             
* Rev	Who		Date			Description                    
* ---	-----	-----------		---------------------------------------
*	-From old fmodlre.c-
* 001	Michel	../06/80  		Pascal version, Inrs-Montreal, Canada, summer 1980
* 002	Michel	../07/83 		Cit-alcatel-lannion, france, 1983-84
* 003	Michel	../07/85 		C version Dec-Maynard, USA summer 1985
* 004	Michel	../07/87 	 	Modification Dec-Reading, England
* 005	Michel	../01/88 		Modification Cit end 1987-beginning 88, transfert on PC
* 006	Michel	../01/89 		Modification of the memorisation of the classes
*                 				(add type M : full word)
* 007	Michel	15/10/92 		Add 2 parameters in ElementArbre : Nd and LH
*                 				according to the compiler modifications (memorisation
*                 				of classes and CtG in different arrays)
*                 				Declaration of NdCl and LHCl
* 008	Michel	05/11/92 		Reorganise the module : add Init_NbF
* 009	Michel	11/11/92 		Add TypTamp
* 010	Michel	19/02/93 		Add the function Traduire
* 011	Michel	10/10/94 		Insert this module in French Dectalk :
*                 				- add #include and MOINS1C
*                 				- TypTamp Tamp static now
*                 				- PhonT becomes PhonTS in TypTamp (PhonT is the phoneme T)
* 012	CJL		20/06/95     	Add automatic proto file include to flsdef.h
* 013	Michel	07/08/95 		Comment in English
* 014	Michel	12/10/95 		Pb with upper and lower cases
* -End of revisions from old fmodlre.c-
* 001	CHJ	07/20/2000			Renamed to l_fr_ru1.c and changed so it works with the new code.
* 002	CHJ	08/17/2000			Convert special characters to their old equivalents to trick French LTS into working better
*								This needs to be removed when the rules are recompiled.
* 003	CHJ 08/23/2000			Fixed liaison.
* 004 	CAB	01/15/2001			Merged Michel Divay changes to French
* 005 	CAB	03/21/2001			Changes per Michel
*/
#include "ls_def.h"
#include "ls_rule.h"

/* constants */
#define TRUE	1
#define FALSE	0
#define EOS	0               /* End Of String */
#define SHORT	unsigned short  /* de 0 a 65535 */
#define BYTE	unsigned char  /* de 0 a 255 */
#define FLAG	short          /* Booléen */

void Finir_Trad (TypTamp *Tampon);
static void ElementArbre (PLTS_T pLts_t, short PtND, const U8 *Nd, const U16 *LH, BYTE *PremPhon, short Inc,
						  FLAG SauvCPC, short *LgECl, short *RepND);
static void Element_ClMot (PLTS_T pLts_t, short PtChCl, BYTE *PremPhon, short Inc, short *LgECl);
static FLAG PartieGauche (PLTS_T pLts_t, TypTamp *Tampon, short PtAid, short *LgPG,  short *RepND);
static short VCG (PLTS_T pLts_t, TypTamp *Tampon, short PtInst);
static short VCD (PLTS_T pLts_t, TypTamp *Tampon, short PtInst, short LgPG);
void Execute_Bloc (PLTS_T pLts_t, TypTamp *Tampon, short NumBloc, short CG);
void Traduire_Cont (PLTS_T pLts_t, char *ChCtG, char *Entree, char *ChCtD, char *Resultat, char *NBloc, short Format,
					short LgPhon, short CG);
void Traduire (PLTS_T pLts_t, char *Entree, char *Resultat, char *NBloc, short Format,
			   short LgPhon, short CG);
TypTamp*  Init_Trad (PLTS_T pLts_t, char *Entree, short LgPhon);

extern unsigned char code_page_table[]; /* chj 8/17/00 used to convert special characters to old equivalents */

/* In regles.c */
/* codes */
extern  short 	PtCar;
extern	short	PgCar;
extern  short NC;
extern	const U16	IndAlph [];
extern  const U8	TCod [];
extern  const U16	InvAlph [];


extern int NbTabCl;

/* classes */
extern   const U8	TTUC [];       /* for classe of type 1 */
extern   const U8	TypClas [];    /* 1, 2, 3, 4, 5 */
extern   const U16	DebClasse [];  /* Beginning of class depending on type */
extern   const U8   ChCl [];       /* strings of word of classes */
extern   const U8	NdCl [];       /* characters for class d or g */
extern   const U16	LHCl [];       /* pointor for another alternative */

/* instructions */
extern   const U8	ChPD [];     /* characters for right strings */

extern	 const U16	PrtDrte [];  /* right part of the rule */
extern	 const short	ContG [];    /* left context of the rule */
extern	 const short	ContD [];    /* right context of the rule */

extern   const U8	FinCont [];  /* end of a part of a context (1 : true) */
extern   const U8	ClOuCh [];   /* string:0, class:1 */
extern   const short	EnsOuCh [];  /* index for class or for a string */


extern   const U8	Nd []; 	     /* characters for left strings */
extern   const U16	LH [];       /* pointor for an alternative of left string */

extern   const U16	SNd [];      /* list of rule with same left string */
extern   const U16	SLH [];      /* rule number */
extern   const signed char	CtG [];      /* grammatical category of left string or -1 */
/* was BYTE : Pb with turboc2 and -1 or 255 */

/* array indicating by bloc and by char., the beginning of left string */
extern   const U16	Aid [];
extern   short	NbTabBasePG; /* first free in TabBasePG */
extern   const U16	TabBasePG []; /* index on Aid of beginning of rule bloc */

#ifdef DEBG
extern long Num [];
#endif
extern short NbInst;

/* Local constants and variables in that module */

//BYTE F_CodBl;

/* left string shorter than the current one */
#define	LgPile	30
//short PilSauv [LgPile];
//short PtPilSauv;  	/* first free in PilSauv */
/*
TypTamp Tamp;
BYTE Ph1 [100];
BYTE Ph2 [100];
*/

/*
*	Function Name:
*		ls_rule_lts	
*
*	Description:      
* 	This is the main driving routine
* 	for Tony's letter to sound. It is called
* 	by "ls1d.c" with two pointers; these bracket the
* 	text to be spoken. This routine makes a private copy
* 	of the text, with the ASCII characters converted to
* 	G-codes and the index lists. The index lists are
* 	kept in normal order. A private array is
* 	used, so that the caller does not have to deal
* 	with the fact that the word might expand, and walk
* 	over the right punctuation.
*
*	Arguments:            
*	LPTTS_HANDLE_T phTTS
*	LETTER *lp2 	The left bounding ppinter to the word
*	LETTER *lp1		The right bounding pointer to the word
*   FLAG ContD	boolean : right word context is or not in nword (ex: "tous les")
*   pLts_t->precedent contains the preceding word in ascii
*	Return Value:
*		None
*
*	Comments:
*
*/
void ls_rule_lts(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp, FLAG ContD) 
{
	unsigned char precednor [80];
	unsigned char phrase    [80];
	unsigned char phrasenor [80];
	unsigned char suivant   [80];
	unsigned char phon      [80];
	unsigned char *lph;
	LETTER *ls1;
	LETTER *lste;
	PLTS_T pLts_t = phTTS->pLTSThreadData;
	lste = ls1 = llp;
	
	
	lph = phrase;
	while (ls1<rlp) 
	{
		*lph = (unsigned char)ls1->l_ch;
		lph++;
		ls1++;
	}
	*lph = EOS;
	
  //printf ("l_fr_ru1.c lts début pLts_t->precedent=%s\n", pLts_t->precedent);

#ifdef FRENCH_DEBUG
    if (DbgNum) 
		printf ("ls4.c lts début precedent=%s\n", precedent);
#endif
	
	if (ContD) 
	{
		ls1 = pLts_t->nword;
		lph = suivant;
		while ( (*lph++ = (unsigned char)ls1->l_ch) != EOS ) 
			ls1++;
	} 
    else 
	{
		strcpy (suivant, "");
	}
	
	/*  Apply bloc 4 (normalization) for the word precedent
        Result in precednor 
    */
	Traduire_Cont (pLts_t, "", pLts_t->precedent, "", precednor, "\004", 1, 100, -1);
	
	/* Apply bloc 4 (normalization) for phrase
       Result in prhrasenor 
    */
	Traduire_Cont (pLts_t, "", phrase   , "", phrasenor, "\004", 1, 100, -1);
	
	/* Left and right contexts are used only for block \001 */
    //printf ("l_fr_ru1.c lts début *%s[%s]%s*\n", precednor,phrasenor,suivant);
	Traduire_Cont (pLts_t, precednor, phrasenor, suivant, phon, "\001\002\003", 2, 100, -1);
	
	strcpy(pLts_t->precedent, phrase); /* for next word, maybe needed or replaced by empty */
	
#ifdef FRENCH_DEBUG
    if (DbgNum) 
		printf ("ls4.c lts sortie precedent=%s\n", precedent);
#endif
	
	lph=phon;
	while (*lph != EOS) 
	{ 
		ls_util_send_phone (phTTS, *lph); 
		lph++; 
	}
	
} /* lts */

/* Return the bit number i of ent (bit order : 0,1, ..., 7) */
static short ChaBit (unsigned short ent, short i)
{
	if( (i<0) || (i>7) ) 
	{
#ifdef FRENCH_DEBUG
		printf ("Error ChaBit i =  %d\n", i);
#endif
		return (0);
	} 
	else 
	{
		return ( (ent >> (7-i) ) & 0x01 );
	}
} /* ChaBit */


/*
  Return bit i from Tab array
  BYTE *Tab;   byte array used as boolean arrays
  short  i;    Boolean looked for
*/
static short ChargEB (const U8 *Tab, short i)
{
	short octet;       /* byte containing bit i */
	short quotient;    /* number in the array of the byte containing bit i */
	short resu;        /* bit i of Tab, first is 0 */
	
					   /* if (DbgFin) 
	printf ("entrée ChargEB i = %d\n",i); */
	
	quotient = i >> 3; /* i / 8 */
	i= i & 0x7;        /* modulo 8 */
	octet = Tab [quotient];
	resu  = ChaBit (octet, i); /* resu = bit i */
	
							   /* if (DbgFin) 
	printf ("ChargEB sortie  octet = %d, resu = %d\n", octet, resu); */
	
	return (resu);
}  /* ChargEB */



/* CODING MODULE */

/*
CompCh compares the N car. of Buf1 from index PtBuf1
with the car. of Buf2. starting from index PtBuf2.
PtMax is the index limit in Buf2.
Egal : true if string are equal
*/
//BYTE	*Buf1;
//short	PtBuf1;
//BYTE	*Buf2;
//short	PtBuf2;
//short	N;
//short	PtMax;
static short CompCh (const U8 *Buf1, short PtBuf1, const U8 *Buf2, short PtBuf2, short N, short PtMax)
{
	short	i;
	FLAG	Egal;
	
	Egal = TRUE;
	i = 0;
	while ( (i<N) && Egal) 
	{
		if ( (PtBuf2+i) <= PtMax ) 
		{
			
#ifdef FRENCH_DEBUG
			if (DbgCod && DbgFin)
				printf ("CompCh i = %d, c1= %c, c2 =  %c\N",
                i, Buf1 [PtBuf1+i], Buf2 [PtBuf2+i]);
#endif
			
			Egal = (Buf1 [PtBuf1+i]==Buf2 [PtBuf2+i]);
			i = i+1;
		} 
		else 
		{
			Egal = FALSE;
		}
	} /* while */
	
	return (Egal);
	
} /* CompCh */


/*
  Coder  Chaine [DebCh1..PtChain] in ChainC [DebCh2..PtChainC]
  PtChainC : output parameter
  Handles conversion from normal ascii input to michel's internal code.
*/
void Coder (BYTE *Chaine, short DebCh1, short PtChain, BYTE *ChainC, short DebCh2, short *PtChainC)
//BYTE	*Chaine;        /* String to code */
//short	DebCh1;         /* index of first char. to code in Chaine */
//short	PtChain;        /* index of last char. */
//BYTE	*ChainC;        /* output string */
//short	DebCh2;         /* index for first output char. */
//short	*PtChainC;      /* index of last output char. */
{
	
	short	i;
	short L;
	short	car; 	   /* car = Chaine [i] */
	short	PtTCod;    /* index on TCod */
	short	NbElt;     /* nb element beginning by the same car. */
	short	N;         /* length of the current string */
	short	IndChainC; /* first free in ChainC */
	FLAG	Trouve;    /* Found equality between Chaine [i..] et TCod [..] */
	
#ifdef FRENCH_DEBUG
    if (DbgCod) 
	{
		printf ("Coder entrée  Chaine : DebCh1 = %d, PtChain = %d, DebCh2 = %d\n",
			DebCh1, PtChain, DebCh2);
		for (i=DebCh1; i<PtChain; i++) 
			printf ("%c", Chaine [i]);
		printf ("\n");
    }
#endif
	
	if ( (PtChain<0) || (PtChain<DebCh1) ) 
	{
#ifdef FRENCH_DEBUG
		Erreur (7);
#endif
	}
	
	i = DebCh1;
	IndChainC = DebCh2;
	
	while (i<=PtChain) 
	{
		car = Chaine [i];
		PtTCod = IndAlph [car-PtCar];
		
#ifdef FRENCH_DEBUG
		if (DbgCod && DbgFin)
			printf ("  Coder car =  %c ou %d,  PtTCod =  %d,  car-PtCar =  %d\n",
			car, car, PtTCod, car-PtCar);
#endif
		
		if (PtTCod == 0 || car<PtCar || car>PgCar) 
		{
#ifdef FRENCH_DEBUG
			Erreur (2);
#endif
			i = i+1;
		} 
		else 
		{
			NbElt = TCod [PtTCod]; /* nb of elements beginning by this car. */
			PtTCod++;
			L = 1;
			Trouve = FALSE;
			
			while ( (L<=NbElt) && !Trouve) 
			{
				N = TCod [PtTCod++]; /* length of the current code */
				
#ifdef FRENCH_DEBUG
				if (DbgCod && DbgFin)
					printf ("  Coder NbElt = %d, N = %d, L = %d, PtTCod = %d\n",
					NbElt, N, L, PtTCod);
#endif
				
				if ( CompCh (TCod, PtTCod, Chaine, i, N, PtChain) ) 
				{
					Trouve = TRUE;
					
#ifdef FRENCH_DEBUG
					if (DbgCod && DbgFin)
						printf ("  Coder TCod [PtTCod+N] = %d, IndChainC = %d\N",
						TCod [PtTCod+N], IndChainC);
#endif
					
					ChainC [IndChainC] = TCod [PtTCod+N];
					
#ifdef FRENCH_DEBUG
					if (DbgCod && DbgFin) 
					{
						printf ("  Coder ChainC [IndChainC] = %d\N", ChainC [IndChainC]);
					}
#endif
					
					i = i+N;
					IndChainC++;
				} 
				else 
				{   /* not equal, test the next element */
					PtTCod += N+1;
					L++;
				}
			} /* while */
			
			if (!Trouve) 
			{
#ifdef FRENCH_DEBUG
				Erreur (5);
#endif
				
				i++;
			}
			
		} /* if */
		
	} /* while */
	
	if ( (IndChainC<=0) || (IndChainC<=DebCh2) ) 
	{
#ifdef FRENCH_DEBUG
		Erreur (6);
#endif
	}
	
	*PtChainC = --IndChainC;
	
#ifdef FRENCH_DEBUG
    if (DbgCod) 
	{
		printf ("Coder sortie  ChainC : DebCh2 = %d, IndChainC = %d\n",
			DebCh2, IndChainC);
		for (i=DebCh2; i<=IndChainC; i++) 
			printf ("%3x", ChainC [i]);
		printf ("\n\n");
    }
#endif
	
} /* Coder */

 /* chj 8/21/2000 this is what i believe is michel's internal code for characters (with the current rule tables),
  * which can be found in places such as Tampon->Phon after the Init_Trad_Cont call. the numbers here are in hex:
  *	63=space
  *	6c=à	6d=á	6e=â	70=é	71=è	72=ê	73=ë
  *	74=î	75=ï	76=ó	78=ú	79=û	7b=a	7c=e
  *	7d=i	7e=o	7f=u	80=y	81=ç	82=b	83=c
  *	84=d	85=f	86=g	87=h	88=j	89=k	8a=l
  *	8b=m	8c=n	8e=p	8f=q	90=r	91=s	92=t
  *	93=v	94=w	95=x	96=z
  */
#if 0  
 /*
  Return a pointor on the decoded string (external code) of char c
  FLAG souligne;  TRue : space is written as underlined
  */
char *Decod_Un_Car (BYTE c, FLAG souligne)
{
	  short	PtTCod;    /* points on TCod */
	  short	LgC;       /* code length */
	  short	k;         /* index on TCod */
	  short	j;         /* index on ch */
#define LgMaxCod 10
	  static char ch [LgMaxCod]; /* decoded string; could also be done with malloc */
	  
#ifdef FRENCH_DEBUG
	  if ( (c<0) || (c>NC) ) 
	  {
		  printf ("Decod_Un_Car  character to decode 0x%x unknown\n", c);
	  }
#endif
	  
	  j = 0;
	  PtTCod = InvAlph [c];
	  LgC = TCod [PtTCod];
	  
	  for (k=PtTCod+1; k<=PtTCod+LgC; k++) 
	  {
		  if (j>=LgMaxCod) 
		  {
#ifdef FRENCH_DEBUG
			  printf ("Decod_Un_Car  phoneme length 0x%4x > %d \n", c, LgMaxCod);
#endif
			  j = 0;
		  }
		  if ( souligne && TCod [k] == ' ' ) ch [j++] = '_'; else ch [j++] = TCod [k];
	  }
	  ch [j] = EOS;
	  return (&ch [0]);
  } /* Decod_Un_Car */
#endif
  
  /*
	Decode the input char of entrée [0..NbEntree] into Sortie [0..NbSortie].
	MaxCar is the maximum size of entrée et Sortie.
  */
void Decoder_Chaine (BYTE *Entree, short Premier, short Dernier,
	  BYTE *Sortie, short *NbSortie, short MaxCar)
{
	  short	PtTCod, k;  /* index on TCod */
	  short	i;          /* index on Entree */
	  short	LgC;        /* length of the code */
	  short	j;          /* index on Sortie */
	  
#ifdef FRENCH_DEBUG
	  if (DbgCod) 
	  {
		  printf ("Decoder_Chaine  Premier %d, Dernier %d, MaxCar %d\n",
			  Premier, Dernier, MaxCar);
	  }
#endif
	  j = 0;
	  
	  for (i=Premier; i<=Dernier; i++) 
	  {
		  PtTCod = InvAlph [ Entree [i] ];
		  LgC = TCod [PtTCod];
		  
		  for (k=PtTCod+1; k<=PtTCod+LgC; k++) 
		  {
			  if (j>=MaxCar) 
			  {
#ifdef FRENCH_DEBUG
				  printf ("%c ", Entree [i]); 
				  Erreur (4);
#endif
				  j = 0;
			  }
			  Sortie [j++] = TCod [k];
		  } /* for */
		  
	  } /* for */
	  
	  *NbSortie = --j;
	  
#ifdef FRENCH_DEBUG
	  if (DbgCod) 
		  printf ("Decoder_Chaine  *NbSortie %d\n", *NbSortie);
#endif
	  
} /* Decoder_Chaine */
  
  
  
/* CLASS MODULE */
  
/* Is car a member of the class NumClas memorized as boolean */
static void Element_TTUC (short NumClas, BYTE car, short *LgECl)
{
	  *LgECl = -1;
	  if ( ChargEB (TTUC, (short)(DebClasse [NumClas]+car)) ) 
		  *LgECl = 1;
} /* Element_TTUC */
  
  
/*
	Search for the longuest match between
    - the tree beginning at the PtND element of Nd-LH
    - and the string beginning at element PremPhon.
	
	  Inc : increment ( +1 or -1)
	  SauvCPC : save the shortest strings into PilSauv
	  
		output :
		LgECl = length of the found element or -1 if none found
		RepND = pointor on * of the current element in Nd-LH
*/
static void ElementArbre (PLTS_T pLts_t, short PtND, const U8 *Nd, const U16 *LH, BYTE *PremPhon, short Inc,
	  FLAG SauvCPC, short *LgECl, short *RepND)
{
#define NIL	 0
#define ETOIL  0xFF
	  
	  FLAG	Trouve;    /* Trouve "longuest match" */
	  FLAG	VoirPC;    /* fail, see shortest strings in the stack */
	  short	j;         /* nb de car. equal */
	  short	k1;        /* index on Nd for the search of ETOIL */
	  BYTE 	*L;        /* index on Phon */
	  short	/*static*/	Pile [LgPile]; /* shortest strings */
	  short	PtPile;    /* first free in the stack */
	  
	  L = PremPhon;
	  
#ifdef FRENCH_DEBUG
	  if (DbgClas) 
	  {
		  printf ("ElementArbre  entrée PtND = %d, *L = %d, Inc = %d, SauvCPC = %d\n",
			  PtND, *L, Inc, SauvCPC);
	  }
#endif
	  
	  PtPile = 0;
	  j = 0;
	  Trouve = FALSE;
	  VoirPC = FALSE;
	  
	  while (!Trouve && !VoirPC) 
	  {
		  
		  if (Nd [PtND] == ETOIL) 
		  { /* end of a string in Nd */
			  if (LH [PtND] == NIL) 
			  { /* no alternative, Trouve "longuest match" */
				  *LgECl = j;
				  *RepND = PtND;  /* the end of the string */
				  Trouve = TRUE;
			  } 
			  else 
			  {
			  /* Found a solution, but may be not "longuest match"
				  save into stack */
				  
#ifdef FRENCH_DEBUG
				  if (PtPile>=LgPile-1) 
				  { 
					  Erreur (1); 
					  PtPile =  LgPile-2; 
				  }
#endif
				  
				  Pile [PtPile++] = PtND;
				  Pile [PtPile++] = j;
				  
				  PtND = LH [PtND]; /* and we continue */
			  } /* if */
		  } /* if */
		  
		  if (!Trouve) 
		  {  /* if not Trouve */
#ifdef FRENCH_DEBUG
			  if (DbgClas && DbgFin) 
				  printf ("Nd [%d] = %d, *L = %d\n", PtND, Nd [PtND], *L);
#endif
			  
			  if (Nd [PtND] == *L) 
			  {
			  /*
			  if equal, continue the comparisons
			  if the string has an alternative pointing on ETOIL
			  save the string into the stack
			  ex : memorisation of auquel then au; compilateur should sort
			  */
				  k1 = LH [PtND];
				  while (k1 != NIL) 
				  {
					  if (Nd [k1] == ETOIL) 
					  {
						  
#ifdef FRENCH_DEBUG
						  if (PtPile>=LgPile-1) 
						  { 
							  Erreur (1); 
							  PtPile =  LgPile-2; 
						  }
#endif
						  
						  Pile [PtPile++] = k1;
						  Pile [PtPile++] = j;
						  k1 = NIL; /* only once */
					  } 
					  else 
					  {
						  k1 = LH [k1];
					  }
				  }  /* while */
				  
				  PtND += 1; /* equal, continue the comparisons */
				  L += Inc;
				  j = j+1;
			  } 
			  else 
			  {     /* not equal, follow the alternative */
				  PtND = LH [PtND];
				  if (PtND == NIL) 
					  VoirPC = TRUE; /* no alternative */
			  }
		  }
	  } /* while */
	  
	  if (VoirPC == TRUE) 
	  {
	  /* fail to found a longuest string
		  take the one on top of stack */
		  if (PtPile>1) 
		  {
			  *LgECl = Pile [--PtPile];
			  *RepND = Pile [--PtPile];
		  } 
		  else 
		  {       /* stack empty, fail */
			  *LgECl = -1;
			  *RepND = 0;
		  }
	  }
	  
	  if (SauvCPC) 
	  {   /* keep the shortest strings of a class */
		  for (j=0; j<=PtPile-1; j++) 
		  {
			  pLts_t->PilSauv [j] = Pile [j];
		  }
		  pLts_t->PtPilSauv = PtPile;
	  }
	  
#ifdef FRENCH_DEBUG
	  if (DbgClas) 
		  printf ("ElementArbre sortie *RepND = %d, LgECl = %d\n", *RepND, *LgECl);
#endif
	  
} /* ElementArbre */


/*
  Return a shortest left string than the current one
  output :
  LgECl = length of the left string -1 if none
  RepND = pointor on * of Nd and LH
*/
static void Depiler_ChPC (PLTS_T pLts_t, short *LgECl, short *RepND)
{
	  if (pLts_t->PtPilSauv <=1) 
	  {
		  *LgECl = -1;
		  *RepND = -1;
	  } 
	  else 
	  {
		  *LgECl = pLts_t->PilSauv [--(pLts_t->PtPilSauv)];
		  *RepND = pLts_t->PilSauv [--(pLts_t->PtPilSauv)];
	  }
}  /* Depiler_ChPC */
  
  
/*
	 Is there an element of the class of type ClMot as a left context
	 starting from PremPhon
	 PtChCl   : beginning of the class in ChCl
	 PremPhon : index of the first phoneme in left (right) context
	 Inc      : increment (-1 left; 1 right)
	 LgECl    : length of the element found; -1 if none
*/
static void Element_ClMot (PLTS_T pLts_t, short PtChCl, BYTE *PremPhon, short Inc, short *LgECl)
{
	  short	LgMot;	   /* length of the word in Phon */
	  BYTE  *ptc;	   /* pointor on Phon or PhonT */
	  FLAG	Trouve;	   /* true if found the word in the class */
	  short	LgMotCrt;  /* length of the current word in the class */
	  short	i,j;
	  FLAG	Egal;
	  
	  /*
	  calculate the length of the word between PremPhon
	  and one space, hyphen or quote
	  */
	  LgMot = 0;
	  ptc   = PremPhon;
	  while ( (*ptc != pLts_t->F_CodBl) ) 
	  {
		  LgMot++;
		  ptc += Inc;
	  }
	  
#ifdef FRENCH_DEBUG
	  if (DbgClas) 
	  {
		  printf ("Element_ClMot : longueur du mot entier de Phon (t) : %d\n", LgMot);
	  }
#endif
	  
	  /* test only words of the class with length LgMot */
	  Trouve = FALSE;
	  while ( !Trouve && ( (LgMotCrt = ChCl [PtChCl]) != 0) ) 
	  {
		  if ( LgMotCrt == LgMot) 
		  {
			  
			  if (Inc == -1) 
			  {
				  j = PtChCl + LgMotCrt;
			  } 
			  else 
			  {
				  j = PtChCl + 1;
			  }
			  
			  Egal = TRUE;
			  ptc = PremPhon;
			  i = 0;
			  while ( (i++<LgMotCrt) && Egal ) 
			  {
				  
#ifdef FRENCH_DEBUG
				  if (DbgClas && DbgFin) 
					  printf ("Element_ClMot : ChCl [%d] : %d, Phon (t) : %d\n", j, ChCl [j], *ptc);
#endif
				  
				  Egal =  ((unsigned char)ChCl [j] == (unsigned char)*ptc); //chj 8/21/2000
				  j    += Inc;
				  ptc  += Inc;
			  }
			  if (Egal) 
				  Trouve = TRUE;
		  } /* if */
		  
		  PtChCl += LgMotCrt + 1; /* mot suivant */
	  } /* while */
	  
	  if (Trouve) 
	  {
		  *LgECl = LgMot;
	  } 
	  else 
	  {
		  *LgECl = -1;
	  }
	  
#ifdef FRENCH_DEBUG
	  if (DbgClas) 
		  printf ("Element_ClMot : longueur %d\n", *LgECl);
#endif
	  
} /* Element_ClMot */
  
  
/*
	Is there an element of the class (type ClSeq : car. seq.)
	as a left context starting at PremPhon
	PtChCl   : beginning of the class in ChCl
	PremPhon : index of the first phoneme in left context (or right)
	Inc      : increment (-1 left; 1 right)
	LgECl    : length of the word; -1 if any
*/
static void Element_ClSeq (short PtChCl, BYTE *PremPhon, short Inc, short *LgECl)
{
	  BYTE  *ptc;	   /* pointor on Phon or PhonT */
	  FLAG	Trouve;	   /* true if found the word in the class */
	  short	LgMotCrt;  /* length of the word in the class */
	  short	i;
	  short j;         /* index on ChCl */
	  FLAG	Egal;
	  
#ifdef FRENCH_DEBUG
	  if (DbgClas) 
	  {
		  printf ("Element_ClSeq : entrée\n");
	  }
#endif
	  
	  Trouve = FALSE;
	  while ( !Trouve && ( (LgMotCrt = ChCl [PtChCl]) != 0) ) 
	  {
		  
		  if (Inc == -1) 
		  {
			  j = PtChCl+LgMotCrt;
		  } else 
		  {
			  j = PtChCl+1;
		  }
		  
		  Egal = TRUE;
		  ptc = PremPhon;
		  i = 0;
		  
		  while ( (i++<LgMotCrt) && Egal ) 
		  {
			  
#ifdef FRENCH_DEBUG
			  if (DbgClas && DbgFin) 
			  {
				  printf ("Element_ClSeq : ChCl [%d] : %d (%s), Phon (t) : %d (%s)\n",
					  j, ChCl [j], Decod_Un_Car (j, TRUE), *ptc, Decod_Un_Car (*ptc, TRUE) );
			  }
#endif
			  
			  Egal =  ((unsigned char)ChCl [j] == (unsigned char)*ptc); //chj 8/21/2000
			  j    += Inc;
			  ptc  += Inc;
		  } /* while */
		  
		  if (Egal) 
			  Trouve = TRUE;
		  
		  PtChCl += LgMotCrt+1; /* next word */
	  } /* while */
	  
	  if (Trouve) 
	  {
		  *LgECl = LgMotCrt;
	  } 
	  else 
	  {
		  *LgECl = -1;
	  } /* if */
	  
#ifdef FRENCH_DEBUG
	  if (DbgClas) 
		  printf ("Element_ClSeq  sortie longueur %d\n", *LgECl);
#endif
	  
} /* Element_ClSeq */
  
  
  
/* RULE MODULE */
  
/*
  Search from the tree of left strings of a bloc of rules
  for a left string in Phon starting at PtcPhon,
  output : return true if not reach the end of Phon
  LgPG = length of the left string (-1 if not found)
  copy a char. in PhonT if no string found
*/
static FLAG PartieGauche (PLTS_T pLts_t, TypTamp *Tampon, short PtAid, short *LgPG,  short *RepND)
{
	  short	RacinePG;       /* root of the tree beginning with a char. */
	  FLAG	Coincidence;    /* found or not */
	  short	LgECl;          /* length if found; -1 if not found */
	  
#ifdef FRENCH_DEBUG
	  if (DbgFin && DbgNum)
		  printf ("PartieGauche entrée  Tampon->PtcPhon = %d\n", Tampon->PtcPhon);
#endif
	  
	  LgECl = -1;
	  Coincidence = FALSE;
	  
	  while ( (Tampon->PtcPhon<=Tampon->FinPhon) && !Coincidence) 
	  {
		  
#ifdef FRENCH_DEBUG
		  if (DbgFin && DbgNum) 
		  {
			  printf ("  PartieGauche Tampon->Phon [%d] = 0x%3x, PtAid = %d\n",
				  Tampon->PtcPhon, Tampon->Phon [Tampon->PtcPhon], PtAid);
		  }
#endif
		  
		  RacinePG = Aid [PtAid+Tampon->Phon [Tampon->PtcPhon]];
		  if (RacinePG == 0) 
		  { /* no tree beginning with that char. */
			  LgECl =  -1;
		  } 
		  else 
		  {
			  ElementArbre (pLts_t, RacinePG, Nd, LH, &Tampon->Phon [Tampon->PtcPhon],
				  1, TRUE, &LgECl, RepND);
		  }
		  if (LgECl == -1) 
		  { /* take the following char. except if finished */
			  /* fail, copy the char. */
			  Tampon->PhonTS [Tampon->PtPhonT++] = Tampon->Phon [Tampon->PtcPhon++];
		  } 
		  else 
		  {
			  Coincidence = TRUE;
		  }
	  } /* while */
	  
	  *LgPG = LgECl;
	  
#ifdef FRENCH_DEBUG
	  if (DbgFin && DbgNum)
		  printf ("PartieGauche sortie Coincidence = %d LgPG = %d\n\n",
		  Coincidence, *LgPG);
#endif
	  
	  return (Coincidence);   /* Coincidence = TRUE si trouve, Coincidence = FALSE si fin du Tampon */
} /* PartieGauche */
  
  
/*
	Substitute to the LgPG car. of Phon starting at PtcPhon,
	the lgi char. of ChPD of rule PtInst
	(substitution in PhonTS starting at PtPhonT)
*/
static void InsChaine (TypTamp *Tampon, short PtInst, short LgPG)
{
	  short	PtChPD;    /* index on ChPD */
	  short	LgCh_ChPD;    /* length of the right string */
	  short	i;
	  
#ifdef FRENCH_DEBUG
	  if (DbgFin && DbgNum) 
		  printf ("InsChaine entrée PtInst = %d, Tampon->PtPhonT = %d\n", 
                   PtInst, Tampon->PtPhonT);
#endif
	  
	  PtChPD = PrtDrte [PtInst];
	  if (PtChPD != 0) 
	  {  /* otherwise empty string; delete the char. */
		  LgCh_ChPD = ChPD [PtChPD++];
		  
#ifdef FRENCH_DEBUG
		  if (Tampon->PtPhonT + LgCh_ChPD > Tampon->LgPhon) 
			  Erreur (4);
#endif
		  
		  for (i=1; i<=LgCh_ChPD; i++) 
			  Tampon->PhonTS [Tampon->PtPhonT++] = ChPD [PtChPD++];
	  }
	  Tampon->PtcPhon += LgPG;  /* test LgPG car. further in Phon */
	  
#ifdef FRENCH_DEBUG
	  if (DbgFin && DbgNum) 
		  printf ("InsChaine sortie Tampon->PtPhonT = %d\n", Tampon->PtPhonT);
#endif
	  
}  /* InsChaine */
  
  
/*
	 Compare the 2 strings : left context of the current string
	 and required context (in ChPD) are equal
*/
//short	PtChPD;    /* index on ChPD */
//BYTE  	*LimGche;  /* pointor on the left limit of the left context */
//BYTE  	*LimDr;    /* pointor on the right limit of the left context*/
//short	*Longueur; /* output : length of the part of the context */
static short cpchgche (short PtChPD, BYTE *LimGche, BYTE *LimDr, short *Longueur)
{
	  short	LgCh_ChPD;      /* length of the string in ChPD */
	  BYTE	*ptphonc;       /* pointor on Phon or PhonTS */
	  FLAG	Egal;           /* strings are equal? */
	  short	i;
	  
	  LgCh_ChPD  = ChPD [PtChPD];   /* length of the string in ChPD */
	  ptphonc = LimDr-LgCh_ChPD+1; /* beginning of left context in Phon or PhonTS */
	  
	  if (ptphonc>=LimGche) 
	  { /* beginning of the window for left context */
		  Egal = TRUE;
		  i = PtChPD+1;
		  while ( (i<=PtChPD+LgCh_ChPD) && Egal) 
		  {
			  
#ifdef FRENCH_DEBUG
			  if (DbgVcg) 
				  printf ("      cpchgche *ptphonc = %d, ChPD [%d] = %d\n", *ptphonc, i, ChPD [i]);
#endif
			  
			  if ( (*ptphonc == ChPD [i]) ) 
			  {
				  i++;
				  ptphonc++;
			  } 
			  else 
			  {
				  Egal = FALSE;
			  }
		  }  /* while */
	  } 
	  else  
	  {
		  Egal = FALSE;
	  }
	  
	  *Longueur = LgCh_ChPD;
	  return (Egal);
	  
} /* cpchgche */
  
  
/* Is the left context OK or not for rule PtInst */
static short VCG (PLTS_T pLts_t, TypTamp *Tampon, short PtInst)
{
	  short	DebSCont;   /* beginning of a part of context */
	  short	DerCont;    /* end of the context for rule */
	  FLAG	EchecSC;    /* fail for part of context */
	  short	NumTerm;    /* number 0 to NbTerm of the part */
	  BYTE  *limdr1;    /* right limit of left context in Phon */
	  BYTE  *limdr2;    /* right limit of left context in PhonTS */
	  short	NbTerm;     /* length of the part of context */
	  short	PtContx;    /* index on EnsOuCh for part of context examination */
	  short	NumClas;    /* class number  */
	  short	Longueur;   /* length of the part of context */
	  FLAG	Corect;
	  FLAG  Tampon2;    /* buffer number 2 */
	  short bidon;
	  
#define CLTUC     1
#define CLARBRE_G 2
#define CLARBRE_D 3
#define CLMOT     4
#define CLSEQ     5
	  
	  DebSCont = ContG [PtInst];
	  
#ifdef FRENCH_DEBUG
	  if (DbgVcg)
		  printf ("\n\nvcg entrée Num [PtInst] = %ld, DebSCont %d\n", Num [PtInst], DebSCont);
#endif
	  
	  if (DebSCont == -1) 
	  { 	/* no left context */
		  Corect = TRUE;
	  } 
	  else 
	  {
		  DerCont = DebSCont+EnsOuCh [DebSCont];
		  
#ifdef FRENCH_DEBUG
		  if (DbgVcg) 
		  {
			  for (NumTerm=DebSCont; NumTerm<=DerCont; NumTerm++) 
			  {
				  printf ("%4d, %4d, %d, %d\n",NumTerm,EnsOuCh [NumTerm],ChargEB (FinCont,NumTerm),
					  ChargEB (ClOuCh,NumTerm) );
			  }
		  }
#endif
		  
		  DebSCont++;    	/* beginning of first part of context */
		  Corect = FALSE;
		  
		  while ( (DebSCont<=DerCont) && !Corect) 
		  {
			  limdr1 = &Tampon->Phon [Tampon->PtcPhon-1]; 	/* right limit of left context */
			  limdr2 = &Tampon->PhonTS [Tampon->PtPhonT-1];     /* right limit of left context */
			  NumTerm = 0;
			  while ( !ChargEB (FinCont, (short)(DebSCont+NumTerm)) ) 
				  NumTerm++;
			  NbTerm = NumTerm+1;
			  
#ifdef FRENCH_DEBUG
			  if (DbgVcg) 
				  printf ("  tq1 DebSCont = %d, NbTerm = %d\n",DebSCont,NbTerm);
#endif
			  
			  EchecSC = FALSE;
			  while ( (NumTerm>=0) && !EchecSC) 
			  {
				  PtContx = DebSCont+NumTerm;
#ifdef FRENCH_DEBUG
				  if (DbgVcg) 
					  printf ("    tq 2 terme NumTerm = %d, PtContx = %d\n",NumTerm,PtContx);
#endif
				  if ( !ChargEB (ClOuCh,PtContx) ) 
				  { /* chaine */
					  if ( EnsOuCh [PtContx]>0 ) 
					  { 	/* graphemic string in Phon */
#ifdef FRENCH_DEBUG
						  if (DbgVcg) 
							  printf ("    tq 2 chaine graphemique\n");
#endif
						  if ( cpchgche (EnsOuCh [PtContx], &(Tampon->Phon) [0], limdr1, &Longueur) ) 
						  {
							  limdr1 -= Longueur; 	/* right limite of left context changed */
							  NumTerm--;		/* next item of part of context */
						  } 
						  else 
						  {
							  EchecSC = TRUE;
							  DebSCont += NbTerm; 	/* see another part of context */
						  }
					  } 
					  else 
					  { 			/* phonetic string into PhonTS */
#ifdef FRENCH_DEBUG
						  if (DbgVcg) 
							  printf ("    tq 2 chaine phonetique\n");
#endif
						  if ( cpchgche ((short)(-EnsOuCh [PtContx]), &Tampon->PhonTS [0],limdr2,&Longueur) ) 
						  {
							  limdr2 -= Longueur; 	/* right limit of left context changed */
							  NumTerm--;		/* next items of part of context */
						  } 
						  else 
						  {
							  EchecSC = TRUE;
							  DebSCont += NbTerm; 	/* another part of context */
						  }
						  
					  }
					  
				  } 
				  else 
				  { 			/* item is a class */
					  
					  NumClas = EnsOuCh [PtContx];
					  if ( NumClas<0) 
					  {
						  NumClas=-NumClas;
						  Tampon2 = TRUE;
					  } 
					  else 
					  {
						  Tampon2 = FALSE;
					  }
					  
#ifdef FRENCH_DEBUG
					  if (DbgVcg) 
					  {
						  printf ("    tq 2 classe NumClas : %d\n",NumClas);
						  printf ("    tq 2 type   TypClas : %d\n", TypClas [NumClas]);
						  printf ("    tq 2 debut  DebClasse : %d\n", DebClasse [NumClas]);
						  if (Tampon2) 
							  printf ("Tampon2 consulté\n");
					  }
					  if (OptNbf) 
						  NbFCl [NumClas]=NbFCl [NumClas]+1;
#endif
					  
					  switch (TypClas [NumClas]) 
					  {
						  
					  case CLTUC: /* class of type TTUC */
						  if ( !Tampon2 ) 
						  {
							  Element_TTUC (NumClas,*limdr1,&Longueur);
						  } 
						  else 
						  {
							  Element_TTUC (NumClas,*limdr2,&Longueur);
						  }
						  break;
						  
					  case CLARBRE_G: /* class memorized in Nd-LH */
						  if ( !Tampon2 ) 
						  {
							  ElementArbre ( pLts_t, DebClasse [NumClas], NdCl, LHCl, limdr1,-1,
								  FALSE,&Longueur, &bidon);
						  } 
						  else 
						  {
							  ElementArbre ( pLts_t, DebClasse [NumClas], NdCl, LHCl, limdr2,-1,
								  FALSE, &Longueur, &bidon);
						  }
						  break;
						  
					  case CLMOT:  /* class memorized as full words */
						  if ( !Tampon2 ) 
						  {
							  Element_ClMot ( pLts_t, DebClasse [NumClas], limdr1, -1, &Longueur);
						  } 
						  else 
						  {
							  Element_ClMot ( pLts_t, DebClasse [NumClas], limdr2, -1, &Longueur);
						  }
						  break;
						  
					  case CLSEQ: /* class memorized as sequential char. */
						  if ( !Tampon2 ) 
						  {
							  Element_ClSeq ( DebClasse [NumClas], limdr1, -1, &Longueur);
						  } 
						  else 
						  {
							  Element_ClSeq ( DebClasse [NumClas], limdr2, -1, &Longueur);
						  }
						  break;
						  
					  } /* switch */
					  
					  if (Longueur != -1) 
					  {
						  if ( !Tampon2 ) 
						  {
							  limdr1 -= Longueur; 	/* change right limite of left context */
						  } 
						  else 
						  {
							  limdr2 -= Longueur;
						  }
						  NumTerm--; 			/* next item of part of context */
					  } 
					  else 
					  {
						  EchecSC = TRUE;
						  DebSCont += NbTerm;
					  }
				  }
      } /* while */
      if (!EchecSC) 
	  {
		  Corect = TRUE;
      }
    } /* while */
  } /* if ( */
  
#ifdef FRENCH_DEBUG
  if (DbgVcg) 
	  printf ("VCG sortie Corect = %d\n",Corect);
#endif
  
  return (Corect);
} /* VCG */


/*
  Indicate in Egal if the 2 strings :
  - right context of the current string from Phon,
  - and required context beginning at EnsOuCh [PtContx] in ChPD
  are equal
  output : longueur is the length of coincidence or -1
*/
//short	PtChPD;    /* EnsOuCh [PtContx] beginning of string in ChPD */
//BYTE	*LimGche;  /* left limit of right context in Phon */
//BYTE	*LimDr;    /* right limit of right context in Phon */
//short 	*Longueur; /* length of the coincidence, -1 if no coincidence. */
static short cpchdrte (short PtChPD, BYTE *LimGche, BYTE *LimDr, short *Longueur)
{
	  BYTE	*ptphonc;  /* index on Phon or PhonTS */
	  short	LgCh_ChPD; /* length of the string in ChPD */
	  FLAG	Egal;      /* 2 strings are equal or not */
	  
#ifdef FRENCH_DEBUG
	  if (DbgVcd) 
		  printf ("      cpchdrte entrée PtChPD = %d, *LimGche = %d\n", PtChPD,*LimGche);
#endif
	  
	  LgCh_ChPD = ChPD [PtChPD++];
	  
#ifdef FRENCH_DEBUG
	  if (DbgVcd)
		  printf ("      PtChPD = %d, LgCh_ChPD = %d\n",PtChPD,LgCh_ChPD);
#endif
	  
	  if (LimGche+LgCh_ChPD-1 <= LimDr) 
	  {
		  Egal = TRUE;
		  ptphonc = LimGche;
		  while ( (ptphonc < LimGche+LgCh_ChPD) && Egal) 
		  {
			  
#ifdef FRENCH_DEBUG
			  if (DbgVcd) 
				  printf ("      cpchdrte *ptphonc = %d, ChPD [%d] = %d\n", *ptphonc,PtChPD,ChPD [PtChPD]);
#endif
			  if ( *ptphonc == ChPD [PtChPD] ) 
			  {
				  ptphonc++;
				  PtChPD++;
			  } 
			  else 
			  {
				  Egal = FALSE;
			  }
		  } /* while */
	  } 
	  else 
	  {
		  Egal = FALSE;
	  }
	  if (Egal) 
		  *Longueur = LgCh_ChPD; 
	  else 
		  *Longueur=-1;
	  
#ifdef FRENCH_DEBUG
	  if (DbgVcd) 
		  printf ("cpchdrte sortie Egal = %d, *Longueur = %d\n",Egal,*Longueur);
#endif
	  
	  return (Egal);
} /* cpchdrte */
  
/*
	Is the right context of PtInst OK
	LgPG is the length of the left string matched
	(used to know the beginning of right context)
*/
static short VCD (PLTS_T pLts_t, TypTamp *Tampon, short PtInst, short LgPG)
{
	  short	DebSCont;  /* index of sub-context in EnsOuCh */
	  short	DerCont;   /* index of end of sub-context in EnsOuCh */
	  short	NbTerm;    /* length of du sub-context */
	  short	PtContx;   /* index of terme  i of sub-context in EnsOuCh */
	  FLAG	EchecSC;   /* fail for sub-context */
	  BYTE	*LimGche;  /* left limit of right context in Phon for term i */
	  short	NumTerm;   /* number from 0 to NbTerm of term in sub-context */
	  short	NumClas;   /* class number */
	  short	Longueur;  /* length (nb char.) of current term */
	  FLAG	Corect;    /* result in VCD */
	  short bidon;
	  
#define CLTUC     1
#define CLARBRE_G 2
#define CLARBRE_D 3
#define CLMOT     4
#define CLSEQ     5
	  
	  /* DbgVcd = TRUE; */
	  
#ifdef FRENCH_DEBUG
	  if (DbgVcd) 
		  printf ("\n\nvcd entrée Num [PtInst] = %ld\n", Num [PtInst]);
#endif
	  
	  DebSCont = ContD [PtInst]; /* début du 1er sous-contexte */
	  Corect = FALSE;
	  if (DebSCont == -1) 
	  {
		  Corect = TRUE;
	  } 
	  else 
	  {
		  DerCont = DebSCont+EnsOuCh [DebSCont]; /* fin du ctx droit */
		  
#ifdef FRENCH_DEBUG
		  if (DbgVcd) 
		  {
			  for (NumTerm = DebSCont;NumTerm<=DerCont;NumTerm++) 
			  {
				  printf ("%4d, %4d, %d, %d\n",NumTerm,EnsOuCh [NumTerm],ChargEB (FinCont,NumTerm),
					  ChargEB (ClOuCh,NumTerm) );
			  }
		  }
#endif
		  
		  Corect = FALSE;
		  DebSCont++; /* first sub-context */
		  while ( (DebSCont<=DerCont) && !Corect) 
		  {
			  LimGche = &Tampon->Phon [Tampon->PtcPhon+LgPG]; /* limite gauche du 1er ss-contexte */
			  
			  NumTerm = 0;
			  while ( !ChargEB (FinCont,(short)(DebSCont+NumTerm)) ) 
				  NumTerm++;
			  NbTerm = NumTerm+1;
			  
			  EchecSC = FALSE;
			  NumTerm = 0;
			  while ( (NumTerm<NbTerm) && !EchecSC) 
			  {
				  PtContx = DebSCont+NumTerm;
				  
#ifdef FRENCH_DEBUG
				  if (DbgVcd) 
					  printf ("    tq 2 terme NumTerm = %d, PtContx = %d\n", NumTerm,PtContx);
#endif
				  
				  if ( !ChargEB (ClOuCh,PtContx) ) 
				  {   /* string */
					  
#ifdef FRENCH_DEBUG
					  if (DbgVcd) 
						  printf ("    tq 2 chaine graphemique\n");
#endif
					  
					  if ( cpchdrte (EnsOuCh [PtContx], LimGche,
						  &Tampon->Phon [Tampon->FinFen], &Longueur) ) 
					  {    /* 11/11/92 */
						  LimGche += Longueur;
						  NumTerm++; /* next term of sub-context if one exists */
					  } 
					  else 
					  {
						  EchecSC = TRUE;
						  DebSCont += NbTerm; /* next sub-contexts */
					  }
				  } 
				  else 
				  { /* a class */
					  
					  NumClas = EnsOuCh [PtContx];
					  
#ifdef FRENCH_DEBUG
					  if (DbgVcg) 
					  {
						  printf ("    tq 2 classe NumClas : %d\n",NumClas);
						  printf ("    tq 2 type   TypClas : %d\n", TypClas [NumClas]);
					  }
					  if (OptNbf) 
						  NbFCl [NumClas] = NbFCl [NumClas]+1;
#endif
					  
					  switch (TypClas [NumClas]) 
					  {
						  
					  case CLTUC: /* classe de type TTUC */
						  Element_TTUC (NumClas, *LimGche, &Longueur);
						  break;
						  
					  case CLARBRE_D: /* class memorized in Nd-LH */
						  ElementArbre ( pLts_t, DebClasse [NumClas], NdCl, LHCl, LimGche, 1,
							  FALSE, &Longueur, &bidon);
						  break;
						  
					  case CLMOT:
						  Element_ClMot ( pLts_t, DebClasse [NumClas], LimGche, 1, &Longueur);
						  break;
						  
					  case CLSEQ:
						  Element_ClSeq ( DebClasse [NumClas], LimGche, 1, &Longueur);
						  break;
						  
					  } /* switch */
					  
					  if (Longueur != -1) 
					  { /* terme i is Corect */
						  LimGche += Longueur;
						  NumTerm++; /* next term */
					  } 
					  else 
					  {
						  EchecSC = TRUE;
						  DebSCont += NbTerm; /* next sub-context */
					  }
				  }
			  } /* while */
			  
			  if (!EchecSC) 
				  Corect = TRUE;
			  
		  } /* while */
		  
	  } /* if ( */
	  
#ifdef FRENCH_DEBUG
	  if (DbgVcd) 
		  printf ("VCD sortie Corect = %d\n", Corect);
#endif
	  
	  return (Corect);
} /* VCD */


/*
  Select the first rule PtInst to test for the current PG
  CG     : grammatical category of the word
  RepND  : end of left string in Nd-LH
  
	output :
	PtInst : relative number of the rule
	PtSNd  : is modified (next rulw with the same PG
	FinMPG : if CG not OK, and end of rules for this PG
	*/
static void Choisit_Inst (short CG, short RepND, short *PtInst, short *PtSNd,
		FLAG *FinMPG)
{
		
#ifdef FRENCH_DEBUG
		if (DbgFin && DbgNum) 
		{
			printf ("Choisit_Inst  entrée  RepND = %d, Nd[RepND] = %d, LH [RepND] = %d\n",
				RepND, Nd [RepND], LH [RepND]);
		}
#endif
		
		/* different in Borland and MS unsigned char or not */
		/* #define MOINS1C -1 if signed char */
		/* #define MOINS1C 255 if unsigned char */
#define MOINS1C -1
		if ( (Nd [RepND]) == 1) 
		{ /* only one rule in LH with CtG = -1 */
			*PtInst = LH [RepND];
			*PtSNd  = 0;
		} 
		else 
		{
			*PtSNd  = LH [RepND];
			while ( (*PtSNd != 0) && (CtG [*PtSNd] != MOINS1C) && (CG != CtG [*PtSNd]) ) 
			{
				*PtSNd  = SNd [*PtSNd];
			}
			if (*PtSNd == 0) 
			{
				*FinMPG = TRUE;
			} 
			else  
			{
				*PtInst = SLH [*PtSNd];
				*PtSNd = SNd [*PtSNd];
			}
		}
		
#ifdef FRENCH_DEBUG
		if (DbgFin && DbgNum) 
			printf ("Choisit_Inst sortie PtInst = %d\n", *PtInst);
#endif
		
} /* Choisit_Inst */
	
	
	
/* Search next rule to test, could modify FinMPG */
static void Next_Inst (short CG, short *PtInst, short *PtSNd, FLAG *FinMPG)
{
		
#ifdef FRENCH_DEBUG
		if (DbgFin && DbgNum) 
			printf ("Next_Inst entrée  *PtSNd = %d\n", *PtSNd);
#endif
		
		/* different in Borland and MS */
		/* #define MOINS1C -1 if signed char */
#define MOINS1C -1
		while ( (*PtSNd != 0) && (CtG [*PtSNd] != MOINS1C) && (CG != CtG [*PtSNd]) ) 
		{
			*PtSNd  = SNd [*PtSNd];
		}
		if (*PtSNd == 0) 
		{
			*FinMPG = TRUE;
		} 
		else  
		{
			*PtInst = SLH [*PtSNd];
			*PtSNd = SNd [*PtSNd];
		}
		
#ifdef FRENCH_DEBUG
		if (DbgFin && DbgNum) 
			printf ("Next_Inst sortie  *FinMPG = %d, *PtInst = %d \n", *FinMPG, *PtInst);
#endif
		
} /* Next_Inst */
	
	
	
/*
  Applies the rules from bloc NumBloc between DebPhon and FinPhon
  in Phon of Tampon.
  
	Results are put in PhonTS starting at PtPhonT included.
	Left context is limited on the left by pdebfen, and on the right by pfinfen
	NumBloc : block of rules number
	CG      : grammatical category of the word
*/
void Execute_Bloc (PLTS_T pLts_t, TypTamp *Tampon, short NumBloc, short CG)
{
		FLAG	FinChPC;   /* End of shortest strings */
		short	LgPG;      /* length of the current left string */
		short	PtAid;     /* current pointor in Aid */
		short PtInst;    /* current rule */
		FLAG	Trouve;
		short i;
		
		short	RepND; 	   /* points on * of the current word in Nd-LH */
		FLAG	FinMPG;    /* end of this left string */
		short PtSNd;     /* current pointor in SNd */
		
#ifdef FRENCH_DEBUG
		if (DbgNum && DbgFin) 
		{
			printf ("\ntrad entrée  Tampon->DebFen = %d, Tampon->DebPhon = %d, Tampon->FinPhon = %d, Tampon->FinFen = %d\n",
				Tampon->DebFen, Tampon->DebPhon, Tampon->FinPhon, Tampon->FinFen);
			printf ("Execute_Bloc graphemes de DebFen a FinFen\n");
			for (i=Tampon->DebPhon; i<=Tampon->FinPhon; i++) 
			{
				printf ("%s", Decod_Un_Car (Tampon->Phon [i],FALSE));
			}
			printf ("\n");
		}
#endif
		
		Tampon->PtPhonT = 0;
		Tampon->PtcPhon = Tampon->DebPhon;
		PtAid = TabBasePG [NumBloc];
		
		while ( PartieGauche (pLts_t, Tampon, PtAid, &LgPG, &RepND) ) 
		{ /* coincidence */
			FinChPC = FALSE; /* end of a shortest string */
			Trouve  = FALSE;
			
			while (!Trouve && !FinChPC) 
			{  /* still one shortest string */
				RepND++; /* RepND points on the * of Nd */
				FinMPG = FALSE;
				/* FinMPG could be set to TRUE */
				Choisit_Inst (CG, RepND, &PtInst, &PtSNd, &FinMPG);
				
				while (!Trouve && !FinMPG) 
				{
					
				//printf ("l_fr_ru1.c Execute_Bloc test de la regle PtInst:%d\n", Num[PtInst]);

#ifdef FRENCH_DEBUG
					if (DbgNum) 
						EcrireRegle (Tampon, PtInst,LgPG);
					if (DbgNum && DbgFin) 
					{
						printf ("\n\n---------------------------------------\n");
						printf ("Execute_Bloc test de la regle Num [%d] = %ld\n", PtInst, Num [PtInst]);
					}
					if (DbgNum) 
					{
						printf ("\n");
						for (i=Tampon->PtcPhon-8; i<Tampon->PtcPhon+8; i++) 
						{
							if (i == Tampon->PtcPhon) 
								printf ("(");
							if (i == Tampon->PtcPhon+LgPG) 
								printf (")");
							if (i>=0 && i<=Tampon->FinFen)
								printf ("%s", Decod_Un_Car (Tampon->Phon [i],FALSE) );
						}
						printf ("\n");
					}
					if (OptNbf) 
						NbFInst [PtInst] = NbFInst [PtInst]+1;
#endif
					
					if ( VCD (pLts_t, Tampon, PtInst, LgPG) ) 
					{
						
#ifdef FRENCH_DEBUG
						if (DbgNum && DbgFin) 
							printf ("  Contexte droit vérifié\n");
						if (OptNbf) 
							NbFContD [PtInst] = NbFContD [PtInst]+1;
#endif
						
						if ( VCG (pLts_t, Tampon, PtInst) ) 
						{
							
#ifdef FRENCH_DEBUG
							if (DbgNum && DbgFin) 
								printf ("  Contexte gauche vérifié\n");
							if (OptNbf) 
								NbFContG [PtInst] = NbFContG [PtInst]+1;
#endif
							
							InsChaine (Tampon, PtInst, LgPG);
							
#ifdef FRENCH_DEBUG
							if (DbgNum) 
							{
								printf ("****   %10ld s'applique  **************\n", Num [PtInst]);
								Ecrire_PhonT (Tampon, 1);
								printf ("\n\n");
							}
#endif
							
							Trouve = TRUE;
						} /* if */
					} /* if */
					
					/* next rule please for the same PG if exists */
					if (!Trouve) 
						Next_Inst (CG, &PtInst, &PtSNd, &FinMPG);
					
				} /* while not Trouve and still a rule with the same PG */
				
				if (!Trouve) 
				{ /* search for a shortest string */
					Depiler_ChPC (pLts_t, &LgPG, &RepND);
					if (LgPG == -1) 
					{ /* no shortest string */
						FinChPC = TRUE;
						Tampon->PhonTS [Tampon->PtPhonT++] = Tampon->Phon [Tampon->PtcPhon++]; /* le car. est recopie */
					}
				}
				
			} /* while pas trouvé et reste des PG plus courtes */
			
		} /* while still a char. to be translated in Phon */
		
		  /* A space is added at the beginning of the word and translated (linking pb)
		  but first char. is not sent as a result in Range_Résu
		*/
		for (i=0; i<Tampon->PtPhonT; i++) 
			Tampon->Phon [i] = Tampon->PhonTS [i];
		
		Tampon->Phon [Tampon->PtPhonT] = pLts_t->F_CodBl;
		Tampon->DebFen  = 0;
		Tampon->DebPhon = 0;
		Tampon->FinPhon = (Tampon->PtPhonT)-1;
		Tampon->FinFen  = Tampon->PtPhonT;  /* space added at beginning and end  */
		
} /* Execute_Bloc */



/* INTERFACE with the user programs */

/* store result in Resultat */
void Ranger_Resu (TypTamp *Tampon, short Format, char *Resultat)
{
	
	short j;
	
	if (Format>2) 
		Format = 2;
	
	switch (Format) 
	{
		
    case 1:  /* code [B][AU] */
		/* Phon [1..FinPhon] ds PhonTS [0..PtPhonT]; Phon[0] est un espace */
		Decoder_Chaine (Tampon->Phon, 1, Tampon->FinPhon, Tampon->PhonTS,
			&Tampon->PtPhonT, Tampon->LgPhon);
		/* Tampon->PtPhonT repère le dernier */
		for (j=0; j<=Tampon->PtPhonT; j++) 
			*Resultat++ = Tampon->PhonTS [j];
		*Resultat = EOS;
		break;
		
		
    case 2: /* internal code for phonemes */
		for (j=1; j<=Tampon->FinPhon; j++) 
			*Resultat++ = Tampon->Phon [j];
		*Resultat = EOS;
		break;
		
	} /* switch */
	
} /* Ranger_Resu */

/* Initialize buffers (length : LgPhon) for the translation of Entree */
TypTamp*  Init_Trad (PLTS_T pLts_t, char *Entree, short LgPhon)
{
	unsigned char c;
	TypTamp *Tampon;
	
	if (LgPhon<100) 
		LgPhon = 100;
	Tampon = &(pLts_t->Tamp);
	Tampon->LgPhon = LgPhon; /* for overflow test */
	Tampon->Phon  = pLts_t->Ph1;
	Tampon->PhonTS = pLts_t->Ph2;
	
	
	/* NbGra += strlen (Entree); */
	
	Tampon->PhonTS [0] = ' ';
	Tampon->PtPhonT = 1;
	while ( (c = *Entree++) != EOS) 
		Tampon->PhonTS [Tampon->PtPhonT++] = c;
	Tampon->PhonTS [Tampon->PtPhonT++] = ' ';
	
	Coder (Tampon->PhonTS, 0, (short)(Tampon->PtPhonT-1), Tampon->Phon, 0, &Tampon->FinFen);
	pLts_t->F_CodBl = Tampon->Phon [0];
	
	Tampon->DebFen  = 0;
	Tampon->DebPhon = 1;
	Tampon->FinPhon = Tampon->FinFen-1; /* un blanc ajoute à la fin */
	
	return (Tampon);
	
} /* Init_Trad */


  /*
  Initialize buffers (length LgPhon) for the translation of Entree
  ChCtg : Chaine Contexte Gauche (String Left Context)
*/
TypTamp*  Init_Trad_Cont (PLTS_T pLts_t, char *ChCtg, char *Entree, char *ChCtD, short LgPhon)
{
	unsigned char c;
	TypTamp *Tampon;
#ifdef FRENCH_DEBUG
	int i; //only used for debug code
#endif

	if (LgPhon<100) 
		LgPhon = 100;
	Tampon = &(pLts_t->Tamp);
	Tampon->LgPhon = LgPhon; /* for overflow test */
	Tampon->Phon  = pLts_t->Ph1;
	Tampon->PhonTS = pLts_t->Ph2;
	
	/* NbGra += strlen (Entree); */
	
	if (strlen(ChCtg)==0) 
	{
		Tampon->DebPhon=0;
	} 
	else 
	{
		/* copy and code a space, then left context from PhonTS in Phon */
		Tampon->PhonTS [0] = ' ';
		Tampon->PtPhonT = 1;
		while ( (c = *ChCtg++) != EOS) 
			Tampon->PhonTS [Tampon->PtPhonT++] = c;
		Coder (Tampon->PhonTS, 0, (short)(Tampon->PtPhonT-1), Tampon->Phon, 0, &Tampon->DebPhon);
		Tampon->DebPhon++;
	}
	
	/* copy and code a space and word from PhonTS in Phon */
	Tampon->PhonTS [0] = ' ';
	Tampon->PtPhonT = 1;
	while ( (c = *Entree++) != EOS) 
		Tampon->PhonTS [Tampon->PtPhonT++] = c;
	Tampon->PhonTS [Tampon->PtPhonT++] = ' ';
	Coder (Tampon->PhonTS, 0, (short)(Tampon->PtPhonT-1), Tampon->Phon, Tampon->DebPhon, &Tampon->FinFen);
	Tampon->DebFen  = 0;
	Tampon->FinPhon = Tampon->FinFen-1; /* a space added at the end */
	
	/* copy and code a space and word on the right from PhonTS into Phon */
	if (strlen(ChCtD) != 0) 
	{
		/* Tampon->PhonTS [0] = ' '; */
		Tampon->PtPhonT = 0;
		while ( (c = *ChCtD++) != EOS) 
			Tampon->PhonTS [Tampon->PtPhonT++] = c;
		Tampon->PhonTS [Tampon->PtPhonT++] = ' ';
		Coder (Tampon->PhonTS, 0, (short)(Tampon->PtPhonT-1), Tampon->Phon, (short)(Tampon->FinPhon+2), &Tampon->FinFen);
	}
	
#ifdef FRENCH_DEBUG
    if (DbgNum) 
	{
		printf ("Init_Trad_Cont : ");
		for (i=0; i<Tampon->DebPhon; i++) 
			printf("%3d ", Tampon->Phon[i]);
		printf (" [ ");
		for (i=Tampon->DebPhon; i<=Tampon->FinPhon; i++) 
			printf("%3d ", Tampon->Phon[i]);
		printf (" ] ");
		for (i=Tampon->FinPhon+1; i<=Tampon->FinFen; i++) 
			printf("%3d ", Tampon->Phon[i]);
		printf ("\nInit_Trad_Cont DebFen=%d, DebPhon=%d, FinPhon=%d, FinFen=%d\n",
			Tampon->DebFen, Tampon->DebPhon, Tampon->FinPhon, Tampon->FinFen);
    }
#endif
	
	pLts_t->F_CodBl = Tampon->Phon [0];
	
	return (Tampon);
	
} /* Init_Trad_Cont */

void Traduire_Cont (PLTS_T pLts_t, char *ChCtG, char *Entree, char *ChCtD, char *Resultat, char *NBloc, short Format,
					short LgPhon, short CG)
{
	TypTamp *Tampon;
	short N;
	short i;
	
	Tampon = Init_Trad_Cont (pLts_t, ChCtG, Entree, ChCtD, LgPhon);
	
	if (*NBloc == 0) 
	{ /* interpret all the blocks */
		for (i=0; i<=NbTabBasePG; i++) 
			Execute_Bloc (pLts_t, Tampon, i, CG);
	} 
	else 
	{ /* only specific blocks */
		while ( (N = *NBloc++) != 0 ) 
		{
			N--;
			/* printf ("Traduire NbTabBasePG %d, N = %d\n", NbTabBasePG, N); getch (); */
			if ( (N>=0) && (N<=NbTabBasePG) ) 
				Execute_Bloc (pLts_t, Tampon, N, CG);
		}
	}
	
	Ranger_Resu (Tampon, Format, Resultat);
	
	Finir_Trad (Tampon);
	
} /* Traduire_Cont */


void Finir_Trad (TypTamp *Tampon)
{
/*
free (Tampon->Phon);
free (Tampon->PhonTS);
free (Tampon);
	*/
} /* Finir_Trad */

#ifdef UNUSED_FRENCH_FUNCTIONS
void Traduire (PLTS_T pLts_t, char *Entree, char *Resultat, char *NBloc, short Format,
			   short LgPhon, short CG)
{
	TypTamp *Tampon;
	short N;
	short i;
	
	Tampon = Init_Trad (pLts_t, Entree, LgPhon);
	
	if (*NBloc == 0) 
	{ /* interpret all the blocks */
		for (i=0; i<=NbTabBasePG; i++) 
			Execute_Bloc (pLts_t, Tampon, i, CG);
	} 
	else 
	{ /* certains blocs */
		while ( (N = *NBloc++) != 0 ) 
		{
			N--;
			/* printf ("Traduire NbTabBasePG %d, N = %d\n", NbTabBasePG, N); getch (); */
			if ( (N>=0) && (N<=NbTabBasePG) ) 
				Execute_Bloc (pLts_t, Tampon, N, CG);
		}
	}
	
	Ranger_Resu (Tampon, Format, Resultat);
	
	Finir_Trad (Tampon);
	
} /* Traduire */


/* Delete spaces from the string points to by Entree */
void Eliminer_Blancs (PLTS_T pLts_t, char *Entree)
{
	char *pt;
	char c;
	
	pt = Entree;
	while ((c = *Entree++) != 0) 
	{
		if (c != pLts_t->F_CodBl) 
			*pt++ = c;
	}
	*pt = 0;
} /* Eliminer_Blancs */
#endif //UNUSED



#ifdef FRENCH_DEBUG

/* Print an erreur message */
static void Erreur (short NErreur)
{
	printf ("\n*** Erreur numéro %2d : ", NErreur);
	switch (NErreur) 
	{
    case 1: 
		printf ("Débordement de pile (ElementArbre)"); 
		break;
    case 2: 
		printf ("Caractère non autorisé (ignoré)"); 
		break;
    case 3: 
		printf ("Débordement de Phon [LgPhon]"); 
		break;
    case 4: 
		printf ("Débordement de Phon [LgPhon]"); 
		break;
    case 5: 
		printf ("Groupe de caractères non codable"); 
		break;
    case 6: 
		printf ("Chaîne codée vide"); 
		break;
    case 7: 
		printf ("Chaine à coder vide"); 
		break;
	} /* switch */
	printf (" ***\n\n");
} /* Erreur */


  /*
  Write the PtPhonT-1 char. of PhonTS
  Format = 1 external code ex: [B][AU]
  Format = 2 integer numbers
*/
static void Ecrire_PhonT (TypTamp *Tampon, short Format)
{
#define LGLIGN  60
	
	short	i;
	static short NCol = 0;
	
	switch (Format) 
	{
		
	case 1:
		NCol = 0;
		
		for (i=0; i<Tampon->PtPhonT; i++) 
		{
			if ( NCol>LGLIGN ) 
			{
				printf ("\n");
				NCol = 0;
			}
			printf ("%s", Decod_Un_Car (Tampon->PhonTS [i], FALSE) );
			NCol += strlen (Decod_Un_Car (Tampon->PhonTS [i], FALSE) );
		} /* for */
		
		printf ("\n");
		break;
		
	case 2:
		NCol = 0;
		for (i=0; i<Tampon->PtPhonT; i++) 
		{
			if (NCol>=LGLIGN)
			{
				printf ("\n");
				NCol = 0;
			}
			NCol += 6;
			printf (" 0x%x ", Tampon->PhonTS [i]);
		}
		break;
		
	} /* switch */
	
} /* Ecrire_PhonT */

/* Write the current rule */
static void EcrireRegle (TypTamp *Tampon, short PtInst, short LgPG)
{
	short NCol;
	short PtChPD, LgCh_ChPD;
	short DebSCont, DerCont, PtContx;
	short NumClas;
	FLAG  Tampon2;
	char c;
	short i;
	
	printf ("\n %10ld : ", Num [PtInst]);
	NCol = 0;
	for (i=Tampon->PtcPhon; i<Tampon->PtcPhon+LgPG; i++) 
	{
		printf ("%s",Decod_Un_Car (Tampon->Phon [i],TRUE) );
		NCol += strlen ( Decod_Un_Car (Tampon->Phon [i],TRUE) );
	}
	for (i=0; i<10-NCol; i++) 
		printf (" ");
	printf (" --> ");
	
	PtChPD = PrtDrte [PtInst];
	LgCh_ChPD = ChPD [PtChPD];
	NCol = 0;
	for (i=0; i<LgCh_ChPD; i++) 
	{
		printf ("%s",Decod_Un_Car (ChPD [++PtChPD],TRUE) );
		NCol += strlen ( Decod_Un_Car (ChPD [PtChPD],TRUE) );
	}
	
	if ( (ContG [PtInst] == 0xFFFF) && (ContD [PtInst] == 0xFFFF) ) 
	{
		printf (" ;");
		return;
	}
	
	for (i=0; i<10-NCol; i++) 
		printf (" ");
	printf (" / ");
	
	/* left contexte */
	DebSCont = ContG [PtInst];
	if (DebSCont == -1) 
	{
		for (i=0; i<10; i++) 
			printf (" ");
		printf (" + ");
	} 
	else 
	{
		DerCont = DebSCont+EnsOuCh [DebSCont];
		PtContx = ++DebSCont;
		Tampon2 = FALSE;
		while (PtContx<=DerCont) 
		{
			if ( !ChargEB (ClOuCh,PtContx) ) 
			{ /* string */
				PtChPD = EnsOuCh [PtContx];
				if (PtChPD<0) 
				{
					if (!Tampon2) 
					{
						Tampon2 = TRUE;
						printf (" ( ");
					}
					PtChPD=-PtChPD;
				}
				LgCh_ChPD = ChPD [PtChPD];
				for (i=0; i<LgCh_ChPD; i++) 
				{
					printf ("%s",Decod_Un_Car (ChPD [++PtChPD],TRUE) );
				}
				if ( Tampon2 && ChargEB (FinCont,PtContx) ) 
				{
					printf (" ) ");
					Tampon2 = FALSE;
				}
				
			} 
			else 
			{ /* class */
				NumClas = EnsOuCh [PtContx];
				if (NumClas<0) 
				{
					if (!Tampon2) 
					{
						Tampon2 = TRUE;
						printf (" ( ");
					}
					NumClas=-NumClas;
				}
				printf ("'");
				for (i=0; i<8; i++) 
					if ( (c=NomCl [NumClas] [i]) != ' ') 
						printf ("%c",c);
					printf ("'");
					if ( Tampon2 && ChargEB (FinCont,PtContx) ) 
					{
						printf (" ) ");
						Tampon2 = FALSE;
					}
			}
			
			if (PtContx != DerCont) 
			{
				if ( !ChargEB (FinCont,PtContx) ) 
				{
					printf (".");
				} 
				else 
				{
					printf (", ");
				}
			}
			
			PtContx++;
		}  /* PtContx != DerCont */
		if (Tampon2) 
			printf (" ) ");
		printf (" + ");
	}
	
	/* rignt context */
	DebSCont = ContD [PtInst];
	if (DebSCont != -1) 
	{
		DerCont = DebSCont+EnsOuCh [DebSCont];
		PtContx = ++DebSCont;
		while (PtContx<=DerCont) 
		{
			if ( !ChargEB (ClOuCh,PtContx) ) 
			{ /* chaine */
				PtChPD = EnsOuCh [PtContx];
				LgCh_ChPD = ChPD [PtChPD];
				for (i=0; i<LgCh_ChPD; i++) 
				{
					printf ("%s",Decod_Un_Car (ChPD [++PtChPD],TRUE) );
				}
			} 
			else 
			{ /* class */
				NumClas = EnsOuCh [PtContx];
				printf ("'");
				for (i=0; i<8; i++) 
					if ( (c=NomCl [NumClas] [i]) != ' ') 
						printf ("%c",c);
					printf ("'");
			}
			if (PtContx != DerCont) 
			{
				if ( !ChargEB (FinCont,PtContx) ) 
				{
					printf (".");
				} 
				else 
				{
					printf (",");
				}
			}
			PtContx++;
		}  /* while PtContx != DerCont */
	} /* if */
	printf (" ; ");
	
} /* EcrireRegle */


void Ecrire_NbF (FILE *fs)
{
	short	i,j;
	
	fprintf (fs,"\n\n   Sortie du numéro de la classe              \n");
	fprintf (fs,"          du nombre de consultations de la classe \n");
	fprintf (fs,"          du type de la classe ( 1 à 4)           \n");
	fprintf (fs,"\n");
	
	for (i=0; i<=NbTabCl-1; i++) 
	{
		fprintf (fs,"%5d '",i);
		for (j=0; j<8; j++) 
			fprintf (fs,"%c", NomCl [i] [j]);
		fprintf (fs,"' ");
		fprintf (fs,"%10ld %6d\n",NbFCl [i], TypClas [i]);
	}
	fprintf (fs,"\n");
	
	fprintf (fs,"   Sortie du numéro de l'instruction          \n");
	fprintf (fs,"          du nombre de tests de la règle      \n");
	fprintf (fs,"          du nombre de vérifications du ContG \n");
	fprintf (fs,"          du nombre de vérifications du ContD \n");
	fprintf (fs,"\n");
	
	for (i=0; i<=NbInst-1; i++) 
	{
		fprintf (fs,"%6d %10ld %10ld %10ld %10ld\n", i, Num [i], NbFInst [i],
			NbFContG [i], NbFContD [i]);
	}
	
	fprintf (fs,"\n");
	fprintf (fs," Nombre de graphèmes lus:%10ld\n", NbGra);
	fprintf (fs,"\n");
} /* Ecrire_NbF */

void Init_NbF ()
{
	short i;
	
	OptNbf = TRUE; /* want application number of times for classes and rules */
	NbGra  = 0;    /* count the graphemes */
	
	NbFCl    = (long *) malloc ( sizeof(long) * NbTabCl);
	for (i=0; i<NbTabCl; i++) 
		NbFCl [i] = 0;
	
	NbFContG = (long *) malloc ( sizeof(long) * NbInst);
	NbFContD = (long *) malloc ( sizeof(long) * NbInst);
	NbFInst  = (long *) malloc ( sizeof(long) * NbInst);
	for (i=0; i<NbInst; i++) 
	{
		NbFContG [i] = 0;
		NbFContD [i] = 0;
		NbFInst  [i] = 0;
	}
	
} /* Init_NbF */
#endif //FRENCH_DEBUG

