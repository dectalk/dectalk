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
 *		English code from phsort.c
 *
 ***********************************************************************
 *    Revision History:
 *	Rev	Who		Date			Description
 *	---	-----	-----------		--------------------------------------------
 *	001	CHJ		07/20/2000		Created from p_us_sr1.c and old fphsort.c
 *  002 CAB		10/18/2000		Changed copyright info
 * 	003	CAB		01/17/2001		Merged Michel Divay changes for the French
 *
 */

short Stressed (short CGPrec, short CGCour)
{
	FLAG WordStressed=TRUE; /* by default */

  	switch (CGCour) 
	{
    	case CgConj:  case CgVA:  case CgArt:    case CgDivers:
    	case CgPrep:  case CgDe:  case CgPrep2:  case CgAV:      case CgInterr:
      		WordStressed = FALSE; /* Not stressed */
      		break;
    	case CgPPS:
      		/* Stressed if preceded by CgPrep, CgDe, CgPrep2
         	   ex : vers(Prep) ELLE, de(De) NOUS, pour(Prep2) ELLE 
      		*/
      		WordStressed = CGPrec == CgPrep || CGPrec == CgDe || CGPrec == CgPrep2;
      		break;
    	case  CgPosDem:
      		/* stressed if preceded by CgArt or CgPosDem : les leurs */
    	  	WordStressed = CGPrec ==  CgArt || CGPrec == CgPosDem;
	    	break;

  	}  /* switch */

  	return (WordStressed);
} /* Stressed */


/* Word boundary, but not syntagme boundary
   PrecStressed   : preceding word is stressed or not
   WordStressed   : current word is stressed or not
   CatSyntC       : category syntactical of the current word
   PosBegPrecWord : Position (index) of the beginning of the preceding word
   PosBegWord     : Position (index) of the beginning of current word
*/
void Word_Bd (PDPH_T pDph_t, FLAG PrecStressed, FLAG WordStressed,  short *CatSyntC,
              short PosBegPrecWord, short* PosFGROUPrec) 
{
	short CGCour;
  	CGCour = *CatSyntC;

  	if (WordStressed)
	{
    	*CatSyntC = CgBas; /* we are interested only in function words */
  	}
 	else
 	{  /* current word not stressed */
    	if (PrecStressed && (PosBegPrecWord - (*PosFGROUPrec))>=10) { // First word is not FGROU
    		//if (PrecStressed) { // First word is not FGROU
      		// 10 phonemes between two groupes ???
      		/* preceding acc., current NAcc :
               pour les pêcheurs(Acc) ET(CONJ) ...
          	   faire place(Acc) a2(CgPrep2) ...
          	   fort(Acc) sur(Prep) ... 
            */
      		if( CGCour != CgArt && CGCour != CgPosDem && CGCour != CgDe ) {
        		pDph_t->sentstruc[PosBegPrecWord] |= FGROU; /* pêcheurs is end of group */
        		*PosFGROUPrec = PosBegPrecWord; 
        		//printf ("Word_Bd FGROU %d\n", PosBegPrecWord);
      		}
    	} /* preceding stressed */
  	} /* current stressed or not */
} /* Word_Bd */

/* Syntagme boundary */
void Synt_Bd (PDPH_T pDph_t, short cur_in_sym, FLAG QuestionDeb)
{
	short Front;

  	switch (cur_in_sym) {
    	case FinNorm:   /* . */
			pDph_t->clausetype = DECLARATIVE;
			pDph_t->clausenumber=0;
      		Front = FinNorm;
      		break;
    	case FinInterr:  /* ? */
      		if (QuestionDeb) {
        		/* quand viendras-tu?   not an interrogative intonation */
		 		pDph_t->clausetype = DECLARATIVE;
		 		pDph_t->clausenumber=0;
        		Front = FinNorm;
      		} 
			else
 			{
				pDph_t->clausetype = QUESTION;
				pDph_t->clausenumber=0;
        		pDph_t->cbsymbol = TRUE;
      		}
      		break;
	  	case COMMA:
			pDph_t->clausetype = COMMACLAUSE;
			pDph_t->clausenumber++;
			// make_phone (pDph_t, GEN_SIL, n, curr_dur, curr_f0);
			// word_init_sw = TRUE;
			// compound_destress = FALSE;
			break;				
	  case EXCLAIM:
			pDph_t->clausetype = EXCLAIMCLAUSE;
			pDph_t->clausenumber=0;
			// add_feature (pDph_t, FSENTENDS, NEXTPHONE);
			// make_phone (pDph_t, GEN_SIL, n, curr_dur, curr_f0);
			// word_init_sw = TRUE;
			// compound_destress = FALSE;
			break;
    }  /* switch */

  	if (pDph_t->nphonetot < NPHON_MAX)
 	{
    	pDph_t->phonemes[pDph_t->nphonetot] = GEN_SIL; /* a clause begins by Segsil */
    	pDph_t->sentstruc[pDph_t->nphonetot] |= (FMOT | FSYNT);
    	if( Front==FinNorm) 
		{
			pDph_t->sentstruc[pDph_t->nphonetot]|= FPROP;
		}
    	pDph_t->nphonetot++;
  	}
} /* Synt_Bd */
