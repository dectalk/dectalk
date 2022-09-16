 #**********************************************************************
 #**********************************************************************
 #
 #                DECtalk Vocal Tract Model
 #
 # Copyright (c)        1984                    by Dennis H. Klatt
 # Copyright (c) 1984 to 1994, Digital Equipment Corporation, Maynard, Mass.
 #
 # Edit history:
 #
 #   1.  1-Sep-84 DK  Initial creation
 #
 #   2. 17-Jan-85 DK  Add "multi-pulse" excitation
 #                    (currently disabled).
 #
 #   3. 19-Feb-85 DK  New Code: Change meaning of TILT to
 #                    "spread glottis".
 #
 #   4. 10-Mar-85 DK  Reorganize to look more like code used on chip.
 #
 #   5. 16-Apr-85 DK  Set R6PB = -3728, R6PC = -851
 #                    ( F = 4900, BW = 2500 )
 #
 #   6. 30-Apr-85 DK  Boost gain in cascade F1 to better avoid limit
 #                    cycles. Try new random number generator.
 #
 #   7. 13-Jul-85 DK  Do not modulate breathiness noise, make glottal
 #                    closure occur at end of a period,> T0
 #                    continuous when NOPEN changes, fix lptilt()
 #                    (MAJOR ERROR), also delete spdef par TILToff.
 #
 #   8. 15-Jul-85 DK  TEMPORARY CHANGES FOR FIGURE GENERATION.
 #                    see SHOW_VOICING.
 #
 #   9. 22-Jul-85 DK  Add print statements for comparison with SPC
 #                    code.
 #
 #  10. 24-Jul-85 DK  Add small constant to output to avoid sign-bit
 #                    noise. Use new variable "AVlind" to delay
 #                    change in AV.
 #
 #  11. 29-Jul-85 DK  Make sure R1ca does not overflow alotted bits.
 #
 #  12. 10-Oct-92 BH  Clearly separated comments from code and
 #                    added a consistent indentation style.
 #                    Removed the changes added in 8 (SHOW_VOICING).
 #                    Added in-line functions for filtering. The new
 #                    functions are:
 #                    TWO_ZERO_FILTER and TWO_POLE_FILTER.
 #                    Set f6p and b6p to get the correct values for
 #                    p6_a1 and p6_a2.
 #
 #  13. 11-Feb-93 BH  Re-wrote to use floating point. The nasal
 #                    anti-resonator and the nasal resonator were
 #                    merged into one biquadratic filter. All filters
 #                    are now in-line macros defined in include file
 #                    "mfilter.h". Filter gains have been combined
 #                    and/or moved around. There are a lot of
 #                    gain multipliers that are only needed to stay
 #                    compatible with the integer Vocal Tract Model
 #                    driver code.
 #
 #  14. 01-Mar-94 BH  Re-wrote the floating point C code version
 #                    (referenced in comment 13 above) in TMS320C30
 #                    assembly language. The code was rearranged to
 #                    do block processing to exploit the architecture
 #                    of the TMS320C30 DSP.
 #                    The noise frame is generated first. Then the
 #                    glottal waveform is generated in a loop. The noise
 #                    block may be modulated in this loop and the
 #                    SpeakerBreathinessPitchSyncGain and the
 #                    LaryngealSourcePitchSyncGain are updated and applied
 #                    in the glottal waveform loop. A record is kept
 #                    of which glottal sample the first occurence of
 #                    pitch synchronous coefficient update occurs.
 #                    The nasal filter loop and the cascade filter
 #                    loop are both divided into two sections, one section
 #                    for before pitch synchronous coefficient update,
 #                    and one for after the pitch synchronous coefficient
 #                    update. A final filtering loop performs the
 #                    parallel noise filtering. Then the output of the
 #                    cascade (voiced) loop and the parallel (frication)
 #                    loop are combined with bypass noise.
 #
 #  15. 01-Mar-94 BH  Re-wrote the floating point C code version
 #                    (referenced in comment 14 above) in Alpha AXP
 #                    assembly language.
 #
 #    Modified version of synthesizer described in
 #    J. Acoust. Soc. Am., Mar. 1980. new voicing source.
 #
 #**********************************************************************
 #**********************************************************************

 #        .verstamp  1 0

        .globl   speech_waveform_generator
        .globl   read_speaker_definition
        .globl   set_fvtm_sample_rate
        .globl   initialize_fvtm

 #----------------------------------------------------------------------
 #  Register definitions
 #----------------------------------------------------------------------

#define  R0   $0
#define  R1   $1
#define  R2   $2
#define  R3   $3
#define  R4   $4
#define  R5   $5
#define  R6   $6
#define  R7   $7
#define  R8   $8
#define  R9   $9
#define  R10  $10
#define  R11  $11
#define  R12  $12
#define  R13  $13
#define  R14  $14
#define  R15  $15
#define  R16  $16
#define  R17  $17
#define  R18  $18
#define  R19  $19
#define  R20  $20
#define  R21  $21
#define  R22  $22
#define  R23  $23
#define  R24  $24
#define  R25  $25
#define  R26  $26
#define  R27  $27
#define  R28  $28
#define  R29  $29
#define  GP   $29
#define  R30  $30
#define  SP   $30
#define  R31  $31

#define  F0   $f0
#define  F1   $f1
#define  F2   $f2
#define  F3   $f3
#define  F4   $f4
#define  F5   $f5
#define  F6   $f6
#define  F7   $f7
#define  F8   $f8
#define  F9   $f9
#define  F10  $f10
#define  F11  $f11
#define  F12  $f12
#define  F13  $f13
#define  F14  $f14
#define  F15  $f15
#define  F16  $f16
#define  F17  $f17
#define  F18  $f18
#define  F19  $f19
#define  F20  $f20
#define  F21  $f21
#define  F22  $f22
#define  F23  $f23
#define  F24  $f24
#define  F25  $f25
#define  F26  $f26
#define  F27  $f27
#define  F28  $f28
#define  F29  $f29
#define  F30  $f30
#define  F31  $f31

 #----------------------------------------------------------------------
 #  Symbol Definitions.
 #----------------------------------------------------------------------

SIZEOF_WORD              =   2
SIZEOF_FLOAT             =   4

 #----------------------------------------------------------------------
 #  Include Files.
 #----------------------------------------------------------------------

#include  "fvtmtabl.h"

 #----------------------------------------------------------------------
 #  Floating Vocal Tract Model Variables.
 #----------------------------------------------------------------------

        .data

        .ascii  "Copyright Digital Equipment Corporation 1994."
        .ascii  "All rights reserved."

 #----------------------------------------------------------------------
 #  Local static variable structure definition.
 #----------------------------------------------------------------------

        .data
        .align   5

FVTM_LocalVars:         .struct 0

 #----------------------------------------------------------------------
 #  Variable used to generate the noise waveform.
 #----------------------------------------------------------------------

RandomNumber:   .long   0

 #----------------------------------------------------------------------
 #  Coefficients for the noise source filters.
 #----------------------------------------------------------------------

NoiseDelay_1:   .s_floating      0.0
NoiseDelay_2:   .s_floating      0.0

 #----------------------------------------------------------------------
 #  Coefficients for the Decimating Low Pass filter.
 #----------------------------------------------------------------------

LowPass_a2:     .s_floating      0.0
LowPass_a1:     .s_floating      0.0
LowPassDelay_1: .s_floating      0.0
LowPassDelay_2: .s_floating      0.0

 #----------------------------------------------------------------------
 #  Coefficients for the Glottal Tilt Filter and the down-sampling
 #  low pass filter and the Voiced waveformm gains.
 #----------------------------------------------------------------------

GlottalSourceTilt_b0:   .s_floating      0.0
GlottalSourceTilt_a1:   .s_floating      0.0
GlottalSourceTiltDelay: .s_floating      0.0

 #----------------------------------------------------------------------
 #  The nasal resonator and anti-resonator filter coefficients.
 #----------------------------------------------------------------------

Nasal_a2:       .s_floating      0.0
Nasal_b2:       .s_floating      0.0
Nasal_a1:       .s_floating      0.0
Nasal_b1:       .s_floating      0.0
Nasal_b0:       .s_floating      0.0
NasalDelay_1:   .s_floating      0.0
NasalDelay_2:   .s_floating      0.0

 #----------------------------------------------------------------------
 #  Filter variable for the cascade resonators for formants
 #  1 through 5.
 #----------------------------------------------------------------------

c5_a2:          .s_floating      0.0              # Speaker defined
c5_a1:          .s_floating      0.0              # Speaker defined
c4_a2:          .s_floating      0.0              # Speaker defined
c4_a1:          .s_floating      0.0              # Speaker defined
c3_a2:          .s_floating      0.0
c3_a1:          .s_floating      0.0
c2_a2:          .s_floating      0.0
c2_a1:          .s_floating      0.0
c1_a2:          .s_floating      0.0
c1_a1:          .s_floating      0.0
CascadePathGain: .s_floating      0.0
c5_Delay_1:     .s_floating      0.0
c5_Delay_2:     .s_floating      0.0
c4_Delay_1:     .s_floating      0.0
c4_Delay_2:     .s_floating      0.0
c3_Delay_1:     .s_floating      0.0
c3_Delay_2:     .s_floating      0.0
c2_Delay_1:     .s_floating      0.0
c2_Delay_2:     .s_floating      0.0
c1_Delay_1:     .s_floating      0.0
c1_Delay_2:     .s_floating      0.0

 #----------------------------------------------------------------------
 #  Coefficients of parallel resonators for formants 2 through 6.
 #----------------------------------------------------------------------

p6_b0:          .s_floating      0.0
p5_b0:          .s_floating      0.0
p5_a2:          .s_floating      0.0              # Speaker defined
p5_a1:          .s_floating      0.0              # Speaker defined
p4_b0:          .s_floating      0.0
p4_a2:          .s_floating      0.0              # Speaker defined
p4_a1:          .s_floating      0.0              # Speaker defined
p3_b0:          .s_floating      0.0
p3_a2:          .s_floating      0.0
p3_a1:          .s_floating      0.0
p2_b0:          .s_floating      0.0
p2_a2:          .s_floating      0.0
p2_a1:          .s_floating      0.0
p6_Delay_1:     .s_floating      0.0
p6_Delay_2:     .s_floating      0.0
p5_Delay_1:     .s_floating      0.0
p5_Delay_2:     .s_floating      0.0
p4_Delay_1:     .s_floating      0.0
p4_Delay_2:     .s_floating      0.0
p3_Delay_1:     .s_floating      0.0
p3_Delay_2:     .s_floating      0.0
p2_Delay_1:     .s_floating      0.0
p2_Delay_2:     .s_floating      0.0

 #----------------------------------------------------------------------
 #  Variables used to generate the glottal waveform.
 #----------------------------------------------------------------------

a:              .s_floating      0.0    # Makes glottal pulse when open
b:              .s_floating      0.0    # Makes glottal pulse when open

 #----------------------------------------------------------------------
 #  Variable gain factors.
 #----------------------------------------------------------------------

LaryngealSourceGain:            .s_floating      0.0
LaryngealSourcePitchSyncGain:   .s_floating      0.0

 #----------------------------------------------------------------------
 #  Speaker defined gain factors.
 #----------------------------------------------------------------------

PartialCascadePathGain:         .s_floating      0.0
SpeakerVoicingGain:             .s_floating      0.0
SpeakerBreathinessGain:         .s_floating      0.0
SpeakerAsperationGain:          .s_floating      0.0
SpeakerFricationGain:           .s_floating      0.0
FormantScale:                   .s_floating      0.0   # Scale F1, F2, & F3
OutputScaleFactor:              .s_floating      0.0
SpeakerBreathinessSyncGain:     .s_floating      0.0

 #----------------------------------------------------------------------
 #  Sample rate scaling parameters for time and frequency.
 #----------------------------------------------------------------------

SampleRateScale:                .s_floating      1.1025
InverseSampleRateScale:         .s_floating      0.907029478458
bfLowSampleRate:                .s_floating      0.0
uiSamplesPerFrame:              .long   0

 #----------------------------------------------------------------------
 #  Counters and counter limits
 #----------------------------------------------------------------------

uiVoicePeriodSampleNumber:      .long   0
iNumOpenSamples:                .long   0
iPositionToStartNoiseModulation: .long   0

 #----------------------------------------------------------------------
 #  Variables used to generate the glottal waveform.
 #----------------------------------------------------------------------

k1:             .s_floating      0.0   # Equals nopen1 for glottal period duration.
k2:             .s_floating      0.0   # Equals nopen2 for glottal period duration.
T0Jitter:       .s_floating      0.0   # Alternating jitter for voicing period.

 #----------------------------------------------------------------------
 #  Variable to store the glottal waveform flow rate.
 #----------------------------------------------------------------------

DifferentiatedGlottalFlow:     .s_floating      0.0

 #----------------------------------------------------------------------
 #  Frequency adjustments for formants 1 and 2
 #----------------------------------------------------------------------

F1Adjust:         .s_floating      0.0
F2Adjust:         .s_floating      0.0

 #----------------------------------------------------------------------
 #  Processed input parameters.
 #----------------------------------------------------------------------

uiT0:             .long   0
                  .quad   0
FVTM_LocalSize:   .quad   0

 #----------------------------------------------------------------------
 #  Constant structure definition.
 #----------------------------------------------------------------------

        .data
        .align   5

FVTM_ConstantStruct:    .struct 0

Q12InverseScale:        .s_floating          2.44140625E-4
CFP0001:                .s_floating          0.0001
CFP0333862304:          .s_floating          0.0333862304
CFP125:                 .s_floating          0.125
CFP333333333333:        .s_floating          0.333333333333
CFP5:                   .s_floating          0.5
CFP58593756:            .s_floating          0.58593756
CFP6309573448:          .s_floating          0.6309573448
CFP75:                  .s_floating          0.75
CF1:                    .s_floating          1.0
CF8:                    .s_floating          8.0
CF16:                   .s_floating         16.0
CF20:                   .s_floating         20.0
CF80:                   .s_floating         80.0
CF210:                  .s_floating        210.0
CF256:                  .s_floating        256.0
CF280:                  .s_floating        280.0
CF300:                  .s_floating        300.0
CF400:                  .s_floating        400.0
CF500:                  .s_floating        500.0
CF615:                  .s_floating        615.0
CF800:                  .s_floating        800.0
CF948:                  .s_floating        948.0
CF2500:                 .s_floating       2500.0
CF4500:                 .s_floating       4500.0
CF5000:                 .s_floating       5000.0
CF9500:                 .s_floating       9500.0
CF10000:                .s_floating      10000.0
CF11264:                .s_floating      11264.0
CF32767:                .s_floating      32767.0
CFM32768:               .s_floating     -32768.0
FrameTimeInSec:         .s_floating          0.0064
Noise_b2:               .s_floating      0.09149169921875 # Scaled by 0.25
Noise_a1:               .s_floating      0.75
Noise_b1:               .s_floating     -0.1777954101563  # Scaled by 0.25
Noise_b0:               .s_floating      0.25             # Speaker constant
p6_a2:                  .s_floating     -0.487060546875   # Speaker constant
p6_a1:                  .s_floating     -1.39208984375    # Speaker constant

 #----------------------------------------------------------------------
 #  Constant memory allocation.
 #----------------------------------------------------------------------

        .data
        .align   5

Const_Constants:
Const_Q12InverseScale:        .s_floating          2.44140625E-4
Const_CFP0001:                .s_floating          0.0001
Const_CFP0333862304:          .s_floating          0.0333862304
Const_CFP125:                 .s_floating          0.125
Const_CFP333333333333:        .s_floating          0.333333333333
Const_CFP5:                   .s_floating          0.5
Const_CFP58593756:            .s_floating          0.58593756
Const_CFP6309573448:          .s_floating          0.6309573448
Const_CFP75:                  .s_floating          0.75
Const_CF1:                    .s_floating          1.0
Const_CF8:                    .s_floating          8.0
Const_CF16:                   .s_floating         16.0
Const_CF20:                   .s_floating         20.0
Const_CF80:                   .s_floating         80.0
Const_CF210:                  .s_floating        210.0
Const_CF256:                  .s_floating        256.0
Const_CF280:                  .s_floating        280.0
Const_CF300:                  .s_floating        300.0
Const_CF400:                  .s_floating        400.0
Const_CF500:                  .s_floating        500.0
Const_CF615:                  .s_floating        615.0
Const_CF800:                  .s_floating        800.0
Const_CF948:                  .s_floating        948.0
Const_CF2500:                 .s_floating       2500.0
Const_CF4500:                 .s_floating       4500.0
Const_CF5000:                 .s_floating       5000.0
Const_CF9500:                 .s_floating       9500.0
Const_CF10000:                .s_floating      10000.0
Const_CF11264:                .s_floating      11264.0
Const_CF32767:                .s_floating      32767.0
Const_CFM32768:               .s_floating     -32768.0
Const_FrameTimeInSec:         .s_floating          0.0064
Const_Noise_b2:               .s_floating      0.09149169921875 # Scaled by 0.25
Const_Noise_a1:               .s_floating      0.75
Const_Noise_b1:               .s_floating     -0.1777954101563  # Scaled by 0.25
Const_Noise_b0:               .s_floating      0.25             # Speaker constant
Const_p6_a2:                  .s_floating     -0.487060546875   # Speaker constant
Const_p6_a1:                  .s_floating     -1.39208984375    # Speaker constant

 #----------------------------------------------------------------------
 #  Stack variable offsets.
 #----------------------------------------------------------------------

        .data
        .align   5

SWG_StackVars:          .struct 0
                        .quad   0
                        .quad   0
SWG_R26:                .quad   0
SWG_R9:                 .quad   0
SWG_R10:                .quad   0
SWG_R11:                .quad   0
SWG_R12:                .quad   0
SWG_R13:                .quad   0
SWG_R14:                .quad   0
SWG_R15:                .t_floating     0.0
SWG_F2:                 .t_floating     0.0
SWG_F3:                 .t_floating     0.0
SWG_F4:                 .t_floating     0.0
SWG_F5:                 .t_floating     0.0
SWG_F6:                 .t_floating     0.0
SWG_F7:                 .t_floating     0.0
SWG_F8:                 .t_floating     0.0
SWG_F9:                 .t_floating     0.0
SWG_qTemp:              .quad   0
SWG_qOutputAddress:     .quad   0
SWG_c2_b0:              .quad   0
SWG_c3_b0:              .quad   0
SWG_BypassNoiseGain:    .quad   0
SWG_T0inS4:             .quad   0   # Pitch period ( pitch from 50 to 165 )
SWG_AVlinear:           .quad   0
SWG_F1inHZ:             .quad   0   # First formant in Hz,       200 to 1300
SWG_F2inHZ:             .quad   0   # Second formant in Hz,      550 to 3000
SWG_F3inHZ:             .quad   0   # Third formant in Hz,      1200 to 4800
SWG_B1inHZ:             .quad   0   # First formant BW in Hz,     40 to 1000
SWG_B2inHZ:             .quad   0   # Second formant BW in Hz,    40 to 1000
SWG_B3inHZ:             .quad   0   # Third formant BW in Hz,     40 to 1000
SWG_qTiltInDB:          .quad   0
SWG_qFZindex:           .quad   0
SWG_NoiseBuffer:        .space  128 * SIZEOF_FLOAT
SWG_DiffVoicingBuffer:              #  These 3 label refer to one buffer
SWG_NasalBuffer:
SWG_VoicedBuffer:       .space  128 * SIZEOF_FLOAT
SWG_FricationBuffer:    .space  128 * SIZEOF_FLOAT
SWG_StackSize:          .quad   0


 #**********************************************************************
 #**********************************************************************
 #
 #  Routine: speech_waveform_generator
 #  Author:  Bill Hallahan
 #  Date:    March 20, 1994
 #
 #
 #  Abstract:
 #
 #    This routine generates a frame of speech samples. The frame time
 #    is defined by constant FrameTimeInSec. This constant is used in
 #    the set_fvtm_sample_rate routine to calculate the value of the
 #    variable uiNumberOfSamplesPerFrame. Voice excited parameters
 #    are updated pitch synchronously to avoid waveform glitches.
 #
 #    The routine read_speaker_definition must be called at least once before
 #    calling this routine. The default output sample rate is 11025 Hz
 #    and may be changed by calling the set_fvtm_sample_rate routine.
 #
 #    This code is NOT reentrant.
 #
 #
 #  Input:
 #
 #    R16    contains the address of a block of 16 bit signed values that
 #           are used to generate one frame of speech samples. There are
 #           17 parameters in the input block. The format of the
 #           parameter block is:
 #
 #           Order   Symbol      Description
 #
 #              0    OUT_AP    Asperation Gain
 #              1    OUT_F1    First Formant frequency in Hz.
 #              2    OUT_A2    Gain of Parallel filter 2 in dB.
 #              3    OUT_A3    Gain of Parallel filter 3 in dB.
 #              4    OUT_A4    Gain of Parallel filter 4 in dB.
 #              5    OUT_A5    Gain of Parallel filter 5 in dB.
 #              6    OUT_A6    Gain of Parallel filter 6 in dB.
 #              7    OUT_AB    Gain of Bypass Noise in dB.
 #              8    OUT_TL    Glottal Source Spectrum Tilt in dB.
 #              9    OUT_T0    Pitch Period
 #             10    OUT_AV    Gain of voicing in dB.
 #             11    OUT_F2    Second Formant frequency in Hz.
 #             12    OUT_F3    Third Formant frequency in Hz.
 #             13    OUT_FZ    Nasal Zero Frequency in Hz.
 #             14    OUT_B1    First Formant bandwidth in Hz.
 #             15    OUT_B2    Second Formant bandwidth in Hz.
 #             16    OUT_B3    Third Formant bandwidth in Hz.
 #
 #    R17    Contains the address of a buffer to place the speech samples.
 #           Each sample is a signed two's complement 16 bit word that
 #           ranges from -32768 to +32767. The buffer must be long enough
 #           to contain 6.4 msec. worth of samples at the current sample
 #           rate. The frame size dependancy on the sample rate is
 #           demonstrated in the following table:
 #
 #             Sample Rate (Hz.)    Frame Size
 #
 #                   8000              71
 #                  10000              64
 #                  11025              51
 #
 #    R18    Contains the address of a structure of type FVTM_T
 #           that stores the variables for this instance of the FVTM.
 #
 #    R26    R26 contains the return address for this routine.
 #
 #
 #  Output:
 #
 #    The output buffer specified in the input register R17 will
 #    contain a frame of 16 bit speech samples.
 #
 #
 #  Registers Modified:
 #
 #    R0, R1, R2, R3, R4, R6, R7, R8, R9,
 #    R16, R17, R18, R19, R20, R21, R22, R23, R24, R25,
 #    R27, R28
 #    F0, F1, F2, F3, F4, F5, F6, F7, F8, F9
 #    F10, F11, F12, F13, F14, F15, F16, F17, F18, F19
 #    F20, F21, F22, F23, F24, F25, F26, F27, F28, F29, F30
 #
 #**********************************************************************
 #**********************************************************************

 #**********************************************************************
 #  ENTRY POINT TO THE SPEECH WAVEFORM GENERATOR
 #**********************************************************************

        .text
        .align   5

        .ent  speech_waveform_generator

