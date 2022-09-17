//**********************************************************************
//**********************************************************************
//  Class Library Definition File: FFT4.h
//  Author: Bill Hallahan
//  Date: June 28, 1995
//
//  Abstract:
//
//         This file contains the class definition for class FFT4_C.
//    This object is used to perform the Fast Fourier Transform (FFT)
//    and the Inverse Fast Fourier Transform (IFFT). This FFT object
//    will perform all FFT sizes that are a power of 2 from the value
//    2 and up to a certain maximum size. The maximum FFT size is
//    limited both by available memory and the maximum FFT size that
//    can be stored in an unsigned integer.
//
//         The FFT constructor that takes one unsigned integer argument
//    may be used to initialize the FFT object for the maximum size
//    complex FFT (IFFT) that is required. This size MUST be a power
//    of 2. Complex FFT sizes that are a power of 2 and that are less
//    than the initialized size will also be supported. The Real FFT
//    (Real IFFT) algorithms require that the object is initialized
//    to a power of two that is twice the largest real FFT size. For
//    example, If the FFT object is initialized for a maximum FFT size
//    of 1024 then the maximum complex FFT size that can be calculated
//    will also be 1024 and the maximum Real FFT size that can be
//    calculated will be 512.
//
//         If an application requires a larger complex FFT, then it
//    may call the SetMaximumSize function with a larger power of 2
//    argument. An application may also declare an FFT object with the
//    default (no argument) constructor and then initialize it with the
//    SetMaximumSize function. This latter method may be preferable
//    since in this case, an error is returned if memory cannot be
//    allocated.
//
//         All of the complex FFT functions require the real terms to
//    be stored at the even indices of the data array and the imaginary
//    terms to be stored at the odd indices of the data array. Thus
//    the first complex term is stored at Data[0] and Data[1].
//    The real FFT functions accept only real samples at all indices
//    and return complex data. All FFT algorithms are performed
//    in-place. The Reorder_DIT and Reorder_DIF function use an internal
//    array to reorder the data (and copy the reordered data back to the
//    input array) only if the data is not a power of 4. Otherwise, data
//    reordering is done in place.
//
//         No scaling takes place in these algorithms. Applications
//    that require scaled data must multiply each element of the data
//    array by the scalar value 1.0/(double)uiFFTsize.
//
//
//         The following list describes the functions and their purpose.
//
//
//      SetMaximumSize        Set the maximum FFT size that the FFT
//                            object will support.
//
//      FFT_Real              Calculate the FFT of a real sequence.
//                            Half of the conjugate symmetric spectrum
//                            is calculated. This function calls
//                            the Reorder_DIT and FFT_DIT_Complex
//                            functions.
//
//      FFT_Real_Plus_Pi_Bin  Calculate the FFT of a real sequence.
//                            Half of the conjugate symmetric spectrum
//                            is calculated. This function calls
//                            the Reorder_DIT and FFT_DIT_Complex
//                            functions. The real term of the
//                            frequency bin that corresponds to
//                            Pi radians is returned in the imaginary
//                            DC location. The imaginary term of both
//                            the DC bin and the imaginary term of
//                            the Pi bin are equal to zero.
//
//      FFT_DIT_Complex       Calculate the FFT using a mixed radix
//                            2 and radix 4 Decimation in Time FFT
//                            algorithm. The Reorder_DIT function
//                            should be called to reorder the data
//                            before calling this function. This
//                            function calls the FFT_DIT_RadixFour
//                            function.
//
//      FFT_DIF_Complex       Calculate the FFT using a mixed radix
//                            2 and radix 4 Decimation in Frequency FFT
//                            algorithm. The Reorder_DIF function
//                            should be called to reorder the data
//                            after calling this function. This
//                            function calls the FFT_DIF_RadixFour
//                            function.
//
//
//      IFFT_Real             Calculate the IFFT of a real sequence.
//                            Half of the conjugate symmetric spectrum
//                            is calculated. This function calls
//                            the Reorder_DIT and IFFT_DIT_Complex
//                            functions.
//
//      IFFT_DIT_Complex      Calculate the IFFT using a mixed radix
//                            2 and radix 4 Decimation in Time IFFT
//                            algorithm. The Reorder_DIT function
//                            should be called to reorder the data
//                            before calling this function. This
//                            function calls the IFFT_DIT_RadixFour
//                            function
//
//      IFFT_DIF_Complex      Calculate the IFFT using a mixed radix
//                            2 and radix 4 Decimation in Frequency FFT
//                            algorithm. The Reorder_DIF function
//                            should be called to reorder the data
//                            after calling this function. This
//                            function calls the IFFT_DIF_RadixFour
//                            function
//
//      Reorder_DIT           Function to reorder the data before
//                            calling any of the complex Decimation
//                            in Time FFT algorithms. This function
//                            calls the RadixFourReorder function.
//
//      Reorder_DIF           Function to reorder the data after calling
//                            any of the complex Decimation in Frequency
//                            FFT algorithms. This function calls the
//                              RadixFourReorder function.
//
//
//         The following FFT functions may be instead of the mixed
//    radix 2 and radix 4 algorithms if the FFT length is a power of 4.
//    This will only save one test and branch per FFT (or IFFT) since
//    the mixed radix functions call these special radix 4 functions.
//
//
//      FFT_DIT_RadixFour     Calculate the FFT of a sequence that
//                            has a length equal to a power of 4
//                            using a Decimation in Time algorithm.
//                            The RadixFourReorder function should be
//                            called to reorder the data before calling
//                            this function.
//
//      FFT_DIF_RadixFour     Calculate the FFT of a sequence that
//                            has a length equal to a power of 4
//                            using a Decimation in Frequency algorithm.
//                            The RadixFourReorder function should be
//                            called to reorder the data after calling
//                            this function.
//
//      IFFT_DIT_RadixFour    Calculate the IFFT of a sequence that
//                            has a length equal to a power of 4
//                            using a Decimation in Time algorithm.
//                            The RadixFourReorder function should be
//                            called to reorder the data before calling
//                            this function.
//
//      IFFT_DIF_RadixFour    Calculate the IFFT of a sequence that
//                            has a length equal to a power of 4
//                            using a Decimation in Frequency algorithm.
//                            The RadixFourReorder function should be
//                            called to reorder the data after calling
//                            this function.
//
//      RadixFourReorder      Function to reorder the data for the radix
//                            4 FFT algorithms. This is called before any
//                            of the complex Decimation in Time algorithms
//                            or after any of the complex Decimation in
//                            Frequency FFT algorithms.
//
//    If an FFT is followed by an IFFT then it may be possible to
//    avoid reordering the FFT data. The Reorder_DIF and Reorder_DIT
//    functions are inverse functions (i.e. the cascade of these
//    functions forms an identity matrix.) Therefore the FFT_DIF_Complex
//    function may be called first, operations may then be performed in
//    the frequency domain, and then the IFFT_DIT_Complex function may
//    be called.
//
//    The RadixFourReorder function is its own inverse. Therefore
//    FFT_DIF_RadixFour function may be called first, operations
//    may then be performed in the frequency domain, and then the
//    IFFT_DIT_RadixFour function may be called.
//
//**********************************************************************
//**********************************************************************

