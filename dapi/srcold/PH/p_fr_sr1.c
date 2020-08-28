/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997 All rights reserved.
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
 *    File Name:    p_fr_sr1.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    English code from phsort.c
 *
 ***********************************************************************
 *    Revision History:
 *  Rev  Who    Date          Description
 *  ---  -----  -----------   --------------------------------------------
 *  001  CHJ    07/20/2000    Created from p_us_sr1.c and old fphsort.c
 *  002  CAB    10/18/2000    Changed copyright info
 *  003  CAB    01/17/2001    Merged Michel Divay changes for the French
 *
 */

// Using the grammatical categories of the preceding word (CGPrec)
// and of the current word (CGCour), decides if the current word
// is stressed or not.
short Stressed (short CGPrec, short CGCour){
  FLAG WordStressed = TRUE; // default is stressed

  switch (CGCour) {
  case CgConj:  case CgVA:  case CgArt:    case CgDivers:
  case CgPrep:  case CgDe:  case CgPrep2:  case CgAV:      case CgInterr:
    // la (CgArt) cigale ...; la is not stressed
    WordStressed = FALSE; // Not stressed
    break;
  case CgPPS:
    // Stressed if preceded by CgPrep, CgDe, CgPrep2
    // ex : vers(Prep) ELLE, de(De) NOUS, pour(Prep2) ELLE 
    WordStressed = CGPrec == CgPrep || CGPrec == CgDe || CGPrec == CgPrep2;
    break;
  case  CgPosDem:
    // stressed if preceded by CgArt or CgPosDem : les leurs
    WordStressed = CGPrec ==  CgArt || CGPrec == CgPosDem;
    break;
  }  // switch

  return WordStressed;
} // Stressed


/* Word boundary, but not clause boundary.
   add a feature FGROU to the first phoneme of the preceding word 
   if the preceding word is stressed and the current word unstressed (function words),
   and if the grammatical category of the current function word allows it.
   FGROU must be separated by a minimum of 10 phonemes.
   PrecStressed   : preceding word is stressed or not
   WordStressed   : current word is stressed or not
   CGCour         : syntactical category  of the current word
   PosBegPrecWord : Position (index) of the beginning of the preceding word
   PosFGROUPrec   : Position (index) of the beginning of the previous FGROU
*/
void Word_Bd (PDPH_T pDph_t, FLAG PrecStressed, FLAG WordStressed, short CGCour,
              short PosBegPrecWord, short* PosFGROUPrec) {
  // preceding word is stressed and current word not stressed
  if (PrecStressed && !WordStressed) {
    if (PosBegPrecWord - (*PosFGROUPrec) >= 10) {
      // 10 phonemes between two groupes
      /* preceding Acc., current NAcc :
              Le petit chat boit du lait (FGROU) dans sa gamelle.
              pour les pêcheurs(Acc) ET(CONJ) ... not 10 phonemes here now
              faire place(Acc) a2(CgPrep2) ...
              fort(Acc) sur(Prep) ... */
      if( CGCour != CgArt && CGCour != CgPosDem && CGCour != CgDe ) {
        pDph_t->sentstruc[PosBegPrecWord] |= FGROU; // pêcheurs is end of group
        *PosFGROUPrec = PosBegPrecWord; 
        //printf ("Word_Bd FGROU %d\n", PosBegPrecWord);
      }
    }
  } // PrecStressed && !WordStressed
} // Word_Bd


// cur_in_sym is a clause or sentence boundary;
// QuestionDeb is true if the first word of the sentence is of grammatical category
// CgInterr. In fact, the sentence is declarative as in : Comment allez-vous ?
// Synt_Bd() sets the type of the clause in the global variable clausetype.
void Synt_Bd (PDPH_T pDph_t, short cur_in_sym, FLAG QuestionDeb) {
  switch (cur_in_sym) {
  case PERIOD:   // . 
    pDph_t->clausetype   = DECLARATIVE;
    break;
  case QUEST:  // ?
    if (QuestionDeb) {  // Apparently ? is already replaced before by a period
      // quand viendras-tu?   not an interrogative intonation
      pDph_t->clausetype   = DECLARATIVE;
    } else {
      pDph_t->clausetype   = QUESTION;
      pDph_t->cbsymbol     = TRUE;
    }
    break;
  case COMMA:
    pDph_t->clausetype   = COMMACLAUSE;
    pDph_t->clausenumber++;
    break;
  case EXCLAIM:
    pDph_t->clausetype   = EXCLAIMCLAUSE;
    break;
  }  // switch

  // add a silence phoneme at the end of the clause or sentence
  // with the features FMOT, FSYNT, and FPROP (if end of sentence).
  if (pDph_t->nphonetot < NPHON_MAX) {
    pDph_t->phonemes [pDph_t->nphonetot] = GEN_SIL;
    pDph_t->sentstruc[pDph_t->nphonetot] |= (FMOT | FSYNT);
    if (cur_in_sym != COMMA) {
      pDph_t->sentstruc[pDph_t->nphonetot] |= FPROP;
    }
    pDph_t->nphonetot++;
  }

  if (cur_in_sym != COMMA) pDph_t->clausenumber = 0;  // new sentence

  //printf ("cur_in_sym %d\n", cur_in_sym);
  //printf ("pDph_t->clausetype %d\n",   pDph_t->clausetype);
  //printf ("pDph_t->clausenumber %d\n", pDph_t->clausenumber);

} // Synt_Bd