speech_waveform_generator:

 #----------------------------------------------------------------------
 #  By software convention, compilers require that the following
 #  registers are preserved across procedure calls.
 #
 #  Save registers R9 to R15 and R26 which contains the return address.
 #  Also save registers F2 to F9.
 #----------------------------------------------------------------------

        ldgp    GP, (R27)               # Load the global pointer
        lda     SP, -SWG_StackSize(SP)  # Allocate space for new stack frame
        stq     R26, SWG_R26(SP)        # Save register 26
        stq     R9, SWG_R9(SP)          # Save register 9
        stq     R10, SWG_R10(SP)        # Save register 10
        stq     R11, SWG_R11(SP)        # Save register 11
        stq     R12, SWG_R12(SP)        # Save register 12
        stq     R13, SWG_R13(SP)        # Save register 13
        stq     R14, SWG_R14(SP)        # Save register 14
        stq     R15, SWG_R15(SP)        # Save register 15
        stt     F2, SWG_F2(SP)          # Save register F2
        stt     F3, SWG_F3(SP)          # Save register F3
        stt     F4, SWG_F4(SP)          # Save register F4
        stt     F5, SWG_F5(SP)          # Save register F5
        stt     F6, SWG_F6(SP)          # Save register F6
        stt     F7, SWG_F7(SP)          # Save register F7
        stt     F8, SWG_F8(SP)          # Save register F8
        stt     F9, SWG_F9(SP)          # Save register F9
        trapb                           # Force any pending HW exceptions

        .prologue

 #----------------------------------------------------------------------
 #  Load address pointers for local static variables and constants.
 #
 #  Also copy the global value uiNumberOfSamplesPerFrame into the local
 #  Static variable structure element uiSamplesPerFrame.
 #----------------------------------------------------------------------

        lda     R11, Const_Constants    # R11 -> Q12InverseScale

 #----------------------------------------------------------------------
 #  Save the output buffer address.
 #----------------------------------------------------------------------

        stq     R17, SWG_qOutputAddress(SP) # Save output buffer address

 #**********************************************************************
 #  PROCESS INPUT PARAMETERS.
 #**********************************************************************
 #----------------------------------------------------------------------
 #  Load useful scaling values.
 #----------------------------------------------------------------------

        lds     F24, SpeakerAsperationGain(R18) # F24 = Speaker Asperation Gain
        lds     F25, SpeakerFricationGain(R18)  # F25 = Speaker Frication Gain
        lds     F26, FormantScale(R18)          # F26 = Formant Scale Factor
        lds     F27, SampleRateScale(R18) # F27 = Sample Rate Scale Factor
        lds     F30, bfLowSampleRate(R18) # Load the low sample rate flag

        lda     R25, dBtoLinearTable    # R25 -> dB to Linear Table address

 #----------------------------------------------------------------------
 #  APinDB = variabpars[OUT_AP];
 #  AsperationGain = SpeakerAsperationGain * dBtoLinear[APinDB + 10];
 #  Variable APinDB has been eliminated.
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iAPinDB, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> F1inHZ
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F23, 10 * SIZEOF_FLOAT(R1) # F23 = Unscaled Asperation Gain
        muls    F24, F23, F23           # F23 = AsperationGain *= SpeakerAsperationGain

 #----------------------------------------------------------------------
 #  Scale F1inHZ, F2inHZ, and F3inHZ up or down in frequency
 #  according to spdef FormantScale. Use trick to reduce scaling
 #  performed if F1inHZ or F2inHZ is relatively low.
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  F1inHZ = FormantScale * (FLTPNT_T)variabpars[OUT_F1]
 #    + ( 256.0 - 256.0 * FormantScale );
 #  F1Adjust is calculated when the speaker definition is loaded.
 #  Sample rate scaling of F1inHZ is performed later in macro
 #  D2POLE_CF123
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iF1inHZ, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iA2inDB
        stq     R0, SWG_qTemp(SP)       # Store as quadword
        ldt     F0, SWG_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float iF1inHZ
        muls    F26, F0, F0             # F1inHZ = FormantScale * F1inHZ
        lds     F1, F1Adjust(R18)       # F1 = Formant 1 Adjustment
        adds    F1, F0, F0              # Adjust F1inHZ
        sts     F0, SWG_F1inHZ(SP)      # Store F1inHZ

 #----------------------------------------------------------------------
 #  A2inDB = variabpars[OUT_A2];
 #  p2_gain = SpeakerFricationGain * dBtoLinear[A2inDB + 12];
 #  p2_gain is saved in F6 for use below by macro D2POLE_PF.
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iA2inDB, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iA3inDB
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F21, 12*SIZEOF_FLOAT(R1) # F21 = Unscaled p2_gain
        muls    F25, F21, F21           # F21 = p2_gain *= Speaker Frication Gain

 #----------------------------------------------------------------------
 #  A3inDB = variabpars[OUT_A3];
 #  p3_gain = SpeakerFricationGain * dBtoLinear[A3inDB + 10];
 #  p2_gain is saved in F7 for use below by macro D2POLE_PF.
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iA3inDB, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iA4inDB
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F22, 10*SIZEOF_FLOAT(R1) # F22 = Unscaled p3_gain
        muls    F25, F22, F22           # F22 = p3_gain *= Speaker Frication Gain

 #----------------------------------------------------------------------
 #  A4inDB = variabpars[OUT_A4];
 #  p4_b0 = SpeakerFricationGain * dBtoLinear[A4inDB + 7];
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iA4inDB, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iA5inDB
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F0, 7*SIZEOF_FLOAT(R1)  # F0 = Unscaled p4_b0
        muls    F25, F0, F0             # p4_b0 *= Speaker Frication Gain
        sts     F0, p4_b0(R18)          # Store p4_b0

 #----------------------------------------------------------------------
 #  A5inDB = variabpars[OUT_A5];
 #  p5_b0 = SpeakerFricationGain * dBtoLinear[A5inDB + 6];
 #
 #  If SampleRate < 9500 then the A5inDB and p5_b0 are not used.
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iA5inDB, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iA6inDB
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F0, 6*SIZEOF_FLOAT(R1)  # F0 = Unscaled p5_b0
        muls    F25, F0, F0             # p5_b0 *= Speaker Frication Gain
        fcmovne F30, F31, F0            # If Fs low then p5_b0 = 0.0
        sts     F0, p5_b0(R18)          # Store p5_b0

 #----------------------------------------------------------------------
 #  A6inDB = variabpars[OUT_A6];
 #  p6_b0 = SpeakerFricationGain * dBtoLinear[A6inDB + 5];
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iA6inDB, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iABinDB
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F0, 5*SIZEOF_FLOAT(R1)  # F0 = Unscaled p6_b0
        muls    F25, F0, F0             # p6_b0 *= Speaker Frication Gain
        sts     F0, p6_b0(R18)          # Store p6_b0

 #----------------------------------------------------------------------
 #  ABinDB = variabpars[OUT_AB];
 #  BypassNoiseGain = SpeakerFricationGain * dBtoLinear[ABinDB + 5];
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iABinDB, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> qTiltInDB
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F0, 5*SIZEOF_FLOAT(R1)  # F0 = Unscaled Bypass Noise Gain
        muls    F25, F0, F0             # BypassNoiseGain *= Speaker Frication Gain
        sts     F0, SWG_BypassNoiseGain(SP) # Store BypassNoiseGain

 #----------------------------------------------------------------------
 #  TiltInDB = variabpars[OUT_TLT] - 12;     # Tilt in dB at 3 kHz
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = qTiltInDB + 12, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> T0inS4
        subl    R0, 12, R0              # R0 = qTiltInDB
        stq     R0, SWG_qTiltInDB(SP)   # Store qTiltInDB

 #----------------------------------------------------------------------
 #  T0inS4 = SampleRateScale * (FLTPNT_T)variabpars[OUT_T0];
 #  This is a time, so it should be scaled if fs != 10K.
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iT0inS4, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iAVinDB
        stq     R0, SWG_qTemp(SP)       # Store as quadword
        ldt     F0, SWG_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float T0inS4
        muls    F27, F0, F0             # T0inS4 *= SampleRateScale
        sts     F0, SWG_T0inS4(SP)      # Store T0inS4

 #----------------------------------------------------------------------
 #  AVinDB = variabpars[OUT_AV];
 #
 #  The original C source for the floating point model used AVinDB
 #  in the following fashion later in pitch synchronous parameter
 #  update section of the vocal tract model:
 #
 #  LaryngealSourceGain = 8.0 * dBtoLinear[AVinDB + 4];
 #
 #  This is stored in the variable AVlinear and used to update
 #  the Laryngeal Source Gain later in the pitch synchronous
 #  update section of the glottal waveform loop.
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iAVinDB, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iF2inHZ
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F0, 4*SIZEOF_FLOAT(R1)  # F0 = 0.125 * AVlinear
        lds     F1, CF8(R11)            # F1 = 8.0
        muls    F1, F0, F0              # F0 = AVlinear
        sts     F0, SWG_AVlinear(SP)    # Store AVlinear

 #----------------------------------------------------------------------
 #  F2inHZ = FormantScale * (FLTPNT_T)variabpars[OUT_F2]
 #    + ( 512.0 - 512.0 * FormantScale );
 #  F2Adjust is calculated when the speaker definition is loaded.
 #  Sample rate scaling of F2inHZ is performed later in macro
 #  D2POLE_CF123
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iF2inHZ, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iF3inHZ
        stq     R0, SWG_qTemp(SP)       # Store as quadword
        ldt     F0, SWG_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float iF2inHZ
        muls    F26, F0, F0             # F2inHZ = FormantScale * F2inHZ
        lds     F1, F2Adjust(R18)       # F1 = Formant 2 Adjustment
        adds    F1, F0, F0              # Adjust F2inHZ
        sts     F0, SWG_F2inHZ(SP)      # Store F2inHZ

 #----------------------------------------------------------------------
 #  F3inHZ = FormantScale * (FLTPNT_T)variabpars[OUT_F3];
 #  Sample rate scaling of F3inHZ is performed later in macro
 #  D2POLE_CF123
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iF3inHZ, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iFZinHZ
        stq     R0, SWG_qTemp(SP)       # Store as quadword
        ldt     F0, SWG_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float iF3inHZ
        muls    F26, F0, F0             # F3inHZ = FormantScale * F3inHZ
        sts     F0, SWG_F3inHZ(SP)      # Store F3inHZ

 #----------------------------------------------------------------------
 #  FZinHZ = InverseSampleRateScale * (FLTPNT_T)variabpars[OUT_FZ];
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iFZinHZ, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iB1inHZ
        stq     R0, SWG_qTemp(SP)       # Store as quadword
        ldt     F0, SWG_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float iFZinHZ
        lds     F1, InverseSampleRateScale(R18) # F1 = Inverse Sample Rate Scale Factor
        muls    F1, F0, F0              # FZinHZ *= InverseSampleRateScale
        lds     F1, CFP125(R11)         # F1 = 0.125
        muls    F1, F0, F0              # F0 = 0.125 * FZinHZ
        cvtst   F0, F0                  # convert to t_floating format
        cvttq   F0, F0                  # F0 = (nint) 0.125 * FZinHZ
        stt     F0, SWG_qFZindex(SP)    # Store qFZindex

 #----------------------------------------------------------------------
 #  B1inHZ = (FLTPNT_T)variabpars[OUT_B1];
 #  Sample rate scaling of B1inHZ is performed later in macro
 #  D2POLE_CF123
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iB1inHZ, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iB2inHZ
        stq     R0, SWG_qTemp(SP)       # Store as quadword
        ldt     F0, SWG_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float iB1inHZ
        sts     F0, SWG_B1inHZ(SP)      # Store B1inHZ

 #----------------------------------------------------------------------
 #  B2inHZ = (FLTPNT_T)variabpars[OUT_B2];
 #  Sample rate scaling of B2inHZ is performed later in macro
 #  D2POLE_CF123
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iB2inHZ, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> iB3inHZ
        stq     R0, SWG_qTemp(SP)       # Store as quadword
        ldt     F0, SWG_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float iB2inHZ
        sts     F0, SWG_B2inHZ(SP)      # Store B2inHZ

 #----------------------------------------------------------------------
 #  B3inHZ = (FLTPNT_T)variabpars[OUT_B3];
 #  Sample rate scaling of B3inHZ is performed later in macro
 #  D2POLE_CF123
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = iB3inHZ, ldw uses R23, R28
        stq     R0, SWG_qTemp(SP)       # Store as quadword
        ldt     F0, SWG_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float iB3inHZ
        sts     F0, SWG_B3inHZ(SP)      # Store B3inHZ

 #----------------------------------------------------------------------
 #  Set coeficients of variable parallel resonator F2.
 #
 #  b2p = 210.0;
 #
 #  D2POLE_PF( p2_a1, p2_a2, p2_b0, F2inHZ, b2p );
 #
 #  p2_b0 = 2.0 * p2_gain * p2_b0;
 #----------------------------------------------------------------------

        lds     F5, CFP125(R11)         # F5 = 0.125
        lds     F6, CFP5(R11)           # F6 = 0.5
        lds     F7, CF4500(R11)         # F7 = 4500.0
        lds     F8, InverseSampleRateScale(R18) # F8 = 10000 / Fs

        lda     R22, RadiusTable        # R22 -> Radius Table
        lda     R23, TwoCosineTable     # R23 -> TwoCosine Table

        lds     F0, CF210(R11)          # F0 = Bandwidth
        lds     F1, SWG_F2inHZ(SP)      # F1 = Frequency

        bsr     R26, D2POLE_PF          # Calculate filter coefficients

        sts     F1, p2_a1(R18)          # Store p2_a1
        sts     F2, p2_a2(R18)          # Store p2_a2
        adds    F3, F3, F3              # F3 = 2.0 * p2_b0
        muls    F21, F3, F3             # F3 = 2.0 * p2_gain * p2_b0
        sts     F3, p2_b0(R18)          # Store p2_b0

 #----------------------------------------------------------------------
 #  Set coeficients of variable parallel resonator F3.
 #
 #  b3p = 280.0;
 #
 #  D2POavliLE_PF( p3_a1, p3_a2, p3_b0, F3inHZ, b3p );
 #
 #  p3_b0 = 2.0 * p3_gain * p3_b0;
 #----------------------------------------------------------------------

        lds     F0, CF280(R11)          # F0 = Bandwidth
        lds     F1, SWG_F3inHZ(SP)      # F1 = Frequency

        bsr     R26, D2POLE_PF          # Calculate filter coefficients

        sts     F1, p3_a1(R18)          # Store p3_a1
        sts     F2, p3_a2(R18)          # Store p3_a2
        adds    F3, F3, F3              # F3 = 2.0 * p3_b0
        muls    F22, F3, F3             # F3 = 2.0 * p3_gain * p3_b0
        sts     F3, p3_b0(R18)          # Store p3_b0

 #**********************************************************************
 #  END OF PROCESS INPUT PARAMETERS.
 #**********************************************************************
 #**********************************************************************
 #  NOISE AND GLOTTAL SOURCE GENERATOR
 #**********************************************************************
 #**********************************************************************
 #  NOISE GENERATOR FOR FRICATION AND ASPIRATION
 #  Generate noise samples for the frame.
 #
 #  RandomNumber = RandomNumber * RandomMultiplier + RandomAddend;
 #  RandomNumber is a 16 bit signed two's complement integer.
 #**********************************************************************
 #----------------------------------------------------------------------
 #
 #  The noise filter has one pole and two zeros. The factor of
 #  0.25 previously incorporated in the noise generation process
 #  has been incorporated in coefficients b0, b1 and b2 of the
 #  noise filter.
 #
 #  The pole tilts down the aspiration noise spectrum at high
 #  frequencies. The two zeros incorporate a Pi-rotated anti-resonator.
 #  (This is the same as an ordinary anti-resonator except that the b1
 #  coefficient has it's sign flipped).
 #  Frequency = 3500, Bandwidth = 1600.
 #
 #  The Nasal Anti-resonator and Resonator have been combined in
 #  a biquadratic filter. They were formerly implemented as a two
 #  zero filter followed by a two pole filter. The gain of the
 #  former two pole filter "NasalResonator_b0" has been included
 #  in the gain of the cascade path.
 #
 #  This filter is second order canonic section that is in
 #  Direct Form II that has the a2 coefficient equal to zero.
 #  The transfer function of the filter is:
 #
 #                              -1      -2
 #            Y(Z)     b0 + b1 Z  + b2 Z
 #    H(Z) = ------ = ---------------------
 #            X(Z)                 -1
 #                         1 - a1 Z
 #
 #
 #  The filter may be implemented as a difference equation of the
 #  following form.
 #
 #  y(n) = a1 y(n-1) + b2 x(n-2) + b1 x(n-1) + b0 x(n)
 #
 #  Instead the filter is implemented as a second order canonic
 #  filter section in Direct Form II with the a2 coefficient
 #  equal to zero.
 #
 #  The following equations that require less storage are used.
 #
 #  d(n) = a1 d(n-1) + x(n)
 #  y(n) = b2 d(n-2) + b1 d(n-1) + b0 d(n)
 #
 #
 #  Register F10 = Noise Filter Output = Noise Sample
 #  Register F23 = AsperationGain
 #----------------------------------------------------------------------

        ldl     R6, uiVoicePeriodSampleNumber(R18) # R6 = VPSN = Voice period sample #

        lda     R7, SWG_DiffVoicingBuffer(SP) # R7 -> Diff. Voicing Buffer
        lda     R8, B0Table             # R8 -> Voicing table
        ldl     R9, uiT0(R18)           # R9 = (int)T0
        ldl     R16, iPositionToStartNoiseModulation(R18) # R16 = iPos.
        ldl     R17, uiSamplesPerFrame(R18) # R17 = # of loop iterations
        ldl     R19, iNumOpenSamples(R18) # R19 = iNumOpenSamples
        subl    R9, R19, R4             # R4 = (int)T0 - iNumOpenSamples
        addq    R31, 20077, R20         # R20 = Random number multiplier
        ldl     R22, RandomNumber(R18)  # R22 = Previous 16 bit random number
        lda     R23, SWG_NoiseBuffer(SP) # R23 -> Output buffer for noise samples

        mulqv   R20, R22, R21           # R21 = R_Number * R_Multiplier
        mov     R31, R24                # Clear R24 = Pitch Sync Location
        addq    R31, 1, R27             # R27 = 1

        lds     F3, LaryngealSourcePitchSyncGain(R18) # F3 = Laryngeal Sync. Gain
        lds     F4, LaryngealSourceGain(R18) # F4 = Laryngeal Source Gain
        lds     F11, NoiseDelay_1(R18)  # F11 = Noise Delay 1 value
        lds     F12, NoiseDelay_2(R18)  # F12 = Noise Delay 2 value
        lds     F13, Noise_b0(R11)      # F13 = Noise b0 coefficient
        lds     F14, Noise_b1(R11)      # F14 = Noise b1 coefficient
        lds     F15, Noise_b2(R11)      # F15 = Noise b2 coefficient
        lds     F16, Noise_a1(R11)      # F16 = Noise a1 coefficient
        lds     F17, LowPassDelay_1(R18) # F17 = Low Pass Delay 1 value
        lds     F18, LowPassDelay_2(R18) # F18 = Low Pass Delay 2 value
        lds     F19, GlottalSourceTilt_b0(R18)   # F19 = GlottalSourceTilt_b0
        lds     F20, GlottalSourceTilt_a1(R18)   # F20 = GlottalSourceTilt_a1
        lds     F21, GlottalSourceTiltDelay(R18) # F21 = GlottalSourceTiltDelay
        lds     F22, SpeakerBreathinessSyncGain(R18) # F22 = SBPSG
        lds     F24, CF1(R11)           # F24 = 1.0
        lds     F25, CFP5(R11)          # F25 = 0.5
        lds     F26, DifferentiatedGlottalFlow(R18) # F26 = Diff. Glottal Flow last sample
        lds     F27, LowPass_a1(R18)    # F27 LowPass_a1
        lds     F28, LowPass_a2(R18)    # F28 LowPass_a2
        lds     F29, a(R18)             # F29 = a
        lds     F30, b(R18)             # F30 = b

 #----------------------------------------------------------------------
 #  Start of noise generation and filtering code
 #  R17 contains the number of loop iterations.
 #
 #  The following instruction has been removed from the top of loop
 #  VLOOP and is repeated at the bottom of loop VLOOP.
 #
 #  mulqv   R20, R22, R21            # R21 = R_Number * R_Multiplier
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  The following instructions are required at the top of loop VLOOP.
 #  They are repeated inside of loop VLOOP.
 #  This allows the code scheduler to generate more efficient code.
 #----------------------------------------------------------------------

