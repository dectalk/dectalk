/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000,2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *
 *    Restricted Rights: "USe, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, "USe, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    phprint.c
 *    Author:       Michel Divay
 *    Creation Date:11/11/2000
 *
 *    Functionality:
 *    
 *    
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------  
 * 0001 MD		11/22/2000      Initial creation
 * 0002	CAB		08/31/2001		Added ifdef NEW_PHONES
 *								Added include for dectalkf.h		
 */

/* phprint.c
   code externe des phonemes : code Michel Divay sur 1 ou 2 caractères 
*/

#include "dectalkf.h"

#ifdef NEW_PHONES
#include "l_all_ph.h"
#else
#include "l_fr_ph.h"	// TOT_ALLOPHONES, FinNorm, FSyntVirg
#endif

#include <stdio.h>

#if 0
static char* lognames[] = {
/* 00 */  "_",
/* 01 */  "A",
/* 02 */  "ƒ", //â
/* 03 */  "Š", //è
/* 04 */  "Au",
/* 05 */  "E",
/* 06 */  "‚",  /é
/* 07 */  "Eu",
/* 08 */  "I",
/* 09 */  "O",
/* 10 */  "O6",
/* 11 */  "Ou",
/* 12 */  "U",
/* 13 */  "An",
/* 14 */  "In",
/* 15 */  "On",
/* 16 */  "Un",
/* 17 */  "Ap",
/* 18 */  "L",
/* 19 */  "R",
/* 20 */  "W",
/* 21 */  "Wu",
/* 22 */  "Y",
/* 23 */  "Ch",
/* 24 */  "F",
/* 25 */  "J",
/* 26 */  "Rx",
/* 27 */  "S",
/* 28 */  "V",
/* 29 */  "Z",
/* 30 */  "B",
/* 31 */  "D",
/* 32 */  "G",
/* 33 */  "K",
/* 34 */  "P",
/* 35 */  "T",
/* 36 */  "Gn",
/* 37 */  "M",
/* 38 */  "N",
/* 39 */  "Ng",
/* 40 */  "Xx",
/* 41 */  "-"
};
#endif

/* external code for phonemes */
char *flognames[] = {
  /* 00 */  "_",
  /* 01 */  "A",
  /* 02 */  "A3",
  /* 03 */  "E2",
  /* 04 */  "Au",
  /* 05 */  "E",
  /* 06 */  "E1",
  /* 07 */  "Eu",
  /* 08 */  "I",
  /* 09 */  "O",
  /* 10 */  "O6",
  /* 11 */  "Ou",
  /* 12 */  "U",
  /* 13 */  "An",
  /* 14 */  "In",
  /* 15 */  "On",
  /* 16 */  "Un",
  /* 17 */  "Ap",
  /* 18 */  "L",
  /* 19 */  "R",
  /* 20 */  "W",
  /* 21 */  "Wu",
  /* 22 */  "Y",
  /* 23 */  "Ch",
  /* 24 */  "F",
  /* 25 */  "J",
  /* 26 */  "Rx",
  /* 27 */  "S",
  /* 28 */  "V",
  /* 29 */  "Z",
  /* 30 */  "B",
  /* 31 */  "D",
  /* 32 */  "G",
  /* 33 */  "K",
  /* 34 */  "P",
  /* 35 */  "T",
  /* 36 */  "Gn",
  /* 37 */  "M",
  /* 38 */  "N",
  /* 39 */  "Ng",
  /* 40 */  "Xx",
  /* 41 */  "-"
};
char *uslognames[]={
 "SIL",		 
 "US_IY",		 
 "US_IH",	 
 "US_EY",		 
 "US_EH",		 
 "US_AE",		 
 "US_AA",		 
 "US_AY",		 
 "US_AW",		 
 "US_AH",		 
 "US_AO",		
 "US_OW",		
 "US_OY",		
 "US_UH",		
 "US_UW",		
 "US_RR",		
 "US_YU",		
 "US_AX",		
 "US_IX",		
 "US_IR",		
 "US_ER",		
 "US_AR",		
 "US_OR",		
 "US_UR",		
 "US_W",		
 "US_Y",		
 "US_R",		
 "US_LL",		
 "US_HX",	
 "US_RX",	
 "US_LX",		
 "US_M",		
 "US_N",		
 "US_NX",		
 "US_EL",	
 "US_DZ",	
 "US_EN",	
 "US_F",	
 "US_V",		
 "US_TH",		
 "US_DH",	
 "US_S",	
 "US_Z",		
 "US_SH",		
 "US_ZH",	
 "US_P",	
 "US_B",		
 "US_T",		
 "US_D",		
 "US_K",		
 "US_G",		
 "US_DX",		
 "US_TX",	
 "US_Q",			
 "US_CH",		
 "US_JH",	
 "US_DF",	
 "US_TZ",	
 "US_CZ",	
 "US_LY",
 "US_RE",
 "US_X1",
 "US_X2",
 "US_X3",
 "US_X4",
 "US_X5",
 "US_X6",
 "US_X7",
 "US_X8",
 "US_X9",
 "US_Z1"
};
char *uklognames[]={
 "SIL",		 
 "UK_IY",		 
 "UK_IH",	 
 "UK_EY",		 
 "UK_EH",		 
 "UK_AE",		 
 "UK_AA",		 
 "UK_AY",		 
 "UK_AW",		 
 "UK_AH",		 
 "UK_AO",		
 "UK_OW",		
 "UK_OY",		
 "UK_UH",		
 "UK_UW",		
 "UK_RR",		
 "UK_YU",		
 "UK_AX",		
 "UK_IX",		
 "UK_IR",		
 "UK_ER",		
 "UK_AR",		
 "UK_OR",		
 "UK_UR",		
 "UK_W",		
 "UK_Y",		
 "UK_R",		
 "UK_LL",		
 "UK_HX",	
 "UK_RX",	
 "UK_LX",		
 "UK_M",		
 "UK_N",		
 "UK_NX",		
 "UK_EL",	
 "UK_DZ",	
 "UK_EN",	
 "UK_F",	
 "UK_V",		
 "UK_TH",		
 "UK_DH",	
 "UK_S",	
 "UK_Z",		
 "UK_SH",		
 "UK_ZH",	
 "UK_P",	
 "UK_B",		
 "UK_T",		
 "UK_D",		
 "UK_K",		
 "UK_G",		
 "UK_DX",		
 "UK_TX",	
 "UK_Q",			
 "UK_CH",		
 "UK_JH",	
 "UK_DF",	
 "UK_TZ",	
 "UK_CZ",	
};


