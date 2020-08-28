/* #include "fix_fft.h" */

/* fix_fft.c - Fixed-point Fast Fourier Transform */ 
/*
 fix_fft() perform FFT or inverse FFT
 window() applies a Hanning window to the (time) input 
 fix_loud() calculates the loudness of the signal, for
   each freq point. Result is an integer array, 
   units are dB (values will be negative).
 Sinewave[1024] sinewave normalized to 32767 (= 1.0). 
 Loudampl[100] Amplitudes for loudnesses from 0 to -99 dB. 
 Low_pass Low-pass filter, cutoff at sample_freq / 4.


 All data are fixed-point short integers, in which
 -32768 to +32768 represent -1.0 to +1.0. Integer arithmetic
 is used for speed, instead of the more natural floating-point.

 For the forward FFT (time -> freq), fixed scaling is 
 performed to prevent arithmetic overflow, and to map a 0dB 
 sine/cosine wave (i.e. amplitude = 32767) to two -6dB freq 
 coefficients; the one in the lower half is reported as 0dB 
 by fix_loud(). The return value is always 0.

 For the inverse FFT (freq -> time), fixed scaling cannot be 
 done, as two 0dB coefficients would sum to a peak amplitude of 
 64K, overflowing the 32k range of the fixed-point integers. 
 Thus, the fix_fft() routine performs variable scaling, and 
 returns a value which is the number of bits LEFT by which
 the output must be shifted to get the actual amplitude 
 (i.e. if fix_fft() returns 3, each value of fr[] and fi[] 
 must be multiplied by 8 (2**3) for proper scaling. 
 Clearly, this cannot be done within the fixed-point short 
 integers. In practice, if the result is to be used as a
 filter, the scale_shift can usually be ignored, as the 
 result will be approximately correctly normalized as is.


 Microsoft Visual C++, 32-bit; uses inline assembly for speed 
 and for carefully-scaled arithmetic.


 Written by:  Tom Roberts  11/8/89
 Modifications by:  Erik Moore 6/29/94
   In fix_loud() and db_from_ampl(),
   1) Pre-computed the squared and half shifted logarithms.  These were
      already being pre-computed every time the program was executed.  I
      just saved the values in the data structure at the end.
   2) The search for the logarithm was originally just a linear search
      that started with the first element to the last and break;'ed at a
      match.  I inserted a bisection search from Numerical Recipes in C
      (which I modified to work with C arrays 0... not Fortran arrays
      1...).
Modifications by:  e.p.carlson (15 Nov 1994)
   1) Microsoft Visual C++, Win32 (but still 16 bit DSP)
   2) Removed usused functions: fix_dot, iscale, fix_mpy
   3) Don't include dos.h
   4) __declspec(dllexport) -- 27 Mar 1995

Further modification history:

  27 Aug 1996  reb:  include flavor.h
  08 Aug 1996  reb:  archived as version 2.2 (no changes).
*/

#include "flavor.h"

typedef short fixed;

/* FIX_MPY() - fixed-point multiplication macro.
   This macro is a statement, not an expression (uses asm).
   BEWARE: make sure _DX is not clobbered by evaluating (A) or DEST. 
   args are all of type fixed.
   Scaling ensures that 32767*32767 = 32767. */
#define FIX_MPY(DEST,A,B) \
__asm {                  \
	  __asm mov dx,(B)   \
	  __asm mov ax,(A)   \
	  __asm imul dx      \
	  __asm add ax,ax    \
	  __asm adc dx,dx    \
	  __asm mov (DEST),dx  \
      }


#define N_WAVE  1024 /* dimension of Sinewave[] */
#define LOG2_N_WAVE 10 /* log2(N_WAVE) */
#define N_LOUD  100 /* dimension of Loudampl[] */ 

extern fixed Sinewave[N_WAVE]; /* placed at end of this file for clarity */ 
extern long loud2[N_LOUD];
short db_from_ampl(fixed re, fixed im);