VLOOP:  muls    F15, F12, F0            # F0 = b2 d(n-2)
        addq    R21, 12345, R22         # R22 = R_Number * R_Multiplier + R_Addend
        fmov    F11, F12                # d(n-2) = d(n-1)
        sll     R22, 48, R22            # Shift left 48 bits
        muls    F16, F11, F1            # F1 = a1 d(n-1)
        sra     R22, 48, R22            # R22 = 16 bit signed random number
        muls    F14, F11, F2            # F2 = b1 d(n-1)
        stq     R22, SWG_qTemp(SP)      # Store as quadword
        ldt     F10, SWG_qTemp(SP)      # Load quadword to floating point register
        cvtqs   F10, F10                # Float the random number
        adds    F1, F10, F11            # F11 = d(n) = a1 d(n-1) + x(n)
        muls    F13, F11, F10           # F10 = b0 d(n)
        adds    F0, F10, F10            # F10 = b2 d(n-2) + b0 d(n)
        adds    F10, F2, F10            # F10 = b2 d(n-2) + b1 d(n-1) + b0 d(n)

 #**********************************************************************
 #**********************************************************************
 #  END OF NOISE GENERATOR FOR FRICATION AND ASPIRATION
 #  Note that the block of noise samples of length uiSamplesPerFrame
 #  is modulated in the glottal source generation code below.
 #**********************************************************************

 #----------------------------------------------------------------------
 #  Amplitude modulate the noise. Reduce noise amplitude during
 #  the second half of the glottal period if
 #  LaryngealSourceGain" > 0.0. Otherwise
 #  iPositionToStartNoiseModulation is set to 0.
 #
 #  if ( uiVoicePeriodSampleNumber < iPositionToStartNoiseModulation )
 #    Noise = 0.5 * Noise;
 #----------------------------------------------------------------------

        fmov    F24, F0                 # F0 = N mult. = 1.0
        subl    R6, R16, R0             # Calculate VPSN - iPos.
        stq     R0, SWG_qTemp(SP)       # Store integer result
        ldt     F2, SWG_qTemp(SP)       # F2 = VPSN - iPos.
        cvtqs   F2, F2                  # Float previous result
        fcmovlt F2, F25, F0             # If VPSN < iPos. then N mult. = 0.5
        muls    F0, F10, F10            # Scale noise value
        s4addq  R27, R31, R2            # R2 = 4 = Decimation loop counter
        sts     F10, (R23)              # Store the filtered random number
        s4addq  R27, R23, R23           # Increment to next output location

 #----------------------------------------------------------------------
 #  PERIODIC VOICING WAVEFORM
 #  A period has duration of T0 samples,
 #  uiVoicePeriodSampleNumber is the counter of current time.
 #  During the first 0 to ( T0 - iNumOpenSamples ) samples the
 #  glottis is is closed. The glottis opens at time
 #  ( T0 - iNumOpenSamples ), and closes at time T0.
 #
 #  for ( nsr4 = 0; nsr4 < 4; nsr4++ )
 #  {
 #
 #  Start of the decimation loop
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  Future upgrade ? When glottis closes, reduce F1 and B1.
 #  f1_b1_down();
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  Compute next value of voicing wave. Calculate glottal pulse
 #  at 4 times output sample rate to minimize the quantization
 #  of the glottal period. The voicing waveform has a fixed
 #  waveshape defined by the equation:    2    3
 #                                      at - bt
 #
 #  Delay a "LaryngealSourceGain" change.
 #
 #  if ( uiVoicePeriodSampleNumber > ((int)T0 - iNumOpenSamples ))
 #  {
 #    a -= b;
 #    DifferentiatedGlottalFlow += a;
 #    LaryngealSourcePitchSyncGain = LaryngealSourceGain;
 #  }
 #  else
 #  {
 #    DifferentiatedGlottalFlow = 0.0;
 #  }
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  The following instructions are required at the top of loop DLOOP.
 #  They are repeated inside of loop DLOOP.
 #  This allows the code scheduler to generate more efficient code.
 #----------------------------------------------------------------------

        subl    R4, R6, R0              # R0 = (int)T0 - iNumOpenSamples - VPSN
        subs    F29, F30, F8            # F8 = New a = a - b
        stq     R0, SWG_qTemp(SP)       # Store integer result
        adds    F26, F8, F9             # F9 = Diff. Glottal Flow + a
        ldt     F2, SWG_qTemp(SP)       # F2 = (int)T0 - iNumOpenSamples - VPSN
        cvtqs   F2, F2                  # Float previous result

DLOOP:  muls    F28, F18, F6            # F6 = lp_a2 y(n-2)
        muls    F27, F17, F7            # F7 = lp_a1 y(n-1)
        fmov    F17, F18                # Copy LowPass y(n-1) to y(n-2)
        subl    R9, R6, R0              # R0 = (int)T0 - VPSN
        fcmovlt F2, F4, F3              # LaryngealSourcePitchSyncGain = LaryngealSourceGain #
        fcmovlt F2, F8, F29             # F29 = New a = a - b
        fcmovlt F2, F9, F26             # F26 = New Diff. Glottal Flow
        fcmovge F2, F31, F26            # F26 = Diff. Glottal Flow = 0.0

 #----------------------------------------------------------------------
 #  END OF PERIODIC VOICING WAVEFORM
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  Perform pitch synchronous update of some parameters. The
 #  parameter update is performed at the sample before the
 #  glottis opens.
 #
 #  if ( uiVoicePeriodSampleNumber == (int)T0 )
 #  {
 #----------------------------------------------------------------------

        beq     R0, PSYNC                # Branch if VPSN == (int)T0

 #----------------------------------------------------------------------
 #  Downsampling low-pass filter.
 #  Decimate the glottal pulse sample rate by 4.
 #
 #  The low pass filter is a two pole filter. The transfer function is:
 #
 #
 #            Y(Z)             1
 #    H(Z) = ------ = --------------------
 #            X(Z)             -1      -2
 #                     1 - a1 Z  - a2 Z
 #
 #
 #  The filter is implemented using the following difference equation:
 #
 #    y(n) = a2 y(n-2) + a1 y(n-1) + x(n)
 #
 #  F26 = input sample
 #  F17 = y(n-1) = output sample
 #  F18 = y(n-2)
 #  F27 = LowPass_a1 = a1
 #  F28 = LowPass_a2 = a2
 #
 #----------------------------------------------------------------------

 #**********************************************************************
 #  END OF GLOTTAL WAVEFORM PITCH SYNCHRONOUS SECTION
 #**********************************************************************

DPSYNC: subl    R2, 1, R2               # Decrement the decimation count
        addl    R6, 1, R6               # uiVoicePeriodSampleNumber++
        adds    F6, F26, F6             # F6 = lp_a2 y(n-2) + x(n)

 #----------------------------------------------------------------------
 #  The following instructions are required at the top of loop DLOOP.
 #  They are repeated above the top of loop DLOOP.
 #  This allows the code scheduler to generate more efficient code.
 #----------------------------------------------------------------------

        subl    R4, R6, R0              # R0 = (int)T0 - iNumOpenSamples - VPSN
        subs    F29, F30, F8            # F8 = New a = a - b
        stq     R0, SWG_qTemp(SP)       # Store integer result
        adds    F26, F8, F9             # F9 = Diff. Glottal Flow + a
        ldt     F2, SWG_qTemp(SP)       # F2 = (int)T0 - iNumOpenSamples - VPSN
        cvtqs   F2, F2                  # Float previous result

 #----------------------------------------------------------------------
 #  End of moved instruction block
 #----------------------------------------------------------------------

        adds    F6, F7, F17             # F17 = lp_a2 y(n-2) + lp_a1 y(n-1) + x(n)
        bgt     R2, DLOOP               # Branch until 4 samples are calculated

 #----------------------------------------------------------------------
 #  End of decimation loop. R2 contains the decimated glottal sample.
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  Tilt the Glottal Source frequency spectrum down by qTiltInDB
 #  dB at 3 kHz, Use a one pole IIR filter (also known as a decay
 #  averager). Note that the LowPass_b0 gain term and the
 #  SpeakerVoicingGain are both included in GlottalSourceTilt_b0.
 #
 #            Y(Z)        b0
 #    H(Z) = ------ = ------------
 #            X(Z)             -1
 #                     1 - a1 Z
 #
 #  The filter is implemented using the following difference equation:
 #
 #    y(n) = a1 y(n-1) + b0 x(n)
 #
 #----------------------------------------------------------------------

        mulqv   R20, R22, R21           # R21 = R_Number * R_Multiplier
        muls    F19, F17, F0            # F0 = GS_b0 x(n)
        muls    F20, F21, F21           # F21 = GS_a1 y(n-1)
        muls    F22, F10, F1            # F0 = SBPSG * Noise
        muls    F23, F10, F6            # F6 = ASPG * Noise
        adds    F0, F21, F21            # F21 = New y(n-1) = GS_a1 y(n-1) + GS_b0 x(n)

 #----------------------------------------------------------------------
 #  Add breathiness to voicing.
 #  DifferentiatedVoicing += SpeakerBreathinessSyncGain * Noise;
 #----------------------------------------------------------------------

        adds    F1, F21, F0             # F0 = Diff. Voicing += SBPSG * Noise

 #----------------------------------------------------------------------
 #  Apply the variable gain to the breathy voicing.
 #  DifferentiatedVoicing *= LaryngealSourcePitchSyncGain;
 #----------------------------------------------------------------------

        muls    F3, F0, F0              # F0 = Diff. Voicing *= LSPSG
        subl    R17, 1, R17             # Decrement the VLOOP loop counter

 #----------------------------------------------------------------------
 #  Add aspiration to the voicing.
 #  DifferentiatedVoicing += AsperationGain * Noise;
 #----------------------------------------------------------------------

        adds    F0, F6, F0              # F0 = Diff. Voicing += ASPG * Noise
        sts     F0, (R7)                # Store the Differentiated Voicing
        s4addq  R27, R7, R7             # Increment to next output location

        bgt     R17, VLOOP              # Branch until frame complete

 #----------------------------------------------------------------------
 #  End of glottal source loop.
 #  Save glottal source generation parameters.
 #----------------------------------------------------------------------

        sts     F3, LaryngealSourcePitchSyncGain(R18) # F3 = Laryngeal Sync. Gain
        sts     F4, LaryngealSourceGain(R18) # F4 = Laryngeal Source Gain
        sts     F11, NoiseDelay_1(R18)       # F11 = Noise Delay 1 value
        sts     F12, NoiseDelay_2(R18)       # F12 = Noise Delay 2 value
        sts     F17, LowPassDelay_1(R18)     # F17 = Low Pass Delay 1 value
        sts     F18, LowPassDelay_2(R18)     # F18 = Low Pass Delay 2 value
        sts     F19, GlottalSourceTilt_b0(R18) # F19 = GlottalSourceTilt_b0
        sts     F20, GlottalSourceTilt_a1(R18) # F20 = GlottalSourceTilt_a1
        sts     F21, GlottalSourceTiltDelay(R18) # F21 = GlottalSourceTiltDelay
        sts     F22, SpeakerBreathinessSyncGain(R18) # Store Pitch synchronous gain
        sts     F26, DifferentiatedGlottalFlow(R18)  # F26 = Diff. Glottal Flow last sample
        sts     F29, a(R18)               # F29 = a
        sts     F30, b(R18)               # F30 = b
        stl     R6, uiVoicePeriodSampleNumber(R18) # R6 = VPSN = Voice period sample #
        stl     R9, uiT0(R18)             # Store (int)T0
        stl     R16, iPositionToStartNoiseModulation(R18) # R16 = iPos.
        stl     R19, iNumOpenSamples(R18) # R19 = iNumOpenSamples
        stl     R22, RandomNumber(R18)    # Save the last random number

 #**********************************************************************
 #  END OF GLOTTAL SOURCE GENERATOR
 #**********************************************************************

 #----------------------------------------------------------------------
 #  Calculate how many samples are before the pitch synchronous
 #  update of the Nasal Resonator coefficients and the pitch synchronous
 #  update of the Cascade Filter coefficients.
 #
 #  R24 is the number of samples to process after pitch synchronization
 #  occurs. R24 contains zero if pitch synchronization did not occur.
 #  R24 contains uiSamplesPerFrame if pitch synchronization occured on
 #  the first sample in the frame. R24 contains 1 if pitch
 #  syncronization occured on the last sample in the frame.
 #----------------------------------------------------------------------

        ldl     R25, uiSamplesPerFrame(R18) # R25 = Frame Size
        subl    R25, R24, R25            # R25 = # of samples before Pitch Sync.

 #**********************************************************************
 #  CASCADE VOCAL TRACT, EXCITED BY LARYNGEAL SOURCES
 #
 #  The cascade path is comprised of the nasal filter followed by
 #  formant resonators for formants F29c, f4c, F3inHZ, F2inHZ, and F1inHZ.
 #**********************************************************************

 #**********************************************************************
 #  NASAL FILTER
 #
 #  The Nasal anti-resonator and nasal resonator have been combined in
 #  a biquadratic filter. They were formerly implemented as a two
 #  zero filter followed by a two pole filter. The gain of the
 #  former two pole filter "NasalResonator_b0" has been included
 #  in the gain of the cascade path.
 #**********************************************************************

 #----------------------------------------------------------------------
 #  Perform pre-pitch synchronous nasal filtering.
 #  R25 contains the # of samples before Pitch Synchronization occurs.
 #  R24 contains the # of samples after Pitch Synchronization occurs.
 #  R27 contains 1
 #----------------------------------------------------------------------

        lda     R1, SWG_NasalBuffer(SP) # R1 -> Nasal Output Buffer
        lda     R2, SWG_DiffVoicingBuffer(SP)  # R2 -> Diff. Voicing Buffer

        lds     F10, NasalDelay_1(R18)  # F10 = Nasal Delay 1 value
        lds     F11, NasalDelay_2(R18)  # F11 = Nasal Delay 2 value
        lds     F12, Nasal_a2(R18)      # F12 = Nasal_a2 filter coefficients
        lds     F13, Nasal_a1(R18)      # F12 = Nasal_a1 filter coefficients
        lds     F14, Nasal_b2(R18)      # F12 = Nasal_b2 filter coefficients
        lds     F15, Nasal_b1(R18)      # F12 = Nasal_b1 filter coefficients
        lds     F16, Nasal_b0(R18)      # F12 = Nasal_b0 filter coefficients
        mov     R25, R3                 # R3 = Size Before Pitch Sync.

        bsr     R26, BLOCK_BIQUAD       # Perform Nasal filtering

 #----------------------------------------------------------------------
 #  If the Pitch Synchronous code was not triggered during glottal
 #  Source generation then done filtering.
 #----------------------------------------------------------------------

        beq     R24, DNASAL             # If no pitch sync, done nasal filtering

 #**********************************************************************
 #  Update coeficients of the nasal zero anti-resonator by table
 #  lookup. This is done pitch synchronously.
 #
 #  Index = (int)( 0.125 * FZinHZ );
 #
 #  Nasal_b0 = Nasal_b0_Table[Index];
 #  Nasal_b1 = Nasal_b1_Table[Index];
 #  Nasal_b2 = Nasal_b2_Table[Index];
 #**********************************************************************

        ldl     R16, SWG_qFZindex(SP)   # R16 = (nint)(0.125 * FZinHZ)

        lda     R17, Nasal_b2_Table     # R17 -> Nasal b2 Table
        s4addq  R16, R17, R17           # R17 -> Table Entry
        lds     F14, (R17)              # F14 = Nasal_b2
        sts     F14, Nasal_b2(R18)      # Store Nasal_b2

        lda     R17, Nasal_b1_Table     # R17 -> Nasal b1 Table
        s4addq  R16, R17, R17           # R17 -> Table Entry
        lds     F15, (R17)              # F15 = Nasal_b1
        sts     F15, Nasal_b1(R18)      # Store Nasal_b1

        lda     R17, Nasal_b0_Table     # R17 -> Nasal b0 Table
        s4addq  R16, R17, R17           # R17 -> Table Entry
        lds     F16, (R17)              # F16 = Nasal_b0
        sts     F16, Nasal_b0(R18)      # Store Nasal_b0

 #----------------------------------------------------------------------
 #  Perform post-pitch synchronous nasal filtering.
 #----------------------------------------------------------------------

        mov     R24, R3                 # R3 = Size After Pitch Sync.

        bsr     R26, BLOCK_BIQUAD       # Perform Nasal filtering

 #----------------------------------------------------------------------
 #  End of nasal filter. Save the nasal delay values.
 #----------------------------------------------------------------------

