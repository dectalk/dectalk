/**********************************************************************/
/*                                                                    */
/*  Include File: vtmfunc.h                                           */
/*                                                                    */
/*  This include declares functions used by the DECtalk vocal tract   */
/*  model vtm.c                                                       */
// 001 4/8.98 Yubing Wang Added notch filter 

/**********************************************************************/

/**********************************************************************/
/*  Function two_zero_filter.                                         */
/**********************************************************************/
#include "kernel.h"		   /* For PKSD_T MVP MI */
#include "vtminst.h"	   /* MVP MI */

#define  two_zero_filter( tz_input, \
                          tz_output, \
                          tz_delay_1, \
                          tz_delay_2, \
                          tz_a, \
                          tz_b, \
                          tz_c ) \
  temp1 = tz_c * (S32)tz_delay_2; \
  temp1 += tz_b * (S32)tz_delay_1; \
  temp1 += tz_a * (S32)tz_input; \
  tz_delay_2 = tz_delay_1; \
  tz_delay_1 = tz_input; \
  tz_output = (S32)( temp1 >> 12 );

/**********************************************************************/

#define Notch_Filter(tn_input,\
                     tnp_delay_1,\
					 tnp_delay_2,\
                     tnz_delay_1,\
					 tnz_delay_2,\
					 tn_a,\
					 tn_b,\
					 tn_c,\
					 tn_gain)\
  tem0 = tn_gain * (S32)tnz_delay_2;\
  tem0 += tn_a * (S32)tnz_delay_1;\
  tem0 += tn_gain * (S32)tn_input;\
  tnz_delay_2 = tnz_delay_1;\
  tnz_delay_1 = tn_input; \
  tem1 = tn_c * (S32)tnp_delay_2;\
  tnp_delay_2 = tnp_delay_1; \
  tem1 += tn_b * (S32)tnp_delay_1; \
  tem1 += tem0; \
  tnp_delay_1 = (S16)( tem1 >> 12 );\



/**********************************************************************/
/*  Function two_zero_filter_2.                                       */
/*  This is a three zero filter, but is implemented as a special case */
/*  because one of the multipliers is 4096 (4096 = 1.0 in Q12 format. */
/*  The input and output variable is "tz_input".                      */
/**********************************************************************/

#define  two_zero_filter_2( tz_input, \
                            tz_delay_1, \
                            tz_delay_2, \
                            tz_b, \
                            tz_c ) \
  temp0 = tz_c * (S32)tz_delay_2; \
  temp0 += tz_b * (S32)tz_delay_1; \
  tz_delay_2 = tz_delay_1; \
  tz_delay_1 = tz_input; \
  tz_input += (S16)( temp0 >> 12 );

/**********************************************************************/
/*  Function two_pole_filter                                          */
/**********************************************************************/

#define  two_pole_filter( tp_input, \
                          tp_delay_1, \
                          tp_delay_2, \
                          tp_a, \
                          tp_b, \
                          tp_c ) \
  temp1 = tp_c * (S32)tp_delay_2; \
  tp_delay_2 = tp_delay_1; \
  temp0 = tp_b * (S32)tp_delay_1; \
  temp1 += temp0; \
  temp0 = tp_a * (S32)tp_input; \
  temp1 += temp0; \
  tp_delay_1 = (S32)( temp1 >> 12 );

/**********************************************************************/
/*                                                                    */
/*  Function: d2pole_cf45                                             */
/*                                                                    */
/*  Convert formant bandwidth into resonator difference equation      */
/*  constants "acoef, bcoef, and ccoef".                              */
/*                                                                    */
/*  If the filter response extends to over Fs/2 then this function    */
/*  will make the filter an all pass filter with unity gain. This is  */
/*  used only for the cascade filters for formants 4 and 5.           */
/*                                                                    */
/**********************************************************************/

S16 radius;    /*  Radius of pole locations                           */