/*
 fix_fft() - perform fast Fourier transform.

 if n>0 FFT is done, if n<0 inverse FFT is done
 fr[n],fi[n] are real,imaginary arrays, INPUT AND RESULT.
 N MUST BE A POWER OF 2!
*/
short fix_fft(fixed * fr, fixed * fi, short n)
{
  short mr,nn,i,j,l,k,m,istep, inverse, scale, shift;
  fixed qr,qi,tr,ti,wr,wi;
  fixed foo;
  
  if(n < 0) {
    inverse = 1;
    n = -n;
  } else {
    inverse = 0;
  }
  
  if(n > N_WAVE)
    return -1;
  
  mr = 0;
  nn = n - 1;
  scale = 0;
  
  /* decimation in time - re-order data */ 
  for(m=1; m<=nn; ++m) {
    l = n;
    do {
      l >>= 1;
    } while(mr+l > nn);
    mr = (mr & (l-1)) + l;
    if(mr <= m) continue;
    tr = fr[m];
    fr[m] = fr[mr];
    fr[mr] = tr;
    ti = fi[m];
    fi[m] = fi[mr];
    fi[mr] = ti;
  }
  
  l = 1;
  k = LOG2_N_WAVE-1;
  while(l < n) {
    if(inverse) {
      /* variable scaling, depending upon data */ 
      shift = 0;
      for(i=0; i<n; ++i) {
	j = fr[i];
	if(j < 0)
	  j = -j;
	m = fi[i];
	if(m < 0)
	  m = -m;
	if(j > 16383 || m > 16383) {
	  shift = 1;
	  break;
	}
      }
      if(shift)
	++scale;
    } else {
      /* fixed scaling, for proper normalization -
	 there will be log2(n) passes, so this 
	 results in an overall factor of 1/n,
	 distributed to maximize arithmetic accuracy. */
      shift = 1;
    }
    /* it may not be obvious, but the shift will be performed
       on each data point exactly once, during this pass. */
    istep = l << 1;
    for(m=0; m<l; ++m) {
      j = m << k;
      /* 0 <= j < N_WAVE/2 */
      wr =  Sinewave[j+N_WAVE/4];
      wi = -Sinewave[j];
      if(inverse)
	wi = -wi;
      if(shift) {
	wr >>= 1;
	wi >>= 1;
      }
      for(i=m; i<n; i+=istep) {
	j = i + l;
	/* tr = fix_mpy(wr,fr[j]) - fix_mpy(wi,fi[j]);*/
	foo = fr[j];
	__asm push bx
	FIX_MPY(bx,wr,foo);
	foo = fi[j];
	FIX_MPY(dx,wi,foo);
	/* tr = _BX - _DX;*/
	__asm mov ax,bx
	__asm sub ax,dx
	__asm mov tr,ax
	/* ti = fix_mpy(wr,fi[j]) + fix_mpy(wi,fr[j]);*/
	foo = fi[j];
	FIX_MPY(bx,wr,foo);
	foo = fr[j];
	FIX_MPY(dx,wi,foo);
	/* ti = _BX + _DX;*/
	__asm mov ax,bx
	__asm add ax,dx
	__asm mov ti,ax
	__asm pop bx
	qr = fr[i];
	qi = fi[i];
	if(shift) {
	  qr >>= 1;
	  qi >>= 1;
	}
	fr[j] = qr - tr;
	fi[j] = qi - ti;
	fr[i] = qr + tr;
	fi[i] = qi + ti;
      }
    }
    --k;
    l = istep;
  }
  
  return scale;
}


/* window() - apply a Hanning window */
void window(fixed * fr, short n)
{
  short i,j,k,r,t;
  
  j = N_WAVE/n;
  n >>= 1;
  for(i=0,k=N_WAVE/4; i<n; ++i,k+=j) {
  	r = fr[i];
    t = 16384 - (Sinewave[k] >> 1);
    FIX_MPY(r,r,t);
	fr[i] = r;
  }
  n <<= 1;
  for(k-=j; i<n; ++i,k-=j) {
  	r = fr[i];
    t = 16384 - (Sinewave[k] >> 1);
    FIX_MPY(r,r,t);
	fr[i] = r;
  }
}