DNASAL: sts     F10, NasalDelay_1(R18)  # F10 = Nasal Delay 1 value
        sts     F11, NasalDelay_2(R18)  # F11 = Nasal Delay 2 value

 #**********************************************************************
 #  END OF NASAL FILTER.
 #**********************************************************************

 #**********************************************************************
 #  CASCADE FORMANT RESONATORS.
 #**********************************************************************
 #----------------------------------------------------------------------
 #  Cascade formant resonators of the vocal tract. Formant 5 to formant 1.
 #  If the sample rate is less than 9500 Hz. then the coefficients for
 #  the 5th formant have already been set to eliminate the formant.
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  Perform pre-pitch synchronous cascade formant filtering.
 #  R25 contains the # of samples before Pitch Synchronization occurs.
 #  R24 contains the # of samples after Pitch Synchronization occurs.
 #  R27 contains 1
 #----------------------------------------------------------------------

        lda     R1, SWG_VoicedBuffer(SP) # R1 -> Cascade Output Buffer
        lda     R2, SWG_NasalBuffer(SP) # R2 -> Voicing Input Buffer

        lds     F30, c5_a2(R18)         # F30 = Coefficient c5_a2
        lds     F29, c5_a1(R18)         # F29 = Coefficient c5_a1
        lds     F28, c4_a2(R18)         # F28 = Coefficient c4_a2
        lds     F27, c4_a1(R18)         # F27 = Coefficient c4_a1
        lds     F26, c3_a2(R18)         # F26 = Coefficient c3_a2
        lds     F25, c3_a1(R18)         # F25 = Coefficient c3_a1
        lds     F24, c2_a2(R18)         # F24 = Coefficient c2_a2
        lds     F23, c2_a1(R18)         # F23 = Coefficient c2_a1
        lds     F22, c1_a2(R18)         # F22 = Coefficient c1_a2
        lds     F21, c1_a1(R18)         # F21 = Coefficient c1_a1
        lds     F20, CascadePathGain(R18) # F20 = Cascade Path Gain
        lds     F19, c5_Delay_2(R18)    # F19 = Cascade 5 Formant Delay value 2
        lds     F18, c5_Delay_1(R18)    # F18 = Cascade 5 Formant Delay value 1
        lds     F17, c4_Delay_2(R18)    # F17 = Cascade 4 Formant Delay value 2
        lds     F16, c4_Delay_1(R18)    # F16 = Cascade 4 Formant Delay value 1
        lds     F15, c3_Delay_2(R18)    # F15 = Cascade 3 Formant Delay value 2
        lds     F14, c3_Delay_1(R18)    # F14 = Cascade 3 Formant Delay value 1
        lds     F13, c2_Delay_2(R18)    # F13 = Cascade 2 Formant Delay value 2
        lds     F12, c2_Delay_1(R18)    # F12 = Cascade 2 Formant Delay value 1
        lds     F11, c1_Delay_2(R18)    # F11 = Cascade 1 Formant Delay value 2
        lds     F10, c1_Delay_1(R18)    # F10 = Cascade 1 Formant Delay value 1
        mov     R25, R3                 # R3 = Size Before Pitch Sync.

        bsr     R26, VOICED_FORMANTS    # Voiced vocal tract processing

 #----------------------------------------------------------------------
 #  If the Pitch Synchronous code was not triggered during glottal
 #  Source generation then done filtering.
 #----------------------------------------------------------------------

        beq     R24, DCSCAD             # If no pitch sync, done cascade filtering

 #**********************************************************************
 #  Set the pitch synchronous frequencies, bandwidths, and gains for
 #  cascade formants 1, 2, and 3.
 #**********************************************************************
 #----------------------------------------------------------------------
 #  Calculate the Filter coefficients for Cascade Formant 3
 #----------------------------------------------------------------------

        lds     F5, CFP125(R11)         # F5 = 0.125
        lds     F6, CFP5(R11)           # F6 = 0.5
        lds     F7, CF4500(R11)         # F7 = 4500.0
        lds     F8, InverseSampleRateScale(R18) # F8 = 10000 / Fs

        lda     R22, RadiusTable        # R22 -> Radius Table
        lda     R23, TwoCosineTable     # R23 -> TwoCosine Table

        lds     F0, SWG_B3inHZ(SP)      # F0 = Bandwidth
        lds     F1, SWG_F3inHZ(SP)      # F1 = Frequency

        bsr     R26, D2POLE_CF123       # Calculate filter coefficients

        sts     F1, c3_a1(R18)          # Store c3_a1
        sts     F2, c3_a2(R18)          # Store c3_a2
        sts     F3, SWG_c3_b0(SP)       # Store c3_b0
        fmov    F1, F25                 # F25 = c3_a1 (used below)
        fmov    F2, F26                 # F26 = c3_a2 (used below)

 #----------------------------------------------------------------------
 #  Calculate the Filter coefficients for Cascade Formant 2
 #----------------------------------------------------------------------

        lds     F0, SWG_B2inHZ(SP)      # F0 = Bandwidth
        lds     F1, SWG_F2inHZ(SP)      # F1 = Frequency

        bsr     R26, D2POLE_CF123       # Calculate filter coefficients

        sts     F1, c2_a1(R18)          # Store c2_a1
        sts     F2, c2_a2(R18)          # Store c2_a2
        sts     F3, SWG_c2_b0(SP)       # Store c2_b0
        fmov    F1, F23                 # F23 = c2_a1 (used below)
        fmov    F2, F24                 # F24 = c2_a2 (used below)

 #----------------------------------------------------------------------
 #  Calculate the Filter coefficients for Cascade Formant 1
 #----------------------------------------------------------------------

        lds     F0, SWG_B1inHZ(SP)      # F0 = Bandwidth
        lds     F1, SWG_F1inHZ(SP)      # F1 = Frequency

        bsr     R26, D2POLE_CF123       # Calculate filter coefficients

        sts     F1, c1_a1(R18)          # Store c1_a1
        sts     F2, c1_a2(R18)          # Store c1_a2
        fmov    F1, F21                 # F21 = c1_a1 (used below)
        fmov    F2, F22                 # F22 = c1_a2 (used below)

 #----------------------------------------------------------------------
 #  F0 contains c1_b0.
 #
 #  CascadePathGain = PartialCascadePathGain * c3_b0 * c2_b0 * c1_b0;
 #----------------------------------------------------------------------

        lds     F0, PartialCascadePathGain(R18) # F0 = PCPG
        muls    F3, F0, F0              # F0 = PCPG c1_b0
        lds     F2, SWG_c2_b0(SP)       # F2 = c2_b0
        muls    F2, F0, F0              # F0 = PCPG c1_b0 c2_b0
        lds     F2, SWG_c3_b0(SP)       # F2 = c3_b0
        muls    F2, F0, F20             # F20 = PCPG c1_b0 c2_b0 c3_b0
        sts     F20, CascadePathGain(R18) # Store the Cascade Path Gain

 #----------------------------------------------------------------------
 #  Perform post-pitch synchronous cascade formant filtering.
 #  R24 contains the # of samples after Pitch Synchronization occurs.
 #  R27 contains 1
 #----------------------------------------------------------------------

        mov     R24, R3                 # R3 = Size After Pitch Sync.

        bsr     R26, VOICED_FORMANTS    # Voiced vocal tract processing

 #----------------------------------------------------------------------
 #  End of cascade formants. Save the current delay values.
 #----------------------------------------------------------------------

DCSCAD: sts     F19, c5_Delay_2(R18)    # F19 = Cascade 5 Formant Delay value 2
        sts     F18, c5_Delay_1(R18)    # F18 = Cascade 5 Formant Delay value 1
        sts     F17, c4_Delay_2(R18)    # F17 = Cascade 4 Formant Delay value 2
        sts     F16, c4_Delay_1(R18)    # F16 = Cascade 4 Formant Delay value 1
        sts     F15, c3_Delay_2(R18)    # F15 = Cascade 3 Formant Delay value 2
        sts     F14, c3_Delay_1(R18)    # F14 = Cascade 3 Formant Delay value 1
        sts     F13, c2_Delay_2(R18)    # F13 = Cascade 2 Formant Delay value 2
        sts     F12, c2_Delay_1(R18)    # F12 = Cascade 2 Formant Delay value 1
        sts     F11, c1_Delay_2(R18)    # F11 = Cascade 1 Formant Delay value 2
        sts     F10, c1_Delay_1(R18)    # F10 = Cascade 1 Formant Delay value 1

 #**********************************************************************
 #  END OF CASCADE FORMANT RESONATORS.
 #**********************************************************************
 #**********************************************************************
 #  END OF CASCADE VOCAL TRACT, EXCITED BY LARYNGEAL SOURCES
 #**********************************************************************

 #**********************************************************************
 #  FRICATION FILTER (PARALLEL FILTERS)
 #**********************************************************************
 #----------------------------------------------------------------------
 #  Parallel Vocal Tract. Formant 6 to formant 2.
 #  R27 contains 1
 #----------------------------------------------------------------------

        lda     R1, SWG_FricationBuffer(SP)  # R1 -> Parallel Output Buffer
        lda     R2, SWG_NoiseBuffer(SP)      # R2 -> Noise Input Buffer

        ldl     R3, uiSamplesPerFrame(R18) # R3 = Number of samples
        lds     F30, p6_b0(R18)         # F30 = p6_b0 Filter coefficient
        lds     F29, p6_a2(R11)         # F30 = p6_a2 Filter coefficient
        lds     F28, p6_a1(R11)         # F30 = p6_a1 Filter coefficient
        lds     F27, p5_b0(R18)         # F27 = p5_b0 Filter coefficient
        lds     F26, p5_a2(R18)         # F26 = p5_a2 Filter coefficient
        lds     F25, p5_a1(R18)         # F25 = p5_a1 Filter coefficient
        lds     F24, p4_b0(R18)         # F24 = p4_b0 Filter coefficient
        lds     F23, p4_a2(R18)         # F23 = p4_a2 Filter coefficient
        lds     F22, p4_a1(R18)         # F22 = p4_a1 Filter coefficient
        lds     F21, p3_b0(R18)         # F21 = p3_b0 Filter coefficient
        lds     F20, p3_a2(R18)         # F20 = p3_a2 Filter coefficient
        lds     F19, p3_a1(R18)         # F19 = p3_a1 Filter coefficient
        lds     F18, p2_b0(R18)         # F18 = p2_b0 Filter coefficient
        lds     F17, p2_a2(R18)         # F17 = p2_a2 Filter coefficient
        lds     F16, p2_a1(R18)         # F16 = p2_a1 Filter coefficient
        lds     F15, p6_Delay_2(R18)    # F15 = Parallel 6 Delay 2 value
        lds     F14, p6_Delay_1(R18)    # F14 = Parallel 6 Delay 1 value
        lds     F13, p5_Delay_2(R18)    # F13 = Parallel 5 Delay 2 value
        lds     F12, p5_Delay_1(R18)    # F12 = Parallel 5 Delay 1 value
        lds     F11, p4_Delay_2(R18)    # F11 = Parallel 4 Delay 2 value
        lds     F10, p4_Delay_1(R18)    # F10 = Parallel 4 Delay 1 value
        lds     F9, p3_Delay_2(R18)     # F9 = Parallel 3 Delay 2 value
        lds     F8, p3_Delay_1(R18)     # F8 = Parallel 3 Delay 1 value
        lds     F7, p2_Delay_2(R18)     # F7 = Parallel 2 Delay 2 value
        lds     F6, p2_Delay_1(R18)     # F6 = Parallel 2 Delay 1 value

        bsr     R26, PARALLEL_FILTERS   # Unvoiced vocal tract processing

 #----------------------------------------------------------------------
 #  End of parallel filtering. Save the current delay values.
 #----------------------------------------------------------------------

        sts     F15, p6_Delay_2(R18)    # F15 = Parallel 6 Delay 2 value
        sts     F14, p6_Delay_1(R18)    # F14 = Parallel 6 Delay 1 value
        sts     F13, p5_Delay_2(R18)    # F13 = Parallel 5 Delay 2 value
        sts     F12, p5_Delay_1(R18)    # F12 = Parallel 5 Delay 1 value
        sts     F11, p4_Delay_2(R18)    # F11 = Parallel 4 Delay 2 value
        sts     F10, p4_Delay_1(R18)    # F10 = Parallel 4 Delay 1 value
        sts     F9, p3_Delay_2(R18)     # F9 = Parallel 3 Delay 2 value
        sts     F8, p3_Delay_1(R18)     # F8 = Parallel 3 Delay 1 value
        sts     F7, p2_Delay_2(R18)     # F7 = Parallel 2 Delay 2 value
        sts     F6, p2_Delay_1(R18)     # F6 = Parallel 2 Delay 1 value

 #**********************************************************************
 #  END OF FRICATION FILTER.
 #**********************************************************************
 #----------------------------------------------------------------------
 #  Add the cascade filter output and the parallel filter output.
 #
 #  Output = VoicedSpeech + UnvoicedSpeech
 #
 #  Then add bypass noise and scale the speech samples.
 #
 #  Output = BypassNoiseGain * Noise - Output;
 #  Output = Output * OutputScaleFactor;
 #
 #  if ( Output > 32767.0 )
 #    Output = 32767.0;
 #  else
 #    if ( Output < -32768.0 )
 #      Output = -32768.0;
 #
 #  iwave[uiNs] = (S16_T)( Output );
 #----------------------------------------------------------------------

        ldq     R1, SWG_qOutputAddress(SP)  # R1 -> Output Buffer for speech
        lda     R2, SWG_NoiseBuffer(SP)     # R2 -> Noise sample block
        ldl     R0, uiSamplesPerFrame(R18)  # R0 = Number of samples
        lds     F4, SWG_BypassNoiseGain(SP) # F4 = Bypass Noise Gain
        lds     F5, OutputScaleFactor(R18)  # F5 = Output Scale Factor
        lds     F6, CFM32768(R11)           # F6 = Minimum Integer Sample
        lds     F7, CF32767(R11)            # F7 = Maximum Integer Sample

 #----------------------------------------------------------------------
 #  R27 contains 1
 #  Load the pipeline
 #
 #  The address of SWG_NoiseBuffer is in R2.
 #  SWG_DiffVoicingBuffer is an offset of 128 * SIZEOF_FLOAT from (R2)
 #  and SWG_FricationBuffer is an offset of 256 * SIZEOF_FLOAT from (R2)
 #----------------------------------------------------------------------

        lds     F0, (R2)                # F0 = Noise Sample
        muls    F4, F0, F0              # F0 = BG N = BypassNoiseGain * Noise
        subl    R0, 1, R0               # Decrement the count
        lds     F1, 128*SIZEOF_FLOAT(R2) # F1 = Voiced Speech Sample
        lds     F2, 256*SIZEOF_FLOAT(R2) # F2 = Frication Sample
        s4addq  R27, R2, R2             # Increment to next noise sample
        adds    F1, F2, F1              # F1 = Voiced Speech + Frication
        subs    F0, F1, F0              # F0 = Sample = BG N - Voiced Speech - Frication
OULOOP:
        muls    F5, F0, F8              # F8 = OutputScaleFactor * Sample
        lds     F0, (R2)                # F0 = Noise Sample
        muls    F4, F0, F0              # F0 = BG N = BypassNoiseGain * Noise
        subl    R0, 1, R0               # Decrement the count
        lds     F1, 128*SIZEOF_FLOAT(R2) # F1 = Voiced Speech Sample
        lds     F2, 256*SIZEOF_FLOAT(R2) # F2 = Frication Sample
        s4addq  R27, R2, R2             # Increment to next noise sample
        adds    F1, F2, F1              # F1 = Voiced Speech + Frication
        subs    F0, F1, F0              # F0 = Sample = BG N - Voiced Speech - Frication
        subs    F0, F7, F9              # F9 = S - 32767.0
        fcmovgt F9, F7, F0              # if S > 32767.0 then S = 32767.0
        subs    F0, F6, F9              # F9 = S - (-32768)
        fcmovlt F9, F6, F0              # if S < -32768.0 then S = -32768.0
        cvtst   F0, F0                  # Is this necessary ?
        cvttq   F8, F3                  # F3 = (nint)Sample
        stt     F3, SWG_qTemp(SP)       # Store the quadword sample
        ldq     R6, SWG_qTemp(SP)       # Load the quadword
        stw     R6, (R1)                # Store sample. Uses R23, R25, R26, and R28
        addq    R1, SIZEOF_WORD, R1     # Increment to next output location
        bgt     R0, OULOOP              # Loop until the speech frame is done

 #----------------------------------------------------------------------
 #  Flush the pipeline.
 #----------------------------------------------------------------------

        muls    F5, F0, F8              # F8 = OutputScaleFactor * Sample
        subs    F0, F7, F9              # F9 = S - 32767.0
        fcmovgt F9, F7, F0              # if S > 32767.0 then S = 32767.0
        subs    F0, F6, F9              # F9 = S - (-32768)
        fcmovlt F9, F6, F0              # if S < -32768.0 then S = -32768.0
        cvtst   F0, F0                  # Is this necessary ?
        cvttq   F8, F3                  # F3 = (nint)Sample
        stt     F3, SWG_qTemp(SP)       # Store the quadword sample
        ldq     R6, SWG_qTemp(SP)       # Load the quadword
        stw     R6, (R1)                # Store sample. Uses R23, R25, R26, and R28

 #----------------------------------------------------------------------
 #  Restore registers RF2 to RF9.
 #  Also restore registers R9 to R15 and R26.
 #----------------------------------------------------------------------

        ldq     R26, SWG_R26(SP)        # Restore register 26
        ldq     R9, SWG_R9(SP)          # Restore register 9
        ldq     R10, SWG_R10(SP)        # Restore register 10
        ldq     R11, SWG_R11(SP)        # Restore register 11
        ldq     R12, SWG_R12(SP)        # Restore register 12
        ldq     R13, SWG_R13(SP)        # Restore register 13
        ldq     R14, SWG_R14(SP)        # Restore register 14
        ldq     R15, SWG_R15(SP)        # Restore register 15
        ldt     F2, SWG_F2(SP)          # Save register F2
        ldt     F3, SWG_F3(SP)          # Save register F3
        ldt     F4, SWG_F4(SP)          # Save register F4
        ldt     F5, SWG_F5(SP)          # Save register F5
        ldt     F6, SWG_F6(SP)          # Save register F6
        ldt     F7, SWG_F7(SP)          # Save register F7
        ldt     F8, SWG_F8(SP)          # Save register F8
        ldt     F9, SWG_F9(SP)          # Save register F9
        trapb                           # Force any pending HW exceptions

        lda     SP, SWG_StackSize(SP)   # Free stack frame

        ret     R31, (R26), 1           # Return to caller

 #**********************************************************************
 #  START OF GLOTTAL WAVEFORM PITCH SYNCHRONOUS SECTION
 #**********************************************************************
 #----------------------------------------------------------------------
 #  Reset period when 'uiVoicePeriodSampleNumber' reaches T0,
 #  when the glottis about to open
 #
 #  uiVoicePeriodSampleNumber = 0;
 #
 #----------------------------------------------------------------------

