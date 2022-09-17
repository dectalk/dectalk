/* 
 ***********************************************************************
 *                                                                      
 *                           Copyright (c)                              
 *    Copyright © 2000,2001 Force Computers, Inc., a Solectron company. All rights reserved.                                                                 
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
 *    File Name:	l_us_ph.h
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *  	american english phoneme codes ...
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *	Rev	Who		Date			Description                    
 *	---	-----	-----------		---------------------------------------
 *  001	MGS		02/08/1996		Moved eng_phon.h to l_us_ph.h    
 *  002 EAB		03/24/1997		Unify phonemic codes dx fx d_dentalized
 *								BATS# 302
 *  003	MGS		06/17/1998		Added code for PHEDIT2
 *  004	CAB		10/16/2000		Changed copyright info
 *	005	CAB		09/04/2001		Added #error
 * 
 */

#error This file is no longer used 

#ifndef L_US_PHH
#define L_US_PHH 1

#include	"l_com_ph.h"

//#define	PFUSA			0x1E		/* American English Phonemes	*/

/*
 * Definitions for the phonemes, under the
 * "PFUSA" font. These are offsets into the font,
 * not absolute font codes. The font code is made
 * by saying "(PFUSA<<PSFONT) + code". May tables are
 * indexed by these values; don't change them unless
 * you are very careful. Dennis made some changes
 * to these for the new synthesizer.
 */

#define SIL		 0		/* Must be zero			*/
#define IY		 1
#define IH		 2
#define EY		 3
#define EH		 4
#define AE		 5
#define AA		 6
#define AY		 7
#define AW		 8
#define AH		 9
#define AO		10
#define OW		11
#define OY		12
#define UH		13
#define UW		14
#define RR		15
#define YU		16
#define AX		17
#define IX		18
#define IR		19
#define ER		20
#define AR		21
#define OR		22
#define UR		23
#define W		24
#define Y		25
#define R		26
#define LL		27
#define HX		28
#define RX		29
#define LX		30
#define M		31
#define N		32
#define NX		33
#define EL		34
#define DZ      35
#define EN		36
#define F		37
#define V		38
#define TH		39
#define DH		40
#define S		41
#define Z		42
#define SH		43
#define ZH		44
#define P		45
#define B		46
#define T		47
#define D		48
#define K		49
#define G		50
#define DX		51
#define TX		52
#define Q		53		/* glottal stop			*/
#define CH		54
#define JH		55
#define DF		56

#ifndef PHEDIT2
#ifndef TOT_ALLOPHONES
#define US_TOT_ALLOPHONES	57
#endif
#else
extern short TOT_ALLOPHONES;
#endif




#endif  /* ifndef L_US_PHH */