/* fix_loud() - compute loudness of freq-spectrum components.
 n should be ntot/2, where ntot was passed to fix_fft();
 6 dB is added to account for the omitted alias components. 
 scale_shift should be the result of fix_fft(), if the time-series 
 was obtained from an inverse FFT, 0 otherwise.
 loud[] is the loudness, in dB wrt 32767; values are -99 to 0.
*/
void fix_loud(fixed * loud, fixed * fr, fixed * fi,
				    short n, short scale_shift)
{
  short i, max;
  
  max = 0;
  if(scale_shift > 0)
    max = 10;
  scale_shift = (scale_shift+1) * 6;
  
  for(i=0; i<n; ++i) {
    loud[i] = db_from_ampl(fr[i],fi[i]) + scale_shift; 
    if(loud[i] > max)
      loud[i] = max;
  }
}

/* db_from_ampl() - find loudness (in dB) from
 the complex amplitude.
*/
short db_from_ampl(fixed re, fixed im) 
{
  long v;
  short ju=N_LOUD,   // Initialize upper (allow return of -N_LOUD)
    jl=0, 	   // and lower limits.
    jm;
  /*****
    The largest sq. magnitude of the complex point is 2 * 32767^2 which is
    3dB greater than the largest point that can currently be represented by
    the array loud2[].
    This 3 dB will be clipped to 0 which is the largest possible dB value.
    *****/
  
  v = (long)re * (long)re + (long)im * (long)im;
  
  while(ju-jl > 1){
    jm=(ju+jl) >> 1;   // Compute a midpoint.
    if(v <= loud2[jm]) // Compare knowing loud2 is decreasing function
      jl=jm;
    else
      ju=jm;
  }
  return (-jl);
}

///*
// fix_mpy() - fixed-point multiplication
//*/
//fixed fix_mpy(fixed a, fixed b)
//{
//  FIX_MPY(a,a,b);
//  return a;
//}

#if N_WAVE != 1024
 ERROR: N_WAVE != 1024