PSYNC:  mov     R31, R6                 # uiVoicePeriodSampleNumber = 0

 #----------------------------------------------------------------------
 #  LaryngealSourceGain moved to LaryngealSourcePitchSyncGain
 #  after half of a pitch period.
 #  Include the gain of the downsampling low pass filter in
 #  LaryngealSourceGain to stay compatible with the integer
 #  vocal tract model. Scale up by 8 to correct for a
 #  frac4mul() of this Q15 gain.
 #  LaryngealSourceGain = AVlinear;
 #----------------------------------------------------------------------

        lds     F4, SWG_AVlinear(SP)    # F4 = LaryngealSourceGain = AVlinear

 #----------------------------------------------------------------------
 #  T0 = T0inS4;                 #  T0inS4 remembers period in case
 #                               #  more than 1 period in cur. frame.
 #  Temp = T0Jitter * T0;        #  Add jitter, if any.
 #  T0 +=  Temp;
 #  T0Jitter = - T0Jitter;       #  Cause jitter to alternate.
 #----------------------------------------------------------------------

        lds     F0, T0Jitter(R18)       # F0 = T0Jitter
        negs    F0, F1                  # T0Jitter = - T0Jitter
        sts     F1, T0Jitter(R18)       # Store minus T0Jitter
        lds     F1, SWG_T0inS4(SP)      # F1 = T0inS4
        muls    F1, F0, F0              # F0 = T0 * T0Jitter
        adds    F0, F1, F2              # T0 = T0 + T0 * T0Jitter
        cvtst   F2, F2                  # Is this necessary ?
        cvttqc  F2, F0                  # F0 = (int)T0
        stt     F0, SWG_qTemp(SP)       # Store (int)T0
        ldq     R9, SWG_qTemp(SP)       # R9 = (int)T0 (Needed at top of loop)

 #----------------------------------------------------------------------
 #  SpeakerBreathinessSyncGain is the Speaker definition
 #  breathiness coeficient.
 #
 #  SpeakerBreathinessSyncGain = SpeakerBreathinessGain;
 #----------------------------------------------------------------------

        lds     F22, SpeakerBreathinessGain(R18) # F22 = Speaker Breathiness Gain

 #----------------------------------------------------------------------
 #  Calculate the coefficients of a one pole filter (decay averager)
 #  that is used to tilt the spectrum of the glottal source down by
 #  TiltInDB dB at 3 kHz.
 #
 #  GlottalSourceTilt_a1 = 0.0333862304 * (FLTPNT_T)TiltInDB;
 #
 #  if ( GlottalSourceTilt_a1 >= 0.0 )
 #    GlottalSourceTilt_b0 = 1.0 - GlottalSourceTilt_a1;
 #  else
 #    GlottalSourceTilt_b0 = 1.0;
 #----------------------------------------------------------------------

        ldt     F20, SWG_qTiltInDB(SP)  # F0 = Tilt in DB
        cvtqt   F20, F20                # F0 = Floating tilt in DB
        lds     F19, CFP0333862304(R11) # F1 = 0.0333862304
        muls    F19, F20, F20           # F0 = GS_a1 = 0.0333862304 * TiltInDB
        subs    F24, F20, F19           # F1 = GS_b0 = 1.0 - GS_a1
        fcmovlt F20, F24, F19           # If GS_a1 < 0.0 then GS_b0 = 1.0

 #----------------------------------------------------------------------
 #  Scale the glottal waveform using the speaker dependant parameter
 #  "SpeakerVoicingGain". The gain of the decimating low pass filter
 #  "LowPass_b0" has previously been incorporated in the SpeakerVoicingGain.
 #
 #  GlottalSourceTilt_b0 *= SpeakerVoicingGain;
 #----------------------------------------------------------------------

        lds     F0, SpeakerVoicingGain(R18) # F0 = SpeakerVoicingGain
        muls    F0, F19, F19            # F19 = GS_b0 * SpeakerVoicingGain

 #----------------------------------------------------------------------
 #  Set to "iPositionToStartNoiseModulation" during the
 #  first half of the period. Modulate the amplitude of the
 #  noise if "LaryngealSourceGain" > 0.0.
 #
 #  iPositionToStartNoiseModulation = 0;
 #
 #  if ( LaryngealSourceGain > 0.0 )
 #    iPositionToStartNoiseModulation = (nint)( 0.5 * T0 );
 #----------------------------------------------------------------------

        muls    F25, F2, F0             # F0 = iPos 0.5 * T0
        fcmovle F4, F31, F0             # If LSG <= 0 then iPos = 0
        cvtst   F0, F0                  # Is this necessary ?
        cvttqc  F0, F1                  # F1 = (int)iPos
        stt     F1, SWG_qTemp(SP)       # Store (int)iPos
        ldq     R16, SWG_qTemp(SP)      # R16 = iPos

 #----------------------------------------------------------------------
 #  Make the open portion of the differentiated glottal
 #  waveform longer as TiltInDB increases.
 #
 #  iNumOpenSamples = (int)( k1 * T0 + k2);
 #  iNumOpenSamples += ( TiltInDB << 2 );
 #----------------------------------------------------------------------

        lds     F0, k1(R18)             # F0 = k1
        muls    F2, F0, F0              # F0 = k1 * T0
        lds     F1, k2(R18)             # F1 = k2
        adds    F1, F0, F0              # F0 = k1 * T0 + k2
        cvtst   F0, F0                  # Is this necessary ?
        cvttqc  F0, F1                  # F1 = (int)( k1 * T0 + k2 )
        stt     F1, SWG_qTemp(SP)       # Store (int)( k1 * T0 + k2 )
        ldq     R19, SWG_qTemp(SP)      # R19 = (int)( k1 * T0 + k2 )
        ldl     R0, SWG_qTiltInDB(SP)   # R0 = qTiltInDB
        sll     R0, 2, R0               # R0 = qTiltInDB << 2
        addl    R0, R19, R19            # R19 = iNumOpenSamples

 #----------------------------------------------------------------------
 #  Bound the open portion of the glottal waveform.
 #  Limit iNumOpenSamples to the range from 40 to 263.
 #----------------------------------------------------------------------

        addq    R31, 40, R3             # R3 = 40
        subl    R19, R3, R0             # R0 = iNumOpenSamples - 40
        cmovlt  R0, R3, R19             # if iNS < 40 then iNS = 40
        addq    R31, 263, R1            # R1 = 263
        subl    R19, R1, R0             # R0 = iNumOpenSamples - 263
        cmovgt  R0, R1, R19             # if iNS > 263 then iNS = 263

 #----------------------------------------------------------------------
 #  if ( iNumOpenSamples >= (int)( 0.75 * T0 ))
 #    iNumOpenSamples = (int)( 0.75 * T0 );
 #----------------------------------------------------------------------

        lds     F0, CFP75(R11)          # F0 = 0.75
        muls    F2, F0, F0              # F0 = 0.75 * T0
        cvtst   F0, F0                  # Is this necessary ?
        cvttqc  F0, F1                  # F1 = (int)( 0.75 * T0 )
        stt     F1, SWG_qTemp(SP)       # Store (int)( 0.75 * T0 )
        ldq     R0, SWG_qTemp(SP)       # R0 = (int)( 0.75 * T0 )
        subl    R19, R0, R1             # R1 = iNumOpenSamples - (int)(0.75 * T0)
        cmovge  R1, R0, R19             # if >= then iNumOpenSamples = (int)(0.75 * T0)

 #----------------------------------------------------------------------
 #  Reset a & b, which determine shape of glottal waveform.
 #
 #  The equations were:
 #
 #    b = 0.0625 * B0[iNumOpenSamples-40];
 #    a = 0.333333333333333 * b * (FLTPNT_T)iNumOpenSamples;
 #
 #  The factor of 0.0625 was incorporated in the table entries.
 #  The new equations are:
 #
 #    b = B0[iNumOpenSamples-40];
 #    a = 0.333333333333333 * b * (FLTPNT_T)iNumOpenSamples;
 #
 #----------------------------------------------------------------------

        subl    R19, R3, R0             # R0 = iNumOpenSamples - 40
        s4addq  R0, R8, R1              # R1 -> B0[iNumOpenSamples-40]
        lds     F30, (R1)               # F30 = b = B0[iNumOpenSamples-40]
        stq     R19, SWG_qTemp(SP)      # R19 = iNumOpenSamples
        ldt     F0, SWG_qTemp(SP)       # F0 = (int)iNumOpenSamples
        cvtqtc  F0, F0                  # F0 = iNumOpenSamples
        muls    F0, F30, F29            # F29 = b * (float)iNumOpenSamples
        lds     F1, CFP333333333333(R11) # F1 = 0.333333333333
        muls    F1, F29, F29            # F29 = a

 #----------------------------------------------------------------------
 #  Calculate (int)T0 - iNumOpenSamples for glottal pulse open interval.
 #----------------------------------------------------------------------

        subl    R9, R19, R4             # R4 = (int)T0 - iNumOpenSamples

 #**********************************************************************
 #  The C floating point model calculates the coeficients of the
 #  variable cascade resonators and the Nasal antiresonator here.
 #  Now since all the glottal samples are calculated before the cascade
 #  (or parallel) filters, we save the glottal sample number that
 #  corresponds to when the cascade filter bank coefficients are updated.
 #
 #  Note that the sample number is saved only on the first occurence of
 #  pitch synchronization.
 #**********************************************************************

        cmoveq  R24, R17, R24           # Save sample number in flag

        br      DPSYNC                  # Done Pitch Synchronous processing

        .end

 #----------------------------------------------------------------------
 #  Routine: BLOCK_BIQUAD
 #  Author:  Bill Hallahan
 #  Date:    March 22, 1994
 #
 #  Abstract:
 #
 #    This routine filters an input block of data.
 #    This filter is second order canonic section that is
 #    in Direct Form II. The transfer function of the filter is:
 #
 #                                -1      -2
 #              Y(Z)     b0 + b1 Z  + b2 Z
 #      H(Z) = ------ = ---------------------
 #              X(Z)             -1      -2
 #                       1 - a1 Z  - a2 Z
 #
 #
 #    The filter may be implemented as a difference equation of the
 #    following form.
 #
 #    y(n) = a2 y(n-2) + a1 y(n-1) + b2 x(n-2) + b1 x(n-1) + b0 x(n)
 #
 #    Instead the filter is implemented as a second order canonic
 #    filter section in Direct Form II.
 #
 #    The following equations that require less storage are used.
 #
 #    d(n) = a2 d(n-2) + a1 d(n-1) + x(n)
 #    y(n) = b2 d(n-2) + b1 d(n-1) + b0 d(n)
 #
 #
 #  Input:
 #
 #    R1     Contains a pointer to the output buffer
 #
 #    R2     Contains a pointer to the input buffer of samples
 #           to be filtered.
 #
 #    R3     Contains the length of the input block of samples
 #           pointed to by register R2.
 #
 #    R26    Contains the return address
 #
 #    R27    Contains the value 1.
 #
 #    F10    Contains d(n-1)
 #
 #    F11    Contains d(n-2)
 #
 #    F12    Contains a2
 #
 #    F13    Contains a1
 #
 #    F14    Contains b2
 #
 #    F15    Contains b1
 #
 #    F16    Contains b0
 #
 #  Output:
 #
 #    The filtered input data is stored in the output buffer.
 #
 #    F10    After execution, F10 contains the d(n-1) for the next
 #           call to this routine. This may need to be saved by the
 #           calling routine for subsequent calls to this routine.
 #
 #    F11    After execution, F10 contains the d(n-2) for the next
 #           call to this routine. This may need to be saved by the
 #           calling routine for subsequent calls to this routine.
 #
 #
 #  Registers Modified:
 #
 #    R0, R1, R2, R3, F10, F11, F12, F13, F14
 #
 #----------------------------------------------------------------------

BLOCK_BIQUAD:
        beq     R3, BQSKIP      # Skip if length = 0

BQLOOP: lds     F1, (R2)        # F1 = Input sample
        muls    F12, F11, F17   # F17 = a2 d(n-2)
        s4addq  R27, R2, R2     # Increment to next input location
        muls    F13, F10, F18   # F18 = a1 d(n-1)
        muls    F14, F11, F19   # F19 = b2 d(n-2)
        muls    F15, F10, F20   # F20 = b1 d(n-1)
        adds    F17, F1, F17    # F17 = a2 d(n-2) + x(n)
        fmov    F10, F11        # Next d(n-2) = d(n-1)
        adds    F18, F17, F10   # F10 = d(n) = a2 d(n-2) + a1 d(n-1) + x(n)
        subl    R3, 1, R3       # Decrement the count
        muls    F16, F10, F17   # F17 = b0 d(n)
        adds    F19, F17, F17   # F17 = b2 d(n-2) + b0 d(n)
        adds    F20, F17, F17   # F17 = b2 d(n-2) + b1 d(n-1) + b0 d(n)
        sts     F17, (R1)       # Store the filter output
        s4addq  R27, R1, R1     # Increment to next output location
        bgt     R3, BQLOOP      # Loop until done

BQSKIP: ret     R31, (R26), 1   # Return to caller

 #----------------------------------------------------------------------
 #  Routine: VOICED_FORMANTS
 #  Author:  Bill Hallahan
 #  Date:    March 22, 1994
 #
 #  Abstract:
 #
 #    This routine filters an input block of samples. The filtering
 #    is done using 5 two pole resonators in cascade.
 #
 #    Cascade vocal tract. Formant 5 to formant 1.
 #
 #    If the sample rate is less than 9500 Hz. then the coefficients for
 #    the 5th formant have already been set to eliminate the filter.
 #
 #    Each cascade filter is a two pole filter. The transfer function of
 #    each filter is:
 #
 #
 #              Y(Z)             1
 #      H(Z) = ------ = --------------------
 #              X(Z)             -1      -2
 #                       1 - a1 Z  - a2 Z
 #
 #
 #    Formants 5 through 2 are implemented using the following difference
 #    equation.
 #
 #      y(n) = a2 y(n-2) + a1 y(n-1) + x(n)
 #
 #    The last formant calculated (which is Formant 1) is implemented
 #    using the following difference equation. This corresponds to replacing
 #    the 1 in the numerator of the transfer function shown above with the
 #    gain term b0.
 #
 #      y(n) = a2 y(n-2) + a1 y(n-1) + b0 x(n)
 #
 #    where: b0 = CascadePathGain = Gain
 #
 #
 #  Input:
 #
 #    R1     Contains a pointer to the output buffer
 #
 #    R2     Contains a pointer to the input buffer of samples
 #           to be filtered.
 #
 #    R3     Contains the length of the input block of samples
 #           pointed to by register R2.
 #
 #    R26    Contains the return address
 #
 #    R27    Contains the integer value 1.
 #
 #    F30    Contains the value of c5_a2
 #
 #    F29    Contains the value of c5_a1
 #
 #    F28    Contains the value of c4_a2
 #
 #    F27    Contains the value of c4_a1
 #
 #    F26    Contains the value of c3_a2
 #
 #    F25    Contains the value of c3_a1
 #
 #    F24    Contains the value of c2_a2
 #
 #    F23    Contains the value of c2_a1
 #
 #    F22    Contains the value of c1_a2
 #
 #    F21    Contains the value of c1_a1
 #
 #    F20    Contains the value of CascadePathGain
 #
 #    F19    Contains the value of c5_Delay_2
 #
 #    F18    Contains the value of c5_Delay_1
 #
 #    F17    Contains the value of c4_Delay_2
 #
 #    F16    Contains the value of c4_Delay_1
 #
 #    F15    Contains the value of c3_Delay_2
 #
 #    F14    Contains the value of c3_Delay_1
 #
 #    F13    Contains the value of c2_Delay_2
 #
 #    F12    Contains the value of c2_Delay_1
 #
 #    F11    Contains the value of c1_Delay_2
 #
 #    F10    Contains the value of c1_Delay_1
 #
 #
 #  Output:
 #
 #    The filtered input data is stored in the output buffer.
 #
 #      F10, F11, F12, F13, F14, F15, F16, F17, F18, F19
 #
 #      After execution, registers F10 to F19 contain the
 #      delay values required for the subsequent calls to
 #      this routine. These should be saved by the calling
 #      calling routine.
 #
 #  Registers Modified:
 #
 #    R1, R2, R3, F0, F1, F2, F3, F4, F5, F6, F7,
 #    F10, F11, F12, F13, F14, F15, F16, F17, F18, F19, F20
 #
 #  Remarks:
 #
 #    Note that yx(n) becomes yx(n-1) on subsequent loop iterations.
 #    where yx(n) is either y1(n), y2(n), ... y5(n).
 #
 #----------------------------------------------------------------------

VOICED_FORMANTS:
        beq     R3, CFSKIP      # Skip if length = 0

CFLOOP:
        lds     F7, (R2)        # F7 = Input sample = x(n)
        s4addq  R27, R2, R2     # Increment to next input location
        muls    F30, F19, F0    # F0 = c5_a2 y5(n-2)
        muls    F29, F18, F1    # F1 = c5_a1 y5(n-1)
        muls    F20, F7, F7     # F7 = CascadePathGain * x(n) = CPG * x(n)
        fmov    F18, F19        # F19 = y5(n-2) = y5(n-1)
        muls    F28, F17, F2    # F2 = c4_a2 y4(n-2)
        muls    F27, F16, F3    # F3 = c4_a1 y4(n-1)
        fmov    F16, F17        # F17 = y4(n-2) = y4(n-1)
        muls    F26, F15, F4    # F4 = c3_a2 y3(n-2)
        muls    F25, F14, F5    # F5 = c3_a1 y3(n-1)
        fmov    F14, F15        # F15 = y3(n-2) = y3(n-1)
        adds    F0, F7, F0      # F0 = c5_a2 y5(n-2) + CPG * x(n)
        adds    F0, F1, F18     # F18 = y5(n) = c5_a2 y5(n-2) + c5_a1 y5(n-1) + CPG x(n)
        muls    F24, F13, F0    # F0 = c2_a2 y2(n-2)
        muls    F23, F12, F1    # F1 = c2_a1 y2(n-1)
        fmov    F12, F13        # F13 = y2(n-2) = y2(n-1)
        muls    F22, F11, F6    # F6 = c1_a2 y1(n-2)
        muls    F21, F10, F7    # F7 = c1_a1 y1(n-1)
        fmov    F10, F11        # F11 = y1(n-2) = y1(n-1)
        adds    F2, F18, F2     # F2 = c4_a2 y4(n-2) + y5(n)
        adds    F2, F3, F16     # F16 = y4(n) = c4_a2 y4(n-2) + c4_a1 y4(n-1) + y5(n)
        adds    F4, F16, F4     # F4 = c3_a2 y3(n-2) + y4(n)
        adds    F4, F5, F14     # F14 = y3(n) = c3_a2 y3(n-2) + c3_a1 y3(n-1) + y4(n)
        adds    F0, F14, F0     # F0 = c2_a2 y2(n-2) + y3(n)
        adds    F0, F1, F12     # F12 = y2(n) = c2_a2 y2(n-2) + c2_a1 y2(n-1) + y3(n)
        subl    R3, 1, R3       # Decrement the count
        adds    F6, F12, F6     # F6 = c1_a2 y1(n-2) + Gain y2(n)
        adds    F6, F7, F10     # F10 = y1(n) = c1_a2 y1(n-2) + c1_a1 y1(n-1) + Gain y2(n)
        sts     F10, (R1)       # Store the filter output
        s4addq  R27, R1, R1     # Increment to next output location
        bgt     R3, CFLOOP      # Loop until done

CFSKIP: ret     R31, (R26), 1   # Return to caller

 #----------------------------------------------------------------------
 #  Routine: PARALLEL_FILTERS
 #  Author:  Bill Hallahan
 #  Date:    March 22, 1994
 #
 #  Parallel Vocal Tract. Formant 6 to formant 2.
 #
 #  This section filters an input block of samples. The filtering
 #  is done using 5 two pole resonators in cascade.
 #
 #  Excited by frication noise source. Uses formant frequencies
 #  F6p, F5p, f4p, F3inHz, F2inHz and bypass path, outputs added
 #  with alternating sign starting with the F6p filter output negative.
 #
 #  If the sample rate is less than 9500 Hz. then the coefficients for
 #  the 5th formant have already been set to eliminate the filter.
 #
 #  The noise filters are two pole filters. The transfer function of
 #  each filter is:
 #
 #
 #            Y(Z)            b0
 #    H(Z) = ------ = --------------------
 #            X(Z)             -1      -2
 #                     1 - a1 Z  - a2 Z
 #
 #
 #  Formants 6 through 2 are implemented using the following difference
 #  equation.
 #
 #    y(n) = a2 y(n-2) + a1 y(n-1) + b0 x(n)
 #
 #  Input:
 #
 #    R1     Contains a pointer to the output buffer
 #
 #    R2     Contains a pointer to the input buffer of samples
 #           to be filtered.
 #
 #    R3     Contains the length of the input block of samples
 #           pointed to by register R2.
 #
 #    R26    Contains the return address
 #
 #    R27    Contains the integer value 1.
 #
 #    F30    Contains the value of p6_b0
 #
 #    F29    Contains the value of p6_a2
 #
 #    F28    Contains the value of p6_a1
 #
 #    F27    Contains the value of p5_b0
 #
 #    F26    Contains the value of p5_a2
 #
 #    F25    Contains the value of p5_a1
 #
 #    F24    Contains the value of p4_b0
 #
 #    F23    Contains the value of p4_a2
 #
 #    F22    Contains the value of p4_a1
 #
 #    F21    Contains the value of p3_b0
 #
 #    F20    Contains the value of p3_a2
 #
 #    F19    Contains the value of p3_a1
 #
 #    F18    Contains the value of p2_b0
 #
 #    F17    Contains the value of p2_a2
 #
 #    F16    Contains the value of p2_a1
 #
 #    F15    Contains the value of p6_Delay_2
 #
 #    F14    Contains the value of p6_Delay_1
 #
 #    F13    Contains the value of p5_Delay_2
 #
 #    F12    Contains the value of p5_Delay_1
 #
 #    F11    Contains the value of p4_Delay_2
 #
 #    F10    Contains the value of p4_Delay_1
 #
 #    F9     Contains the value of p3_Delay_2
 #
 #    F8     Contains the value of p3_Delay_1
 #
 #    F7     Contains the value of p2_Delay_2
 #
 #    F6     Contains the value of p2_Delay_1
 #
 #
 #  Output:
 #
 #    The filtered input data is stored in the output buffer.
 #
 #      F6, F7, F8, F9, F10, F11, F12, F13, F14, F15
 #
 #      After execution, registers F6 to F15 contain the
 #      delay values required for the subsequent calls to
 #      this routine. These should be saved by the calling
 #      calling routine.
 #
 #
 #  Registers Modified:
 #
 #    R1, R2, R3, F0, F1, F2, F3, F4, F5, F6, F7,
 #    F10, F11, F12, F13, F14, F15, F16, F17, F18, F19, F20
 #
 #----------------------------------------------------------------------

