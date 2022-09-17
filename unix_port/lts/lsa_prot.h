/*
 ***********************************************************************
 *                                                                      
 *                           Coryright (c)                              
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.        
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
 *    File Name:    lsa_prot.h
 *    Author:       Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *  	the acna specific prototypes                                                                           
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *  Rev Who     Date        	Description                    
 *  --- -----   ----------- 	---------------------------------------
 *  001 MGS     02/08/1996 		Renamed from altsp.h to lsa_prot.h    
 *	002 MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 * 
 */

extern int lsa_util_force_english(void);
extern void lsa_util_print_ntype(int type);
extern int lsa_util_id_name(LETTER *llp,LETTER *rlp);
extern void lsa_util_init_lang(void);
extern void lsa_util_stress_sp (PLTS_T pLts_t,PHONE *fpp, PHONE *lpp, int pstype);
extern void lsa_util_stress_sl (PLTS_T pLts_t,PHONE *fpp, PHONE *lpp, int pstype);
extern void lsa_util_stress_ja (PLTS_T pLts_t,PHONE *fpp, PHONE *lpp, int pstype);
extern void lsa_util_stress_it (PLTS_T pLts_t,PHONE *fpp, PHONE *lpp, int pstype);
extern void lsa_util_stress_gr (PLTS_T pLts_t,PHONE *fpp, PHONE *lpp, int pstype);
extern void lsa_util_stress_fr (PLTS_T pLts_t,PHONE *fpp, PHONE *lpp, int pstype);
extern int lsa_util_pcmp(PHONE *fpp, PHONE *lpp, char *p, unsigned short p_len);

