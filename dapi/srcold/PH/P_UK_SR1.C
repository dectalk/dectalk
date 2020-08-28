/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997 All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computer Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    p_uk_sr1.c
 *    Author:       Matthew Schnee
 *    Creation Date:05-Jun-1995 
 *
 *    Functionality:
 *		English code from phsort.c
 *
 ***********************************************************************
 *    Revision History:
 *	Rev	Who		Date			Description
 *	---	-----	-----------		--------------------------------------------
 *  001	MGS		06/19/1996		Moved init_med_final,find_syll_to_stress to 
 *								ph_sort2.c English and German
 *								Moved get_next_bound_type, move_stdangle  to
 *								ph_sort2.c English and Spanish
 *	002 SIK		07/12/1996  	Cleaning up and maintenance
 *  003	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 *  004	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 *	005	DR		07/21/1997		file created, copied from p_us_st1.c for older revisions go to that file
 *  006	MGS		04/13/2000		Changes for integrated phoneme set
 *  007 CAB		10/18/2000		Changed copyright info
 *
 */

/* 
 * Scan forward to see if this consonant is followed by a stress symbol 
 * before encounter vowel or boundary.  If so, check to see if legal cluster 
 */

#define NOCLUSTER   	0
#define CLUSTER      	1
#define CLUSTER_TRYS   	2


/*
 *      Function Name: phcluster()
 *
 *  	Description: If f & s are first and second elements of potential cluster, return 
 * 					 either CLUSTER, NOCLUSTER, or CLUSTER_TRYS 
 *					 (true and look for prior [s]) 
 *
 *      Arguments: short f,
 *				   chort s	
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
short uk_phcluster (short f, short s)
{
	switch (f)
	{
	case UKP_P:
		if ((s == UKP_LL) || (s == UKP_R))
			return (CLUSTER_TRYS);
		break;
	case UKP_B:
		if ((s == UKP_LL) || (s == UKP_R))
			return (CLUSTER);
		break;
	case UKP_F:
		if (s == UKP_R)
			return (CLUSTER_TRYS);
		if (s == UKP_LL)
			return (CLUSTER);
		break;
	case UKP_T:
		if (s == UKP_R)
			return (CLUSTER_TRYS);
		if (s == UKP_W)
			return (CLUSTER);
		break;
	case UKP_D:
	case UKP_TH:
		if ((s == UKP_R) || (s == UKP_W))
			return (CLUSTER);
		break;
	case UKP_K:
		if ((s == UKP_R) || (s == UKP_LL) || (s == UKP_W))
			return (CLUSTER_TRYS);
		break;
	case UKP_G:
		if ((s == UKP_R) || (s == UKP_LL) || (s == UKP_W))
			return (CLUSTER);
		break;
	case UKP_S:
		if ((s == UKP_W) || (s == UKP_LL) || (s == UKP_P) || (s == UKP_T)
			|| (s == UKP_K) || (s == UKP_M) || (s == UKP_N) || (s == UKP_F))
			return (CLUSTER);
		break;
	case UKP_SH:
		if ((s == UKP_W) || (s == UKP_LL) || (s == UKP_P) || (s == UKP_T)
			|| (s == UKP_R) || (s == UKP_M) || (s == UKP_N))
			return (CLUSTER);
		break;
	}
	return (NOCLUSTER);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
