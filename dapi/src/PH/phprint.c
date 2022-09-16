/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000 Force Computers, Inc., a Solectron Company. All rights reserved.
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
 * 0001 MD     11/22/2000      Initial creation
 */

/* phprint.c
   code externe des phonemes : code Michel Divay sur 1 ou 2 caractères 
*/

#include "l_fr_ph.h"   // TOT_ALLOPHONES, FinNorm, FSyntVirg
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
char *lognames[] = {
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

/* phoneme c is converted in an external code */
char* phprint (short c) {
  static char resu [10];

  if( ( (c & 0xFF00) == 0x1900) ) {
    c = (short) (c & 0x00FF);
    return lognames[c];
  } else {
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