PARALLEL_FILTERS:

PFLOOP: lds     F4, (R2)        # F4 = Input sample
        s4addq  R27, R2, R2     # Increment to next input location
        muls    F30, F4, F0     # F0 = p6_b0 * x(n)
        muls    F29, F15, F1    # F1 = p6_a2 y6(n-2)
        fmov    F14, F15        # F15 = y6(n-2) = y6(n-1)
        muls    F28, F14, F14   # F14 = p6_a1 y6(n-1)
        muls    F27, F4, F2     # F2 = p5_b0 * x(n)
        muls    F26, F13, F3    # F3 = p5_a2 y5(n-2)
        fmov    F12, F13        # F13 = y5(n-2) = y5(n-1)
        muls    F25, F12, F12   # F12 = p5_a1 y5(n-1)
        adds    F0, F1, F0      # F2 = p6_a2 y6(n-2) + p6_b0 x(n)
        adds    F0, F14, F14    # F14 = y6(n) = p6_a2 y6(n-2) + p6_a1 y6(n-1) + p6_b0 x(n)
        muls    F24, F4, F0     # F0 = p4_b0 * x(n)
        muls    F23, F11, F1    # F1 = p4_a2 y4(n-2)
        fmov    F10, F11        # F11 = y4(n-2) = y4(n-1)
        muls    F22, F10, F10   # F10 = p4_a1 y4(n-1)
        adds    F2, F3, F2      # F2 = p5_a2 y5(n-2) + p5_b0 x(n)
        adds    F2, F12, F12    # F12 = y5(n) = p5_a2 y5(n-2) + p5_a1 y5(n-1) + p5_b0 x(n)
        muls    F21, F4, F2     # F2 = p3_b0 * x(n)
        muls    F20, F9, F3     # F3 = p3_a2 y3(n-2)
        fmov    F8, F9          # F9 = y3(n-2) = y3(n-1)
        muls    F19, F8, F8     # F8 = p3_a1 y3(n-1)
        adds    F0, F1, F0      # F2 = p4_a2 y4(n-2) + p4_b0 x(n)
        adds    F0, F10, F10    # F10 = y4(n) = p4_a2 y4(n-2) + p4_a1 y4(n-1) + p4_b0 x(n)
        muls    F18, F4, F0     # F0 = p2_b0 * x(n)
        muls    F17, F7, F1     # F1 = p2_a2 y2(n-2)
        fmov    F6, F7          # F7 = y2(n-2) = y2(n-1)
        muls    F16, F6, F6     # F6 = p2_a1 y2(n-1)
        adds    F2, F3, F2      # F2 = p3_a2 y3(n-2) + p3_b0 x(n)
        adds    F2, F8, F8      # F8 = y3(n) = p3_a2 y3(n-2) + p3_a1 y3(n-1) + p3_b0 x(n)
        subs    F12, F14, F2    # F2 = - y6(n) + y5(n)
        subs    F2, F10, F2     # F2 = - y6(n) + y5(n) - y4(n)
        adds    F2, F8, F2      # F2 = - y6(n) + y5(n) - y4(n) + y3(n)
        adds    F0, F1, F0      # F2 = p2_a2 y2(n-2) + p2_b0 x(n)
        adds    F0, F6, F6      # F6 = y2(n) = p2_a2 y2(n-2) + p2_a1 y2(n-1) + p2_b0 x(n)
        subs    F2, F6, F2      # F2 = - y6(n) + y5(n) - y4(n) + y3(n) - y2(n)
        subl    R3, 1, R3       # Decrement the count
        sts     F2, (R1)        # Store the filter output
        s4addq  R27, R1, R1     # Increment to next output location

        bgt     R3, PFLOOP      # Loop until done

        ret     R31, (R26), 1   # Return to caller

 #**********************************************************************
 #**********************************************************************
 #
 #  Routine: read_speaker_definition
 #  Author:  Bill Hallahan
 #  Date:    April 2, 1994
 #
 #
 #  Abstract:
 #
 #    This routine reads a 22 words speaker definition packet and
 #    sets the speaker voice for routine speech_waveform_generator.
 #
 #
 #  Input:
 #
 #    R16    R16 contains the address of a block of 16 bit values that
 #           are used to set the speaker dependant parameters. There are
 #           22 parameters in a speaker definition block. The format of a
 #           speaker definition parameter block is:
 #
 #           Order   Symbol      Description
 #
 #              0     r4cb      Cascade Formant 4 frequency
 #              1     r4cc      Cascade Formant 4 bandwidth
 #              2     r5cb      Cascade Formant 5 frequency
 #              3     r5cc      Cascade Formant 5 bandwidth
 #              4     r4pb      Parallel filter 4 frequency
 #              5     r5pb      Parallel filter 5 frequency
 #              6     t0jit     Jitter Parameter
 #              7     r5ca      Gain of 5th cascade formant in dB
 #              8     r4ca      Gain of 4th cascade formant in dB
 #              9     r3ca      Gain of 3rd cascade formant in dB
 #             10     r2ca      Gain of 2nd cascade formant in dB
 #             11     r1ca      Gain of 1st cascade formant in dB
 #             12     nopen1    Determines open phase of glottal period
 #             13     nopen2    Also determines open phase of glottal period
 #             14     aturb     Speaker Breathiness coefficient in dB.
 #             15     F4scale   Scale factor for F1inHZ, F2inHZ and F3inHZ
 #             16     afgain    Speaker Frication Gain in dB
 #             17     rnpgain   Gain of nasal resonator in dB.
 #             18     azgain    Speaker Voicing Gain in dB
 #             19     apgain    Speaker Asperation Gain in dB
 #             20     notused
 #             21     osgain    Output Scale factor in dB.
 #
 #
 #    R17    Contains the address of a structure of type FVTM_T
 #           that stores the variables for this instance of the FVTM.
 #
 #
 #    R26    R26 contains the return address for this routine.
 #
 #
 #  Output:
 #
 #    This Current Speaker is returned in R0.
 #
 #    The following paramters used by routine speech_waveform_generator are
 #    initialized:
 #
 #      Nasal_a1
 #      Nasal_a2
 #      LowPass_a1
 #      LowPass_a2
 #      c4_a1
 #      c4_a2
 #      c5_a1
 #      c5_a2
 #      p4_a1
 #      p4_a2
 #      p5_a1
 #      p5_a2
 #      T0Jitter
 #      k1
 #      k2
 #      SpeakerBreathinessGain
 #      FormantScale
 #      F1Adjust
 #      F2Adjust
 #      SpeakerFricationGain
 #      PartialCascadePathGain
 #      SpeakerVoicingGain
 #      SpeakerAsperationGain
 #      OutputScaleFactor
 #
 #
 #  Registers Modified:
 #
 #    R0, R1, R2, R3, R4, R6, R7, R8, R9,
 #    R16, R22, R23,
 #    F0, F1, F2, F3, F4, F5, F6, F7, F8
 #
 #**********************************************************************
 #**********************************************************************
 #----------------------------------------------------------------------
 #  Read_Speaker_Definitions Stack variables.
 #----------------------------------------------------------------------

        .data

RSD_StackVars:          .struct 0
                        .quad   0
                        .quad   0
RSD_R26:                .quad   0
RSD_R9:                 .quad   0
RSD_R10:                .quad   0
RSD_R11:                .quad   0
RSD_R12:                .quad   0
RSD_R13:                .quad   0
RSD_R14:                .quad   0
RSD_R15:                .t_floating     0.0
RSD_F2:                 .t_floating     0.0
RSD_F3:                 .t_floating     0.0
RSD_F4:                 .t_floating     0.0
RSD_F5:                 .t_floating     0.0
RSD_F6:                 .t_floating     0.0
RSD_F7:                 .t_floating     0.0
RSD_F8:                 .t_floating     0.0
RSD_F9:                 .t_floating     0.0
RSD_qTemp:              .quad   0
RSD_StackSize:          .quad   0

        .text
        .align   5

        .ent  read_speaker_definition