#endif
fixed Sinewave[1024] = {
      0,    201,    402,    603,    804,   1005,   1206,   1406,
   1607,   1808,   2009,   2209,   2410,   2610,   2811,   3011, 
   3211,   3411,   3611,   3811,   4011,   4210,   4409,   4608, 
   4807,   5006,   5205,   5403,   5601,   5799,   5997,   6195, 
   6392,   6589,   6786,   6982,   7179,   7375,   7571,   7766, 
   7961,   8156,   8351,   8545,   8739,   8932,   9126,   9319, 
   9511,   9703,   9895,  10087,  10278,  10469,  10659,  10849,
  11038,  11227,  11416,  11604,  11792,  11980,  12166,  12353, 
  12539,  12724,  12909,  13094,  13278,  13462,  13645,  13827, 
  14009,  14191,  14372,  14552,  14732,  14911,  15090,  15268, 
  15446,  15623,  15799,  15975,  16150,  16325,  16499,  16672, 
  16845,  17017,  17189,  17360,  17530,  17699,  17868,  18036, 
  18204,  18371,  18537,  18702,  18867,  19031,  19194,  19357, 
  19519,  19680,  19840,  20000,  20159,  20317,  20474,  20631, 
  20787,  20942,  21096,  21249,  21402,  21554,  21705,  21855, 
  22004,  22153,  22301,  22448,  22594,  22739,  22883,  23027, 
  23169,  23311,  23452,  23592,  23731,  23869,  24006,  24143, 
  24278,  24413,  24546,  24679,  24811,  24942,  25072,  25201, 
  25329,  25456,  25582,  25707,  25831,  25954,  26077,  26198, 
  26318,  26437,  26556,  26673,  26789,  26905,  27019,  27132, 
  27244,  27355,  27466,  27575,  27683,  27790,  27896,  28001, 
  28105,  28208,  28309,  28410,  28510,  28608,  28706,  28802, 
  28897,  28992,  29085,  29177,  29268,  29358,  29446,  29534, 
  29621,  29706,  29790,  29873,  29955,  30036,  30116,  30195, 
  30272,  30349,  30424,  30498,  30571,  30643,  30713,  30783, 
  30851,  30918,  30984,  31049,  31113,  31175,  31236,  31297, 
  31356,  31413,  31470,  31525,  31580,  31633,  31684,  31735, 
  31785,  31833,  31880,  31926,  31970,  32014,  32056,  32097, 
  32137,  32176,  32213,  32249,  32284,  32318,  32350,  32382, 
  32412,  32441,  32468,  32495,  32520,  32544,  32567,  32588, 
  32609,  32628,  32646,  32662,  32678,  32692,  32705,  32717, 
  32727,  32736,  32744,  32751,  32757,  32761,  32764,  32766, 
  32767,  32766,  32764,  32761,  32757,  32751,  32744,  32736, 
  32727,  32717,  32705,  32692,  32678,  32662,  32646,  32628, 
  32609,  32588,  32567,  32544,  32520,  32495,  32468,  32441, 
  32412,  32382,  32350,  32318,  32284,  32249,  32213,  32176, 
  32137,  32097,  32056,  32014,  31970,  31926,  31880,  31833, 
  31785,  31735,  31684,  31633,  31580,  31525,  31470,  31413, 
  31356,  31297,  31236,  31175,  31113,  31049,  30984,  30918, 
  30851,  30783,  30713,  30643,  30571,  30498,  30424,  30349, 
  30272,  30195,  30116,  30036,  29955,  29873,  29790,  29706, 
  29621,  29534,  29446,  29358,  29268,  29177,  29085,  28992, 
  28897,  28802,  28706,  28608,  28510,  28410,  28309,  28208, 
  28105,  28001,  27896,  27790,  27683,  27575,  27466,  27355, 
  27244,  27132,  27019,  26905,  26789,  26673,  26556,  26437, 
  26318,  26198,  26077,  25954,  25831,  25707,  25582,  25456, 
  25329,  25201,  25072,  24942,  24811,  24679,  24546,  24413, 
  24278,  24143,  24006,  23869,  23731,  23592,  23452,  23311, 
  23169,  23027,  22883,  22739,  22594,  22448,  22301,  22153, 
  22004,  21855,  21705,  21554,  21402,  21249,  21096,  20942, 
  20787,  20631,  20474,  20317,  20159,  20000,  19840,  19680, 
  19519,  19357,  19194,  19031,  18867,  18702,  18537,  18371, 
  18204,  18036,  17868,  17699,  17530,  17360,  17189,  17017, 
  16845,  16672,  16499,  16325,  16150,  15975,  15799,  15623, 
  15446,  15268,  15090,  14911,  14732,  14552,  14372,  14191, 
  14009,  13827,  13645,  13462,  13278,  13094,  12909,  12724, 
  12539,  12353,  12166,  11980,  11792,  11604,  11416,  11227, 
  11038,  10849,  10659,  10469,  10278,  10087,   9895,   9703,
   9511,   9319,   9126,   8932,   8739,   8545,   8351,   8156, 
   7961,   7766,   7571,   7375,   7179,   6982,   6786,   6589, 
   6392,   6195,   5997,   5799,   5601,   5403,   5205,   5006, 
   4807,   4608,   4409,   4210,   4011,   3811,   3611,   3411, 
   3211,   3011,   2811,   2610,   2410,   2209,   2009,   1808, 
   1607,   1406,   1206,   1005,    804,    603,    402,    201,
      0,   -201,   -402,   -603,   -804,  -1005,  -1206,  -1406,
  -1607,  -1808,  -2009,  -2209,  -2410,  -2610,  -2811,  -3011, 
  -3211,  -3411,  -3611,  -3811,  -4011,  -4210,  -4409,  -4608, 
  -4807,  -5006,  -5205,  -5403,  -5601,  -5799,  -5997,  -6195, 
  -6392,  -6589,  -6786,  -6982,  -7179,  -7375,  -7571,  -7766, 
  -7961,  -8156,  -8351,  -8545,  -8739,  -8932,  -9126,  -9319, 
  -9511,  -9703,  -9895, -10087, -10278, -10469, -10659, -10849,
 -11038, -11227, -11416, -11604, -11792, -11980, -12166, -12353, 
 -12539, -12724, -12909, -13094, -13278, -13462, -13645, -13827, 
 -14009, -14191, -14372, -14552, -14732, -14911, -15090, -15268, 
 -15446, -15623, -15799, -15975, -16150, -16325, -16499, -16672, 
 -16845, -17017, -17189, -17360, -17530, -17699, -17868, -18036, 
 -18204, -18371, -18537, -18702, -18867, -19031, -19194, -19357, 
 -19519, -19680, -19840, -20000, -20159, -20317, -20474, -20631, 
 -20787, -20942, -21096, -21249, -21402, -21554, -21705, -21855, 
 -22004, -22153, -22301, -22448, -22594, -22739, -22883, -23027, 
 -23169, -23311, -23452, -23592, -23731, -23869, -24006, -24143, 
 -24278, -24413, -24546, -24679, -24811, -24942, -25072, -25201, 
 -25329, -25456, -25582, -25707, -25831, -25954, -26077, -26198, 
 -26318, -26437, -26556, -26673, -26789, -26905, -27019, -27132, 
 -27244, -27355, -27466, -27575, -27683, -27790, -27896, -28001, 
 -28105, -28208, -28309, -28410, -28510, -28608, -28706, -28802, 
 -28897, -28992, -29085, -29177, -29268, -29358, -29446, -29534, 
 -29621, -29706, -29790, -29873, -29955, -30036, -30116, -30195, 
 -30272, -30349, -30424, -30498, -30571, -30643, -30713, -30783, 
 -30851, -30918, -30984, -31049, -31113, -31175, -31236, -31297, 
 -31356, -31413, -31470, -31525, -31580, -31633, -31684, -31735, 
 -31785, -31833, -31880, -31926, -31970, -32014, -32056, -32097, 
 -32137, -32176, -32213, -32249, -32284, -32318, -32350, -32382, 
 -32412, -32441, -32468, -32495, -32520, -32544, -32567, -32588, 
 -32609, -32628, -32646, -32662, -32678, -32692, -32705, -32717, 
 -32727, -32736, -32744, -32751, -32757, -32761, -32764, -32766, 
 -32767, -32766, -32764, -32761, -32757, -32751, -32744, -32736, 
 -32727, -32717, -32705, -32692, -32678, -32662, -32646, -32628, 
 -32609, -32588, -32567, -32544, -32520, -32495, -32468, -32441, 
 -32412, -32382, -32350, -32318, -32284, -32249, -32213, -32176, 
 -32137, -32097, -32056, -32014, -31970, -31926, -31880, -31833, 
 -31785, -31735, -31684, -31633, -31580, -31525, -31470, -31413, 
 -31356, -31297, -31236, -31175, -31113, -31049, -30984, -30918, 
 -30851, -30783, -30713, -30643, -30571, -30498, -30424, -30349, 
 -30272, -30195, -30116, -30036, -29955, -29873, -29790, -29706, 
 -29621, -29534, -29446, -29358, -29268, -29177, -29085, -28992, 
 -28897, -28802, -28706, -28608, -28510, -28410, -28309, -28208, 
 -28105, -28001, -27896, -27790, -27683, -27575, -27466, -27355, 
 -27244, -27132, -27019, -26905, -26789, -26673, -26556, -26437, 
 -26318, -26198, -26077, -25954, -25831, -25707, -25582, -25456, 
 -25329, -25201, -25072, -24942, -24811, -24679, -24546, -24413, 
 -24278, -24143, -24006, -23869, -23731, -23592, -23452, -23311, 
 -23169, -23027, -22883, -22739, -22594, -22448, -22301, -22153, 
 -22004, -21855, -21705, -21554, -21402, -21249, -21096, -20942, 
 -20787, -20631, -20474, -20317, -20159, -20000, -19840, -19680, 
 -19519, -19357, -19194, -19031, -18867, -18702, -18537, -18371, 
 -18204, -18036, -17868, -17699, -17530, -17360, -17189, -17017, 
 -16845, -16672, -16499, -16325, -16150, -15975, -15799, -15623, 
 -15446, -15268, -15090, -14911, -14732, -14552, -14372, -14191, 
 -14009, -13827, -13645, -13462, -13278, -13094, -12909, -12724, 
 -12539, -12353, -12166, -11980, -11792, -11604, -11416, -11227, 
 -11038, -10849, -10659, -10469, -10278, -10087,  -9895,  -9703,
  -9511,  -9319,  -9126,  -8932,  -8739,  -8545,  -8351,  -8156, 
  -7961,  -7766,  -7571,  -7375,  -7179,  -6982,  -6786,  -6589, 
  -6392,  -6195,  -5997,  -5799,  -5601,  -5403,  -5205,  -5006, 
  -4807,  -4608,  -4409,  -4210,  -4011,  -3811,  -3611,  -3411, 
  -3211,  -3011,  -2811,  -2610,  -2410,  -2209,  -2009,  -1808, 
  -1607,  -1406,  -1206,  -1005,   -804,   -603,   -402,   -201
};