#ifndef FFT4_H
#define FFT4_H

typedef float FFT_Float_T;

#define  DEFAULT_MAX_FFT4_SIZE  1024

//**********************************************************************
//  Class definition for class FFT4_C
//**********************************************************************

class FFT4_C
{
protected:

  FFT_Float_T * m_pReorderData;

  static unsigned int m_uiReferenceCount;
  static unsigned int m_uiMaximumFFTsize;
  static FFT_Float_T * m_pCosine_1;
  static FFT_Float_T * m_pSine_1;
  static FFT_Float_T * m_pCosine_2;
  static FFT_Float_T * m_pSine_2;
  static FFT_Float_T * m_pCosine_3;
  static FFT_Float_T * m_pSine_3;

public:

  FFT4_C( unsigned int uiMaximumFFTsize = DEFAULT_MAX_FFT4_SIZE );

  ~FFT4_C();

  //********************************************************************
  //  Member Functions.
  //********************************************************************

  unsigned int SetMaximumSize( unsigned int uiMaximumFFTsize );

  void FFT_Real( FFT_Float_T Data[],
                 unsigned int uiFFTsize );

  void FFT_Real_Plus_Pi_Bin( FFT_Float_T Data[],
                             unsigned int uiFFTsize );

  void FFT_DIT_Complex( FFT_Float_T Data[],
                        unsigned int uiFFTsize );

  void FFT_DIT_RadixFour( FFT_Float_T Data[],
                          unsigned int uiFFTsize );

  void FFT_DIF_Complex( FFT_Float_T Data[],
                        unsigned int uiFFTsize );

  void FFT_DIF_RadixFour( FFT_Float_T Data[],
                          unsigned int uiFFTsize );

  void IFFT_Real( FFT_Float_T Data[],
                  unsigned int uiFFTsize );

  void IFFT_DIT_Complex( FFT_Float_T Data[],
                         unsigned int uiFFTsize );

  void IFFT_DIT_RadixFour( FFT_Float_T Data[],
                           unsigned int uiFFTsize );

  void IFFT_DIF_Complex( FFT_Float_T Data[],
                         unsigned int uiFFTsize );

  void IFFT_DIF_RadixFour( FFT_Float_T Data[],
                           unsigned int uiFFTsize );

  void Reorder_DIT( FFT_Float_T Data[],
                    unsigned int uiFFTsize );

  void Reorder_DIF( FFT_Float_T Data[],
                    unsigned int uiFFTsize );

  void RadixFourReorder( FFT_Float_T Data[],
                         unsigned int uiFFTsize );

private:

  void FreeTrigTableMemory();

  unsigned int LogBaseTwo( unsigned int uiPowerOfTwo );

  unsigned int LogBaseFour( unsigned int uiPowerOfFour );
};

#endif
