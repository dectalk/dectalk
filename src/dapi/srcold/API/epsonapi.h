#ifndef _EPSONAPI_H
#define _EPSONAPI_H
//Sample rate selection
#define WAVE_FORMAT_1M16  0x0001	// 11Khz Output (71 samles per buffer)
#define WAVE_FORMAT_08M16 0x0002	// 8Khz Output (51 samples per buffer)

#define ERR_NOERROR		0	// no errors
#define ERR_ERROR		1	// random error
#define ERR_RESET		2	// Start returned early due to reset
#define ERR_INDEX		3	// Data in callback is index

#ifdef EPSON_ARM7
#define ERR_PHONEME_BUF_TOO_SHORT 4 //phoneme buffer is full and there is more to go in it
#endif

#define PTS_DONE		0
#define PTS_OUTPUT		5

#ifdef EPSON_ARM7
#ifndef BLD_DECTALK_DLL
#define BLD_DECTALK_DLL
#endif

#define  LANG_ENGLISH_US      0x0000
#define  LANG_FRENCH          0x0001
#define  LANG_GERMAN          0x0002
#define  LANG_SPANISH         0x0003
#define  LANG_RESERVED        0x0004
#define  LANG_ENGLISH_UK      0x0005
#define  LANG_LATIN_AMERICAN  0x0006
#define  LANG_NONE            0xffff


typedef struct SPEAKER_DEF_T {
	short sex;                /* Sex 1 (male) or 0 (female)                        */
	short smoothness;         /* Smoothness, in %                                  */
	short assertiveness;      /* Assertiveness, in %                               */
	short average_pitch;      /* Average pitch, in Hz                              */
	short pitch_range;        /* Pitch range, in %                                 */
	short breathiness;        /* Breathiness, in decibels (dB)                     */
	short richness;           /* Richness, in %                                    */
	short num_fixed_samp_og;  /* Number of fixed samples of open glottis           */
	short laryngealization;   /* Laryngealization, in %                            */
	short head_size;          /* Head size, in %                                   */
	short formant4_res_freq;  /* Fourth formant resonance frequency, in Hz         */
	short formant4_bandwidth; /* Fourth formant bandwidth, in Hz                   */
	short formant5_res_freq;  /* Fifth formant resonance frequency, in Hz          */
	short formant5_bandwidth; /* Fifth formant bandwidth, in Hz                    */
	short parallel4_freq;     /* Parallel fourth formant frequency, in Hz          */
	short parallel5_freq;     /* Parallel fifth formant frequency, in Hz           */
	short gain_frication;     /* Gain of frication source, in dB                   */
	short gain_aspiration;    /* Gain of aspiration source, in dB                  */
	short gain_voicing;       /* Gain of voicing source, in dB                     */
	short gain_nasalization;  /* Gain of nasalization, in dB                       */
	short gain_cfr1;          /* Gain of cascade formant resonator 1, in dB        */
	short gain_cfr2;          /* Gain of cascade formant resonator 2, in dB        */
	short gain_cfr3;          /* Gain of cascade formant resonator 3, in dB        */
	short gain_cfr4;          /* Gain of cascade formant resonator 4, in dB        */
	short loudness;           /* Loudness, gain input to cascade 1st formant in dB */
	short spectral_tilt;      /* (f0-dependent spectral tilt in % of max)frm 75 to 90 for 10to8 */
	short baseline_fall;      /* Baseline fall, in Hz                              */
	short lax_breathiness;    /* Lax breathiness, in %                             */
	short quickness;          /* Quickness, in %                                   */
	short hat_rise;           /* Hat rise, in Hz                                   */
	short stress_rise;        /* Stress rise, in Hz                                */
	short avg_glot_open;      /* Glottal speed                                     */
	short avg_glot_voicd_open;
	short avg_glot_unv_open;
	short area_chink;
	short open_quo;
	short output_gain_mult;   /* Output gain multiplier for FVTM                   */
	short HL_B1m;
	short HL_B2m;
	short HL_B3m;
	short HL_B4m;
	short HL_B5m;
	short HL_B2F;
	short HL_B3F;
	short HL_B4F;
	short HL_B5F;
	short HL_F6;
	short HL_B6F;
	short stress_step;
	short unstress_pressure;
	short stress_pressure;
	short nom_sub_pressure;
	short nom_fricative_opening;
	short nom_glot_stop_area;
	short vot_speed;
	short endofphrase_spread;
	short HL_num_formants;
	short HL_f1_hi_shift;
	short HL_acd_f1_break;


} SPEAKER_DEF_T;

#include "tts.h"
#include "kernel.h"
#include "cm_def.h"
#include "vtminst.h"
#include "ph_def.h"
#include "ls_def.h"
extern int TextToSpeechInitTTP(LPTTS_HANDLE_T phTTS, PKSD_T pKsd_t, 
						PCMD_T pCmd_t, PLTS_T pLts_t, void *user_dict,
						U16 lang_id,U16 reset_all);
extern int TextToSpeechInitPTS(LPTTS_HANDLE_T phTTS, PKSD_T pKsd_t, 
						PDPH_T pDph_t, PDPHSETTAR_ST pDphsettar,
						PVTM_T pVtm_t, SPEAKER_DEF_T **spdef_ptr, U16 output_format,
						U16 reset_all);

extern int TextToSpeechStartTTP(LPTTS_HANDLE_T phTTS,char *input_text, 
						 S16 *ctrl_phoneme_ptr, 
						 S16 ctrl_phoneme_buff_length, 
						 char **input_text_ptr);
extern int TextToSpeechStartPTS(LPTTS_HANDLE_T phTTS,S16 *ctrl_phoneme_ptr,
						 S16 ctrl_phoneme_buff_length,
						 short *output_buffer);
extern int TextToSpeechGetSpeakerDef(SPEAKER_DEF_T *speaker_def_ptr);

extern int TextToSpeechReset(LPTTS_HANDLE_T phTTS);
#else
extern int TextToSpeechStart(char *input,short *buffer,int output_format);
extern int TextToSpeechInit(short *(*callback)(short *,long),void *user_dict);
extern int TextToSpeechReset(void);

#endif

#endif //_EPSONAPI_H