#if N_LOUD != 100
 ERROR: N_LOUD != 100
#endif

/*****
  This Loudampl conversion is computed with the assumption that 32767 is
  the reference dB level.  The next point is the amplitude which corresponds
  to 1 dB less than the dB at 32767 and so on down the table.  Searching
  on the table is done in a reversed sense since the highest index
  corresponds to the lowest dB value.
  
fixed Loudampl[100] = {
  32767,  29203,  26027,  23197,  20674,  18426,  16422,  14636, 
  13044,  11626,  10361,   9234,   8230,   7335,   6537,   5826,
   5193,   4628,   4125,   3676,   3276,   2920,   2602,   2319, 
   2067,   1842,   1642,   1463,   1304,   1162,   1036,    923,
    823,    733,    653,    582,    519,    462,    412,    367, 
    327,    292,    260,    231,    206,    184,    164,    146, 
    130,    116,    103,     92,     82,     73,     65,     58,
     51,     46,     41,     36,     32,     29,     26,     23, 
     20,     18,     16,     14,     13,     11,     10,      9,
      8,      7,      6,      5,      5,      4,      4,      3, 
      3,      2,      2,      2,      2,      1,      1,      1, 
      1,      1,      1,      0,      0,      0,      0,      0, 
      0,      0,      0,      0,
};
  To compute the dB of the magnitude squared it is useful to have the
  squared dB values of the data above.  The magnitude squared
  values of the data are computed with the bins shifted by 1/2
  by the following;

  loud2[0] = (long)Loudampl[0] * (long)Loudampl[0]; 
  for(i=1; i<N_LOUD; ++i) {
    v = (long)Loudampl[i] * (long)Loudampl[i]; 
    loud2[i] = v;
    loud2[i-1] = (loud2[i-1]+v) / 2;
  }
*****/
  