S16 d2pole_cf45( PVTM_T pVtm_t,
				 S16 * bcoef,
                 S16 * ccoef,
                 S16 frequency,
                 S16 bandwidth,
                 S16 gain )
{
  S16 acoef;

  /********************************************************************/
  /*  Scale the frequency and bandwidth if the sample rate is not     */
  /*  10 KHz.                                                         */
  /********************************************************************/

  if ( pVtm_t->uiSampleRateChange == SAMPLE_RATE_DECREASE )
  {
    frequency = frac1mul( pVtm_t->inv_rate_scale, frequency ) << 1;
    bandwidth = frac1mul( pVtm_t->inv_rate_scale, bandwidth ) << 1;
  }
  else
  {
    if ( pVtm_t->uiSampleRateChange == SAMPLE_RATE_INCREASE )
    {
      frequency = frac1mul( pVtm_t->inv_rate_scale, frequency );
      bandwidth = frac1mul( pVtm_t->inv_rate_scale, bandwidth );
    }
  }

  /********************************************************************/
  /*  Zap resonator if center frequency above maximum frequency.      */ 
  /********************************************************************/

  {
    /******************************************************************/
    /*  calculate radius = exp( -pi * T * bandwidth ).                */
    /******************************************************************/

    radius = radius_table[bandwidth >> 3];

    /******************************************************************/
    /*  bcoef = radius * 2 * cos( 2* pi * T * frequency )             */
    /******************************************************************/

    *bcoef = frac4mul( radius, cosine_table[ frequency >> 3 ] );

    /******************************************************************/
    /*  Let ccoef = - r^2                                             */
    /******************************************************************/

    *ccoef = - frac4mul( radius, radius );
  }

  /********************************************************************/
  /*  Let acoef = 1.0 - bcoef - ccoef                                 */
  /********************************************************************/

  pVtm_t->temp = 4096 - *bcoef - *ccoef;
  
  /********************************************************************/
  /*  Adjust "acoef" by the gain term to keep output signal of the    */
  /*  resonator in the high-order bits.                               */
  /********************************************************************/

  acoef = frac4mul( gain, pVtm_t->temp ) << 1;

  return( acoef );
}

/**********************************************************************/
/*                                                                    */
/*  Function: d2pole_cf123                                            */
/*                                                                    */
/*  Convert formant bandwidth into resonator difference equation      */
/*  constants "acoef, bcoef, and ccoef".                              */
/*                                                                    */
/*  If the filter response extends to over Fs/2 then this function    */
/*  will set the filter center frequency to Fs/2 and make the         */
/*  bandwidth Fs/4. This is used for cascade formants 1, 2, and 3.    */
/*  If the formant frequency move over Fs/2, this function will cause */
/*  the filter to be effectively removed (over a short filter decay   */
/*  time) without causing an abrupt gain change.                      */
/*                                                                    */
/**********************************************************************/

S32 d2pole_cf123( PVTM_T pVtm_t,
				  PKSD_T pKsd_t,
				  S16 * bcoef,
                  S16 * ccoef,
                  S16 frequency,
                  S16 bandwidth,
                  S16 gain )
{
  S32 acoef;

  /********************************************************************/
  /*  Scale the frequency and bandwidth if the sample rate is not     */
  /*  10 KHz.                                                         */
  /********************************************************************/

  if ( pVtm_t->uiSampleRateChange == SAMPLE_RATE_DECREASE )
  {
	  frequency = frac1mul( pVtm_t->inv_rate_scale, frequency ) << 1;
	  bandwidth = frac1mul( pVtm_t->inv_rate_scale, bandwidth ) << 1;
  }
  else
  {
	  if ( pVtm_t->uiSampleRateChange == SAMPLE_RATE_INCREASE )
	  {
		  frequency = frac1mul( pVtm_t->inv_rate_scale, frequency );
		  bandwidth = frac1mul( pVtm_t->inv_rate_scale, bandwidth );
	  }
  }

  /********************************************************************/
  /*  Zap resonator if center frequency above maximum frequency.      */ 
  /********************************************************************/

  if ( frequency >= 4500 )
  {
    frequency = pKsd_t->uiSampleRate >> 1;
    bandwidth = pKsd_t->uiSampleRate >> 2;
  }

  /********************************************************************/
  /*  calculate radius = exp( -pi * T * bandwidth ).                  */
  /********************************************************************/

  radius = radius_table[bandwidth >> 3];

  /********************************************************************/
  /*  bcoef = radius * 2 * cos( 2* pi * T * frequency )               */
  /********************************************************************/

  *bcoef = frac4mul( radius, cosine_table[ frequency >> 3 ] );

  /********************************************************************/
  /*  Let ccoef = - r^2                                               */
  /********************************************************************/

  *ccoef = - frac4mul( radius, radius );

  /********************************************************************/
  /*  Let acoef = 1.0 - bcoef - ccoef                                 */
  /********************************************************************/

  pVtm_t->temp = 4096 - *bcoef - *ccoef;
  
  /********************************************************************/
  /*  Adjust "acoef" by the gain term to keep output signal of the    */
  /*  resonator in the high-order bits.                               */
  /********************************************************************/

  acoef = frac4mul( gain, pVtm_t->temp ) << 1;
  
  
  return( acoef );
}