read_speaker_definition:

 #----------------------------------------------------------------------
 #  By software convention, compilers require that the following
 #  registers are preserved across procedure calls.
 #
 #  Save registers R9 to R15 and R26 which contains the return address.
 #  Also save registers F2 to F9.
 #----------------------------------------------------------------------

        ldgp    GP, (R27)               # Load the global pointer
        lda     SP, -RSD_StackSize(SP)  # Allocate space for new stack frame
        stq     R26, RSD_R26(SP)        # Save register 26
        stq     R9, RSD_R9(SP)          # Save register 9
        stq     R10, RSD_R10(SP)        # Save register 10
        stq     R11, RSD_R11(SP)        # Save register 11
        stq     R12, RSD_R12(SP)        # Save register 12
        stq     R13, RSD_R13(SP)        # Save register 13
        stq     R14, RSD_R14(SP)        # Save register 14
        stq     R15, RSD_R15(SP)        # Save register 15
        stt     F2, RSD_F2(SP)          # Save register F2
        stt     F3, RSD_F3(SP)          # Save register F3
        stt     F4, RSD_F4(SP)          # Save register F4
        stt     F5, RSD_F5(SP)          # Save register F5
        stt     F6, RSD_F6(SP)          # Save register F6
        stt     F7, RSD_F7(SP)          # Save register F7
        stt     F8, RSD_F8(SP)          # Save register F8
        stt     F9, RSD_F9(SP)          # Save register F9
        trapb                           # Force any pending HW exceptions

        .prologue

 #----------------------------------------------------------------------
 #  Load address pointers for local static variables and constants.
 #----------------------------------------------------------------------

        lda     R11, Const_Constants    # R11 -> Q12InverseScale

 #----------------------------------------------------------------------
 #  The following constants are all defined as data in memory.
 #
 #  RandomMultiplier = 20077;
 #  RandomAddend = 12345;
 #
 #  The factor of 0.25 previously incorporated in the noise generation
 #  process has been incorporated in coefficients b0, b1 and b2 of the
 #  noise filter.
 #
 #  Noise_b2 = 0.25 * 0.365966796875;
 #  Noise_a1 = 0.75;
 #  Noise_b1 = 0.25 * -0.711181640625;
 #  Noise_b0 = 0.25;
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  Parallel 6th formant.
 #  Resonator constant "p6_b0" is set in routine speech_waveform_generator
 #  from A6inDB.
 #
 #  F6p = 4884.0 Hz. and b6p = 1145.0 Hz.
 #
 #  It is not necessary to change these with a nominal change in
 #  sample rate. The following constants are defined as data in memory.
 #
 #  p6_a1 = -1.39208984375;
 #  p6_a2 = -0.487060546875;
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  Coefficients for fixed nasal formant.
 #  Gain parameter "NasalResonator_b0" is set below by speaker
 #  definition parameter "rnpg". Note possible future change, this
 #  could vary from speaker to speaker.
 #
 #  The nasal resonator frequency is at 300 Hz with a bandwidth of 80 Hz.
 #  The gain output is discarded.
 #
 #  fnp = 300.0;
 #  bnp = 80.0;
 #
 #  DESIGN_TWO_POLE_FILTER_CF123( NasalResonator_a1,
 #                                NasalResonator_a2,
 #                                Temp,
 #                                fnp,
 #                                bnp );
 #
 #----------------------------------------------------------------------

        lds     F5, CFP125(R11)         # F5 = 0.125
        lds     F6, CFP5(R11)           # F6 = 0.5
        lds     F7, CF4500(R11)         # F7 = 4500.0
        lds     F8, InverseSampleRateScale(R17) # F8 = 10000 / Fs

        lda     R22, RadiusTable        # R22 -> Radius Table
        lda     R23, TwoCosineTable     # R23 -> TwoCosine Table

        lds     F0, CF80(R11)           # F0 = Bandwidth
        lds     F1, CF300(R11)          # F1 = Frequency

        bsr     R26, D2POLE_CF123       # Calculate filter coefficients

        sts     F1, Nasal_a1(R17)       # Store Nasal_a1
        sts     F2, Nasal_a2(R17)       # Store Nasal_a2

 #----------------------------------------------------------------------
 #  Coefficients for fixed downsampling low-pass filter
 #
 #  if ( SampleRate < 9500.0 )
 #  {
 #    flp = 948.0;
 #    blp = 800.0;
 #  }
 #  else
 #  {
 #    flp = 948.0;
 #    blp = 615.0;
 #  }
 #
 #  rlpg = 0.5859375;
 #
 #  D2POLE_PF( LowPass_a1, LowPass_a2, LowPass_b0, flp, blp );
 #
 #  LowPass_b0 = 2.0 * LowPass_b0 * rlpg;
 #
 #  F29 = LowPass_b0
 #----------------------------------------------------------------------

        lds     F30, bfLowSampleRate(R17) # Load the low sample rate flag
        lds     F3, CF800(R11)          # Load the low sample Bandwidth
        lds     F0, CF615(R11)          # F0 = Bandwidth = 615.0 Hz.
        fcmovne F30, F3, F0             # If Fs low then Bandwidth = 800
        lds     F1, CF948(R11)          # F1 = Frequency

        bsr     R26, D2POLE_PF          # Calculate filter coefficients

        sts     F1, LowPass_a1(R17)     # Store LowPass_a1
        sts     F2, LowPass_a2(R17)     # Store LowPass_a2
        lds     F4, CFP58593756(R11)    # F4 = 0.58593756
        muls    F4, F3, F3              # F3 = 0.5 LowPass_b0
        adds    F3, F3, F29             # F29 = LowPass_b0

 #----------------------------------------------------------------------
 #  Begin set coeficients of speaker-def controlled resonators.
 #  Cascade fourth formant
 #  f4c = pSpeakerDefinition->r4cb;    #  0
 #  b4c = pSpeakerDefinition->r4cc;    #  1
 #
 #  DESIGN_TWO_POLE_FILTER_CF45( c4_a1, c4_a2, Temp, f4c, b4c );
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = r4cb, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> r4cc
        stq     R0, RSD_qTemp(SP)       # Store as quadword
        ldt     F0, RSD_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F1                  # Float f4c

        ldw     R0, (R16)               # R0 = ib4c, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> r5cb
        stq     R0, RSD_qTemp(SP)       # Store as quadword
        ldt     F0, RSD_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float b4c

        lda     R23, TwoCosineTable     # R23 -> TwoCosine Table

        bsr     R26, D2POLE_CF45        # Calculate filter coefficients

        sts     F1, c4_a1(R17)          # Store c4_a1
        sts     F2, c4_a2(R17)          # Store c4_a2

 #----------------------------------------------------------------------
 #  Cascade fifth formant
 #  f5c = pSpeakerDefinition->r5cb;    #  2
 #  b5c = pSpeakerDefinition->r5cc;    #  3
 #
 #  DESIGN_TWO_POLE_FILTER_CF45( c5_a1, c5_a2, Temp, f5c, b5c );
 #
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = r5cb, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> r45c
        stq     R0, RSD_qTemp(SP)       # Store as quadword
        ldt     F0, RSD_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F1                  # Float f5c

        ldw     R0, (R16)               # R0 = ib4c, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> r4pb
        stq     R0, RSD_qTemp(SP)       # Store as quadword
        ldt     F0, RSD_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float b5c

        lda     R23, TwoCosineTable     # R23 -> TwoCosine Table

        bsr     R26, D2POLE_CF45        # Calculate filter coefficients

        fcmovne F30, F31, F1            # If Low Sample Rate, c5_a1 = 0.0
        fcmovne F30, F31, F2            # If Low Sample Rate, c5_a2 = 0.0
        sts     F1, c5_a1(R17)          # Store c5_a1
        sts     F2, c5_a2(R17)          # Store c5_a2

 #----------------------------------------------------------------------
 #  Parallel fourth formant
 #  f4p = pSpeakerDefinition->r4pb    #  4
 #  b4p = 400.0;
 #
 #  DESIGN_TWO_POLE_FILTER_PF( p4_a1, p4_a2, Temp, f4p, b4p );
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = r4pb, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> r5pb
        stq     R0, RSD_qTemp(SP)       # Store as quadword
        ldt     F0, RSD_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F1                  # Float f4p
        lds     F0, CF400(R11)          # F0 = Bandwidth = 400.0
        lda     R23, TwoCosineTable     # R23 -> TwoCosine Table

        bsr     R26, D2POLE_PF          # Calculate filter coefficients

        sts     F1, p4_a1(R17)           # Store p4_a1
        sts     F2, p4_a2(R17)           # Store p4_a2

 #----------------------------------------------------------------------
 #  Parallel fifth formant
 #  f5p = pSpeakerDefinition->r5pb;     #  5
 #  b5p = 500.0;
 #
 #  DESIGN_TWO_POLE_FILTER_PF( p5_a1, p5_a2, Temp, f5p, b5p );
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = r5pb, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> t0jit
        stq     R0, RSD_qTemp(SP)       # Store as quadword
        ldt     F0, RSD_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F1                  # Float f5p
        lds     F0, CF500(R11)          # F0 = Bandwidth = 500.0

        lda     R23, TwoCosineTable     # R23 -> TwoCosine Table

        bsr     R26, D2POLE_PF          # Calculate filter coefficients

        fcmovne F30, F31, F1            # If Low Sample Rate, p5_a1 = 0.0
        fcmovne F30, F31, F2            # If Low Sample Rate, p5_a2 = 0.0
        sts     F1, p5_a1(R17)          # Store p5_a1
        sts     F2, p5_a2(R17)          # Store p5_a2

 #----------------------------------------------------------------------
 #  End of set coeficients of speaker definition controlled
 #  resonators.
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  The following parameter deleted 12-JUL-85
 #  TLToff = pSpeakerDefinition->tltoff;
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  Jitter parameter converted to negative if T0Jitter currently
 #  negative.                          6
 #
 #  if ( T0Jitter < 0 )
 #    T0Jitter = - Q12_INVERSE_SCALE * (FLTPNT_T)pSpeakerDefinition->t0jit;
 #  else
 #    T0Jitter = Q12_INVERSE_SCALE * (FLTPNT_T)pSpeakerDefinition->t0jit;
 #
 #  The code above has been replaced with just loading the jitter
 #  parameter. There is no need to flip the sign here. WIH and EAB.
 #
 #----------------------------------------------------------------------

        lds     F28, Q12InverseScale(R11) # F28 = 1 / 4096.0

        ldw     R0, (R16)               # R0 = t0jit, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> r5ca
        stq     R0, RSD_qTemp(SP)       # Store as quadword
        ldt     F0, RSD_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float T0Jitter
        muls    F28, F0, F0             # F0 = T0Jitter
        sts     F0, T0Jitter(R17)       # Store T0Jitter

 #----------------------------------------------------------------------
 #  Gains of cascade resonators.
 #
 #  a5gain = pSpeakerDefinition->r5ca;     #  7
 #  a4gain = pSpeakerDefinition->r4ca;     #  8
 #
 #  if ( SampleRate < 9500.0 )
 #  {
 #    c5_b0 = 1.0;
 #    c4_b0 = 0.6309573448 * dBtoLinear[a4gain];
 #  }
 #  else
 #  {
 #    c5_b0 = dBtoLinear[a5gain];
 #    c4_b0 = dBtoLinear[a4gain];
 #  }
 #
 #  F4 = c4_b0
 #  F5 = c5_b0
 #----------------------------------------------------------------------

        lda     R25, dBtoLinearTable    # R25 -> dB to Linear Table address

        ldw     R0, (R16)               # R0 = r5ca, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> r4ca
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F5, (R1)                # F5 = c5_b0 = dBtoLinear[a5gain]
        lds     F2, CF1(R11)            # F2 = 1.0
        fcmovne F30, F2, F5             # If Fs low then c5_b0 = 1.0

        ldw     R0, (R16)               # R0 = r4ca, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> r3ca
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F4, (R1)                # F4 = c4_b0 = dBtoLinear[a4gain]
        lds     F0, CFP6309573448(R11)  # F0 = 0.6309573448
        fcmovne F30, F0, F2             # If Fs low then use 0.6309573448
        muls    F2, F4, F4              # Scale c4_b0

 #----------------------------------------------------------------------
 #  a3gain = pSpeakerDefinition->r3ca;     #  9
 #  a2gain = pSpeakerDefinition->r2ca;     #  10
 #  a1gain = pSpeakerDefinition->r1ca;     #  11
 #
 #  c3_gain = dBtoLinear[a3gain];
 #  c2_gain = dBtoLinear[a2gain];
 #  c1_gain = dBtoLinear[a1gain];
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = r3ca, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> r2ca
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F3, (R1)                # F3 = c3_gain = dBtoLinear[a3gain]

        ldw     R0, (R16)               # R0 = r2ca, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> r1ca
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F2, (R1)                # F2 = c2_gain = dBtoLinear[a2gain]

        ldw     R0, (R16)               # R0 = r1ca, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> nopen1
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F1, (R1)                # F1 = c1_gain = dBtoLinear[a1gain]
        muls    F4, F5, F5              # F5 = c5_b0 * c4_b0
        muls    F3, F5, F5              # F5 = c5_b0 * c4_b0 * c3_gain
        muls    F2, F5, F5              # F5 = c5_b0 * c4_b0 * c3_gain * c2_gain
        muls    F1, F5, F5              # F5 = c5 * c4 * c3 * c2 * c1

 #----------------------------------------------------------------------
 #  Constants that determine the duration of the open phase of the
 #  glottal period.
 #
 #  k1 = Q12_INVERSE_SCALE *
 #    (FLTPNT_T)pSpeakerDefinition->nopen1;  # 12
 #  k2 = Q12_INVERSE_SCALE *
 #    (FLTPNT_T)pSpeakerDefinition->nopen2;  # 13
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = nopen1, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> abrg
        stq     R0, RSD_qTemp(SP)       # Store as quadword
        ldt     F0, RSD_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float nopen1
        muls    F28, F0, F0             # F0 = k1 = nopen1 / 4096.0
        sts     F0, k1(R17)             # Store k1

        ldw     R0, (R16)               # R0 = nopen2, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> aturb
        stq     R0, RSD_qTemp(SP)       # Store as quadword
        ldt     F0, RSD_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float nopen2
        muls    F28, F0, F0             # F0 = k2 = nopen2 / 4096.0
        sts     F0, k2(R17)             # Store k2

 #----------------------------------------------------------------------
 #  Breathiness coefficient.
 #  Scale up by 8 to correct for a frac4mul() of this Q15 gain.
 #  Apply arbitrary scale factor of 0.125 to all Speaker gains.
 #
 #  abrg = pSpeakerDefinition->aturb;      #  14
 #  SpeakerBreathinessGain = 4.0 * dBtoLinear[abrg];
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = aturb, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> fnscale
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F0, (R1)                # F0 = SPG = dBtoLinear[aturb]
        adds    F0, F0, F1              # F1 = 2 * SPG
        adds    F1, F1, F2              # F2 = 4 * SPG
        sts     F0, SpeakerBreathinessGain(R17) # Store SpeakerBreathinessGain

 #----------------------------------------------------------------------
 #  T0range = pSpeakerDefinition->f0scale;  (Not used)
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  Scale factor for variable formants F1inHZ, F2inHZ, and F3inHZ.
 #
 #  FormantScale =                        #  15
 #    Q12_INVERSE_SCALE * (FLTPNT_T)pSpeakerDefinition->fnscale;
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = fncale, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> afgain
        stq     R0, RSD_qTemp(SP)       # Store as quadword
        ldt     F0, RSD_qTemp(SP)       # Load quadword to floating point register
        cvtqs   F0, F0                  # Float unscaled FormantScale
        muls    F28, F0, F0             # F0 = FormantScale
        sts     F0, FormantScale(R17)   # Store FormantScale

 #----------------------------------------------------------------------
 #  Calculate F1Adjust
 #
 #  F1Adjust = 256.0 - 256.0 * FormantScale;
 #  F1Adjust is added to F1inHZ in routine speech_waveform_generator
 #----------------------------------------------------------------------

        lds     F2, CF1(R11)            # 1.0 used for F1Adjust and F2Adjust
        subs    F2, F0, F1              # F1 = 1.0 - FormantScale
        lds     F3, CF256(R11)          # F3 = 256.0
        muls    F3, F1, F1              # F1 = 256.0 - 256.0 * FormantScale
        sts     F1, F1Adjust(R17)       # Store F1Adjust

 #----------------------------------------------------------------------
 #  Calculate F2Adjust
 #
 #  F2Adjust = 512.0 - 512.0 * FormantScale;
 #  F2Adjust is added to F2inHZ in routine speech_waveform_generator
 #----------------------------------------------------------------------

        adds    F1, F1, F2              # F2 = 512.0 - 512.0 * FormantScale
        sts     F2, F2Adjust(R17)       # Store F2Adjust

 #----------------------------------------------------------------------
 #  Overall gain of frication source relative to other sources.
 #  Apply arbitrary scale factor of 0.125 to all Speaker gains.
 #
 #  afg = pSpeakerDefinition->afgain;      #  16
 #  SpeakerFricationGain = dBtoLinear[afg];
 #
 #  if ( SampleRate < 9500.0 )
 #    SpeakerFricationGain *= 20.0;
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = afgain, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> rnpgain
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F0, (R1)                # F0 = SFG = dBtoLinear[afgain]
        lds     F1, CF1(R11)            # F1 = 1.0
        lds     F2, CF20(R11)           # F2 = 20.0
        fcmovne F30, F2, F1             # If Fs low then scale by 20.0
        muls    F1, F0, F0              # Scale the SpeakerFricationGain
        sts     F0, SpeakerFricationGain(R17) # Store SpeakerFricationGain

 #----------------------------------------------------------------------
 #  Gain of the nasal pole resonator of cascade filter section.
 #
 #  rnpg = pSpeakerDefinition->rnpgain;    #  17
 #  NasalResonator_b0 = dBtoLinear[rnpg];
 #
 #  F6 = NasalResonator_b0
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = rnpgain, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> azgain
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F6, (R1)                # F6 = NasalResonator_b0

 #----------------------------------------------------------------------
 #
 #  Combine most of the cascade path gains. It must now be done
 #  this way to stay compatible with the driver for the integer
 #  version of the vocal tract model. In the integer vocal tract
 #  model all of the filter gains are scaled up by 2. They are not
 #  scaled up by two in macros D2POLE_XXX so the
 #  following gain corrections must be applied to the cascade path.
 #  Also the new Nasal anti-resonator gain is equal to 1.0. The
 #  integer vocal tract model nasal anti-resonator had a gain of
 #  88. Thus the Partial Cascade Path Gain also contains speaker
 #  defined gains of cascade formant 4, cascade formant 5, and
 #  finally the speaker defined gain of the nasal resonator.
 #  Scale up by 8 to correct for a frac4mul() of this Q15 gain.
 #
 #  items.
 #
 #    ITEM             GAIN CORRECTION
 #
 #    c1_b0 extra factor of 2.0 (c1_b0 scaled up in integer model.)
 #    c1_gain               2.0
 #    c2_gain               2.0
 #    c3_gain               2.0
 #    Nasal Anti-Resonator  88.0
 #    Nasal Resonator      NasalResonator_b0
 #    c4_b0
 #    c5_b0
 #
 #  PartialCascadePathGain = 11264.0 * c1_gain * c2_gain * c3_gain
 #    * c4_b0 * c5_b0 * NasalResonator_b0;
 #
 #  F5 = c4_b0 * c5_b0 * c3gain * c2_gain * c1_gain
 #  F6 = NasalResonator_b0
 #----------------------------------------------------------------------

        lds     F0, CF11264(R11)        # F0 = K = 11264.0
        muls    F0, F5, F5              # F5 = K c5 c4 c3 c2 c1
        muls    F6, F5, F5              # F5 = K c5 c4 c3 c2 c1 Nb0
        sts     F5, PartialCascadePathGain(R17) # Store PartialCascadePathGain

 #----------------------------------------------------------------------
 #  Overall gain of the voicing source relative to other sources.
 #  Scale up by 16 to correct for the differentiated glottal pulse
 #  generator. The pulse generator in this model produces a
 #  waveform that is scaled down by 16 relative to the integer
 #  vocal tract model. (This saves one multiply per sample at 4
 #  the output sample rate ).
 #  Scale up by 8 to correct for a frac4mul() of this Q15 gain.
 #  Apply arbitrary scale factor of 0.125 to all Speaker gains.
 #  The gain LowPass_b0 has been incorporated with the
 #  SpeakerVoicingGain
 #
 #  avg = pSpeakerDefinition->azgain;      #  18
 #  SpeakerVoicingGain = 16.0 * LowPass_b0 * dBtoLinear[avg];
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = azgain, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> apgain
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F0, (R1)                # F0 = dBtoLinear[azgain]
        lds     F1, CF16(R11)           # F1 = 16.0
        muls    F1, F0, F0              # F0 = 16 * dBtoLinear[azgain]
        muls    F29, F0, F0             # 16.0 * LowPass_b0 * dBtoLinear[azgain]
        sts     F0, SpeakerVoicingGain(R17) # Store SpeakerVoicingGain

 #----------------------------------------------------------------------
 #  Overall gain of aspiration source relative to other sources.
 #  Scale up by 8 to correct for a frac4mul() of this Q15 gain.
 #  Apply arbitrary scale factor of 0.125 to all Speaker gains.
 #
 #  apg = pSpeakerDefinition->apgain;      #  19
 #  SpeakerAsperationGain = 8.0 * dBtoLinear[apg];
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = apgain, ldw uses R23, R28
        addq    R16, 2*SIZEOF_WORD, R16 # R16 -> osgain (Skip unused parameter
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F0, (R1)                # F0 = 0.125 * SpeakerAsperationGain
        lds     F1, CF8(R11)            # F1 = 8.0
        muls    F1, F0, F0              # F0 = SpeakerAsperationGain
        sts     F0, SpeakerAsperationGain(R17) # Store SpeakerAsperationGain

 #----------------------------------------------------------------------
 #  Skip unused parameter
 #
 #             20    notused
 #  The address increment used in the last addq instruction is
 #  2*SIZEOF_WORD to skip this parameter.
 #----------------------------------------------------------------------
 #----------------------------------------------------------------------
 #  Calculate the output scale factor based on the delta gain in dB
 #
 #             21    osgain    Output Scale factor in dB.
 #
 #  iDeltaGainInDB = (int)pSpeakerDefinition->osgain;
 #
 #  OutputScaleFactor = OUTPUT_SCALE_FACTOR = 8.0;
 #
 #  if ( iDeltaGainInDB <= 0 )
 #  {
 #    OutputScaleFactor =
 #      OutputScaleFactor * dBtoLinear[87+iDeltaGainInDB];
 #  }
 #  else
 #  {
 #    OutputScaleFactor =
 #      OutputScaleFactor / dBtoLinear[87-iDeltaGainInDB];
 #  }
 #
 #
 #  This gain parameter is slightly different than the other gain
 #  parameters. A value of 0 dB. for osgain references the 87th element
 #  of the gain table which is a gain value of 1.0. The previous gain
 #  table only had 87.0 elements, so the if statement was required.
 #  The new dBtoLinear table has been extended to make the "if"
 #  statement unnecessary. The new code is:
 #
 #  iDeltaGainInDB = (int)pSpeakerDefinition->osgain;
 #
 #  OutputScaleFactor = OUTPUT_SCALE_FACTOR * dBtoLinear[87+iDeltaGainInDB];
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = osgain, ldw uses R23, R28
        addq    R16, SIZEOF_WORD, R16   # R16 -> speaker
        s4addq  R0, R25, R1             # R1 -> dBtoLinear Table entry
        lds     F0, 87*SIZEOF_FLOAT(R1) # F0 = Unscaled OutputScaleFactor
        lds     F1, CF8(R11)            # F1 = OutputScaleMultiplier
        muls    F1, F0, F0              # F0 = OutputScaleFactor
        sts     F0, OutputScaleFactor(R17) # Store OutputScaleFactor

 #----------------------------------------------------------------------
 #  Get the current speaker value so that it may be returned by
 #  function TextToSpeechGetSpeaker().
 #
 #  uiCurrentSpeaker = (unsigned int)pSpeakerDefinition->speaker;
 #----------------------------------------------------------------------

        ldw     R0, (R16)               # R0 = speaker, ldw uses R23, R28

 #----------------------------------------------------------------------
 #  Restore registers RF2 to RF9.
 #  Also restore registers R9 to R15 and R26.
 #----------------------------------------------------------------------

        ldq     R26, RSD_R26(SP)        # Restore register 26
        ldq     R9, RSD_R9(SP)          # Restore register 9
        ldq     R10, RSD_R10(SP)        # Restore register 10
        ldq     R11, RSD_R11(SP)        # Restore register 11
        ldq     R12, RSD_R12(SP)        # Restore register 12
        ldq     R13, RSD_R13(SP)        # Restore register 13
        ldq     R14, RSD_R14(SP)        # Restore register 14
        ldq     R15, RSD_R15(SP)        # Restore register 15
        ldt     F2, RSD_F2(SP)          # Save register F2
        ldt     F3, RSD_F3(SP)          # Save register F3
        ldt     F4, RSD_F4(SP)          # Save register F4
        ldt     F5, RSD_F5(SP)          # Save register F5
        ldt     F6, RSD_F6(SP)          # Save register F6
        ldt     F7, RSD_F7(SP)          # Save register F7
        ldt     F8, RSD_F8(SP)          # Save register F8
        ldt     F9, RSD_F9(SP)          # Save register F9
        trapb                           # Force any pending HW exceptions

        lda     SP, RSD_StackSize(SP)   # Free stack frame

        ret     R31, (R26), 1           # Return to caller

 #**********************************************************************
 #**********************************************************************
 #  Routine: D2POLE_CF45
 #  Author: Bill Hallahan
 #  Date: May 20, 1994
 #
 #  Abstract:
 #
 #    These macros calculates the coefficients of a two pole filter.
 #    The transfer function of the filter is:
 #
 #
 #             Y(Z)            b0
 #     H(Z) = ------ = --------------------
 #             X(Z)             -1      -2
 #                      1 - a1 Z  - a2 Z
 #
 #
 #    The filter may be implemented as a difference equation of the
 #    following form.
 #
 #    y(n) = a2 y(n-2) + a1 y(n-1) + b0 x(n)
 #
 #
 #             b0 = GAIN
 #      X(Z) ---------------------------------> Y(Z)
 #                ^          |
 #                |          V
 #                |       -------
 #                |       |  -1 |
 #                |       | Z   |
 #                |       |     |
 #                |       -------
 #                |          |
 #                |   a1     |
 #                |<---------|
 #                |          |
 #                |          V
 #                |       -------
 #                |       |  -1 |
 #                |       | Z   |
 #                |       |     |
 #                |       -------
 #                |          |
 #                |   a2     |
 #                |<----------
 #
 #
 #
 #  Inputs:
 #
 #    F0        Contains the floating point filter bandwidth in Hz.
 #
 #    F1        Contains the floating point filter center frequency in Hz..
 #
 #    F5        Contains the floating point constant 0.125
 #
 #    F6        Contains the floating point constant 0.5
 #
 #    F7        Contains the maximum frequency for the filter.
 #
 #    F8        Contains the floating point Inverse Sample Rate Scale
 #              which equals 10000 / Sample Rate.
 #
 #    R11       Contains the address of the constant table.
 #
 #    R22       Contains the address of the radius table.
 #
 #    R23       Contains the address of the Two Cosine table.
 #
 #    R26       Contains the return address
 #
 #    Location RSD_qTemp(SP) is used as a temporary variable. Space for
 #    this variable MUST be allocated on the stack before calling this
 #    routine.
 #
 #  Output:
 #
 #    F1        Contains the filters a1 coefficient.
 #
 #    F2        Contains the filters a2 coefficient.
 #
 #    F3        Contains the floating point gain coefficient (The gain of
 #              the filter at DC).
 #
 #    Upon macro completion, the floating point value of filter coefficient
 #    A1, A2, and GAIN will be stored.
 #
 #
 #  Registers Modified:
 #
 #    Registers R0, F0, F1, F2, and F3 are modified by this routine.
 #
 #**********************************************************************
 #**********************************************************************
 #---------------------------------------------------------------------
 # D2POLE_CF45
 #
 # If the filter response extends to near to Fs/2 then this routine
 # will make the filter an all pass filter with unity gain. This is
 # used only for the cascade filters for formants 4 and 5.
 #---------------------------------------------------------------------

        .align   5

D2POLE_CF45:
        muls    F8, F0, F0              # F0 = BW = T * Bandwidth
        muls    F8, F1, F1              # F1 = Freq = T * Frequency
        muls    F6, F0, F2              # F2 = 0.5 * BW
        adds    F1, F2, F2              # F2 = Freq + 0.5 * BW
        subs    F7, F2, F3              # F3 = Max. Freq minus Freq + 0.5 BW

        fbge    F3, BCF45               # Branch if frequency in range

 #---------------------------------------------------------------------
 #  If here then Freq + 0.5 * BW > MaximumFrequency
 #---------------------------------------------------------------------

        fmov    F31, F1                 # A1 = 0.0
        fmov    F31, F2                 # A2 = 0.0
        lds     F3, CF1(R11)            # Set the gain to 1.0

        ret     R31, (R26), 1           # Return to caller

 #---------------------------------------------------------------------
 #  If here then Freq + 0.5 * BW <= MaximumFrequency
 #---------------------------------------------------------------------

BCF45:  muls    F5, F0, F0              # F0 = 0.125 * BW
        cvtst   F0, F0                  # Is this necessary ?
        cvttq   F0, F0                  # F0 = (nint)( 0.125 * BW )
        stt     F0, RSD_qTemp(SP)       # Store the index
        ldq     R0, RSD_qTemp(SP)       # R0 = (nint)( 0.125 * BW )
        s4addq  R0, R22, R0             # R0 -> Radius Table entry
        lds     F0, (R0)                # R0 = Radius
        muls    F0, F0, F2              # F2 = Radius * Radius
        negs    F2, F2                  # F2 = A2 = - Radius * Radius
        muls    F5, F1, F1              # F1 = 0.125 * Freq
        cvtst   F1, F1                  # Is this necessary ?
        cvttq   F1, F1                  # F1 = (nint)( 0.125 * Freq )
        stt     F1, RSD_qTemp(SP)       # Store the index
        ldq     R0, RSD_qTemp(SP)       # R0 = (nint)( 0.125 * Freq )
        s4addq  R0, R23, R0             # R0 -> TwoCosine Table entry
        lds     F1, (R0)                # F1 = 2 * Cosine( Twopi * Freq )
        muls    F0, F1, F1              # F1 = 2 * Radius * Cosine( Twopi * Freq )
        adds    F1, F2, F3              # F3 = A1 + A2
        lds     F4, CF1(R11)            # F4 = 1.0
        subs    F4, F3, F3              # F3 = 1.0 - A1 - A2

        ret     R31, (R26), 1           # Return to caller

 #**********************************************************************
 #**********************************************************************
 #  Routine: D2POLE_CF123
 #  Author: Bill Hallahan
 #  Date: May 20, 1994
 #
 #  Abstract:
 #
 #    These macros calculates the coefficients of a two pole filter.
 #    The transfer function of the filter is:
 #
 #
 #             Y(Z)            b0
 #     H(Z) = ------ = --------------------
 #             X(Z)             -1      -2
 #                      1 - a1 Z  - a2 Z
 #
 #
 #    The filter may be implemented as a difference equation of the
 #    following form.
 #
 #    y(n) = a2 y(n-2) + a1 y(n-1) + b0 x(n)
 #
 #
 #             b0 = GAIN
 #      X(Z) ---------------------------------> Y(Z)
 #                ^          |
 #                |          V
 #                |       -------
 #                |       |  -1 |
 #                |       | Z   |
 #                |       |     |
 #                |       -------
 #                |          |
 #                |   a1     |
 #                |<---------|
 #                |          |
 #                |          V
 #                |       -------
 #                |       |  -1 |
 #                |       | Z   |
 #                |       |     |
 #                |       -------
 #                |          |
 #                |   a2     |
 #                |<----------
 #
 #
 #
 #  Inputs:
 #
 #    F0        Contains the floating point filter bandwidth in Hz.
 #
 #    F1        Contains the floating point filter center frequency in Hz..
 #
 #    F5        Contains the floating point constant 0.125
 #
 #    F6        Contains the floating point constant 0.5
 #
 #    F7        Contains the maximum frequency for the filter.
 #
 #    F8        Contains the floating point Inverse Sample Rate Scale
 #              which equals 10000 / Sample Rate.
 #
 #    R11       Contains the address of the constant table.
 #
 #    R22       Contains the address of the radius table.
 #
 #    R23       Contains the address of the Two Cosine table.
 #
 #    R26       Contains the return address
 #
 #    Location RSD_qTemp(SP) is used as a temporary variable. Space for
 #    this variable MUST be allocated on the stack before calling this
 #    routine.
 #
 #
 #  Output:
 #
 #    F1        Contains the filters a1 coefficient.
 #
 #    F2        Contains the filters a2 coefficient.
 #
 #    F3        Contains the floating point gain coefficient (The gain of
 #              the filter at DC).
 #
 #    Upon macro completion, the floating point value of filter coefficient
 #    A1, A2, and GAIN will be stored.
 #
 #
 #  Registers Modified:
 #
 #    Registers R0, F0, F1, F2, F3, and F4.
 #
 #**********************************************************************
 #**********************************************************************
 #---------------------------------------------------------------------
 #  D2POLE_CF123
 #
 #  If the filter response extends too near to Fs/2 then this routine
 #  will set the filter center frequency to Fs/2 and make the
 #  bandwidth Fs/4. This is used for cascade formants 1, 2, and 3.
 #  If the formant frequency move over Fs/2, this routine will cause
 #  the filter to be effectively removed (over a short filter decay
 #  time) without causing an abrupt gain change.
 #---------------------------------------------------------------------

        .align   5