char *grlognames[]={
"SIL",
"GRP_A",
"GRP_E",
"GRP_AE",
"GRP_EX",	 
"GRP_I",		 
"GRP_O",		
"GRP_OE",	
"GRP_U",		 
"GRP_UE",	
"GRP_AH",	
"GRP_EH",	
"GRP_AEH",	
"GRP_IH",	
"GRP_OH",	
"GRP_OEH",	
"GRP_UH",	
"GRP_UEH",	
"GRP_EI",	
"GRP_AU",	
"GRP_EU",	
"GRP_AN",	
"GRP_IM",
"GRP_UM",	
"GRP_ON",	
"GRP_J",	
"GRP_L",		
"GRP_RR",
"GRP_R",		
"GRP_H",	
"GRP_M",	
"GRP_N",	
"GRP_NG",	
"GRP_EL",
"GRP_EM",	
"GRP_EN",	
"GRP_F",	
"GRP_V",	    
"GRP_S",		
"GRP_Z",		
"GRP_SH",	
"GRP_ZH",	
"GRP_CH",		
"GRP_KH",	
"GRP_P",	
"GRP_B",	
"GRP_T",	
"GRP_D",	
"GRP_K",	
"GRP_G",	
"GRP_Q",	
"GRP_PF",	
"GRP_TS",	
"GRP_DJ",	
"GRP_TJ",	
"GRP_KSX",	
"GRP_I1",	
"GRP_E1",	
"GRP_O1",
"GRP_U1",	
"GRP_Y1",	
"GRP_ER",	
};

