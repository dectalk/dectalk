/**********************************************************************/
/*  Function two_pole_filter                                          */
/**********************************************************************/
void two_pole_filter( short tp_input, short *tp_delay_1, short *tp_delay_2, short tp_a, short tp_b, short tp_c )
{
	int temp1;

	temp1 = tp_c * *tp_delay_2;
	*tp_delay_2 = *tp_delay_1;
	temp1 += tp_b * *tp_delay_1;
	temp1 += tp_a * tp_input;
	*tp_delay_1 = ( temp1 >> 12 );
}

/**********************************************************************/
/*  Function two_zero_filter.                                         */
/**********************************************************************/
void two_zero_filter( short tz_input, short *tz_output, short *tz_delay_1, short *tz_delay_2, short tz_a, short tz_b, short tz_c )
{
	int temp1;
	temp1 = tz_c * *tz_delay_2;
	temp1 += tz_b * *tz_delay_1;
	temp1 += tz_a * tz_input;
	*tz_delay_2 = *tz_delay_1;
	*tz_delay_1 = tz_input;
	*tz_output = ( temp1 >> 12 );
}

/**********************************************************************/
/*  Function two_zero_filter_2.                                       */
/*  This is a three zero filter, but is implemented as a special case */
/*  because one of the multipliers is 4096 (4096 = 1.0 in Q12 format. */
/*  The input and output variable is "tz_input".                      */
/**********************************************************************/

void two_zero_filter_2( short *tz_input, short *tz_delay_1, short *tz_delay_2, short tz_b, short tz_c ) 
{
	int temp0;

	temp0 = tz_c * *tz_delay_2;
	*tz_delay_2 = *tz_delay_1;
	temp0 += tz_b * *tz_delay_1;
	*tz_delay_1 = *tz_input;
	*tz_input += ( temp0 >> 12 );
}
