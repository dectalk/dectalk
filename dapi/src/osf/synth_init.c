/*
 * @DEC_COPYRIGHT@
 *    © SMART Modular Technologies 1999. All rights reserved.    
 */
/*
 * HISTORY
 * Revision 1.1.2.2  1995/07/05  19:36:09  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:33:51  Krishna_Mangipudi]
 *
 * Revision 1.2.2.2  1994/11/07  23:09:23  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:16:20  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
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
/**********************************************************************/
/*                                                                    */
/*  Copyright Digital Equipment Corporation, 1994,                    */
/*  All rights reserved.                                              */
/*                                                                    */
/*  This software is proprietary to and embodies the confidential     */
/*  technology of Digital Equipment Corporation. Possession, use,     */
/*  or copying of this software and media is authorized only pursuant */
/*  to a valid written license from Digital or an authorized          */
/*  sublicensor.                                                      */
/*                                                                    */
/*  Restricted Rights: Use, duplication, or disclosure by the         */
/*  U.S. Government is subject to restrictions as set forth in        */
/*  subparagraph (c) (1) (ii) of DFARS 252.227-7013, or in            */
/*  FAR 52.227-19, or in FAR 52.227-14 Alt. III as applicable.        */
/*                                                                    */
/*  The name of Digital Equipment Corporation may not be used to      */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  This software is provided "as is" and without any express or      */
/*  implied warranties, including, without limitation, implied        */
/*  warranties of non-infringement, merchantibility or fitness        */
/*  for a particular purpose. Digital assumes no responsibility AT    */
/*  ALL for the use or reliability of this software.                  */
/*                                                                    */
/**********************************************************************/

/*****************************************************************************
**  PROGRAM:
**     synth_init.c
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
** 	DECtalk driver program
**
** 	declare and manipulate data structures global to synthesizer threads
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     Krishna Mangipudi
**
**  CREATION DATE:
**     July 8, 1993
**
**  MODIFICATION HISTORY:
**
*****************************************************************************/


#include <stdio.h>

#include "defs.h"
#include "esc.h"
#include "kernel.h"
#include "dectalk.h"

struct share_data kernel_data, *kernel_share = &kernel_data;

extern P_PIPE lts_pipe;
extern P_PIPE ph_pipe;

init_synthesizer_globals( )
{
    int i;

    /*
     * this comes from the pc-based kernel initialization
     */
    for ( i=0; i<MAX_languages; i++)
    {
	KS.lang_lts[i] = NULL_PIPE;
	KS.lang_ph[i]  = NULL_PIPE;
	KS.lang_ready[i] = 0;
    }
    KS.lang_lts[0] = lts_pipe;
    KS.lang_ph[0] = ph_pipe;
    KS.lts_pipe = KS.lang_lts[0];
    KS.ph_pipe = KS.lang_ph[0];
}