char *splognames[]={
"SIL",
"SPP_A",   //((PFSP<<PSFONT) |SP_A	)               /*       Palabra        */
"SPP_E",   //((PFSP<<PSFONT) |SP_E	)               /*       Leo            */
"SPP_I",      //((PFSP<<PSFONT) |SP_I	)               /*       Hilo           */
"SPP_O",      //((PFSP<<PSFONT) |SP_O	)               /*       Hola           */
"SPP_U",      //((PFSP<<PSFONT) |SP_U )               /*       Lunes          */
"SPP_WX",	 //((PFSP<<PSFONT) |SP_WX)               /* Rounded dipth semiv. */
"SPP_YX",		 //((PFSP<<PSFONT) |SP_YX)               /* Unround dipth semiv. */
"SPP_RR",		 //((PFSP<<PSFONT) |SP_RR)               /*       Rama           */
"SPP_L",		 //((PFSP<<PSFONT) |SP_L	)               /*       Luna           */
"SPP_LL",		//((PFSP<<PSFONT) |SP_LL)              /*       Calle          */
"SPP_M",		//((PFSP<<PSFONT) |SP_M)              /*       Mama'          */
"SPP_N",		//((PFSP<<PSFONT) |SP_N)              /*       Nana           */
"SPP_NH",		//((PFSP<<PSFONT) |SP_NH)              /*       Munoz          */
"SPP_F",		//((PFSP<<PSFONT) |SP_F)              /*       Feo            */
"SPP_S",		//((PFSP<<PSFONT) |SP_S)              /*       Casa           */
"SPP_J",		//((PFSP<<PSFONT) |SP_J)              /*       Caja           */
"SPP_TH",		//((PFSP<<PSFONT) |SP_TH)              /*       Caza           */
"SPP_BH",		//((PFSP<<PSFONT) |SP_BH)              /*       Haba           */
"SPP_DH",		//((PFSP<<PSFONT) |SP_DH)              /*       Hada           */
"SPP_GH",		//((PFSP<<PSFONT) |SP_GH)              /*       Haga           */
"SPP_YH",		//((PFSP<<PSFONT) |SP_YH)              /*       Yate affricate */
"SPP_P",		//((PFSP<<PSFONT) |SP_P)              /*       Papa'          */
"SPP_B",		//((PFSP<<PSFONT) |SP_B)              /*       Barco          */
"SPP_T",		//((PFSP<<PSFONT) |SP_T)              /*       Tela           */
"SPP_D",		//((PFSP<<PSFONT) |SP_D)              /*       Dama           */
"SPP_K",		//((PFSP<<PSFONT) |SP_K)              /*       Casa           */
"SPP_G",		//((PFSP<<PSFONT) |SP_G)              /*       Gasa           */
"SPP_CH",		//((PFSP<<PSFONT) |SP_CH)              /*       Charco         */
"SPP_Y",		//((PFSP<<PSFONT) |SP_Y)              /*       Haya fricitive */
"SPP_R",		//((PFSP<<PSFONT) |SP_R)              /*       Sara           */
"SPP_Q",		//((PFSP<<PSFONT) |SP_Q)              /*       ~n offglide    */
"SPP_Z",		//((PFSP<<PSFONT) |SP_Z)              /*       Desde          */
"SPP_W",		//((PFSP<<PSFONT) |SP_W)              /*       Hueso          */
"SPP_NX",		//((PFSP<<PSFONT) |SP_NX)              /*       Mango          */
"SPP_V",		//((PFSP<<PSFONT) |SP_V)              /*       Afgano         */
"SPP_IX",		//((PFSP<<PSFONT) |SP_IX)              /*       ~n offglide    */
"SPP_MX",		//((PFSP<<PSFONT) |SP_MX)              /*       Infierno ((nf)  */
"SPP_PH",		//((PFSP<<PSFONT) |SP_PH)              /*       Observar       */
};

