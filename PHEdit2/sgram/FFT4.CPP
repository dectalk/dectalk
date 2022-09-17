//**********************************************************************
//**********************************************************************
//  Class Implementation File: FFT4.cpp
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  Abstract:
//
//    This file contains the class implementation for class FFT4_C.
//
//**********************************************************************
//**********************************************************************

#include "stdafx.h"

#include <math.h>
#include "FFT4.h"
#include "MathConstant.h"

#ifndef TRUE
#define TRUE   1
#endif

#ifndef FALSE
#define FALSE  0
#endif

//**********************************************************************
//**********************************************************************
//  Static Data Member declarations.
//**********************************************************************
//**********************************************************************

unsigned int FFT4_C::m_uiReferenceCount = 0;
unsigned int FFT4_C::m_uiMaximumFFTsize = 0;
FFT_Float_T * FFT4_C::m_pCosine_1 = 0;
FFT_Float_T * FFT4_C::m_pSine_1 = 0;
FFT_Float_T * FFT4_C::m_pCosine_2 = 0;
FFT_Float_T * FFT4_C::m_pSine_2 = 0;
FFT_Float_T * FFT4_C::m_pCosine_3 = 0;
FFT_Float_T * FFT4_C::m_pSine_3 = 0;

//**********************************************************************
//**********************************************************************
//  Constructor: FFT4_C::FFT4_C
//  Author: Bill Hallahan
//  Date: June 28, 1995
//**********************************************************************
//**********************************************************************

FFT4_C::FFT4_C( unsigned int uiMaximumFFTsize )
  : m_pReorderData( 0 )
{
  if (( 0 == m_uiReferenceCount++ )
    || ( uiMaximumFFTsize > m_uiMaximumFFTsize ))
  {
    SetMaximumSize( uiMaximumFFTsize );
  }
  else
  {
    //******************************************************************
    //  Allocate a temporary array that is used to reorder the data.
    //******************************************************************

    m_pReorderData = new FFT_Float_T [uiMaximumFFTsize << 1];
  }
}

//**********************************************************************
//**********************************************************************
//  Destructor: FFT4_C::~FFT4_C
//  Author: Bill Hallahan
//  Date: June 28, 1995
//**********************************************************************
//**********************************************************************

