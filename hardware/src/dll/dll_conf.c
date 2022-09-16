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
 *    File Name:	dll_conf.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  dtpcFindModules() is used to find installed DECtalk-PC modules and
 *  set up the dtc[] data structure for it.
 *
 ***********************************************************************
 *    Revision History:
 */

#include "dll.h"

#define	NO_MODULE		(0)
#define	IN_SELF_TEST	(1)
#define	IN_INIT			(2)
#define	FOUND_IRQ		(3)

#define	GET_STATUS(x)		((unsigned int)((_inp((x)+1)<<8)+_inp((x))))
#define	PUT_COMMAND(x,y)	{			\
	_outp((x),(y&0xff));					\
	_outp((x)+1,((y>>8)&0xff));			\
	}
volatile int num_mod;


int _dtpcFindModules()
{
	unsigned int bases[4] = { 0x240, 0x250, 0x340, 0x350 };
	int	i,done;
	int	found_base[4];
	

	for(i=0;i<4;i++)
		found_base[i] = NO_MODULE;
	num_mod = 0;

/*
 *  first, look at all the bases
 */

	for(i=0;i<4;i++)
		{
		switch(GET_STATUS(bases[i]))
			{
			case MODULE_self_test	:
				found_base[i] = IN_SELF_TEST;
				break;
			case MODULE_init			:
				found_base[i] = IN_INIT;
				break;
			}
		}

/*
 *  now, init all the non-responders ...
 */

	for(i=0;i<4;i++)
		if(found_base[i] == NO_MODULE)
			PUT_COMMAND(bases[i],MODULE_reset);

/*
 *  now, wait one second for every one to either be in init or selftest
 */
		_dtpcSetTimeout(5);
		while(_dtpcCheckTimeout() == false)
			{
			for(i=0;i<4;i++)
				if(found_base[i] == 0)
					{
					switch(GET_STATUS(bases[i])) {

						case MODULE_self_test:
							found_base[i] = IN_SELF_TEST;
							break;

						case MODULE_init:
							found_base[i] = IN_INIT;
							break;
						}
					}
			}
/*
 *  now, wait up to 15 seconds for all selftests to finish
 */

		_dtpcSetTimeout(15);
		while(_dtpcCheckTimeout() == false)
			{
			done = true;
			for(i=0;i<4;i++)
				if(found_base[i] == IN_SELF_TEST)
					{
					if(GET_STATUS(bases[i]) == MODULE_init)
						found_base[i] = IN_INIT;
					else
						done = false;
					}
			if(done)
				break;
			}
/*
 *  now, run through the dtc structures and add the bases that we found ...
 */
		for(i=0;i<4;i++)
			if(found_base[i] == IN_INIT)
				{
				dtc[num_mod].base = bases[i];
				dtc[num_mod].status = 0;
				dtc[num_mod].module_status = 0;
				dtc[num_mod].command = MODULE_init;
				dtc[num_mod].error_status = 0;
				dtc[num_mod].id = ID_boot;
				dtc[num_mod].dma_flop = 0;
				dtc[num_mod].loaded = false;
				dtc[num_mod].lastindex = 0xffff;
				dtc[num_mod].ds.settings_loaded=false;
				num_mod++;
				dtc[num_mod].status = 0;
				}
		return(num_mod);
}