char *itlognames[]={
"SIL",
"ITP_A",   //((PFIT<<PSFONT) |IT_A	)               /*       Palabra        */
"ITP_E",   //((PFIT<<PSFONT) |IT_E	)               /*       Leo            */
"ITP_I",      //((PFIT<<PSFONT) |IT_I	)               /*       Hilo           */
"ITP_O",      //((PFIT<<PSFONT) |IT_O	)               /*       Hola           */
"ITP_U",      //((PFIT<<PSFONT) |IT_U )               /*       Lunes          */
"ITP_WX",	 //((PFIT<<PSFONT) |IT_WX)               /* Rounded dipth semiv. */
"ITP_YX",		 //((PFIT<<PSFONT) |IT_YX)               /* Unround dipth semiv. */
"ITP_RR",		 //((PFIT<<PSFONT) |IT_RR)               /*       Rama           */
"ITP_L",		 //((PFIT<<PSFONT) |IT_L	)               /*       Luna           */
"ITP_LL",		//((PFIT<<PSFONT) |IT_LL)              /*       Calle          */
"ITP_M",		//((PFIT<<PSFONT) |IT_M)              /*       Mama'          */
"ITP_N",		//((PFIT<<PSFONT) |IT_N)              /*       Nana           */
"ITP_NH",		//((PFIT<<PSFONT) |IT_NH)              /*       Munoz          */
"ITP_F",		//((PFIT<<PSFONT) |IT_F)              /*       Feo            */
"ITP_S",		//((PFIT<<PSFONT) |IT_S)              /*       Casa           */
"ITP_J",		//((PFIT<<PSFONT) |IT_J)              /*       Caja           */
"ITP_TH",		//((PFIT<<PSFONT) |IT_TH)              /*       Caza           */
"ITP_BH",		//((PFIT<<PSFONT) |IT_BH)              /*       Haba           */
"ITP_DH",		//((PFIT<<PSFONT) |IT_DH)              /*       Hada           */
"ITP_GH",		//((PFIT<<PSFONT) |IT_GH)              /*       Haga           */
"ITP_YH",		//((PFIT<<PSFONT) |IT_YH)              /*       Yate affricate */
"ITP_P",		//((PFIT<<PSFONT) |IT_P)              /*       Papa'          */
"ITP_B",		//((PFIT<<PSFONT) |IT_B)              /*       Barco          */
"ITP_T",		//((PFIT<<PSFONT) |IT_T)              /*       Tela           */
"ITP_D",		//((PFIT<<PSFONT) |IT_D)              /*       Dama           */
"ITP_K",		//((PFIT<<PSFONT) |IT_K)              /*       Casa           */
"ITP_G",		//((PFIT<<PSFONT) |IT_G)              /*       Gasa           */
"ITP_CH",		//((PFIT<<PSFONT) |IT_CH)              /*       Charco         */
"ITP_Y",		//((PFIT<<PSFONT) |IT_Y)              /*       Haya fricitive */
"ITP_R",		//((PFIT<<PSFONT) |IT_R)              /*       Sara           */
"ITP_Q",		//((PFIT<<PSFONT) |IT_Q)              /*       ~n offglide    */
"ITP_Z",		//((PFIT<<PSFONT) |IT_Z)              /*       Desde          */
"ITP_W",		//((PFIT<<PSFONT) |IT_W)              /*       Hueso          */
"ITP_NX",		//((PFIT<<PSFONT) |IT_NX)              /*       Mango          */
"ITP_V",		//((PFIT<<PSFONT) |IT_V)              /*       Afgano         */
"ITP_IX",		//((PFIT<<PSFONT) |IT_IX)              /*       ~n offglide    */
"ITP_MX",		//((PFIT<<PSFONT) |IT_MX)              /*       Infierno ((nf)  */
"ITP_PH",		//((PFIT<<PSFONT) |IT_PH)              /*       Observar       */
};