/**********************************************************************/
/*                                                                    */
/*  Function: d2pole_pf                                               */
/*                                                                    */
/*  Convert formant bandwidth into resonator difference equation      */
/*  constants "acoef, bcoef, and ccoef".                              */
/*                                                                    */
/*  If the filter response extends to over Fs/2 then this function    */
/*  will set the filter gain to zero to remove the filter. This is    */
/*  used for the parallel filters (Except P6 which is used to         */
/*  to generate the 'S' sound.)                                       */
/*                                                                    */
/**********************************************************************/

S16 d2pole_pf( PVTM_T pVtm_t,
			   S16 * bcoef,
               S16 * ccoef,
               S16 frequency,
               S16 bandwidth,
               S16 gain )
{
  S16 acoef;

  /********************************************************************/
  /*  Scale the frequency and bandwidth if the sample rate is not     */
  /*  10 KHz.                                                         */
  /********************************************************************/

  if ( pVtm_t->uiSampleRateChange == SAMPLE_RATE_DECREASE )
  {
    frequency = frac1mul( pVtm_t->inv_rate_scale, frequency ) << 1;
    bandwidth = frac1mul( pVtm_t->inv_rate_scale, bandwidth ) << 1;
  }
  else
  {
    if ( pVtm_t->uiSampleRateChange == SAMPLE_RATE_INCREASE )
    {
      frequency = frac1mul( pVtm_t->inv_rate_scale, frequency );
      bandwidth = frac1mul( pVtm_t->inv_rate_scale, bandwidth );
    }
  }

  /********************************************************************/
  /*  Zap resonator if center frequency above maximum frequency.      */ 
  /********************************************************************/


  {
    /******************************************************************/
    /*  calculate radius = exp( -pi * T * bandwidth ).                */
    /******************************************************************/

    radius = radius_table[bandwidth >> 3];

    /******************************************************************/
    /*  bcoef = radius * 2 * cos( 2* pi * T * frequency )             */
    /******************************************************************/

    *bcoef = frac4mul( radius, cosine_table[ frequency >> 3 ] );

    /******************************************************************/
    /*  Let ccoef = - r^2                                             */
    /******************************************************************/

    *ccoef = - frac4mul( radius, radius );

    /******************************************************************/
    /*  Let acoef = 1.0 - bcoef - ccoef                               */
    /******************************************************************/

    pVtm_t->temp = 4096 - *bcoef - *ccoef;
  
    /******************************************************************/
    /*  Adjust "acoef" by the gain term to keep output signal of the  */
    /*  resonator in the high-order bits.                             */
    /******************************************************************/

    acoef = frac4mul( gain, pVtm_t->temp ) << 1;
  }
  return( acoef );
}


void Notch_fc( PVTM_T pVtm_t,
			   S16 * bcoef,
               S16 * ccoef,
			   S16 * acoef,
               S16 frequency,
               S16 bandwidth,
			   S16 gain
                  )
{
    
    /******************************************************************/
    /*  calculate radius = exp( -pi * T * bandwidth ).                */
    /******************************************************************/

    radius = radius_table[bandwidth >> 3];

    /******************************************************************/
    /*  bcoef = radius * 2 * cos( 2* pi * T * frequency )             */
    /******************************************************************/

    *bcoef = frac4mul( radius, cosine_table[ frequency >> 3 ] );

    /******************************************************************/
    /*  Let ccoef = - r^2                                             */
    /******************************************************************/

    *ccoef = - frac4mul( radius, radius );

    /******************************************************************/
    /*  Let acoef = 1.0 - bcoef - ccoef                               */
    /******************************************************************/

    *acoef = - frac4mul(gain,cosine_table[ frequency >> 3 ]);
  
   
}