long loud2[100] = {
  963245749L,  765109969L,  607752769L,  482757542L,  383465876L,
  304599780L,  241947290L,  192179216L,  152654906L,  121257098L,
   96308538L,   76499828L,   60767562L,   48267297L,   38337322L,
   30454762L,   24192816L,   19217004L,   15264300L,   12122576L,
    9629288L,    7648402L,    6074082L,    4825125L,    3832726L,
    3044564L,    2418266L,    1920392L,    1525330L,    1211770L,
     962612L,     764629L,     607309L,     481849L,     382566L,
     304042L,     241402L,     191594L,     152216L,     120809L,
      96096L,      76432L,      60480L,      47898L,      38146L,
      30376L,      24106L,      19108L,      15178L,      12032L,
       9536L,       7594L,       6026L,       4777L,       3794L,
       2982L,       2358L,       1898L,       1488L,       1160L,
        932L,        758L,        602L,        464L,        362L,
        290L,        226L,        182L,        145L,        110L,
         90L,         72L,         56L,         42L,         30L,
         25L,         20L,         16L,         12L,          9L,
          6L,          4L,          4L,          4L,          2L,
          1L,          1L,          1L,          1L,          1L,
          0L,          0L,          0L,          0L,          0L,
          0L,          0L,          0L,          0L,          0L
};