FFT4_C::~FFT4_C()
{
  delete [] m_pReorderData;

  if ( 0 == --m_uiReferenceCount )
  {
    FreeTrigTableMemory();
  }
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::FreeMemory
//  Author: Bill Hallahan
//  Date: July 18, 1995
//**********************************************************************
//**********************************************************************

void FFT4_C::FreeTrigTableMemory()
{
  delete [] m_pCosine_1;
  m_pCosine_1 = 0;

  delete [] m_pSine_1;
  m_pSine_1 = 0;

  delete [] m_pCosine_2;
  m_pCosine_2 = 0;

  delete [] m_pSine_2;
  m_pSine_2 = 0;

  delete [] m_pCosine_3;
  m_pCosine_3 = 0;

  delete [] m_pSine_3;
  m_pSine_3 = 0;

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::SetMaximumSize
//  Author: Bill Hallahan
//  Date: June 28, 1995
//**********************************************************************
//**********************************************************************

unsigned int FFT4_C::SetMaximumSize( unsigned int uiMaximumFFTsize )
{
  unsigned int bMemoryError = FALSE;

  FreeTrigTableMemory();

  //********************************************************************
  //  Allocate a temporary array that is used to reorder the data.
  //********************************************************************

  delete m_pReorderData;
  m_pReorderData = new FFT_Float_T [uiMaximumFFTsize << 1];

  if ( 0 == m_pReorderData )
  {
    FreeTrigTableMemory();
    bMemoryError = TRUE;
  }

  //********************************************************************
  //  Allocate memory for the cosine angle terms.
  //********************************************************************

  if ( ! bMemoryError )
  {
    m_pCosine_1 = new FFT_Float_T [uiMaximumFFTsize >> 1];

    if ( 0 == m_pCosine_1 )
    {
      FreeTrigTableMemory();
      bMemoryError = TRUE;
    }
  }

  //********************************************************************
  //  Allocate memory for the sine angle terms.
  //********************************************************************

  if ( ! bMemoryError )
  {
    m_pSine_1 = new FFT_Float_T [uiMaximumFFTsize >> 1];

    if ( 0 == m_pSine_1 )
    {
      FreeTrigTableMemory();
      bMemoryError = TRUE;
    }
  }

  //********************************************************************
  //  Allocate memory for the cosine double angle terms.
  //********************************************************************

  if ( ! bMemoryError )
  {
    m_pCosine_2 = new FFT_Float_T [uiMaximumFFTsize >> 2];

    if ( 0 == m_pCosine_2 )
    {
      FreeTrigTableMemory();
      bMemoryError = TRUE;
    }
  }

  //********************************************************************
  //  Allocate memory for the sine double angle terms.
  //********************************************************************

  if ( ! bMemoryError )
  {
    m_pSine_2 = new FFT_Float_T [uiMaximumFFTsize >> 2];

    if ( 0 == m_pSine_2 )
    {
      FreeTrigTableMemory();
      bMemoryError = TRUE;
    }
  }

  //********************************************************************
  //  Allocate memory for the cosine triple angle terms.
  //********************************************************************

  if ( ! bMemoryError )
  {
    m_pCosine_3 = new FFT_Float_T [uiMaximumFFTsize >> 2];

    if ( 0 == m_pCosine_3 )
    {
      FreeTrigTableMemory();
      bMemoryError = TRUE;
    }
  }

  //********************************************************************
  //  Allocate memory for the sine triple angle terms.
  //********************************************************************

  if ( ! bMemoryError )
  {
    m_pSine_3 = new FFT_Float_T [uiMaximumFFTsize >> 2];

    if ( 0 == m_pSine_3 )
    {
      FreeTrigTableMemory();
      bMemoryError = TRUE;
    }
  }

  //********************************************************************
  //  Calculate trig table values.
  //********************************************************************

  if ( ! bMemoryError )
  {
    double AngleIncrement = MathConstant_C::m_TwoPi / uiMaximumFFTsize;

    for ( unsigned int uiI = 0; uiI < uiMaximumFFTsize >> 1; uiI++ )
    {
      double Angle = AngleIncrement * double( uiI );
      m_pCosine_1[uiI] = FFT_Float_T( cos( Angle ));
      m_pSine_1[uiI] = FFT_Float_T( sin( Angle ));
    }

    for ( uiI = 0; uiI < uiMaximumFFTsize >> 2; uiI++ )
    {
      double Angle = AngleIncrement * double( uiI );
      m_pCosine_2[uiI] = FFT_Float_T( cos( 2.0 * Angle ));
      m_pSine_2[uiI] = FFT_Float_T( sin( 2.0 * Angle ));
      m_pCosine_3[uiI] = FFT_Float_T( cos( 3.0 * Angle ));
      m_pSine_3[uiI] = FFT_Float_T( sin( 3.0 * Angle ));
    }

    m_uiMaximumFFTsize = uiMaximumFFTsize;
  }

  return bMemoryError;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::FFT_Real
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs the Fast Fourier Transform for real value
//  only input. Since the output spectrum is conjugate symmetric for
//  real data it is only necessary to calculate the positive frequency
//  spectrum. Thus uiFFTsize real points will result in uiFFTsize/2
//  complex frequency values. An uiFFTsize/2 point complex transform
//  is performed by function "FFT_DIT_Complex" and then an extra pass
//  is performed that results in the uiFFTsize/2 complex frequency
//  values.
//
//**********************************************************************
//**********************************************************************

void FFT4_C::FFT_Real( FFT_Float_T Data[],
                       unsigned int uiLength )
{
  FFT_Real_Plus_Pi_Bin( Data, uiLength );

  Data[1] = FFT_Float_T( 0.0 );
  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::FFT_Real_Plus_Pi_Bin
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs the Fast Fourier Transform for real value
//  only input. Since the output spectrum is conjugate symmetric for
//  real data it is only necessary to calculate the positive frequency
//  spectrum. Thus uiFFTsize real points will result in uiFFTsize/2
//  complex frequency values. An uiFFTsize/2 point complex transform
//  is performed by function "FFT_DIT_Complex" and then an extra pass
//  is performed that results in the uiFFTsize/2 complex frequency
//  values.
//
//  The complex value corresponding to a frequency of Pi radians
//  is missing from the returned spectrum. Since the FFT of real
//  data results in the imaginary term of the DC frequency bin
//  being equal to zero, the value of the real frequency bin in
//  the complex FFT is stored in the location corresponding to the
//  imaginary term of the DC frequency value (the second location in
//  the FFT array.) The imaginary term of the the frequency
//  of Pi radians is always equal to zero for the FFT of real data.
//
//**********************************************************************
//**********************************************************************

void FFT4_C::FFT_Real_Plus_Pi_Bin( FFT_Float_T Data[],
                                   unsigned int uiLength )
{
  //********************************************************************
  //  If uiFFTsize is not a power of two, then force the length to
  //  the next highest power of two.
  //********************************************************************

  unsigned int uiFFTsize = 1 << LogBaseTwo( uiLength );

  //********************************************************************
  //  First perform a uiFFTsize/2 point complex FFT using the real
  //  data. The real terms have even indices and the imaginary terms
  //  have odd indices.
  //********************************************************************

  unsigned int uiFFTsizeDivTwo = uiFFTsize >> 1;

  Reorder_DIT( Data, uiFFTsizeDivTwo );

  FFT_DIT_Complex( Data, uiFFTsizeDivTwo );

  //********************************************************************
  //  Generate the real transform from the uiFFTsize/2 point complex
  //  transform. Only the first uiFFTsize/2 complex samples are
  //  calculated.
  //********************************************************************

  FFT_Float_T Temp = Data[0] + Data[1];
  Data[1] = Data[0] - Data[1];
  Data[0] = Temp;

  FFT_Float_T * pImag = &Data[1];

  unsigned int uiAngleIncrement =
    m_uiMaximumFFTsize >> LogBaseTwo( uiFFTsize );

  unsigned int uiAngleIndex = uiAngleIncrement;

  for ( unsigned int uiI = 2, uiM = uiFFTsize - 2;
        uiI <= uiFFTsizeDivTwo;
        uiI += 2 )
  {
    FFT_Float_T Wr = m_pCosine_1[uiAngleIndex];
    FFT_Float_T Wi = m_pSine_1[uiAngleIndex];

    FFT_Float_T Rn = Data[uiI] - Data[uiM];
    FFT_Float_T Tp = pImag[uiI] + pImag[uiM];

    FFT_Float_T Pr = Wr * Tp - Wi * Rn;
    FFT_Float_T Pi = Wr * Rn + Wi * Tp;

    FFT_Float_T Rp = Data[uiI] + Data[uiM];
    FFT_Float_T Tn = pImag[uiI] - pImag[uiM];

    Data[uiI] = FFT_Float_T( 0.5 ) * ( Rp + Pr );
    pImag[uiI] = FFT_Float_T( 0.5 ) * ( Tn - Pi );

    Data[uiM] = FFT_Float_T( 0.5 ) * ( Rp - Pr );
    pImag[uiM] = FFT_Float_T( 0.5 ) * ( -Tn - Pi );

    uiAngleIndex += uiAngleIncrement;

    uiM -= 2;
  }

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::FFT_DIT_Complex
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs a mixed radix 4 and radix 2 decimation in
//  time version of the Fast Fourier Transform. The number of complex
//  data points equals uiFFTsize. If the FFT length is not a power of
//  4 then an extra radix 2 pass is performed on the data. The data
//  should be reordered by the Reorder_DIT function before calling this
//  function.
//**********************************************************************
//**********************************************************************

void FFT4_C::FFT_DIT_Complex( FFT_Float_T Data[],
                              unsigned int uiLength )
{
  //********************************************************************
  //  If uiFFTsize is not a power of two, then force the length to
  //  the next highest power of two.
  //********************************************************************

  unsigned int uiPowerOfTwo = LogBaseTwo( uiLength );
  unsigned int uiFFTsize = 1 << uiPowerOfTwo;

  //********************************************************************
  //  Determine if the FFT can be done using only radix 4 butterflies.
  //********************************************************************

  if ( uiPowerOfTwo & 1 )
  {
    //******************************************************************
    //  "uiFFTsize" is 2 times a power of 4. Perform 2 radix 4 FFTs
    //  followed by a radix 2 pass on the data.
    //******************************************************************

    if ( uiFFTsize > 2 )
    {
      unsigned int uiFFTsizeDivTwo = uiFFTsize >> 1;

      FFT_DIT_RadixFour( Data, uiFFTsizeDivTwo );

      FFT_DIT_RadixFour( &Data[uiFFTsize], uiFFTsizeDivTwo );
    }

    //******************************************************************
    //  Final radix 2 butterflies.
    //******************************************************************

    unsigned int uiAngleIncrement = m_uiMaximumFFTsize >> uiPowerOfTwo;
    unsigned int uiAngleIndex = 0;

    FFT_Float_T * pImag_0 = &Data[1];
    FFT_Float_T * pReal_1 = &Data[uiFFTsize];
    FFT_Float_T * pImag_1 = pReal_1 + 1;

    for ( unsigned int uiK = 0; uiK < uiFFTsize; uiK += 2 )
    {
      FFT_Float_T Wr = m_pCosine_1[uiAngleIndex];
      FFT_Float_T Wi = m_pSine_1[uiAngleIndex];

      //****************************************************************
      //  Radix 2 Decimation in Time butterfly.
      //  (complex conjugate multiplies)
      //****************************************************************

      FFT_Float_T Rtemp = Wr * pReal_1[uiK] + Wi * pImag_1[uiK];
      FFT_Float_T Itemp = Wr * pImag_1[uiK] - Wi * pReal_1[uiK];

      pReal_1[uiK] = Data[uiK] - Rtemp;
      pImag_1[uiK] = pImag_0[uiK] - Itemp;

      Data[uiK] = Data[uiK] + Rtemp;
      pImag_0[uiK] = pImag_0[uiK] + Itemp;

      uiAngleIndex += uiAngleIncrement;
    }
  }
  else
  {
    FFT_DIT_RadixFour( Data, uiFFTsize );
  }

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::FFT_DIT_RadixFour
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs a radix 4 decimation in time version of the
//  Fast Fourier Transform. The number of complex data points equals
//  4^uiNumberOfPasses. The data should be reordered by the
//  RadixFourReorder function before calling this function.
//**********************************************************************
//**********************************************************************

void FFT4_C::FFT_DIT_RadixFour( FFT_Float_T Data[],
                                unsigned int uiLength )
{
  //********************************************************************
  //  If uiFFTsize is not a power of 4, then force the length to
  //  the next highest power of 4.
  //  uiNumberOfPasses = The log base 4 of uiFFTsize
  //********************************************************************

  unsigned int uiNumberOfPasses = LogBaseFour( uiLength );
  unsigned int uiFFTsize = 1 << ( uiNumberOfPasses << 1 );

  //********************************************************************
  //  Pass loop initialization.
  //********************************************************************

  FFT_Float_T * pImag_0 = &Data[1];
  unsigned int uiAngleIncrement = m_uiMaximumFFTsize >> 2;
  unsigned int uiRepeatTimesTwo = 2;

  //********************************************************************
  //  Initial pass with special butterflies for Angle = 0
  //********************************************************************

  unsigned int uiIncrementTimesTwo = uiRepeatTimesTwo << 2;

  FFT_Float_T * pReal_1 = &Data[0] + uiRepeatTimesTwo;
  FFT_Float_T * pReal_2 = pReal_1 + uiRepeatTimesTwo;
  FFT_Float_T * pReal_3 = pReal_2 + uiRepeatTimesTwo;
  FFT_Float_T * pImag_1 = pReal_1 + 1;
  FFT_Float_T * pImag_2 = pReal_2 + 1;
  FFT_Float_T * pImag_3 = pReal_3 + 1;

  for ( unsigned int uiK = 0;
        uiK < uiFFTsize << 1;
        uiK += uiIncrementTimesTwo )
  {
    //******************************************************************
    //  Radix 4 Decimation In Time butterfly for W = 0
    //******************************************************************

    FFT_Float_T Tr0 = Data[uiK] + pReal_2[uiK];
    FFT_Float_T Ti0 = pImag_0[uiK] + pImag_2[uiK];

    FFT_Float_T Tr1 = Data[uiK] - pReal_2[uiK];
    FFT_Float_T Ti1 = pImag_0[uiK] - pImag_2[uiK];

    FFT_Float_T Tr2 = pReal_1[uiK] + pReal_3[uiK];
    FFT_Float_T Ti2 = pImag_1[uiK] + pImag_3[uiK];

    FFT_Float_T Tr3 = pReal_1[uiK] - pReal_3[uiK];
    FFT_Float_T Ti3 = pImag_1[uiK] - pImag_3[uiK];

    Data[uiK] = Tr0 + Tr2;
    pImag_0[uiK] = Ti0 + Ti2;

    pReal_1[uiK] = Tr1 + Ti3;
    pImag_1[uiK] = Ti1 - Tr3;

    pReal_2[uiK] = Tr0 - Tr2;
    pImag_2[uiK] = Ti0 - Ti2;

    pReal_3[uiK] = Tr1 - Ti3;
    pImag_3[uiK] = Ti1 + Tr3;
  }

  unsigned int uiAngleIndex = uiAngleIncrement;
  uiAngleIncrement = uiAngleIncrement >> 2;
  uiRepeatTimesTwo = uiIncrementTimesTwo;

  //********************************************************************
  //  Final FFT butterflies
  //********************************************************************

  for ( unsigned int uiI = 1; uiI < uiNumberOfPasses; uiI++ )
  {
    unsigned int uiIncrementTimesTwo = uiRepeatTimesTwo << 2;
    unsigned int uiAngleIndex = 0;

    for ( unsigned int uiJ = 0; uiJ < uiRepeatTimesTwo; uiJ += 2 )
    {
      FFT_Float_T Wr1 = m_pCosine_1[uiAngleIndex];
      FFT_Float_T Wi1 = m_pSine_1[uiAngleIndex];
      FFT_Float_T Wr2 = m_pCosine_2[uiAngleIndex];
      FFT_Float_T Wi2 = m_pSine_2[uiAngleIndex];
      FFT_Float_T Wr3 = m_pCosine_3[uiAngleIndex];
      FFT_Float_T Wi3 = m_pSine_3[uiAngleIndex];

      pReal_1 = &Data[0] + uiRepeatTimesTwo;
      pReal_2 = pReal_1 + uiRepeatTimesTwo;
      pReal_3 = pReal_2 + uiRepeatTimesTwo;
      pImag_1 = pReal_1 + 1;
      pImag_2 = pReal_2 + 1;
      pImag_3 = pReal_3 + 1;

      for ( unsigned int uiK = uiJ;
            uiK < uiFFTsize << 1;
            uiK += uiIncrementTimesTwo )
      {
        //**************************************************************
        //  Radix 4 Decimation In Time butterfly.
        //  (complex conjugate multiplies)
        //**************************************************************

        FFT_Float_T Rtemp1 = Wr1 * pReal_1[uiK] + Wi1 * pImag_1[uiK];
        FFT_Float_T Itemp1 = Wr1 * pImag_1[uiK] - Wi1 * pReal_1[uiK];

        FFT_Float_T Rtemp2 = Wr2 * pReal_2[uiK] + Wi2 * pImag_2[uiK];
        FFT_Float_T Itemp2 = Wr2 * pImag_2[uiK] - Wi2 * pReal_2[uiK];

        FFT_Float_T Rtemp3 = Wr3 * pReal_3[uiK] + Wi3 * pImag_3[uiK];
        FFT_Float_T Itemp3 = Wr3 * pImag_3[uiK] - Wi3 * pReal_3[uiK];

        FFT_Float_T Tr0 = Data[uiK] + Rtemp2;
        FFT_Float_T Ti0 = pImag_0[uiK] + Itemp2;

        FFT_Float_T Tr1 = Data[uiK] - Rtemp2;
        FFT_Float_T Ti1 = pImag_0[uiK] - Itemp2;

        FFT_Float_T Tr2 = Rtemp1 + Rtemp3;
        FFT_Float_T Ti2 = Itemp1 + Itemp3;

        FFT_Float_T Tr3 = Rtemp1 - Rtemp3;
        FFT_Float_T Ti3 = Itemp1 - Itemp3;

        Data[uiK] = Tr0 + Tr2;
        pImag_0[uiK] = Ti0 + Ti2;

        pReal_1[uiK] = Tr1 + Ti3;
        pImag_1[uiK] = Ti1 - Tr3;

        pReal_2[uiK] = Tr0 - Tr2;
        pImag_2[uiK] = Ti0 - Ti2;

        pReal_3[uiK] = Tr1 - Ti3;
        pImag_3[uiK] = Ti1 + Tr3;
      }

      uiAngleIndex += uiAngleIncrement;
    }

    uiAngleIncrement = uiAngleIncrement >> 2;
    uiRepeatTimesTwo = uiIncrementTimesTwo;
  }

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::FFT_DIF_Complex
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs a mixed radix 4 and radix 2 decimation in
//  frequency version of the Fast Fourier Transform. The number of
//  complex data points equals "uiFFTsize". If the FFT length is not
//  a power of 4 then an extra radix 2 pass is performed on the data.
//  The data should be reordered by the Reorder_DIF function after
//  calling this function.
//**********************************************************************
//**********************************************************************

void FFT4_C::FFT_DIF_Complex( FFT_Float_T Data[],
                              unsigned int uiLength )
{
  //********************************************************************
  //  If uiFFTsize is not a power of two, then force the length to
  //  the next highest power of two.
  //********************************************************************

  unsigned int uiPowerOfTwo = LogBaseTwo( uiLength );
  unsigned int uiFFTsize = 1 << uiPowerOfTwo;

  //********************************************************************
  //  Determine if the FFT can be done using only radix 4 butterflies.
  //********************************************************************

  if ( uiPowerOfTwo & 1 )
  {
    //******************************************************************
    //  "uiFFTsize" is 2 times a power of 4. Perform a radix 2 pass
    //  on the data followed by 2 radix 4 FFTs.
    //******************************************************************

    unsigned int uiAngleIncrement = m_uiMaximumFFTsize >> uiPowerOfTwo;
    unsigned int uiAngleIndex = 0;

    FFT_Float_T * pImag_0 = &Data[1];
    FFT_Float_T * pReal_1 = &Data[uiFFTsize];
    FFT_Float_T * pImag_1 = pReal_1 + 1;

    for ( unsigned int uiK = 0; uiK < uiFFTsize; uiK += 2 )
    {
      FFT_Float_T Wr = m_pCosine_1[uiAngleIndex];
      FFT_Float_T Wi = m_pSine_1[uiAngleIndex];

      //****************************************************************
      //  Radix 2 Decimation in Frequency butterfly.
      //  (complex conjugate multiplies)
      //****************************************************************

      FFT_Float_T Rtemp = Data[uiK] - pReal_1[uiK];
      FFT_Float_T Itemp = pImag_0[uiK] - pImag_1[uiK];

      Data[uiK] = Data[uiK] + pReal_1[uiK];
      pImag_0[uiK] = pImag_0[uiK] + pImag_1[uiK];

      pReal_1[uiK] = Wr * Rtemp + Wi * Itemp;
      pImag_1[uiK] = Wr * Itemp - Wi * Rtemp;

      uiAngleIndex += uiAngleIncrement;
    }

    //******************************************************************
    //  Final radix 4 butterflies.
    //******************************************************************

    if ( uiFFTsize > 2 )
    {
      unsigned int uiFFTsizeDivTwo = uiFFTsize >> 1;

      FFT_DIF_RadixFour( Data, uiFFTsizeDivTwo );

      FFT_DIF_RadixFour( &Data[uiFFTsize], uiFFTsizeDivTwo );
    }
  }
  else
  {
    //******************************************************************
    //  "uiFFTsize" is a power of 4. Perform a radix 4 FFT and exit.
    //******************************************************************

    FFT_DIF_RadixFour( Data, uiFFTsize );
  }

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::FFT_DIF_RadixFour
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs a radix 4 decimation in frequency version
//  of the Fast Fourier Transform. The number of complex data points
//  equals 4^uiNumberOfPasses. The data should be reordered by the
//  RadixFourReorder function after calling this function.
//**********************************************************************
//**********************************************************************

void FFT4_C::FFT_DIF_RadixFour( FFT_Float_T Data[],
                                unsigned int uiLength )
{
  //********************************************************************
  //  If uiFFTsize is not a power of 4, then force the length to
  //  the next highest power of 4.
  //  uiNumberOfPasses = The log base 4 of uiFFTsize
  //********************************************************************

  unsigned int uiNumberOfPasses = LogBaseFour( uiLength );
  unsigned int uiFFTsize = 1 << ( uiNumberOfPasses << 1 );

  //********************************************************************
  //  Pass loop initialization.
  //********************************************************************

  FFT_Float_T * pImag_0 = &Data[1];
  unsigned int uiAngleIncrement =
    m_uiMaximumFFTsize >> ( uiNumberOfPasses << 1 );
  unsigned int uiRepeatTimesTwo = uiFFTsize >> 1;

  //********************************************************************
  //  Initial FFT butterflies.
  //********************************************************************

  for ( unsigned int uiI = 0; uiI < uiNumberOfPasses - 1; uiI++ )
  {
    unsigned int uiIncrementTimesTwo = uiRepeatTimesTwo << 2;
    unsigned int uiAngleIndex = 0;

    for ( unsigned int uiJ = 0; uiJ < uiRepeatTimesTwo; uiJ += 2 )
    {
      FFT_Float_T Wr1 = m_pCosine_1[uiAngleIndex];
      FFT_Float_T Wi1 = m_pSine_1[uiAngleIndex];
      FFT_Float_T Wr2 = m_pCosine_2[uiAngleIndex];
      FFT_Float_T Wi2 = m_pSine_2[uiAngleIndex];
      FFT_Float_T Wr3 = m_pCosine_3[uiAngleIndex];
      FFT_Float_T Wi3 = m_pSine_3[uiAngleIndex];

      FFT_Float_T * pReal_1 = &Data[0] + uiRepeatTimesTwo;
      FFT_Float_T * pReal_2 = pReal_1 + uiRepeatTimesTwo;
      FFT_Float_T * pReal_3 = pReal_2 + uiRepeatTimesTwo;
      FFT_Float_T * pImag_1 = pReal_1 + 1;
      FFT_Float_T * pImag_2 = pReal_2 + 1;
      FFT_Float_T * pImag_3 = pReal_3 + 1;

      for ( unsigned int uiK = uiJ;
            uiK <= (( uiFFTsize << 1 ) - uiIncrementTimesTwo + uiJ );
            uiK += uiIncrementTimesTwo )
      {
        //**************************************************************
        //  Radix 4 Decimation In Frequency butterfly.
        //  (complex conjugate multiplies)
        //**************************************************************

        FFT_Float_T Tr0 = Data[uiK] + pReal_2[uiK];
        FFT_Float_T Ti0 = pImag_0[uiK] + pImag_2[uiK];

        FFT_Float_T Tr1 = Data[uiK] - pReal_2[uiK];
        FFT_Float_T Ti1 = pImag_0[uiK] - pImag_2[uiK];

        FFT_Float_T Tr2 = pReal_1[uiK] + pReal_3[uiK];
        FFT_Float_T Ti2 = pImag_1[uiK] + pImag_3[uiK];

        FFT_Float_T Tr3 = pReal_1[uiK] - pReal_3[uiK];
        FFT_Float_T Ti3 = pImag_1[uiK] - pImag_3[uiK];

        FFT_Float_T Rtemp1 = Tr1 + Ti3;
        FFT_Float_T Itemp1 = Ti1 - Tr3;

        FFT_Float_T Rtemp2 = Tr0 - Tr2;
        FFT_Float_T Itemp2 = Ti0 - Ti2;

        FFT_Float_T Rtemp3 = Tr1 - Ti3;
        FFT_Float_T Itemp3 = Ti1 + Tr3;

        Data[uiK] = Tr0 + Tr2;
        pImag_0[uiK] = Ti0 + Ti2;

        pReal_1[uiK] = Wr1 * Rtemp1 + Wi1 * Itemp1;
        pImag_1[uiK] = Wr1 * Itemp1 - Wi1 * Rtemp1;

        pReal_2[uiK] = Wr2 * Rtemp2 + Wi2 * Itemp2;
        pImag_2[uiK] = Wr2 * Itemp2 - Wi2 * Rtemp2;

        pReal_3[uiK] = Wr3 * Rtemp3 + Wi3 * Itemp3;
        pImag_3[uiK] = Wr3 * Itemp3 - Wi3 * Rtemp3;
      }

      uiAngleIndex += uiAngleIncrement;
    }

    uiRepeatTimesTwo >>= 2;
    uiAngleIncrement <<= 2;
  }

  //********************************************************************
  //  Final pass with special butterflies for Angle = 0
  //********************************************************************

  unsigned int uiIncrementTimesTwo = uiRepeatTimesTwo << 2;
  unsigned int uiAngleIndex = 0;

  FFT_Float_T * pReal_1 = &Data[0] + uiRepeatTimesTwo;
  FFT_Float_T * pReal_2 = pReal_1 + uiRepeatTimesTwo;
  FFT_Float_T * pReal_3 = pReal_2 + uiRepeatTimesTwo;
  FFT_Float_T * pImag_1 = pReal_1 + 1;
  FFT_Float_T * pImag_2 = pReal_2 + 1;
  FFT_Float_T * pImag_3 = pReal_3 + 1;

  for ( unsigned int uiK = 0;
        uiK < uiFFTsize << 1;
        uiK += uiIncrementTimesTwo )
  {
    //******************************************************************
    //  Radix 4 Decimation In Frequency butterfly for W = 0
    //******************************************************************

    FFT_Float_T Tr0 = Data[uiK] + pReal_2[uiK];
    FFT_Float_T Ti0 = pImag_0[uiK] + pImag_2[uiK];

    FFT_Float_T Tr1 = Data[uiK] - pReal_2[uiK];
    FFT_Float_T Ti1 = pImag_0[uiK] - pImag_2[uiK];

    FFT_Float_T Tr2 = pReal_1[uiK] + pReal_3[uiK];
    FFT_Float_T Ti2 = pImag_1[uiK] + pImag_3[uiK];

    FFT_Float_T Tr3 = pReal_1[uiK] - pReal_3[uiK];
    FFT_Float_T Ti3 = pImag_1[uiK] - pImag_3[uiK];

    Data[uiK] = Tr0 + Tr2;
    pImag_0[uiK] = Ti0 + Ti2;

    pReal_1[uiK] = Tr1 + Ti3;
    pImag_1[uiK] = Ti1 - Tr3;

    pReal_2[uiK] = Tr0 - Tr2;
    pImag_2[uiK] = Ti0 - Ti2;

    pReal_3[uiK] = Tr1 - Ti3;
    pImag_3[uiK] = Ti1 + Tr3;
  }

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::IFFT_Real
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs the Inverse Fast Fourier Transform for real
//  value only input. Since the output spectrum is conjugate symmetric
//  for real data it is only necessary to calculate the positive
//  frequency spectrum. Thus uiFFTsize real points will result in
//  uiFFTsize/2 complex frequency values. An uiFFTsize/2 point complex
//  transform is performed by function "IFFT_DIT_Complex" and then an
//  extra pass is performed that results in the uiFFTsize/2 complex
//  frequency values.
//**********************************************************************
//**********************************************************************

void FFT4_C::IFFT_Real( FFT_Float_T Data[],
                        unsigned int uiLength )
{
  //********************************************************************
  //  If uiFFTsize is not a power of two, then force the length to
  //  the next highest power of two.
  //********************************************************************

  unsigned int uiFFTsize = 1 << LogBaseTwo( uiLength );

  //********************************************************************
  //  First perform a uiFFTsize/2 point complex IFFT using the real
  //  data. The real terms have even indices and the imaginary terms
  //  have odd indices.
  //********************************************************************

  unsigned int uiFFTsizeDivTwo = uiFFTsize >> 1;

  Reorder_DIT( Data, uiFFTsizeDivTwo );

  IFFT_DIT_Complex( Data, uiFFTsizeDivTwo );

  //********************************************************************
  //  Generate the real transform from the uiFFTsize/2 point complex
  //  transform. Only the first uiFFTsize/2 complex samples are
  //  calculated. (complex conjugate multiplies)
  //********************************************************************

  Data[0] = Data[0] + Data[1];
  Data[1] = FFT_Float_T( 0.0 );

  FFT_Float_T * pImag = &Data[1];

  unsigned int uiAngleIncrement =
    m_uiMaximumFFTsize >> LogBaseTwo( uiFFTsize );

  unsigned int uiAngleIndex = uiAngleIncrement;

  for ( unsigned int uiI = 2, uiM = uiFFTsize - 2;
        uiI <= uiFFTsizeDivTwo;
        uiI += 2 )
  {
    FFT_Float_T Wr = m_pCosine_1[uiAngleIndex];
    FFT_Float_T Wi = m_pSine_1[uiAngleIndex];

    FFT_Float_T Rn = Data[uiI] - Data[uiM];
    FFT_Float_T Tp = pImag[uiI] + pImag[uiM];

    FFT_Float_T Pr = Wr * Tp + Wi * Rn;
    FFT_Float_T Pi = Wr * Rn - Wi * Tp;

    FFT_Float_T Rp = Data[uiI] + Data[uiM];
    FFT_Float_T Tn = pImag[uiI] - pImag[uiM];

    Data[uiI] = FFT_Float_T( 0.5 ) * ( Rp + Pr );
    pImag[uiI] = FFT_Float_T( 0.5 ) * ( Tn - Pi );

    Data[uiM] = FFT_Float_T( 0.5 ) * ( Rp - Pr );
    pImag[uiM] = FFT_Float_T( 0.5 ) * ( -Tn - Pi );

    uiAngleIndex += uiAngleIncrement;

    uiM -= 2;
  }

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::IFFT_DIT_Complex
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs a mixed radix 4 and radix 2 decimation in
//  time version of the Inverse Fast Fourier Transform. The number of
//  complex data points equals uiFFTsize. If the FFT length is not a
//  power of 4 then an extra radix 2 pass is performed on the data.
//  The data should be reordered by the Reorder_DIT function before
//  calling this function.
//**********************************************************************
//**********************************************************************

void FFT4_C::IFFT_DIT_Complex( FFT_Float_T Data[],
                               unsigned int uiLength )
{
  //********************************************************************
  //  If uiFFTsize is not a power of two, then force the length to
  //  the next highest power of two.
  //********************************************************************

  unsigned int uiPowerOfTwo = LogBaseTwo( uiLength );
  unsigned int uiFFTsize = 1 << uiPowerOfTwo;

  //********************************************************************
  //  Determine if the IFFT can be done using only radix 4 butterflies.
  //********************************************************************

  if ( uiPowerOfTwo & 1 )
  {
    //******************************************************************
    //  "uiFFTsize" is 2 times a power of 4. Perform 2 radix 4 IFFTs
    //  followed by a radix 2 pass on the data.
    //******************************************************************

    if ( uiFFTsize > 2 )
    {
      unsigned int uiFFTsizeDivTwo = uiFFTsize >> 1;

      IFFT_DIT_RadixFour( Data, uiFFTsizeDivTwo );

      IFFT_DIT_RadixFour( &Data[uiFFTsize], uiFFTsizeDivTwo );
    }

    //******************************************************************
    //  Final radix 2 butterflies.
    //******************************************************************

    unsigned int uiAngleIncrement = m_uiMaximumFFTsize >> uiPowerOfTwo;
    unsigned int uiAngleIndex = 0;

    FFT_Float_T * pImag_0 = &Data[1];
    FFT_Float_T * pReal_1 = &Data[uiFFTsize];
    FFT_Float_T * pImag_1 = pReal_1 + 1;

    for ( unsigned int uiK = 0; uiK < uiFFTsize; uiK += 2 )
    {
      FFT_Float_T Wr = m_pCosine_1[uiAngleIndex];
      FFT_Float_T Wi = m_pSine_1[uiAngleIndex];

      //****************************************************************
      //  Radix 2 Decimation in Time butterfly.
      //****************************************************************

      FFT_Float_T Rtemp = Wr * pReal_1[uiK] - Wi * pImag_1[uiK];
      FFT_Float_T Itemp = Wr * pImag_1[uiK] + Wi * pReal_1[uiK];

      pReal_1[uiK] = Data[uiK] - Rtemp;
      pImag_1[uiK] = pImag_0[uiK] - Itemp;

      Data[uiK] = Data[uiK] + Rtemp;
      pImag_0[uiK] = pImag_0[uiK] + Itemp;

      uiAngleIndex += uiAngleIncrement;
    }
  }
  else
  {
    IFFT_DIT_RadixFour( Data, uiFFTsize );
  }

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::IFFT_DIT_RadixFour
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs a radix 4 decimation in time version of the
//  Inverse Fast Fourier Transform. The number of complex data points
//  equals 4^uiNumberOfPasses. The data should be reordered by the
//  RadixFourReorder function before calling this function.
//**********************************************************************
//**********************************************************************

void FFT4_C::IFFT_DIT_RadixFour( FFT_Float_T Data[],
                                 unsigned int uiLength )
{
  //********************************************************************
  //  If uiFFTsize is not a power of 4, then force the length to
  //  the next highest power of 4.
  //  uiNumberOfPasses = The log base 4 of uiFFTsize
  //********************************************************************

  unsigned int uiNumberOfPasses = LogBaseFour( uiLength );
  unsigned int uiFFTsize = 1 << ( uiNumberOfPasses << 1 );

  //********************************************************************
  //  Pass loop initialization.
  //********************************************************************

  FFT_Float_T * pImag_0 = &Data[1];
  unsigned int uiAngleIncrement = m_uiMaximumFFTsize >> 2;
  unsigned int uiRepeatTimesTwo = 2;

  //********************************************************************
  //  Initial pass with special butterflies for Angle = 0
  //********************************************************************

  unsigned int uiIncrementTimesTwo = uiRepeatTimesTwo << 2;

  FFT_Float_T * pReal_1 = &Data[0] + uiRepeatTimesTwo;
  FFT_Float_T * pReal_2 = pReal_1 + uiRepeatTimesTwo;
  FFT_Float_T * pReal_3 = pReal_2 + uiRepeatTimesTwo;
  FFT_Float_T * pImag_1 = pReal_1 + 1;
  FFT_Float_T * pImag_2 = pReal_2 + 1;
  FFT_Float_T * pImag_3 = pReal_3 + 1;

  for ( unsigned int uiK = 0;
        uiK < uiFFTsize << 1;
        uiK += uiIncrementTimesTwo )
  {
    //******************************************************************
    //  Radix 4 Decimation In Time butterfly for W = 0
    //******************************************************************

    FFT_Float_T Tr0 = Data[uiK] + pReal_2[uiK];
    FFT_Float_T Ti0 = pImag_0[uiK] + pImag_2[uiK];

    FFT_Float_T Tr1 = Data[uiK] - pReal_2[uiK];
    FFT_Float_T Ti1 = pImag_0[uiK] - pImag_2[uiK];

    FFT_Float_T Tr2 = pReal_1[uiK] + pReal_3[uiK];
    FFT_Float_T Ti2 = pImag_1[uiK] + pImag_3[uiK];

    FFT_Float_T Tr3 = pReal_1[uiK] - pReal_3[uiK];
    FFT_Float_T Ti3 = pImag_1[uiK] - pImag_3[uiK];

    Data[uiK] = Tr0 + Tr2;
    pImag_0[uiK] = Ti0 + Ti2;

    pReal_1[uiK] = Tr1 - Ti3;
    pImag_1[uiK] = Ti1 + Tr3;

    pReal_2[uiK] = Tr0 - Tr2;
    pImag_2[uiK] = Ti0 - Ti2;

    pReal_3[uiK] = Tr1 + Ti3;
    pImag_3[uiK] = Ti1 - Tr3;
  }

  unsigned int uiAngleIndex = uiAngleIncrement;
  uiAngleIncrement = uiAngleIncrement >> 2;
  uiRepeatTimesTwo = uiIncrementTimesTwo;

  //********************************************************************
  //  Final FFT butterflies
  //********************************************************************

  for ( unsigned int uiI = 1; uiI < uiNumberOfPasses; uiI++ )
  {
    unsigned int uiIncrementTimesTwo = uiRepeatTimesTwo << 2;
    unsigned int uiAngleIndex = 0;

    for ( unsigned int uiJ = 0; uiJ < uiRepeatTimesTwo; uiJ += 2 )
    {
      FFT_Float_T Wr1 = m_pCosine_1[uiAngleIndex];
      FFT_Float_T Wi1 = m_pSine_1[uiAngleIndex];
      FFT_Float_T Wr2 = m_pCosine_2[uiAngleIndex];
      FFT_Float_T Wi2 = m_pSine_2[uiAngleIndex];
      FFT_Float_T Wr3 = m_pCosine_3[uiAngleIndex];
      FFT_Float_T Wi3 = m_pSine_3[uiAngleIndex];

      pReal_1 = &Data[0] + uiRepeatTimesTwo;
      pReal_2 = pReal_1 + uiRepeatTimesTwo;
      pReal_3 = pReal_2 + uiRepeatTimesTwo;
      pImag_1 = pReal_1 + 1;
      pImag_2 = pReal_2 + 1;
      pImag_3 = pReal_3 + 1;

      for ( unsigned int uiK = uiJ;
            uiK < uiFFTsize << 1;
            uiK += uiIncrementTimesTwo )
      {
        //**************************************************************
        //  Radix 4 Decimation In Time butterfly.
        //**************************************************************

        FFT_Float_T Rtemp1 = Wr1 * pReal_1[uiK] - Wi1 * pImag_1[uiK];
        FFT_Float_T Itemp1 = Wr1 * pImag_1[uiK] + Wi1 * pReal_1[uiK];

        FFT_Float_T Rtemp2 = Wr2 * pReal_2[uiK] - Wi2 * pImag_2[uiK];
        FFT_Float_T Itemp2 = Wr2 * pImag_2[uiK] + Wi2 * pReal_2[uiK];

        FFT_Float_T Rtemp3 = Wr3 * pReal_3[uiK] - Wi3 * pImag_3[uiK];
        FFT_Float_T Itemp3 = Wr3 * pImag_3[uiK] + Wi3 * pReal_3[uiK];

        FFT_Float_T Tr0 = Data[uiK] + Rtemp2;
        FFT_Float_T Ti0 = pImag_0[uiK] + Itemp2;

        FFT_Float_T Tr1 = Data[uiK] - Rtemp2;
        FFT_Float_T Ti1 = pImag_0[uiK] - Itemp2;

        FFT_Float_T Tr2 = Rtemp1 + Rtemp3;
        FFT_Float_T Ti2 = Itemp1 + Itemp3;

        FFT_Float_T Tr3 = Rtemp1 - Rtemp3;
        FFT_Float_T Ti3 = Itemp1 - Itemp3;

        Data[uiK] = Tr0 + Tr2;
        pImag_0[uiK] = Ti0 + Ti2;

        pReal_1[uiK] = Tr1 - Ti3;
        pImag_1[uiK] = Ti1 + Tr3;

        pReal_2[uiK] = Tr0 - Tr2;
        pImag_2[uiK] = Ti0 - Ti2;

        pReal_3[uiK] = Tr1 + Ti3;
        pImag_3[uiK] = Ti1 - Tr3;
      }

      uiAngleIndex += uiAngleIncrement;
    }

    uiAngleIncrement = uiAngleIncrement >> 2;
    uiRepeatTimesTwo = uiIncrementTimesTwo;
  }

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::IFFT_DIF_Complex
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs a mixed radix 4 and radix 2 decimation in
//  frequency version of the Inverse Fast Fourier Transform. The number
//  of complex data points equals "uiFFTsize". If the FFT length is not
//  a power of 4 then an extra radix 2 pass is performed on the data.
//  The data should be reordered by the Reorder_DIF function after
//  calling this function.
//**********************************************************************
//**********************************************************************

void FFT4_C::IFFT_DIF_Complex( FFT_Float_T Data[],
                               unsigned int uiLength )
{
  //********************************************************************
  //  If uiFFTsize is not a power of two, then force the length to
  //  the next highest power of two.
  //********************************************************************

  unsigned int uiPowerOfTwo = LogBaseTwo( uiLength );
  unsigned int uiFFTsize = 1 << uiPowerOfTwo;

  //********************************************************************
  //  Determine if the IFFT can be done using only radix 4 butterflies.
  //********************************************************************

  if ( uiPowerOfTwo & 1 )
  {
    //******************************************************************
    //  "uiFFTsize" is 2 times a power of 4. Perform a radix 2 pass
    //  on the data followed by 2 radix 4 FFTs.
    //******************************************************************

    unsigned int uiAngleIncrement = m_uiMaximumFFTsize >> uiPowerOfTwo;
    unsigned int uiAngleIndex = 0;

    FFT_Float_T * pImag_0 = &Data[1];
    FFT_Float_T * pReal_1 = &Data[uiFFTsize];
    FFT_Float_T * pImag_1 = pReal_1 + 1;

    for ( unsigned int uiK = 0; uiK < uiFFTsize; uiK += 2 )
    {
      FFT_Float_T Wr = m_pCosine_1[uiAngleIndex];
      FFT_Float_T Wi = m_pSine_1[uiAngleIndex];

      //****************************************************************
      //  Radix 2 Decimation in Frequency butterfly.
      //  (complex conjugate multiplies).
      //****************************************************************

      FFT_Float_T Rtemp = Data[uiK] - pReal_1[uiK];
      FFT_Float_T Itemp = pImag_0[uiK] - pImag_1[uiK];

      Data[uiK] = Data[uiK] + pReal_1[uiK];
      pImag_0[uiK] = pImag_0[uiK] + pImag_1[uiK];

      pReal_1[uiK] = Wr * Rtemp - Wi * Itemp;
      pImag_1[uiK] = Wr * Itemp + Wi * Rtemp;

      uiAngleIndex += uiAngleIncrement;
    }

    //******************************************************************
    //  Final radix 4 butterflies.
    //******************************************************************

    if ( uiFFTsize > 2 )
    {
      unsigned int uiFFTsizeDivTwo = uiFFTsize >> 1;

      IFFT_DIF_RadixFour( Data, uiFFTsizeDivTwo );

      IFFT_DIF_RadixFour( &Data[uiFFTsize], uiFFTsizeDivTwo );
    }
  }
  else
  {
    //******************************************************************
    //  "uiFFTsize" is a power of 4. Perform a radix 4 IFFT and exit.
    //******************************************************************

    IFFT_DIF_RadixFour( Data, uiFFTsize );
  }

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::IFFT_DIF_RadixFour
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs a radix 4 decimation in frequency version
//  of the Inverse Fast Fourier Transform. The number of complex data
//  points equals 4^uiNumberOfPasses. The data should be reordered by
//  the RadixFourReorder function after calling this function.
//**********************************************************************
//**********************************************************************

void FFT4_C::IFFT_DIF_RadixFour( FFT_Float_T Data[],
                                 unsigned int uiLength )
{
  //********************************************************************
  //  If uiFFTsize is not a power of 4, then force the length to
  //  the next highest power of 4.
  //  uiNumberOfPasses = The log base 4 of uiFFTsize
  //********************************************************************

  unsigned int uiNumberOfPasses = LogBaseFour( uiLength );
  unsigned int uiFFTsize = 1 << ( uiNumberOfPasses << 1 );

  //********************************************************************
  //  Pass loop initialization.
  //********************************************************************

  FFT_Float_T * pImag_0 = &Data[1];
  unsigned int uiAngleIncrement =
    m_uiMaximumFFTsize >> ( uiNumberOfPasses << 1 );
  unsigned int uiRepeatTimesTwo = uiFFTsize >> 1;

  //********************************************************************
  //  Initial FFT butterflies.
  //********************************************************************

  for ( unsigned int uiI = 0; uiI < uiNumberOfPasses - 1; uiI++ )
  {
    unsigned int uiIncrementTimesTwo = uiRepeatTimesTwo << 2;
    unsigned int uiAngleIndex = 0;

    for ( unsigned int uiJ = 0; uiJ < uiRepeatTimesTwo; uiJ += 2 )
    {
      FFT_Float_T Wr1 = m_pCosine_1[uiAngleIndex];
      FFT_Float_T Wi1 = m_pSine_1[uiAngleIndex];
      FFT_Float_T Wr2 = m_pCosine_2[uiAngleIndex];
      FFT_Float_T Wi2 = m_pSine_2[uiAngleIndex];
      FFT_Float_T Wr3 = m_pCosine_3[uiAngleIndex];
      FFT_Float_T Wi3 = m_pSine_3[uiAngleIndex];

      FFT_Float_T * pReal_1 = &Data[0] + uiRepeatTimesTwo;
      FFT_Float_T * pReal_2 = pReal_1 + uiRepeatTimesTwo;
      FFT_Float_T * pReal_3 = pReal_2 + uiRepeatTimesTwo;
      FFT_Float_T * pImag_1 = pReal_1 + 1;
      FFT_Float_T * pImag_2 = pReal_2 + 1;
      FFT_Float_T * pImag_3 = pReal_3 + 1;

      for ( unsigned int uiK = uiJ;
            uiK <= (( uiFFTsize << 1 ) - uiIncrementTimesTwo + uiJ );
            uiK += uiIncrementTimesTwo )
      {
        //**************************************************************
        //  Radix 4 Decimation In Frequency butterfly.
        //**************************************************************

        FFT_Float_T Tr0 = Data[uiK] + pReal_2[uiK];
        FFT_Float_T Ti0 = pImag_0[uiK] + pImag_2[uiK];

        FFT_Float_T Tr1 = Data[uiK] - pReal_2[uiK];
        FFT_Float_T Ti1 = pImag_0[uiK] - pImag_2[uiK];

        FFT_Float_T Tr2 = pReal_1[uiK] + pReal_3[uiK];
        FFT_Float_T Ti2 = pImag_1[uiK] + pImag_3[uiK];

        FFT_Float_T Tr3 = pReal_1[uiK] - pReal_3[uiK];
        FFT_Float_T Ti3 = pImag_1[uiK] - pImag_3[uiK];

        FFT_Float_T Rtemp1 = Tr1 - Ti3;
        FFT_Float_T Itemp1 = Ti1 + Tr3;

        FFT_Float_T Rtemp2 = Tr0 - Tr2;
        FFT_Float_T Itemp2 = Ti0 - Ti2;

        FFT_Float_T Rtemp3 = Tr1 + Ti3;
        FFT_Float_T Itemp3 = Ti1 - Tr3;

        Data[uiK] = Tr0 + Tr2;
        pImag_0[uiK] = Ti0 + Ti2;

        pReal_1[uiK] = Wr1 * Rtemp1 - Wi1 * Itemp1;
        pImag_1[uiK] = Wr1 * Itemp1 + Wi1 * Rtemp1;

        pReal_2[uiK] = Wr2 * Rtemp2 - Wi2 * Itemp2;
        pImag_2[uiK] = Wr2 * Itemp2 + Wi2 * Rtemp2;

        pReal_3[uiK] = Wr3 * Rtemp3 - Wi3 * Itemp3;
        pImag_3[uiK] = Wr3 * Itemp3 + Wi3 * Rtemp3;
      }

      uiAngleIndex += uiAngleIncrement;
    }

    uiRepeatTimesTwo >>= 2;
    uiAngleIncrement <<= 2;
  }

  //********************************************************************
  //  Final pass with special butterflies for Angle = 0
  //********************************************************************

  unsigned int uiIncrementTimesTwo = uiRepeatTimesTwo << 2;
  unsigned int uiAngleIndex = 0;

  FFT_Float_T * pReal_1 = &Data[0] + uiRepeatTimesTwo;
  FFT_Float_T * pReal_2 = pReal_1 + uiRepeatTimesTwo;
  FFT_Float_T * pReal_3 = pReal_2 + uiRepeatTimesTwo;
  FFT_Float_T * pImag_1 = pReal_1 + 1;
  FFT_Float_T * pImag_2 = pReal_2 + 1;
  FFT_Float_T * pImag_3 = pReal_3 + 1;

  for ( unsigned int uiK = 0;
        uiK < uiFFTsize << 1;
        uiK += uiIncrementTimesTwo )
  {
    //******************************************************************
    //  Radix 4 Decimation In Frequency butterfly for W = 0
    //******************************************************************

    FFT_Float_T Tr0 = Data[uiK] + pReal_2[uiK];
    FFT_Float_T Ti0 = pImag_0[uiK] + pImag_2[uiK];

    FFT_Float_T Tr1 = Data[uiK] - pReal_2[uiK];
    FFT_Float_T Ti1 = pImag_0[uiK] - pImag_2[uiK];

    FFT_Float_T Tr2 = pReal_1[uiK] + pReal_3[uiK];
    FFT_Float_T Ti2 = pImag_1[uiK] + pImag_3[uiK];

    FFT_Float_T Tr3 = pReal_1[uiK] - pReal_3[uiK];
    FFT_Float_T Ti3 = pImag_1[uiK] - pImag_3[uiK];

    Data[uiK] = Tr0 + Tr2;
    pImag_0[uiK] = Ti0 + Ti2;

    pReal_1[uiK] = Tr1 - Ti3;
    pImag_1[uiK] = Ti1 + Tr3;

    pReal_2[uiK] = Tr0 - Tr2;
    pImag_2[uiK] = Ti0 - Ti2;

    pReal_3[uiK] = Tr1 + Ti3;
    pImag_3[uiK] = Ti1 - Tr3;
  }

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::Reorder_DIT
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs mixed radix 2 and radix 4 digit reverse
//  ordering on the complex data array. This function should be
//  called before calling any decimation in time FFT function.
//**********************************************************************
//**********************************************************************

void FFT4_C::Reorder_DIT( FFT_Float_T Data[],
                          unsigned int uiFFTsize )
{
  //********************************************************************
  //  Determine if the Reorder can be done using only radix 4 digit
  //  reverse ordering.
  //********************************************************************

  if ( uiFFTsize > 2 )
  {
    unsigned int uiPowerOfTwo = LogBaseTwo( uiFFTsize );

    if ( uiPowerOfTwo & 1 )
    {
      unsigned int uiFFTsizeDivTwo = uiFFTsize >> 1;

      for ( unsigned int uiI = 0; uiI < uiFFTsizeDivTwo; uiI++ )
      {
        unsigned int uiII = uiI << 1;
        unsigned int uiFourI = uiII << 1;

        m_pReorderData[uiII] = Data[uiFourI];
        m_pReorderData[uiII + 1] = Data[uiFourI + 1];
        m_pReorderData[uiII + uiFFTsize] = Data[uiFourI + 2];
        m_pReorderData[uiII + uiFFTsize + 1] = Data[uiFourI + 3];
      }

      for ( uiI = 0; uiI < ( uiFFTsize << 1 ); uiI++ )
      {
        Data[uiI] = m_pReorderData[uiI];
      }

      if ( uiFFTsize > 2 )
      {
        RadixFourReorder( Data, uiFFTsizeDivTwo );

        RadixFourReorder( &Data[uiFFTsize], uiFFTsizeDivTwo );
      }
    }
    else
    {
      RadixFourReorder( Data, uiFFTsize );
    }
  }

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::Reorder_DIF
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs mixed radix 4 and radix 2 digit reverse
//  ordering on the complex data array. This function should be
//  called after calling any decimation in frequency FFT function.
//**********************************************************************
//**********************************************************************

void FFT4_C::Reorder_DIF( FFT_Float_T Data[],
                          unsigned int uiFFTsize )
{
  //********************************************************************
  //  Determine if the Reorder can be done using only radix 4 digit
  //  reverse ordering.
  //********************************************************************

  if ( uiFFTsize > 2 )
  {
    unsigned int uiPowerOfTwo = LogBaseTwo( uiFFTsize );

    if ( uiPowerOfTwo & 1 )
    {
      unsigned int uiFFTsizeDivTwo = uiFFTsize >> 1;

      RadixFourReorder( Data, uiFFTsizeDivTwo );

      RadixFourReorder( &Data[uiFFTsize], uiFFTsizeDivTwo );

      for ( unsigned int uiI = 0; uiI < uiFFTsizeDivTwo; uiI++ )
      {
        unsigned int uiII = uiI << 1;
        unsigned int uiFourI = uiII << 1;

        m_pReorderData[uiFourI] = Data[uiII];
        m_pReorderData[uiFourI + 1] = Data[uiII + 1];
        m_pReorderData[uiFourI + 2] = Data[uiII + uiFFTsize];
        m_pReorderData[uiFourI + 3] = Data[uiII + uiFFTsize + 1];
      }

      for ( uiI = 0; uiI < ( uiFFTsize << 1 ); uiI++ )
      {
        Data[uiI] = m_pReorderData[uiI];
      }
    }
    else
    {
      RadixFourReorder( Data, uiFFTsize );
    }
  }

  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::RadixFourReorder
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function performs radix 4 digit reverse ordering on
//  the complex data array.
//**********************************************************************
//**********************************************************************

void FFT4_C::RadixFourReorder( FFT_Float_T Data[],
                               unsigned int uiFFTsize )
{
  unsigned int uiFrac = uiFFTsize >> 2;
  int iJ = 0;

  for ( unsigned int uiI = 0; uiI < uiFFTsize - 1; uiI++ )
  {
    if ((int)uiI < iJ )
    {
      unsigned int iJJ = iJ << 1;
      unsigned int uiII = uiI << 1;

      FFT_Float_T Temp = Data[iJJ];
      Data[iJJ] = Data[uiII];
      Data[uiII] = Temp;

      Temp = Data[iJJ + 1];
      Data[iJJ + 1] = Data[uiII + 1];
      Data[uiII + 1] = Temp;
    }

    unsigned int uiK = uiFrac;

    int iRadixK = uiK + uiK + uiK;

    while ( iRadixK <= iJ )
    {
      iJ -= iRadixK;
      uiK >>= 2;
      iRadixK >>= 2;
    }

    iJ += (int)uiK;
  }
  return;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::LogBaseTwo
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function returns the log base 2 of the first power of 2
//  that is greater than or equal to the passed argument.
//**********************************************************************
//**********************************************************************

unsigned int FFT4_C::LogBaseTwo( unsigned int uiPowerOfTwo )
{
  for ( unsigned int uiLogBaseTwo = 0, uiTemp = uiPowerOfTwo - 1;
        uiTemp > 0;
        uiTemp >>= 1 )
    uiLogBaseTwo++;

  return uiLogBaseTwo;
}

//**********************************************************************
//**********************************************************************
//  Member Function: FFT4_C::LogBaseFour
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  This function returns the log base 4 of the first power of 4
//  that is greater than or equal to the passed argument.
//  The Log base 4 may be obtained by dividing the Log base 2 by 2
//  (or shifting it down by 1.) This function is more efficient
//  than this method because less loop iteratiuons are performed.
//**********************************************************************
//**********************************************************************

unsigned int FFT4_C::LogBaseFour( unsigned int uiPowerOfFour )
{
  for ( unsigned int uiLogBaseFour = 0, uiTemp = uiPowerOfFour - 1;
        uiTemp > 0;
        uiTemp >>= 2 )
    uiLogBaseFour++;

  return uiLogBaseFour;
}