D2POLE_CF123:
        muls    F8, F0, F0              # F0 = BW = T * Bandwidth
        muls    F8, F1, F1              # F1 = Freq = T * Frequency
        muls    F6, F0, F2              # F2 = 0.5 * BW
        adds    F1, F2, F2              # F2 = Freq + 0.5 * BW
        subs    F7, F2, F3              # F3 = Max. Freq minus Freq + 0.5 BW

 #---------------------------------------------------------------------
 #  If Freq + 0.5 * BW > MaximumFrequency then F = 5000 and BW = 2500;
 #---------------------------------------------------------------------

        lds     F4, CF5000(R11)         # F4 = 5000.0
        lds     F2, CF2500(R11)         # F2 = 2500.0
        fcmovlt F3, F4, F1              # If out of range then Freq = 5000.0
        fcmovlt F3, F2, F0              # If out of range then BW = 2500.0
        muls    F5, F0, F0              # F0 = 0.125 * BW
        cvtst   F0, F0                  # Is this necessary ?
        cvttq   F0, F0                  # F0 = (nint)( 0.125 * BW )
        stt     F0, RSD_qTemp(SP)       # Store the index
        ldq     R0, RSD_qTemp(SP)       # R0 = (nint)( 0.125 * BW )
        s4addq  R0, R22, R0             # R0 -> Radius Table entry
        lds     F0, (R0)                # R0 = Radius
        muls    F0, F0, F2              # F2 = Radius * Radius
        negs    F2, F2                  # F2 = A2 = - Radius * Radius
        muls    F5, F1, F1              # F1 = 0.125 * Freq
        cvtst   F1, F1                  # Is this necessary ?
        cvttq   F1, F1                  # F1 = (nint)( 0.125 * Freq )
        stt     F1, RSD_qTemp(SP)       # Store the index
        ldq     R0, RSD_qTemp(SP)       # R0 = (nint)( 0.125 * Freq )
        s4addq  R0, R23, R0             # R0 -> TwoCosine Table entry
        lds     F1, (R0)                # F1 = 2 * Cosine( Twopi * Freq )
        muls    F0, F1, F1              # F1 = 2 * Radius * Cosine( Twopi * Freq )
        adds    F1, F2, F3              # F3 = A1 + A2
        lds     F4, CF1(R11)            # F4 = 1.0
        subs    F4, F3, F3              # F3 = 1.0 - A1 - A2

        ret     R31, (R26), 1           # Return to caller

 #**********************************************************************
 #**********************************************************************
 #  Routine: D2POLE_PF
 #  Author: Bill Hallahan
 #  Date: May 20, 1994
 #
 #  Abstract:
 #
 #    These macros calculates the coefficients of a two pole filter.
 #    The transfer function of the filter is:
 #
 #
 #             Y(Z)            b0
 #     H(Z) = ------ = --------------------
 #             X(Z)             -1      -2
 #                      1 - a1 Z  - a2 Z
 #
 #
 #    The filter may be implemented as a difference equation of the
 #    following form.
 #
 #    y(n) = a2 y(n-2) + a1 y(n-1) + b0 x(n)
 #
 #
 #             b0 = GAIN
 #      X(Z) ---------------------------------> Y(Z)
 #                ^          |
 #                |          V
 #                |       -------
 #                |       |  -1 |
 #                |       | Z   |
 #                |       |     |
 #                |       -------
 #                |          |
 #                |   a1     |
 #                |<---------|
 #                |          |
 #                |          V
 #                |       -------
 #                |       |  -1 |
 #                |       | Z   |
 #                |       |     |
 #                |       -------
 #                |          |
 #                |   a2     |
 #                |<----------
 #
 #
 #
 #  Inputs:
 #
 #    F0        Contains the floating point filter bandwidth in Hz.
 #
 #    F1        Contains the floating point filter center frequency in Hz..
 #
 #    F5        Contains the floating point constant 0.125
 #
 #    F6        Contains the floating point constant 0.5
 #
 #    F7        Contains the maximum frequency for the filter.
 #
 #    F8        Contains the floating point Inverse Sample Rate Scale
 #              which equals 10000 / Sample Rate.
 #
 #    R11       Contains the address of the constant table.
 #
 #    R22       Contains the address of the radius table.
 #
 #    R23       Contains the address of the Two Cosine table.
 #
 #    R26       Contains the return address
 #
 #    Location RSD_qTemp(SP) is used as a temporary variable. Space for
 #    this variable MUST be allocated on the stack before calling this
 #    routine.
 #
 #
 #  Output:
 #
 #    F1        Contains the filters a1 coefficient.
 #
 #    F2        Contains the filters a2 coefficient.
 #
 #    F3        Contains the floating point gain coefficient (The gain of
 #              the filter at DC).
 #
 #    Upon macro completion, the floating point value of filter coefficient
 #    A1, A2, and GAIN will be stored.
 #
 #
 #  Registers Modified:
 #
 #    Registers R0, F0, F1, F2, and F3 are modified by this routine.
 #
 #**********************************************************************
 #**********************************************************************
 #---------------------------------------------------------------------
 # D2POLE_PF
 #
 # If the filter response extends too near to Fs/2 then this routine
 # will set the filter gain to zero to remove the filter. This is
 # used for the parallel filters (Except P6 which is used to
 # to generate the 'S' sound).
 #---------------------------------------------------------------------

        .align   5

D2POLE_PF:
        muls    F8, F0, F0              # F0 = BW = T * Bandwidth
        muls    F8, F1, F1              # F1 = Freq = T * Frequency
        muls    F6, F0, F2              # F2 = 0.5 * BW
        adds    F1, F2, F2              # F2 = Freq + 0.5 * BW
        subs    F7, F2, F3              # F3 = Max. Freq minus Freq + 0.5 BW

        fbge    F3, BPF                 # Branch if frequency in range

 #---------------------------------------------------------------------
 #  If here then Freq + 0.5 * BW > MaximumFrequency
 #---------------------------------------------------------------------

        fmov    F31, F1                 # A1 = 0.0
        fmov    F31, F2                 # A2 = 0.0
        fmov    F31, F3                 # Gain = 0.0

        ret     R31, (R26), 1           # Return to caller

 #---------------------------------------------------------------------
 #  If here then Freq + 0.5 * BW <= MaximumFrequency
 #---------------------------------------------------------------------

BPF:    muls    F5, F0, F0              # F0 = 0.125 * BW
        cvtst   F0, F0                  # Is this necessary ?
        cvttq   F0, F0                  # F0 = (nint)( 0.125 * BW )
        stt     F0, RSD_qTemp(SP)       # Store the index
        ldq     R0, RSD_qTemp(SP)       # R0 = (nint)( 0.125 * BW )
        s4addq  R0, R22, R0             # R0 -> Radius Table entry
        lds     F0, (R0)                # R0 = Radius
        muls    F0, F0, F2              # F2 = Radius * Radius
        negs    F2, F2                  # F2 = A2 = - Radius * Radius
        muls    F5, F1, F1              # F1 = 0.125 * Freq
        cvtst   F1, F1                  # Is this necessary ?
        cvttq   F1, F1                  # F1 = (nint)( 0.125 * Freq )
        stt     F1, RSD_qTemp(SP)       # Store the index
        ldq     R0, RSD_qTemp(SP)       # R0 = (nint)( 0.125 * Freq )
        s4addq  R0, R23, R0             # R0 -> TwoCosine Table entry
        lds     F1, (R0)                # F1 = 2 * Cosine( Twopi * Freq )
        muls    F0, F1, F1              # F1 = 2 * Radius * Cosine( Twopi * Freq )
        adds    F1, F2, F3              # F3 = A1 + A2
        lds     F4, CF1(R11)            # F4 = 1.0
        subs    F4, F3, F3              # F3 = 1.0 - A1 - A2

        ret     R31, (R26), 1           # Return to caller

        .end

 #**********************************************************************
 #**********************************************************************
 #
 #  Routine: set_fvtm_sample_rate
 #  Author:  Bill Hallahan
 #  Date:    March 20, 1994
 #
 #
 #  Abstract:
 #
 #    This routine sets the sample rate for the floating point
 #    vocal tract model routine speech_waveform_generator.
 #
 #
 #  Input:
 #
 #    R16    R16 contains the integer sample rate.
 #
 #
 #    R17    Contains the address of a structure of type FVTM_T
 #           that stores the variables for this instance of the FVTM.
 #
 #
 #    R26    R26 contains the return address for this routine.
 #
 #
 #  Output:
 #
 #    The Number Of Samples Per Frame is returned in R0.
 #
 #    The following variables used by routine speech_waveform_generator are
 #    initialized.
 #
 #      SampleRateScale
 #      InverseSampleRateScale
 #      uiNumberOfSamplesPerFrame
 #      bfLowSampleRate
 #
 #  Registers Modified:
 #
 #    R0, R8, R9, R10
 #    F0, F1, F2, F3
 #
 #**********************************************************************
 #**********************************************************************
 #----------------------------------------------------------------------
 #  set_fvtm_sample_rate Stack variables.
 #----------------------------------------------------------------------

        .data

SSR_StackVars:          .struct 0
                        .quad   0
                        .quad   0
SSR_R26:                .quad   0
SSR_R9:                 .quad   0
SSR_R10:                .quad   0
SSR_R11:                .quad   0
SSR_R12:                .quad   0
SSR_R13:                .quad   0
SSR_R14:                .quad   0
SSR_R15:                .t_floating     0.0
SSR_F2:                 .t_floating     0.0
SSR_F3:                 .t_floating     0.0
SSR_F4:                 .t_floating     0.0
SSR_F5:                 .t_floating     0.0
SSR_F6:                 .t_floating     0.0
SSR_F7:                 .t_floating     0.0
SSR_F8:                 .t_floating     0.0
SSR_F9:                 .t_floating     0.0
SSR_qTemp:              .quad   0
                        .quad   0
SSR_StackSize:          .quad   0


        .text
        .align   5

        .ent  set_fvtm_sample_rate

set_fvtm_sample_rate:

 #----------------------------------------------------------------------
 #  By software convention, compilers require that the following
 #  registers are preserved across procedure calls.
 #
 #  Save registers R9 to R15 and R26 which contains the return address.
 #  Also save registers F2 to F9.
 #----------------------------------------------------------------------

        ldgp    GP, (R27)               # Load the global pointer
        lda     SP, -SSR_StackSize(SP)  # Allocate space for new stack frame
        stq     R26, SSR_R26(SP)        # Save register 26
        stq     R9, SSR_R9(SP)          # Save register 9
        stq     R10, SSR_R10(SP)        # Save register 10
        stq     R11, SSR_R11(SP)        # Save register 11
        stq     R12, SSR_R12(SP)        # Save register 12
        stq     R13, SSR_R13(SP)        # Save register 13
        stq     R14, SSR_R14(SP)        # Save register 14
        stq     R15, SSR_R15(SP)        # Save register 15
        stt     F2, SSR_F2(SP)          # Save register F2
        stt     F3, SSR_F3(SP)          # Save register F3
        stt     F4, SSR_F4(SP)          # Save register F4
        stt     F5, SSR_F5(SP)          # Save register F5
        stt     F6, SSR_F6(SP)          # Save register F6
        stt     F7, SSR_F7(SP)          # Save register F7
        stt     F8, SSR_F8(SP)          # Save register F8
        stt     F9, SSR_F9(SP)          # Save register F9
        trapb                           # Force any pending HW exceptions

        .prologue

 #----------------------------------------------------------------------
 #  Load address pointers for local static variables and constants.
 #----------------------------------------------------------------------

        lda     R11, Const_Constants    # R11 -> Q12InverseScale

 #---------------------------------------------------------------------
 #  SampleRate = (float) integer Sample Rate;
 #---------------------------------------------------------------------

        stq     R16, SSR_qTemp(SP)      # Store as quadword
        ldt     F0, SSR_qTemp(SP)       # Load quadword to floating point register
        cvtqt   F0, F3                  # F3 = Float SampleRate

 #---------------------------------------------------------------------
 #  SamplePeriod = 1.0 / SampleRate;
 #---------------------------------------------------------------------

        lds     F1, CF1(R11)            # F1 = 1.0
        divt    F1, F3, F2              # F2 = 1.0 / SampleRate

 #---------------------------------------------------------------------
 #  InverseSampleRateScale = 10000.0 * SamplePeriod
 #---------------------------------------------------------------------

        lds     F1, CF10000(R11)        # F1 = 10000.0
        muls    F1, F2, F2              # F2 = InverseSampleRateScale
        sts     F2, InverseSampleRateScale(R17) # Store InverseSampleRateScale

 #---------------------------------------------------------------------
 #  SampleRateScale = 0.0001 * SampleRate
 #---------------------------------------------------------------------

        lds     F1, CFP0001(R11)        # F1 = 0.0001
        muls    F1, F3, F0              # F0 = SampleRateScale
        sts     F0, SampleRateScale(R17) # Store SampleRateScale

 #---------------------------------------------------------------------
 #  uiNumberOfSamplesPerFrame =
 #    (unsigned int)( SampleRate * FrameTimeinSec + 0.5 );
 #---------------------------------------------------------------------

        lds     F0, FrameTimeInSec(R11) # F0 = Frame Time in seconds
        muls    F3, F0, F0              # Calculate floating point frame size
        cvtst   F0, F0                  # Is this necessary ?
        cvttq   F0, F1                  # F1 = (nint)Frame Size
        stt     F1, SSR_qTemp(SP)       # Store as quadword
        ldq     R0, SSR_qTemp(SP)       # Set the function return value.
        stl     R0, uiSamplesPerFrame(R17) # Store uiSamplesPerFrame

 #---------------------------------------------------------------------
 #  If the sample rate is less than 9500.0 Hz. then set the
 #  floating point bfLowSampleRate flag to a non-zero value.
 #---------------------------------------------------------------------

        lds     F1, CF9500(R11)         # F1 = 9500.0
        subs    F3, F1, F0              # F0 = SampleRate - 9500.0
        fcmovge F0, F31, F1             # F1 = Zero if Fs >= 9500.0
        sts     F1, bfLowSampleRate(R17) # Store the Low Sample Rate flag

 #----------------------------------------------------------------------
 #  Restore registers RF2 to RF9.
 #  Also restore registers R9 to R15 and R26.
 #----------------------------------------------------------------------

        ldq     R26, SSR_R26(SP)        # Restore register 26
        ldq     R9, SSR_R9(SP)          # Restore register 9
        ldq     R10, SSR_R10(SP)        # Restore register 10
        ldq     R11, SSR_R11(SP)        # Restore register 11
        ldq     R12, SSR_R12(SP)        # Restore register 12
        ldq     R13, SSR_R13(SP)        # Restore register 13
        ldq     R14, SSR_R14(SP)        # Restore register 14
        ldq     R15, SSR_R15(SP)        # Restore register 15
        ldt     F2, SSR_F2(SP)          # Save register F2
        ldt     F3, SSR_F3(SP)          # Save register F3
        ldt     F4, SSR_F4(SP)          # Save register F4
        ldt     F5, SSR_F5(SP)          # Save register F5
        ldt     F6, SSR_F6(SP)          # Save register F6
        ldt     F7, SSR_F7(SP)          # Save register F7
        ldt     F8, SSR_F8(SP)          # Save register F8
        ldt     F9, SSR_F9(SP)          # Save register F9
        trapb                           # Force any pending HW exceptions

        lda     SP, SSR_StackSize(SP)   # Free stack frame

        ret     R31, (R26), 1           # Return to caller

        .end

 #**********************************************************************
 #**********************************************************************
 #
 #  Routine: initialize_fvtm
 #  Author:  Bill Hallahan
 #  Date:    April 5, 1994
 #
 #
 #  Abstract:
 #
 #    This routine initializes the floating point vocal tract model
 #    routine speech_waveform_generator.
 #
 #
 #  Input:
 #
 #
 #    R16    Contains the address of a structure of type FVTM_T
 #           that stores the variables for this instance of the FVTM.
 #
 #
 #    R26    R26 contains the return address for this routine.
 #
 #
 #  Output:
 #
 #    The delay buffers for most of the vocal tract filters are
 #    zeroed.
 #
 #
 #  Registers Modified:
 #
 #
 #**********************************************************************
 #**********************************************************************

        .text
        .align   5

        .ent  initialize_fvtm

initialize_fvtm:

 #----------------------------------------------------------------------
 #  Zero floating point glottal source generation parameters.
 #----------------------------------------------------------------------

        ldgp    GP, (R27)               # Load the global pointer
        sts     F31, LaryngealSourceGain(R16) # LaryngealSourceGain = 0.0
        sts     F31, DifferentiatedGlottalFlow(R16) # Diff.-GlottalFlow = 0.0

 #----------------------------------------------------------------------
 #  Zero all filter delays.
 #----------------------------------------------------------------------

        sts     F31, LowPassDelay_1(R16) # LowPassDelay_1 = 0.0
        sts     F31, LowPassDelay_2(R16) # LowPassDelay_2 = 0.0
        sts     F31, GlottalSourceTiltDelay(R16) # GlottalSourceTiltDelay = 0.0
        sts     F31, NasalDelay_1(R16)  # NasalDelay_1 = 0.0
        sts     F31, NasalDelay_2(R16)  # NasalDelay_2 = 0.0
        sts     F31, c5_Delay_1(R16)    # c5_Delay_1 = 0.0
        sts     F31, c5_Delay_2(R16)    # c5_Delay_2 = 0.0
        sts     F31, c4_Delay_1(R16)    # c4_Delay_1 = 0.0
        sts     F31, c4_Delay_2(R16)    # c4_Delay_2 = 0.0
        sts     F31, c3_Delay_1(R16)    # c3_Delay_1 = 0.0
        sts     F31, c3_Delay_2(R16)    # c3_Delay_2 = 0.0
        sts     F31, c2_Delay_1(R16)    # c2_Delay_1 = 0.0
        sts     F31, c2_Delay_2(R16)    # c2_Delay_2 = 0.0
        sts     F31, c1_Delay_1(R16)    # c1_Delay_1 = 0.0
        sts     F31, c1_Delay_2(R16)    # c1_Delay_2 = 0.0
        sts     F31, p6_Delay_1(R16)    # p6_Delay_1 = 0.0
        sts     F31, p6_Delay_2(R16)    # p6_Delay_2 = 0.0
        sts     F31, p5_Delay_1(R16)    # p5_Delay_1 = 0.0
        sts     F31, p5_Delay_2(R16)    # p5_Delay_2 = 0.0
        sts     F31, p4_Delay_1(R16)    # p4_Delay_1 = 0.0
        sts     F31, p4_Delay_2(R16)    # p4_Delay_2 = 0.0
        sts     F31, p3_Delay_1(R16)    # p3_Delay_1 = 0.0
        sts     F31, p3_Delay_2(R16)    # p3_Delay_2 = 0.0
        sts     F31, p2_Delay_1(R16)    # p2_Delay_1 = 0.0
        sts     F31, p2_Delay_2(R16)    # p2_Delay_2 = 0.0

 #----------------------------------------------------------------------
 #  Zero integer point glottal source generation parameters.
 #----------------------------------------------------------------------

        stl     R31, uiVoicePeriodSampleNumber(R16) # uiVPSN = 0
        stl     R31, iNumOpenSamples(R16) # iNumOpenSamples = 0
        stl     R31, iPositionToStartNoiseModulation(R16) # iPos. = 0

        ret     R31, (R26), 1           # Return to caller

        .end
