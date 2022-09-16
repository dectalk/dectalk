/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	iso_char.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  Install iso mapping table defaults ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */
 
#include "defs.h"
#include	"esc.h"
#include "kernel.h"
#include	"dectalk.h"
#include "iso_char.h"

struct	case_equivalents	{
	unsigned char	upper;
	unsigned char	lower;
};

struct case_equivalents case_table[] = {
	{C_A,C_a},
	{C_B,C_b},
	{C_C,C_c},
	{C_D,C_d},
	{C_E,C_e},
	{C_F,C_f},
	{C_G,C_g},
	{C_H,C_h},
	{C_I,C_i},
	{C_J,C_j	},
	{C_K,C_k},
	{C_L,C_l},
	{C_M,C_m},
	{C_N,C_n},
	{C_O,C_o},
	{C_P,C_p},
	{C_Q,C_q},
	{C_R,C_r},
	{C_S,C_s},
	{C_T,C_t},
	{C_U,C_u},
	{C_V,C_v},
	{C_W,C_w},
	{C_X,C_x},
	{C_Y,C_y},
	{C_Z,C_z},
	{C_GR_A,C_GR_a},
	{C_AC_A,C_AC_a},
	{C_CF_A,C_CF_a},
	{C_TL_A,C_TL_a},
	{C_UM_A,C_UM_a},
	{C_RI_A,C_RI_a},
	{C_AE,C_ae},
	{C_CD_C,C_CD_c},
	{C_GR_E,C_GR_e},
	{C_AC_E,C_AC_e},
	{C_CF_E,C_CF_e},
	{C_UM_E,C_UM_e},
	{C_GR_I,C_GR_i},
	{C_AC_I,C_AC_i},
	{C_CF_I,C_CF_i},
	{C_UM_I,C_UM_i},
	{C_ETH,C_eth},
	{C_TL_N,C_TL_N},
	{C_GR_O,C_GR_o},
	{C_AC_O,C_AC_o},
	{C_CF_O,C_CF_o},
	{C_TL_O,C_TL_o},
	{C_UM_O,C_UM_o},
	{C_GR_U,C_GR_u},
	{C_AC_U,C_AC_u},
	{C_CF_U,C_CF_u},
	{C_UM_U,C_UM_u},
	{C_THORN,C_THORN},
	{0,0}		
};

void iso_case_map(void)
{
	int	i;

	for(i=0;i<256;i++)
		{
		KS.iso_to_upper[i] = i;
		KS.iso_to_lower[i] = i;
		}
	for(i=0;case_table[i].upper;i++)
		{
		KS.iso_to_lower[case_table[i].upper]=case_table[i].lower;
		KS.iso_to_upper[case_table[i].lower]=case_table[i].upper;
		}
}