char *lalognames[]={
"SIL",
"LAP_A",   //((PFSP<<PSFONT) |SP_A	)               /*       Palabra        */
"LAP_E",   //((PFSP<<PSFONT) |SP_E	)               /*       Leo            */
"LAP_I",      //((PFSP<<PSFONT) |SP_I	)               /*       Hilo           */
"LAP_O",      //((PFSP<<PSFONT) |SP_O	)               /*       Hola           */
"LAP_U",      //((PFSP<<PSFONT) |SP_U )               /*       Lunes          */
"LAP_WX",	 //((PFSP<<PSFONT) |SP_WX)               /* Rounded dipth semiv. */
"LAP_YX",		 //((PFSP<<PSFONT) |SP_YX)               /* Unround dipth semiv. */
"LAP_RR",		 //((PFSP<<PSFONT) |SP_RR)               /*       Rama           */
"LAP_L",		 //((PFSP<<PSFONT) |SP_L	)               /*       Luna           */
"LAP_LL",		//((PFSP<<PSFONT) |SP_LL)              /*       Calle          */
"LAP_M",		//((PFSP<<PSFONT) |SP_M)              /*       Mama'          */
"LAP_N",		//((PFSP<<PSFONT) |SP_N)              /*       Nana           */
"LAP_NH",		//((PFSP<<PSFONT) |SP_NH)              /*       Munoz          */
"LAP_F",		//((PFSP<<PSFONT) |SP_F)              /*       Feo            */
"LAP_S",		//((PFSP<<PSFONT) |SP_S)              /*       Casa           */
"LAP_J",		//((PFSP<<PSFONT) |SP_J)              /*       Caja           */
"LAP_TH",		//((PFSP<<PSFONT) |SP_TH)              /*       Caza           */
"LAP_BH",		//((PFSP<<PSFONT) |SP_BH)              /*       Haba           */
"LAP_DH",		//((PFSP<<PSFONT) |SP_DH)              /*       Hada           */
"LAP_GH",		//((PFSP<<PSFONT) |SP_GH)              /*       Haga           */
"LAP_YH",		//((PFSP<<PSFONT) |SP_YH)              /*       Yate affricate */
"LAP_P",		//((PFSP<<PSFONT) |SP_P)              /*       Papa'          */
"LAP_B",		//((PFSP<<PSFONT) |SP_B)              /*       Barco          */
"LAP_T",		//((PFSP<<PSFONT) |SP_T)              /*       Tela           */
"LAP_D",		//((PFSP<<PSFONT) |SP_D)              /*       Dama           */
"LAP_K",		//((PFSP<<PSFONT) |SP_K)              /*       Casa           */
"LAP_G",		//((PFSP<<PSFONT) |SP_G)              /*       Gasa           */
"LAP_CH",		//((PFSP<<PSFONT) |SP_CH)              /*       Charco         */
"LAP_Y",		//((PFSP<<PSFONT) |SP_Y)              /*       Haya fricitive */
"LAP_R",		//((PFSP<<PSFONT) |SP_R)              /*       Sara           */
"LAP_Q",		//((PFSP<<PSFONT) |SP_Q)              /*       ~n offglide    */
"LAP_Z",		//((PFSP<<PSFONT) |SP_Z)              /*       Desde          */
"LAP_W",		//((PFSP<<PSFONT) |SP_W)              /*       Hueso          */
"LAP_NX",		//((PFSP<<PSFONT) |SP_NX)              /*       Mango          */
"LAP_V",		//((PFSP<<PSFONT) |SP_V)              /*       Afgano         */
"LAP_IX",		//((PFSP<<PSFONT) |SP_IX)              /*       ~n offglide    */
"LAP_MX",		//((PFSP<<PSFONT) |SP_MX)              /*       Infierno ((nf)  */
"LAP_PH",		//((PFSP<<PSFONT) |SP_PH)              /*       Observar       */
};


/* phoneme c is converted in an external code */
char* phprint (short c) {
  static char resu [10];

  if( ( (c & 0xFF00) == 0x1900) ) {
    c = (short) (c & 0x00FF);
    return flognames[c];
  }
  else if( ( (c & 0xFF00) == 0x1E00) ) {
    c = (short) (c & 0x00FF);
    return uslognames[c];
  }
   else if( ( (c & 0xFF00) == 0x1D00) ) {
    c = (short) (c & 0x00FF);
    return uklognames[c];
  }
else if ( ( (c & 0xFF00) == 0x1C00) ) {
    c = (short) (c & 0x00FF);
    return grlognames[c];
  } 
else if ( ( (c & 0xFF00) == 0x1B00) ) {
    c = (short) (c & 0x00FF);
    return splognames[c];
}
else if ( ( (c & 0xFF00) == 0x1A00) ) {
    c = (short) (c & 0x00FF);
    return lalognames[c];
}
else if ( ( (c & 0xFF00) == 0x1700) ) {
    c = (short) (c & 0x00FF);
    return itlognames[c];
}
else {
    switch (c) {
      case FinNorm:   return ".";
      case FSyntVirg: return ",";
      case FinInterr: return "?";
      case FrontMot:  return " ";
      default : 
         sprintf (resu,"<%4x>", c);
         return resu;
    }
  }

/* else if( ( (c&0xFF00) == 0x1d00) ) {
    c = (short) (c&0x00FF);

    switch(c) {
      case CgBas:     return("<Bas>");
      case CgConj:     return("<Conj>");
      case CgPPS:      return("<PPS>");
      case CgVA:       return("<VA>");
      case CgArt:     return("<Art>");
      case CgDivers:   return("<Divers>");
      case CgPrep:    return("<Prep>");
      case CgPosDem:  return("<PosDem>");
      case CgInterr:   return("<Interr>");
      case CgDe:       return("<De>");
      case CgPrep2:    return("<Prep2>");
      case CgAV:      return("<AV>");
      default:
        sprintf(resu,"<%4x>",c);
        return(resu);
    }

  } else {
    sprintf resu,"<%4x>",c);
    return resu);
  } 

  return(" <?? phoneme inconnu> "); */

} /* phprint */