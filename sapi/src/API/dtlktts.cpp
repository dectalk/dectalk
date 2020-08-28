/************************************************************************
dtlkTTS.Cpp - DECtalk TTS mode (main part)
   Includes the interfaces:
	  ISRAttributes
	  ISRCentral
	  ISRDialogs
	  IUnknown

Copyright 1994 by Microsoft corporation.All rights reserved.
Copyright 1995 by Digital Equipment Corporation. All rights reserved.
Copyright 1998 by Digital Equipment Corporation. All rights reserved.
Copyright 1999 by Digital Equipment Corporation. All rights reserved.

24feb97		tek			Fix UnRegister return (BATS 90)
26feb97		tek			rewrite the loading of TTSMODEINFO
19mar97		ncs			Remerge of Willowpond stuff
29apr97		tql			Add checks to see if pSinkW exists before using it
01may97		tek			Licensing changes
01aug97		tek			bats423 (low-level audio fixes)
04aug97		tek			notification fixes (thru 07aug97)
20sep97		tek			implement the tagged-text parser, but only
						to strip tags.
24oct97		cjl/tek		BATS#415, Changed TTSFEATURE_PITCH to TTSFEATURE_SPEED.
12nov97		tek			merge in the aug97 fixes above, plus mouth position data.
19nov97     cjl         change speech.h to local
02feb98		MGS			Added support for more tags
04feb98		MGS			BATS #428 made the language info correct for all languages
04feb98		MGS			Fixed group F interfaces
11feb98		tek			do the required implied "resume" on AudioReset,
						correct reset in case of claimed and paused.
03mar98		MGS			BATS 610, fixed volume tag.
09mar98		tek			sapi backend timing (group h)
16mar98		tek			bats 617: registered sink needs to take a reference
18mar98		tek			bats 608/609/620: audio format support
18mar98		cjl			Removed specific path for dectalkf.h.
19mar98		tek			bats 627: return TTSERR_NOTSUPPORTED for all dialogs.
19mar98		MGS			BATS 626: fixed MAX_PITCH and MIN_PITCH
12may98		tek			bats665: handle files as audio destination
13mau98		tek			bats666: remove a semicolon causing spurious setting of m_bTextDataDone
08jun98		tek			lots of changes for SAPI dialogs, plus a bugfix in 
						the way A::TextData calculates its buffer size.
27jul98		tek		compiler /Og workaround in TextData
30jul98		jhu			Added support for SPANISH_LA and SPANISH_SP.
10sep98		tek		serialize buffer start/stop notifications (bats 761)
14sep98		tek			add PeekAndPump()
15sep98		tek		implement m_bDoNotNotify
16sep98		tek		do both ANSI and UNICODE NotifySink interfaces
21sep98		tek		add TTSI_ITTSDIALOGS
28sep98		tek		merge in lots of compliance changes and TTSFUNC-detected bugfixes
07oct98		tek		remove extra wordposition mark at end of buffer (added 28sep98)
19oct98		tek		(to 27oct98)extend support for IPAPHONETIC characters (still a sync bug)
					(also fixed several compiler warnings due to mismatched types etc)
04nov98		tek		bats797: fix build error for non-US
07jan98		tek		bats850: add PumpModeMessage(), make PeekAndPump a member of CMode
					also fix incorrect size validation in A::ModeGet
07apr99		tek		bats 884: correct stop index in unicode TextData.
*/


#include "dectalkf.h"


#ifndef _AFXDLL  //tek 08jun98 MFC for dialogs
#include <windows.h>
#else //_AFxDLL
#include "stdafx.h"
#endif //_AFXDLL

#include <mmsystem.h>

#include <objbase.h>
#include <objerror.h>
#include <crtdbg.h>	// tek 17sep98 for _ASSERT macros
#include <assert.h> // this too

// cjl 19nov97 change speech.h to local
#include "speech.h"
#include "dtlkTTS.h"
#include "dtlkttsE.h"
#include "audioapi.h"  // WIH For GetAudioVolume and SetAudioVolume
#include "audiodef.h"  // MVP: new common header file
#include "resource.h"
// here is the dialog property sheet..
#include "DECtalkDialogs.h"

#include "kernel.h"		// tek 13nov97 needed for outputdebugstring

#ifdef WILLOWPOND
#include "idec.h"      // NCS For willow pond
#endif

// This is the temporary output window that dummies as a wave out - remove

// 01aug97 bats423: WM_NS defs moved to audiodef.h


//UINT ID_Mode_Shutdown;       

#define ID_Mode_Shutdown (WM_USER + 6)

#define SHUTDOWN_COUNT          1 // tek 21sep98 forces synchronous shutdown.

#define ITTSCENTRAL_INTERNAL_REFERENCES (2) // the number of refs left when we're done.

// tek 13aug97 this is the size of the temporary buffer we use to build the 
// substituted strings in TextData
#define	SUBST_STRING_SIZE	(256)
// this is the (re) alloc block size for the destination buffer in TextData
#define TEXT_DATA_REALLOC_BLOCK	(4096)


extern "C"
{
  void SetSampleRate( LPTTS_HANDLE_T, unsigned int );
  /* BATS 610, added next line */
  DWORD DecodeDectalkVolume( DWORD dwVolume );
#ifdef SAPI_MULTI_LANGUAGE_SUPPORT
  int  GetCurrentPitch(LPTTS_HANDLE_T phTTS, int *pitch);
#endif
}

int  MyAStrLen (PCSTR pA);
void NotificationSend (PCMode pCMode, PCList pList, DWORD dwMessage, DWORD dwParam1, DWORD dwParam2);
// tek 20sep97 tagged text parser prototype
void ProcessTaggedTextW(PCMode pMode, char *szDest, DWORD *dwDestCount, WCHAR *wszSrc, DWORD *dwWSrcCount, BOOL bIsIPA);
void ProcessTaggedText(PCMode pMode, char *szDest, DWORD *dwDestCount, char *szSrc, DWORD *dwSrcCount);
// tek 27aug97 this is the data that we return for the Visual notification..
// this is closely related to TTSMOUTH.. so don't screw with it!
typedef struct DEC_MOUTHINFO_STRUCT {
	char szPhoneme[5];
    BYTE  bMouthHeight;
    BYTE  bMouthWidth;
    BYTE  bMouthUpturn;
    BYTE  bJawOpen;
    BYTE  bTeethUpperVisible;
    BYTE  bTeethLowerVisible;
    BYTE  bTonguePosn;
    BYTE  bLipTension;
}  DEC_MOUTHINFO;

// here we actually instantiate the mouth data..
DEC_MOUTHINFO dmiMouthInfo[]={
//#include "mouth.c"
// 29aug97		tek		initial
	{"SIL",	  0,	202,	  0,	  0,	  0,	  0,	  0,	  0 }, //0	
	{"IY",	 33,	200,	164,	 34,	 66,	127,	208,	222 }, //1	
	{"IH",	 83,	179,	171,	 46,	 79,	114,	221,	 87 }, //2	
	{"EY",	 66,	209,	164,	 70,	120,	112,	191,	172 }, //3	
	{"EH",	 92,	178,	158,	101,	101,	120,	179,	166 }, //4	
	{"AE",	119,	181,	147,	116,	 70,	137,	134,	159 }, //5	
	{"AA",	137,	157,	170,	118,	108,	123,	  0,	  0 }, //6	
	{"AY",	129,	140,	156,	119,	119,	101,	121,	  0 }, //7	
	{"AW",	136,	117,	163,	139,	109,	121,	121,	  0 }, //8	
	{"AH",	 44,	188,	175,	106,	 49,	117,	123,	  0 }, //9	
	{"AO",	130,	124,	150,	131,	120,	111,	136,	  0 }, //10	
	{"OW",	 29,	 87,	147,	 51,	  0,	  0,	  0,	240 }, //11	
	{"OY",	 92,	115,	162,	 95,	 29,	 35,	  0,	  0 }, //12	
	{"UH",	 52,	129,	151,	 33,	  0,	 59,	  0,	  0 }, //13	
	{"UW",	 34,	 87,	164,	 34,	  0,	  0,	  0,	  0 }, //14	
	{"RR",	 68,	133,	168,	 66,	 30,	 32,	  0,	  0 }, //15	
	{"YU",	 30,	102,	154,	 34,	  0,	  0,	  0,	  0 }, //16	
	{"AX",	 49,	200,	144,	 88,	 45,	108,	120,	  0 }, //17	
	{"IX",	100,	196,	173,	 90,	103,	131,	172,	145 }, //18	
	{"IR",	 34,	227,	170,	 33,	 70,	139,	237,	204 }, //19	
	{"ER",	 87,	194,	149,	 95,	 92,	126,	172,	175 }, //20	
	{"AR",	127,	148,	147,	116,	108,	105,	  0,	  0 }, //21	
	{"OR",	117,	130,	162,	131,	108,	108,	  0,	  0 }, //22	
	{"UR",	 48,	123,	169,	 30,	  0,	 69,	  0,	  0 }, //23	
	{"W",	 34,	 92,	157,	 44,	  0,	  0,	  0,	250 }, //24	
	{"Y",	 35,	181,	169,	 44,	 69,	157,	254,	140 }, //25	
	{"R",	 31,	129,	159,	 48,	 29,	 76,	  0,	  0 }, //26	
	{"LL",	 35,	168,	172,	 49,	 60,	 93,	234,	 97 }, //27	
	{"HX",	 50,	215,	159,	 61,	 47,	108,	115,	114 }, //28	
	{"RX",	 67,	135,	154,	 63,	 35,	 31,	  0,	  0 }, //29	
	{"LX",	 35,	176,	146,	 47,	 66,	 97,	248,	 87 }, //30	
	{"M",	  0,	203,	148,	  0,	  0,	  0,	118,	132 }, //31	
	{"N",	 30,	206,	174,	 59,	 86,	213,	240,	  0 }, //32	
	{"NX",	 15,	165,	147,	 49,	 30,	 78,	  0,	  0 }, //33	
	{"EL",	 35,	161,	173,	 50,	 58,	102,	255,	 99 }, //34	
	{"DZ",	  0,	  0,	  0,	  0,	  0,	  0,	  0,	  0 }, //35	
	{"EN",	 34,	209,	161,	 59,	 88,	227,	244,	  0 }, //36	
	{"F",	 17,	165,	168,	  0,	125,	  0,	  0,	225 }, //37	
	{"V",	 17,	149,	163,	  0,	130,	  0,	  0,	202 }, //38	
	{"TH",	 33,	221,	170,	 48,	 59,	129,	255,	  0 }, //39	
	{"DH",	 29,	212,	171,	 48,	 69,	140,	252,	  0 }, //40	
	{"S",	 15,	204,	158,	 50,	 74,	225,	232,	102 }, //41	
	{"Z",	 16,	190,	145,	 52,	 75,	220,	242,	 95 }, //42	
	{"SH",	 34,	186,	170,	 58,	103,	135,	227,	134 }, //43	
	{"ZH",	 30,	191,	156,	 63,	 99,	141,	207,	136 }, //44	
	{"P",	  0,	208,	158,	  0,	  0,	  0,	118,	134 }, //45	
	{"B",	  0,	206,	169,	  0,	  0,	  0,	136,	140 }, //46	
	{"T",	 34,	219,	145,	 66,	 75,	206,	255,	  0 }, //47	
	{"D",	 30,	225,	174,	 59,	 73,	218,	241,	  0 }, //48	
	{"K",	 17,	190,	148,	 45,	 29,	 85,	  0,	  0 }, //49	
	{"G",	 17,	162,	164,	 52,	 30,	 84,	  0,	  0 }, //50	
	{"DX",	 32,	217,	150,	 63,	 84,	226,	243,	  0 }, //51	
	{"TX",	 33,	198,	151,	 66,	 80,	210,	231,	  0 }, //52	
	{"Q",	 30,	225,	154,	 31,	 63,	119,	213,	227 }, //53	
	{"CH",	 33,	207,	156,	 63,	 78,	228,	255,	  0 }, //54	
	{"JH",	 30,	197,	148,	 68,	 83,	190,	255,	  0 }, //55	
	{"DF",	 30,	225,	157,	 65,	 86,	206,	255,	  0 }  //56	

};


// end visual struct.

#ifdef ENGLISH_US // tek 19oct98 IPA extensions only for us english.
struct  IPA_TO_ARPA {
	WCHAR	wzIpa[3];
	char	szArpa[4];
	unsigned char cIndex;
};

#include "l_all_ph.h"
// it would be nice if all these tables were part of a language module instead of
// duplicated all over the place..
struct IPA_TO_ARPA itaUSEnglish[] = {
{{0x20,0x0,0x0},		{"  "}, WBOUND}, /*SPACE; (word boundary) */
{{0x2E,0x0,0x0},		{"- "}, SBOUND}, /*FULL STOP; (syllable break) */
{{0x52,0x0,0x0},		{"r "}, US_R     }, /*LATIN CAPITAL LETTER R; (Rat) */
{{0x5F,0x0,0x0},		{"_ "}, SIL   }, /*LOW LINE; (silence) */
{{0x61,0x26A,0x0},		{"ay"}, US_AY    }, /*LATIN SMALL LETTER A + LATIN LETTER SMALL CAPITAL I; (bUY) */
{{0x61,0x28A,0x0},		{"aw"}, US_AW    }, /*LATIN SMALL LETTER A + LATIN SMALL LETTER UPSILON; (brOW) */
{{0x62,0x0,0x0},		{"b "}, US_B     }, /*LATIN SMALL LETTER B; (Bad) */
{{0x64,0x32F,0x0},		{"dz"}, US_DZ    }, /*LATIN SMALL LETTER D + COMBINING INVERTED BREVE BELOW; (wiDth) */
{{0x64,0x0,0x0},		{"d "}, US_D     }, /*LATIN SMALL LETTER D; (Dad) */
{{0x65,0x0,0x0},		{"ey"}, US_EY    }, /*LATIN SMALL LETTER E; (bAY) */
{{0x66,0x0,0x0},		{"f "}, US_F     }, /*LATIN SMALL LETTER F; (Fat) */
{{0x67,0x0,0x0},		{"g "}, US_G     }, /*LATIN SMALL LETTER G; (Game) */
{{0x68,0x0,0x0},		{"hx"}, US_HX    }, /*LATIN SMALL LETTER H; (Had) */
{{0x69,0x2B4,0x0},		{"ir"}, US_IR    }, /*LATIN SMALL LETTER I + MODIFIER LETTER SMALL TURNED R; (pEEr) */
{{0x69,0x0,0x0},		{"iy"}, US_IY    }, /*LATIN SMALL LETTER I; (bEAn) */
{{0x6A,0x75,0x0},		{"yu"}, US_YU    }, /*LATIN SMALL LETTER J + LATIN SMALL LETTER U; (cUte) */
{{0x6A,0x0,0x0},		{"yx"}, US_Y     }, /*LATIN SMALL LETTER J; (Yank) */
{{0x6B,0x0,0x0},		{"k "}, US_K     }, /*LATIN SMALL LETTER K; (loCH) */
{{0x6C,0x329,0x0},		{"el"}, US_EL    }, /*LATIN SMALL LETTER L +  COMBINING VERTICAL LINE BELOW; (dangLe) */
{{0x6C,0x0,0x0},		{"l "}, US_LL    }, /*LATIN SMALL LETTER L; (Lad) */
{{0x6D,0x0,0x0},		{"m "}, US_M     }, /*LATIN SMALL LETTER M; (idealisM) */
{{0x6E,0x329,0x0},		{"en"}, US_EN    }, /*LATIN SMALL LETTER N + COMBINING VERTICAL LINE BELOW; (burdeN) */
{{0x6E,0x0,0x0},		{"n "}, US_N     }, /*LATIN SMALL LETTER N; (Nat) */
{{0x6F,0x28A,0x0},		{"ow"}, US_OW    }, /*LATIN SMALL LETTER O + LATIN SMALL LETTER UPSILON; (nO) */
{{0x6F,0x0,0x0},		{"ow"}, US_OW    }, /*LATIN SMALL LETTER O; (nO) */
{{0x70,0x0,0x0},		{"p "}, US_P     }, /*LATIN SMALL LETTER P; (Pat) */
{{0x72,0x0,0x0},		{"r "}, US_R     }, /*LATIN SMALL LETTER R; (Rat) */
{{0x73,0x0,0x0},		{"s "}, US_S     }, /*LATIN SMALL LETTER S; (Sap) */
{{0x74,0x294,0x0},		{"tx"}, US_TX    }, /*LATIN SMALL LETTER T + LATIN LETTER GLOTTAL STOP; (baTTen) */
{{0x74,0x0,0x0},		{"t "}, US_T     }, /*LATIN SMALL LETTER T; (Tack) */
{{0x75,0x0,0x0},		{"uw"}, US_UW    }, /*LATIN SMALL LETTER U; (bOOn) */
{{0x76,0x0,0x0},		{"v "}, US_V     }, /*LATIN SMALL LETTER V; (Vat) */
{{0x77,0x0,0x0},		{"w "}, US_W     }, /*LATIN SMALL LETTER W; (Why) */
{{0x7A,0x0,0x0},		{"z "}, US_Z     }, /*LATIN SMALL LETTER Z; (Zap) */
{{0xE6,0x0,0x0},		{"ae"}, US_AE    }, /*LATIN SMALL LETTER AE; (pAt) */
{{0xF0,0x0,0x0},		{"dh"}, US_DH    }, /*LATIN SMALL LETTER ETH; (THen) */
{{0x14B,0x0,0x0},		{"nx"}, US_NX    }, /*LATIN SMALL LETTER ENG; (baNG) */
{{0x251,0x2B4,0x0},		{"ar"}, US_AR    }, /*LATIN SMALL LETTER ALPHA + MODIFIER LETTER SMALL TURNED R; (bARn) */
{{0x251,0x0,0x0},		{"aa"}, US_AA    }, /*LATIN SMALL LETTER ALPHA; (pOt) */
{{0x254,0x26A,0x0},		{"oy"}, US_OY    }, /*LATIN SMALL LETTER OPEN O + LATIN SMALL LETTER CAPITAL I; (bOY) */
{{0x254,0x2B4,0x0},		{"or"}, US_OR    }, /*LATIN SMALL LETTER OPEN O + MODIFIER LETTER SMALL TURNED R; (bOrn) */
{{0x254,0x0,0x0},		{"ao"}, US_AO    }, /*LATIN SMALL LETTER O; (bOUght) */
{{0x259,0x0,0x0},		{"ax"}, US_AX    }, /*LATIN SMALL LETTER SCHWA; (About) */
{{0x25A,0x0,0x0},		{"rr"}, US_RR    }, /*LATIN SMALL LETTER SCHWA WITH HOOK; (anothER) */
{{0x25B,0x0,0x0},		{"eh"}, US_EH    }, /*LATIN SMALL LETTER OPEN E; (pEt) */
{{0x261,0x0,0x0},		{"g "}, US_G     }, /*LATIN SMALL LETTER SCRIPT G; (Game) */
{{0x268,0x0,0x0},		{"ix"}, US_IX    }, /*LATIN SMALL LETTER I WITH STROKE; (kissEs) */
{{0x26A,0x0,0x0},		{"ih"}, US_IH    }, /*LATIN SMALL LETTER CAPITAL I; (tImbre) */
{{0x26B,0x0,0x0},		{"lx"}, US_LX    }, /*LATIN SMALL LETTER I WITH MIDDLE TILDE; (untiL) */
{{0x279,0x0,0x0},		{"rx"}, US_RX    }, /*LATIN SMALL LETTER TURNED R WITH HOOK; (coRe) */
{{0x27B,0x0,0x0},		{"rx"}, US_RX    }, /*LATIN SMALL LETTER TURNED R WITH HOOK; (coRe) */
{{0x27E,0x0,0x0},		{"dx"}, US_DX    }, /*LATIN SMALL LETTER WITH FISHHOOK; (riDer) */
{{0x283,0x0,0x0},		{"sh"}, US_SH    }, /*LATIN SMALL LETTER ESH; (SHeep) */
{{0x28A,0x2B4,0x0},		{"ur"}, US_UR    }, /*LATIN SMALL LETTER UPSILON + MODIFIER LETTER SMALL TURNED R; (pOOr) */
{{0x28A,0x0,0x0},		{"uh"}, US_UH    }, /*LATIN SMALL LETTER UPSILON; (pUt) */
{{0x28C,0x0,0x0},		{"ah"}, US_AH    }, /*LATIN SMALL LETTER TURNED V; (pUtt) */
{{0x292,0x0,0x0},		{"zh"}, US_ZH    }, /*LATIN SMALL LETTER EZH; (meaSure) */
{{0x294,0x0,0x0},		{"q "}, US_Q     }, /*LATIN LETTER GLOTTAL STOP; (we eat) */
{{0x2A4,0x0,0x0},		{"jh"}, US_JH    }, /*LATIN SMALL LETTER DEZH DIGRAPH; (Jeep) */
{{0x2A7,0x0,0x0},		{"ch"}, US_CH    }, /*LATIN SMALL LETTER TESH DIGRAPH; (CHeap) */
{{0x2C8,0x0,0x0},		{"' "}, S1    }, /*MODIFIER LETTER VERTICAL LINE; (primary stress) */
{{0x2CC,0x0,0x0},		{"` "}, S2    }, /*MODIFIER LETTER LOW VERTICAL LINE; (secondary stress) */
{{0x3B8,0x0,0x0},		{"th"}, US_TH    }, /*GREEK SMALL LETTER THETA; (THin) */
{{0x2197,0x0,0x0},		{"/ "}, HAT_RISE}, /*NORTH EAST ARROW; (rising) */
{{0x2198,0x0,0x0},		{"\\"}, HAT_FALL}, /*SOUTH EAST ARROW; (falling) */
{{0,0,0},{0,0,0},0}					 /* end marker */
};



WCHAR wUSEnglishIndexToIPA [121]= {
0x5F,	/* SIL; 0;  */
0x69,	/* IY; 1; bEAn */
0x26A,	/* IH; 2; tImbre */
0x65,	/* EY; 3; bAY */
0x25B,	/* EH; 4; pEt */
0xE6,	/* AE; 5; pAt */
0x251,	/* AA; 6; pOt */
0x61,	/* AY; 7; bUY */
0x61,	/* AW; 8; brOW */
0x28C,	/* AH; 9; pUtt */
0x254,	/* AO; 10; bOUght */
0x6F,	/* OW; 11; nO */
0x254,	/* OY; 12; bOY */
0x28A,	/* UH; 13; pUt */
0x75,	/* UW; 14; bOOn */
0x25A,	/* RR; 15; anothER */
0x6A,	/* YU; 16; cUte */
0x259,	/* AX; 17; About */
0x268,	/* IX; 18; kissEs */
0x69,	/* IR; 19; pEEr */
0x25A,	/* ER; 20; murdER */
0x251,	/* AR; 21; bARn */
0x254,	/* OR; 22; bOrn */
0x28A,	/* UR; 23; pOOr */
0x77,	/* W; 24; Why */
0x6A,	/* Y; 25; Yank */
0x72,	/* R; 26; Rat */
0x6C,	/* LL; 27; Lad */
0x68,	/* HX; 28; Had */
0x27B,	/* RX; 29; coRe */
0x26B,	/* LX; 30; untiL */
0x6D,	/* M; 31; idealisM */
0x6E,	/* N; 32; Nat */
0x14B,	/* NX; 33; baNG */
0x6C,	/* EL; 34; dangLe */
0x64,	/* DZ; 35; wiDth */
0x6E,	/* EN; 36; burdeN */
0x66,	/* F; 37; Fat */
0x76,	/* V; 38; Vat */
0x3B8,	/* TH; 39; THin */
0xF0,	/* DH; 40; THen */
0x73,	/* S; 41; Sap */
0x7A,	/* Z; 42; Zap */
0x283,	/* SH; 43; SHeep */
0x292,	/* ZH; 44; meaSure */
0x70,	/* P; 45; Pat */
0x62,	/* B; 46; Bad */
0x74,	/* T; 47; Tack */
0x64,	/* D; 48; Dad */
0x6B,	/* K; 49; loCH */
0x67,	/* G; 50; Game */
0x27E,	/* DX; 51; riDer */
0x74,	/* TX; 52; baTTen */
0x294,	/* Q; 53; we eat */
0x2A7,	/* CH; 54; CHeap */
0x2A4,	/* JH; 55; Jeep */
0x74,	/* DF; 56; wriTer */
0x0,	/* ; 57; <rsvd> */
0x0,	/* ; 58; <rsvd> */
0x0,	/* ; 59; <rsvd> */
0x0,	/* ; 60; <rsvd> */
0x0,	/* ; 61; <rsvd> */
0x0,	/* ; 62; <rsvd> */
0x0,	/* ; 63; <rsvd> */
0x0,	/* ; 64; <rsvd> */
0x0,	/* ; 65; <rsvd> */
0x0,	/* ; 66; <rsvd> */
0x0,	/* ; 67; <rsvd> */
0x0,	/* ; 68; <rsvd> */
0x0,	/* ; 69; <rsvd> */
0x0,	/* ; 70; <rsvd> */
0x0,	/* ; 71; <rsvd> */
0x0,	/* ; 72; <rsvd> */
0x0,	/* ; 73; <rsvd> */
0x0,	/* ; 74; <rsvd> */
0x0,	/* ; 75; <rsvd> */
0x0,	/* ; 76; <rsvd> */
0x0,	/* ; 77; <rsvd> */
0x0,	/* ; 78; <rsvd> */
0x0,	/* ; 79; <rsvd> */
0x0,	/* ; 80; <rsvd> */
0x0,	/* ; 81; <rsvd> */
0x0,	/* ; 82; <rsvd> */
0x0,	/* ; 83; <rsvd> */
0x0,	/* ; 84; <rsvd> */
0x0,	/* ; 85; <rsvd> */
0x0,	/* ; 86; <rsvd> */
0x0,	/* ; 87; <rsvd> */
0x0,	/* ; 88; <rsvd> */
0x0,	/* ; 89; <rsvd> */
0x0,	/* ; 90; <rsvd> */
0x0,	/* ; 91; <rsvd> */
0x0,	/* ; 92; <rsvd> */
0x0,	/* ; 93; <rsvd> */
0x0,	/* ; 94; <rsvd> */
0x0,	/* ; 95; <rsvd> */
0x0,	/* ; 96; <rsvd> */
0x0,	/* ; 97; <rsvd> */
0x0,	/* ; 98; <rsvd> */
0x0,	/* ; 99; <rsvd> */
0x0,	/* BLOCK_RULES; 100; block allophones  */
0x0,	/* S3; 101; tertiary stress */
0x2CC,	/* S2; 102; secondary stress */
0x2C8,	/* S1; 103; primary stress */
0x0,	/* SEMPH; 104; emphatic stress */
0x2197,	/* HAT_RISE; 105; rising */
0x2198,	/* HAT_FALL; 106; falling */
0x0,	/* HAT_RF; 107; rising/falling */
0x2E,	/* SBOUND; 108; syllable break */
0x0,	/* MBOUND; 109; morpheme boundary */
0x0,	/* HYPHEN; 110; compound noun break */
0x0,	/* WBOUND; 111; word boundary */
0x0,	/* PPSTART; 112; prep phrase start */
0x0,	/* VPSTART; 113; verb phrase start */
0x0,	/* RELSTART; 114; clause start */
0x0,	/* COMMA; 115; end of clause */
0x0,	/* PERIOD; 116; end of sentence */
0x0,	/* QUEST; 117; end of question */
0x0,	/* EXCLAIM; 118; end of exclaimation */
0x0,	/* NEW_PARAGRAPH; 119; explicit paragraph */
0x0,	/* SPECIALWORD; 120; special citation word */
};

// the routine that knows how to turn IPA into arpabet
unsigned int IPAToArpa(char *szResult,			// the resulting arpa string
					   WCHAR *wszIn,			// incoming IPA string
					   DWORD *pdwInCount,		// where we are in the IPA string
					   unsigned char *cPhoneme)	// place to put the internal phoneme index
{

	// WARNING: only matches one or two incoming characters!
	// returns the count of non-null characters in the result, and
	// pushes pdwInCount to point just past the end of this match.
	unsigned int iRetVal = 0;
	struct IPA_TO_ARPA *pitaConv = &itaUSEnglish[0];
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"IPAToArpa: chars=%04x:%04X, ptr=%ld\n",
			(int)(wszIn[*pdwInCount]),(int)(wszIn[*pdwInCount+1]), *pdwInCount);
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG

	while (1) // we break out inside the block
	{
		if (pitaConv->wzIpa[0] > wszIn[*pdwInCount])
		{
			pitaConv = NULL; // flag that we didn't find anything.
			break; // sorted list, not found.
		}
		
		if (  (pitaConv->wzIpa[0] == wszIn[*pdwInCount])
			&&(pitaConv->wzIpa[1] == 0)
			)
		{
			// sorted list, single chars last. This must be it.
			// we'll only be chewing one character.
			(*pdwInCount)++;
			break;
		}

		if (  (pitaConv->wzIpa[0] == wszIn[*pdwInCount])
			&&(pitaConv->wzIpa[1] == wszIn[*pdwInCount+1])
			)
		{
			// exact match. Chew two characters.
			*pdwInCount += 2;
			break;
		}
		// nothing matched, Move down the list, and see if we're done.
		pitaConv++;
		if (pitaConv->wzIpa == 0)
		{
			// end of list. No match. Chew 1
			*pdwInCount++;
			pitaConv = NULL;
			break;
		}
	}

	// ok, here we may have a match. If we do, pitaConv will be non_NULL
	if (pitaConv == NULL)
	{
		// nothing found

#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"IPAToArpa: no match, ptr=%ld\n",
			*pdwInCount);
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG		
	return (0);
	}

	// copy out the match, and return the count and updated pointer.
	strcpy(szResult, pitaConv->szArpa);
	// possibly return the internal phoneme
	if (cPhoneme)
		*cPhoneme = pitaConv->cIndex;

#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"IPAToArpa: result=%s, ptr=%ld\n",
			szResult, *pdwInCount);
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	
	return (strlen(szResult));
} // IPAToArpa()

// this routine converts a wchar IPA string to a char arpabet string.
// returns the length of the result, not including the terminating null.
int wcsIPATombsArpa(char *szDestArpa, 
					unsigned char *szDestPhone, 
					WCHAR *wszSrc, 
					DWORD dwDestArpaLength,
					DWORD dwDestPhoneLength)
{
	DWORD dwDestPtr=0;
	DWORD dwSrcPtr=0;
	DWORD dwPhonePtr=0;
	while (  (dwDestPtr<dwDestArpaLength-3) // 3 is maximum result length
		   &&(wszSrc[dwSrcPtr]!=L'\0')
		   )
	{
		DWORD dwDummyCount=0; // for passing in to IPAToArpa
		DWORD dwConverted=0;
		unsigned char cPhoneme;
		dwConverted = IPAToArpa(&szDestArpa[dwDestPtr],&wszSrc[dwSrcPtr], &dwDummyCount, &cPhoneme);
		if (dwDummyCount) // if anything converted
		{
			dwDestPtr += dwConverted;
			dwSrcPtr += dwDummyCount;
			if (  (szDestPhone)
				&&(dwPhonePtr < dwDestPhoneLength)
				)
			{
				szDestPhone[dwPhonePtr++] = cPhoneme;
			}
		}

	} // while converting
	return dwDestPtr;
}

#endif //ENGLISH_US IPA extensions

// these get used in several places..
char szArpaOn[] = "[:pho arpa speak on] ";
char szArpaOff[] = "[:pho arpa speak off] ";

/************************************************************************/
/* this constant array holds the default info for TTSMODEINFO. These    */
/* values are loaded into the active structure for enumeration and      */
/* selection. (tek 26feb97)                                             */
/************************************************************************/

/* this is done as a wide-character structure, and converted to MBCS if */
/* (when) needed.                                                       */

#ifndef ACI_LICENSE
#define DECMFGNAME (L"Digital Equipment Corporation")
#ifdef ACCESS32
#define DECPRODUCTNAME (L"DECtalk Access32 Software")
#else //ACCESS32
#define DECPRODUCTNAME (L"DECtalk Software")
#endif //ACCESS32
#else //ACI_LICENSE
#define DECMFGNAME (L"Manufacturer's name goes here")
#define DECPRODUCTNAME (L"Product name goes here")
#endif //ACI_LICENSE


const TTSMODEINFOW cttsDefaultModeInfoW[NUMTTSMODES] =
	{
		{
			GUID_DECTALKCLSID, 
			DECMFGNAME,
			DECPRODUCTNAME,
			GUID_MODEID_PAUL,
			L"Paul",
			{ 
#ifdef ENGLISH_US
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_US),
#endif
#ifdef ENGLISH_UK
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_UK),
#endif
#ifdef GERMAN
				MAKELANGID(LANG_GERMAN,SUBLANG_GERMAN),
#endif
#ifdef SPANISH_LA
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH_MEXICAN),
#endif
#ifdef SPANISH_SP
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH),
#endif


				L"Standard"
			},
			L"Paul",
			L"Perfect",
			GENDER_MALE,
			TTSAGE_ADULT,
			TTSFEATURE_ANYWORD 
			  | TTSFEATURE_VOLUME
#ifdef SAPI_GROUP_F_INTERFACES
			  | TTSFEATURE_PITCH
						| TTSFEATURE_TAGGED
						| TTSFEATURE_VISUAL
						| TTSFEATURE_WORDPOSITION
#endif
#ifdef ENGLUSH_US
						| TTSFEATURE_IPATEXTDATA
#endif //ENGLISH_US
                          | TTSFEATURE_SPEED
			  | TTSFEATURE_PCOPTIMIZED,
			TTSI_ITTSATTRIBUTES
			|TTSI_ITTSDIALOGS
			| TTSI_ITTSCENTRAL
		},
		{
			GUID_DECTALKCLSID,
			DECMFGNAME,
			DECPRODUCTNAME,
			GUID_MODEID_BETTY,
			L"Betty",
			{ 
#ifdef ENGLISH_US
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_US),
#endif
#ifdef ENGLISH_UK
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_UK),
#endif
#ifdef GERMAN
				MAKELANGID(LANG_GERMAN,SUBLANG_GERMAN),
#endif
#ifdef SPANISH_LA
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH_MEXICAN),
#endif
#ifdef SPANISH_SP
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH),
#endif	
			
				L"Standard"
			},
			L"Betty",
			L"Beautiful",
			GENDER_FEMALE,
			TTSAGE_ADULT,
			TTSFEATURE_ANYWORD 
			  | TTSFEATURE_VOLUME
#ifdef SAPI_GROUP_F_INTERFACES
			  | TTSFEATURE_PITCH
						| TTSFEATURE_TAGGED
						| TTSFEATURE_VISUAL
						| TTSFEATURE_WORDPOSITION
#endif
#ifdef ENGLUSH_US
						| TTSFEATURE_IPATEXTDATA
#endif //ENGLISH_US
                          | TTSFEATURE_SPEED
			  | TTSFEATURE_PCOPTIMIZED,
			TTSI_ITTSATTRIBUTES
			|TTSI_ITTSDIALOGS
			  | TTSI_ITTSCENTRAL
		},
		{
			GUID_DECTALKCLSID,
			DECMFGNAME,
			DECPRODUCTNAME,
			GUID_MODEID_HARRY,
			L"Harry",
			{ 
#ifdef ENGLISH_US
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_US),
#endif
#ifdef ENGLISH_UK
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_UK),
#endif
#ifdef GERMAN
				MAKELANGID(LANG_GERMAN,SUBLANG_GERMAN),
#endif
#ifdef SPANISH_LA
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH_MEXICAN),
#endif
#ifdef SPANISH_SP
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH),
#endif			
			
				L"Standard"
			},
			L"Harry",
			L"Huge",
			GENDER_MALE,
			TTSAGE_ADULT,
			TTSFEATURE_ANYWORD 
			  | TTSFEATURE_VOLUME
#ifdef SAPI_GROUP_F_INTERFACES
			  | TTSFEATURE_PITCH
						| TTSFEATURE_TAGGED
						| TTSFEATURE_VISUAL
						| TTSFEATURE_WORDPOSITION
#endif
#ifdef ENGLUSH_US
						| TTSFEATURE_IPATEXTDATA
#endif //ENGLISH_US
                          | TTSFEATURE_SPEED
			  | TTSFEATURE_PCOPTIMIZED,
			TTSI_ITTSATTRIBUTES
			|TTSI_ITTSDIALOGS
			  | TTSI_ITTSCENTRAL
		},		
		{
			GUID_DECTALKCLSID,
			DECMFGNAME,
			DECPRODUCTNAME,
			GUID_MODEID_FRANK,
			L"Frank",
			{ 
#ifdef ENGLISH_US
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_US),
#endif
#ifdef ENGLISH_UK
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_UK),
#endif
#ifdef GERMAN
				MAKELANGID(LANG_GERMAN,SUBLANG_GERMAN),
#endif
#ifdef SPANISH_LA
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH_MEXICAN),
#endif
#ifdef SPANISH_SP
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH),
#endif
			
				L"Standard"
			},
			L"Frank",
			L"Frail",
			GENDER_MALE,
			TTSAGE_ELDERLY,
			TTSFEATURE_ANYWORD 
			  | TTSFEATURE_VOLUME
#ifdef SAPI_GROUP_F_INTERFACES
			  | TTSFEATURE_PITCH
						| TTSFEATURE_TAGGED
						| TTSFEATURE_VISUAL
						| TTSFEATURE_WORDPOSITION
#endif
#ifdef ENGLUSH_US
						| TTSFEATURE_IPATEXTDATA
#endif //ENGLISH_US
                          | TTSFEATURE_SPEED
			  | TTSFEATURE_PCOPTIMIZED,
			TTSI_ITTSATTRIBUTES
			|TTSI_ITTSDIALOGS
			  | TTSI_ITTSCENTRAL
		},
		{
			GUID_DECTALKCLSID,
			DECMFGNAME,
			DECPRODUCTNAME,
			GUID_MODEID_DENNIS,
			L"Dennis",
			{ 
#ifdef ENGLISH_US
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_US),
#endif
#ifdef ENGLISH_UK
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_UK),
#endif
#ifdef GERMAN
				MAKELANGID(LANG_GERMAN,SUBLANG_GERMAN),
#endif
#ifdef SPANISH_LA
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH_MEXICAN),
#endif
#ifdef SPANISH_SP
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH),
#endif
				
				L"Standard"
			},
			L"Dennis",
			L"Doctor",
			GENDER_MALE,
			TTSAGE_ADULT,
			TTSFEATURE_ANYWORD 
			  | TTSFEATURE_VOLUME
#ifdef SAPI_GROUP_F_INTERFACES
			  | TTSFEATURE_PITCH
						| TTSFEATURE_TAGGED
						| TTSFEATURE_VISUAL
						| TTSFEATURE_WORDPOSITION
#endif
#ifdef ENGLUSH_US
						| TTSFEATURE_IPATEXTDATA
#endif //ENGLISH_US
                          | TTSFEATURE_SPEED
			  | TTSFEATURE_PCOPTIMIZED,
			TTSI_ITTSATTRIBUTES
			|TTSI_ITTSDIALOGS
			  | TTSI_ITTSCENTRAL
		},
		{
			GUID_DECTALKCLSID,
			DECMFGNAME,
			DECPRODUCTNAME,
			GUID_MODEID_KIT,
			L"Kit",
			{ 
#ifdef ENGLISH_US
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_US),
#endif
#ifdef ENGLISH_UK
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_UK),
#endif
#ifdef GERMAN
				MAKELANGID(LANG_GERMAN,SUBLANG_GERMAN),
#endif
#ifdef SPANISH_LA
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH_MEXICAN),
#endif
#ifdef SPANISH_SP
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH),
#endif
			
				L"Standard"
			},
			L"Kit",
			L"Kid",
			GENDER_MALE,
			TTSAGE_CHILD,
			TTSFEATURE_ANYWORD 
			  | TTSFEATURE_VOLUME
#ifdef SAPI_GROUP_F_INTERFACES
			  | TTSFEATURE_PITCH
						| TTSFEATURE_TAGGED
						| TTSFEATURE_VISUAL
						| TTSFEATURE_WORDPOSITION
#endif
#ifdef ENGLUSH_US
						| TTSFEATURE_IPATEXTDATA
#endif //ENGLISH_US
                          | TTSFEATURE_SPEED
			  | TTSFEATURE_PCOPTIMIZED,
			TTSI_ITTSATTRIBUTES
			|TTSI_ITTSDIALOGS
			  | TTSI_ITTSCENTRAL
		},
		{
			GUID_DECTALKCLSID,
			DECMFGNAME,
			DECPRODUCTNAME,
			GUID_MODEID_URSULA,
			L"Ursula",
			{ 
#ifdef ENGLISH_US
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_US),
#endif
#ifdef ENGLISH_UK
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_UK),
#endif
#ifdef GERMAN
				MAKELANGID(LANG_GERMAN,SUBLANG_GERMAN),
#endif
#ifdef SPANISH_LA
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH_MEXICAN),
#endif
#ifdef SPANISH_SP
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH),
#endif
			
				L"Standard"
			},
			L"Ursula",
			L"Elderly",
			GENDER_FEMALE,
			TTSAGE_ELDERLY,
			TTSFEATURE_ANYWORD 
			  | TTSFEATURE_VOLUME
#ifdef SAPI_GROUP_F_INTERFACES
			  | TTSFEATURE_PITCH
						| TTSFEATURE_TAGGED
						| TTSFEATURE_VISUAL
						| TTSFEATURE_WORDPOSITION
#endif
#ifdef ENGLUSH_US
						| TTSFEATURE_IPATEXTDATA
#endif //ENGLISH_US
                          | TTSFEATURE_SPEED
			  | TTSFEATURE_PCOPTIMIZED,
			TTSI_ITTSATTRIBUTES
			|TTSI_ITTSDIALOGS
			  | TTSI_ITTSCENTRAL
		},
		{
			GUID_DECTALKCLSID,
			DECMFGNAME,
			DECPRODUCTNAME,
			GUID_MODEID_RITA,
			L"Rita",
			{ 
#ifdef ENGLISH_US
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_US),
#endif
#ifdef ENGLISH_UK
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_UK),
#endif
#ifdef GERMAN
				MAKELANGID(LANG_GERMAN,SUBLANG_GERMAN),
#endif
#ifdef SPANISH_LA
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH_MEXICAN),
#endif
#ifdef SPANISH_SP
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH),
#endif
			
				L"Standard"
			},
			L"Rita",
			L"Rough",
			GENDER_FEMALE,
			TTSAGE_ADULT,
			TTSFEATURE_ANYWORD 
			  | TTSFEATURE_VOLUME
#ifdef SAPI_GROUP_F_INTERFACES
			  | TTSFEATURE_PITCH
						| TTSFEATURE_TAGGED
						| TTSFEATURE_VISUAL
						| TTSFEATURE_WORDPOSITION
#endif
#ifdef ENGLUSH_US
						| TTSFEATURE_IPATEXTDATA
#endif //ENGLISH_US
                          | TTSFEATURE_SPEED
			  | TTSFEATURE_PCOPTIMIZED,
			TTSI_ITTSATTRIBUTES
			|TTSI_ITTSDIALOGS
			  | TTSI_ITTSCENTRAL
		},
		{
			GUID_DECTALKCLSID,
			DECMFGNAME,
			DECPRODUCTNAME,
			GUID_MODEID_WENDY,
			L"Wendy",
			{ 
#ifdef ENGLISH_US
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_US),
#endif
#ifdef ENGLISH_UK
				MAKELANGID(LANG_ENGLISH,SUBLANG_ENGLISH_UK),
#endif
#ifdef GERMAN
				MAKELANGID(LANG_GERMAN,SUBLANG_GERMAN),
#endif
#ifdef SPANISH_LA
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH_MEXICAN),
#endif
#ifdef SPANISH_SP
				MAKELANGID(LANG_SPANISH,SUBLANG_SPANISH),
#endif
			
				L"Standard"
			},
			L"Wendy",
			L"Whispery",
			GENDER_FEMALE,
			TTSAGE_ADULT,
			TTSFEATURE_ANYWORD 
			  | TTSFEATURE_VOLUME
#ifdef SAPI_GROUP_F_INTERFACES
			  | TTSFEATURE_PITCH
						| TTSFEATURE_TAGGED
						| TTSFEATURE_VISUAL
						| TTSFEATURE_WORDPOSITION
#endif
#ifdef ENGLUSH_US
						| TTSFEATURE_IPATEXTDATA
#endif //ENGLISH_US
                          | TTSFEATURE_SPEED
			  | TTSFEATURE_PCOPTIMIZED,
			TTSI_ITTSATTRIBUTES
			|TTSI_ITTSDIALOGS
			  | TTSI_ITTSCENTRAL
		}
}; // cttsDefaultModeInfoW

// this routine is used to copy the mode info into the TTSMODEINFO struct..
void CopyTTSModeInfoW(PTTSMODEINFOW pTTSModeInfo, unsigned int uiIndex)
{
	uiIndex = uiIndex % NUMTTSMODES; // wrap if out of range.. 
	memcpy(
		pTTSModeInfo, 
		&cttsDefaultModeInfoW[uiIndex],
		sizeof(TTSMODEINFOW));
}


/************************************************************************
MyAStrLen - ANSI string length.

inputs
   PCSTR    pA - A string
returns
   int - length of string (excluding null terminator)
*/

int MyAStrLen (PCSTR pA)
{
	int cnt=0;

	while (*pA) {
		pA++;
		cnt++;
	}

	return cnt;
}

// tek 07jan99 this is the general-purpose version of the message pumper.
// it is C-callable, and only pumps messages for the window attached to 
// the AudioParams that is passed in. Returns TRUE, unless WM_QUIT or WM_DESTROY
// is found.
extern "C" {
BOOL PumpModeMessage(LPAUDIO_PARAMS_T pAudioParams)
{
	MSG	Msg;
#ifdef API_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"PumpModeMessage for window %08lx at %ld\n",
			pAudioParams->hModeWnd, timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //_API_DEBUG
	if (!pAudioParams->hModeWnd)
		return TRUE; // nobody there??

	while (PeekMessage(&Msg,
						pAudioParams->hModeWnd,
						NULL,
						NULL,
						PM_REMOVE))
		{
#ifdef API_DEBUG
			{
				char szTemp[256];
				sprintf(szTemp,"PumpModeMessage processing message %08x at %ld\n",
								Msg.message, timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //API_DEBUG
			DispatchMessage(&Msg);
			if (  (Msg.message == WM_QUIT)
				||(Msg.message == WM_DESTROY) )
			{
				return FALSE;
			}
		} // while PeekMessage
		return TRUE;						
}
} //extern "C"



/*************************************************************************
ModeWindowProc - Window which is displayed for a TTS mode.
*/

LRESULT CALLBACK ModeWindowProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	// init these to -1, for the case where the mode isn't up yet.
	int ID_DWBookMarkMessage=-1;
	int ID_DWWordPosMessage=-1;
	int ID_DWStartMessage = -1;
	int ID_DWStopMessage = -1;	
	int ID_DWVisualMessage = -1;

	PCMode   pMode = (PCMode)GetWindowLong(hWnd, 0);
	if (pMode)
	{
		// MVP :03/05/96 Get the Registered DECtalk Index Message ID    :Later move
		// this call to CMode::CMode i.e into the initialization.
		// tek 22aug97 moved it, but to avoid code errors I'll do this
		// assignment anyway.
		ID_DWBookMarkMessage = pMode->m_uiBookMarkMessage;
		ID_DWWordPosMessage = pMode->m_uiWordPosMessage;
		ID_DWStartMessage = pMode->m_uiStartMessage;
		ID_DWStopMessage = pMode->m_uiStopMessage;
		ID_DWVisualMessage = pMode->m_uiVisualMessage;
	}
#ifdef M_DEBUG
	else
	{
		char szTemp[256]="";
		sprintf(szTemp, "ModeWindowProc w/o mode, msg=%u at %lu\n",
			uMsg,timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG

#ifdef M_DEBUG //tek 15aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"ModeWindowProc msg=%u lParam=%08lx at %ld\n",
			uMsg,lParam,timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	switch (uMsg) 
	{

		case WM_CLOSE:
			return 0;   // dont close

		case WM_CREATE:
		{
			RECT  rect;

			pMode = (PCMode) ((CREATESTRUCT *) lParam)->lpCreateParams;
			SetWindowLong (hWnd, 0, (DWORD) pMode);

			GetClientRect (hWnd, &rect);

			pMode->hWndEdit = CreateWindow ("EDIT", "TTS results.\n",
				WS_HSCROLL | WS_VSCROLL | ES_MULTILINE | ES_READONLY | WS_VISIBLE | WS_CHILD,
				rect.left, rect.top, rect.right - rect.left, rect.bottom - rect.top,
				hWnd, NULL, ghInstance, NULL
				);
		}
			return 0;

		case WM_SIZE:              // resize the edit control
		{
			RECT  rect;

			GetClientRect (hWnd, &rect);
			MoveWindow (pMode->hWndEdit, 0, 0, rect.right, rect.bottom, TRUE);
		}

			return 0;
		
		case    WM_NSAUDIOSTART:
			if (pMode && pMode->m_fSentStart==TRUE)
			{
				pMode->m_fSentStart=FALSE;
			}
			else
			{
				NotificationSend (pMode, pMode->m_pNotifyList, uMsg, wParam, lParam);
			}
			return 0;
			break;
		case    WM_NSATTRIBCHANGED:
		case    WM_NSAUDIOSTOP:
			NotificationSend (pMode, pMode->m_pNotifyList, uMsg, wParam, lParam);
			return 0;
			break;

		case	WM_NSTEXTDATASTARTED:
			// call the sinnk..
			{
				PSINK_DATA psdSinkData=(PSINK_DATA)lParam;
				PITTSBUFNOTIFYSINK pbnsNotifySink=NULL;
				pbnsNotifySink = (PITTSBUFNOTIFYSINK)(psdSinkData->pvNotifySink);
				if (pbnsNotifySink)
				{
					pbnsNotifySink->TextDataStarted(psdSinkData->qwTime);
					pbnsNotifySink->Release();
				}

				free(psdSinkData);
								  
			}
			break; // end of WM_NSTEXTDATASTARTED
		case WM_NSTEXTDATAABORTED:
			// tek 10sep98 this is added to serialize start/stop messages
			// (bats 761)
			{
				PSINK_DATA psdSinkData=(PSINK_DATA)lParam;
				PITTSBUFNOTIFYSINK pbnsNotifySink=NULL;
				pbnsNotifySink = (PITTSBUFNOTIFYSINK)(psdSinkData->pvNotifySink);
				if (pbnsNotifySink)
				{
					pbnsNotifySink->TextDataDone(psdSinkData->qwTime, TTSBNS_ABORTED);
					pbnsNotifySink->Release();
				}

				// this was malloc'd, so free it.
				free(psdSinkData);				
			}
			break; //WM_NSTEXTDATAABORTED

		// MVP: This message is sent by QueueAudio()  
		//      to send speech to audio destination object's internal memory.
	  
		case ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE :

			    pMode->ProcessAudio();
			return 0;
		case ID_Get_Audio_Volume :
			pMode->DECGetAudioVolume((LPDWORD)lParam);
			return 0;
		case ID_Set_Audio_Volume :
			pMode->DECSetAudioVolume((DWORD)lParam);
			return 0;
  /********************************************************************/
  /*  An application uses this message to get the position of the     */
  /*  last sample played by the wave output device.                   */
  /********************************************************************/
		case ID_Get_Audio_Position :
			pMode->DECGetAudioPosition((LPDWORD)lParam);
			return 0;
  /********************************************************************/
  /*  An application uses this message to get audio parameters.       */
  /********************************************************************/
		case ID_Get_Audio_Params :
			pMode->DECGetAudioParams((LPWAVEFORMATEX)lParam);
			return 0;
  /********************************************************************/
  /*  An application uses this message to set audio parameters.       */
  /********************************************************************/
		case ID_Set_Audio_Params :
			pMode->DECSetAudioParams((LPWAVEFORMATEX)lParam);
			return 0;

	// tek 21sep98 handle this null message to sweep any marks out of the
	// message queue during shutdown..
		case ID_Null:
			return 0;
  
  /********************************************************************/
  /*  The WM_DESTROY message is used to destroy a window.             */
  /********************************************************************/
		case WM_DESTROY:

			pMode->DestroyAudioObjects();
			return 0;

		/********************************************************************/
		/*  An application uses this message to shut down the CMode object. */
		/********************************************************************/
		case ID_Mode_Shutdown :
		//if (uMsg == ID_Mode_Shutdown)
			{	
			pMode->ModeShutdown();
			return 0;
			}
	
	
	}

  /********************************************************************/
  /* MVP :03/05/96  (Bookmark notification from the Speech ENGINE)    */
  /*  The DECtalk speech engine sends this message to this ModeWindow */
  /*  when it encounters index marks in the Text.LPARAM contains Index*/
  /*  value.                                                          */
  /********************************************************************/
	if(uMsg == (unsigned)ID_DWBookMarkMessage)	 //tek 25feb97 fixed signed/unsigned
	{
#ifdef M_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"BookMark: MarkData=%08lx at %lu\n",
				(DWORD)lParam,timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //M_DEBUG
		pMode->NotifyBookMarks((PMARK_DATA)lParam);
		return 0;
	}


  /********************************************************************/
  /* MVP :03/21/96 (Word Position Notification from the speech ENGINE)*/
  /*  The DECtalk speech engine sends "DECtalkWordPosMessage"message  */
  /*  to this ModeWindow to notify the word being played              */
  /*  LPARAM lParam contains Word Pos Offset value                    */
  /********************************************************************/
	if(uMsg == (unsigned)ID_DWWordPosMessage)
	{
		pMode->NotifyWordPosition((PMARK_DATA)lParam);
		return 0;
	}

	// tek 15aug97 process the start/stop messages
	if(uMsg == (unsigned)ID_DWStartMessage)
	{
		pMode->ProcessStartMessage((PMARK_DATA)lParam);
		return 0;
	}

	if(uMsg == (unsigned)ID_DWStopMessage)
	{
		pMode->ProcessStopMessage((PMARK_DATA)lParam);
		return 0;
	}

	// tek 27aug97
	if(uMsg == (unsigned)ID_DWVisualMessage)
	{

#ifdef M_DEBUG //tek 15aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"ModeWindowProc sending visual thru NotificationSend; lParam=%08lx at %ld\n",
			lParam,timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
		NotificationSend (pMode, pMode->m_pNotifyList, WM_NSVISUAL, wParam, lParam);
		return 0;

	}




	
	return DefWindowProc (hWnd, uMsg, wParam, lParam);
}


typedef struct {
	PVOID           pInterface;
	IID         iid;
	DWORD           dwKey;
	} NOTIFY, *PNOTIFY;

/*************************************************************************
NotificationRegister - This function adds an application to the list of
	notifcations-ojects which are to be notified.

inputs
	PCList  pList - List object that contains the notifications
	PVOID       pInterface - Pointer to the interface
	IID     iid - Interface #
returns
	DWORD - Key #, or 0 if error
*/
DWORD NotificationRegister (PCList pList, PVOID pInterface, IID iid)
{
	static  DWORD dwKeyCount = 1;   // key-count
	NOTIFY  n;
	
	// fill out the structuire
	n.pInterface = pInterface;
	n.iid = iid;
	n.dwKey = dwKeyCount++;
	
	// Add it to the list
	if (!pList->AddElem (&n, sizeof(n)))
		return 0;
	else
	{
		// tek 16mar98 bats 617: have to take a ref to the object if we've stored it
		((LPUNKNOWN)(pInterface))->AddRef();
		return n.dwKey;
	}
}



/***************************************************************************8
NotificationUnRegister - This unregisters a registered interface.

  inputs
  PCList  pList - List object that contains the notifications
  DWORD       dwKey - Key value to unregister
  returns
  BOOL - TTRUE if found it, FALSE if didn't
*/
BOOL NotificationUnRegister (PCList pList, DWORD dwKey)
{
	DWORD   i, dwNumElems;
	PNOTIFY pn;
	
	dwNumElems = pList->GetNumElems();
	for (i = 0; i < dwNumElems; i++) {
		pn = (PNOTIFY) pList->GetElem(i);
		if (!pn)
			continue;   // error
		if (pn->dwKey == dwKey) 
		{
			// tek 16mar98 bats 617...
			// get the interface pointer before we remove it from the list
			LPUNKNOWN punkTemp = ((LPUNKNOWN)(pn->pInterface));
			// now remove it so nobody else can call it
			pList->RemoveElem (i);
			//  now that nobody can call it, release the reference..
			punkTemp->Release();

			return TRUE;
		};
	};
	
	// else cant find
	return FALSE;
}

/***************************************************************************8
NotificationUnRegisterAll - This unregisters a all registered intefcaes
	and calls release on them.

inputs
	PCList  pList - List object that contains the notifications
returns
	none
*/
void NotificationUnRegisterAll (PCList pList)
{
PNOTIFY pn;

while (pn = (PNOTIFY) pList->GetElem(0)) {
	((LPUNKNOWN) pn->pInterface)->Release();
	pList->RemoveElem(0);
	};
}


/**************************************************************************
NotificationSend - This sends out a notification to all of the registered
	interface objects.

inputs
	PCList  pList - List object that contains the notifications
	DWORD       dwMessage - Message number
	DWORD       dwParam1 - first parameter (depends on message #)
	DWORD       dwParam2 - second parameter (decpond on message #)

returns
	none
*/
void NotificationSend (PCMode pCMode, PCList pList, DWORD dwMessage, DWORD dwParam1, DWORD dwParam2)
{
DWORD   i, dwNumElems;
PNOTIFY pn;
// MVP : 03/13/96 Changed the NotifySinks to default i.e ITSSNotifySink
// tek 16sep98 now support both A and W.
// The only difference between the two is the args to Visual, but to
// be clean we will call the correct interface..
PITTSNOTIFYSINKA    pnsA = NULL;
PITTSNOTIFYSINKW    pnsW = NULL;
PVISUAL_DATA pvdVisualData = NULL; // tek 27aug97

// tek 15sep98 m_bDoNotNotify
// Don't send notifications (to ITTSNotifySink) if m_bDoNotNotify
// is set. Do this by pretending there are no registered sinks.
if (pCMode->m_bDoNotNotify)
{
dwNumElems = 0;
}
else
{
dwNumElems = pList->GetNumElems();
}
#ifdef M_DEBUG 
{
	char szTemp[256]="";
	sprintf(szTemp, "NotificationSend, msg=%08lx (%lu), NumElems=%lu\n",
		dwMessage, dwMessage, dwNumElems);
	OutputDebugString(szTemp);
}
#endif //M_DEBUG

// we always have to pick up pvdVisualData, so taht we can free it even if there
// are no sinks..
if (dwMessage == WM_NSVISUAL)
	pvdVisualData = (PVISUAL_DATA)dwParam2;


for (i = 0; i < dwNumElems; i++) {
	pn = (PNOTIFY) pList->GetElem(i);
	if (!pn)
		continue;   // error

	// We only support IID_ITTSNotifySinkW at the moment
	// MVP : Changed to default NotifySink
	// tek 16sep98 now support both A and W.
	pnsA = NULL;
	pnsW = NULL; // later, we only call the correct one.
	if (IsEqualIID(pn->iid, IID_ITTSNotifySinkA))
	{
		pnsA = (PITTSNOTIFYSINKA) pn->pInterface;
	}
	else if (IsEqualIID(pn->iid, IID_ITTSNotifySinkW))
	{
		pnsW = (PITTSNOTIFYSINKW) pn->pInterface;
	}
	else 
		continue; // bogus sink, don't try to use it.

	switch (dwMessage) {
		// FIll this in
		case    WM_NSATTRIBCHANGED:
#ifdef M_DEBUG
			{
				char szTemp[256]="";
				sprintf(szTemp,"AttribChanged notification at %lu\n",timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //M_DEBUG
			if (pnsW)
				pnsW->AttribChanged (dwParam1);
			if (pnsA)
				pnsA->AttribChanged (dwParam1);
			break;
		case    WM_NSAUDIOSTART:
#ifdef M_DEBUG
			{
				char szTemp[256]="";
				sprintf(szTemp,"AudioStart notification at %lu\n",timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //M_DEBUG
			if (pnsW)
				pnsW->AudioStart (((QWORD) dwParam2 << 32) | dwParam1);
			if (pnsA)
				pnsA->AudioStart (((QWORD) dwParam2 << 32) | dwParam1);
			break;
		case    WM_NSAUDIOSTOP:
#ifdef M_DEBUG
			{
				char szTemp[256]="";
				sprintf(szTemp,"AudioStop notification at %lu\n",timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //M_DEBUG
			if (pnsW)
				pnsW->AudioStop (((QWORD) dwParam2 << 32) | dwParam1);
			if (pnsA)
				pnsA->AudioStop (((QWORD) dwParam2 << 32) | dwParam1);
			break;
		case    WM_NSVISUAL:
			{
				// tek 27aug97
				//have to break apart the VISUAL_DATA packet and send it along..
				TTSMOUTH ttsMouth;
				PTTSMOUTH pttsMouth=&ttsMouth;
#ifdef M_DEBUG
				{
					char szTemp[256]="";
					sprintf(szTemp,"WM_NSVISUAL: param1=%08lx param2=%08lx\n",
						dwParam1, dwParam2);
					OutputDebugString(szTemp);
				}
#endif //M_DEBUG
				if (pvdVisualData)
				{
					// this is a small table, so mask just to make sure we don't go too
					// crazy if we get handed junk..
					unsigned int uiIndex=((unsigned int)pvdVisualData->dwPhoneme)&0xff;
					DEC_MOUTHINFO *pdmiMouth = &dmiMouthInfo[uiIndex];
					// fill in the mouth info here.
					ttsMouth.bMouthHeight		= pdmiMouth->bMouthHeight;
					ttsMouth.bMouthWidth		= pdmiMouth->bMouthWidth;
 					ttsMouth.bMouthUpturn		= pdmiMouth->bMouthUpturn;
 					ttsMouth.bJawOpen			= pdmiMouth->bJawOpen;
 					ttsMouth.bTeethUpperVisible	= pdmiMouth->bTeethUpperVisible;
 					ttsMouth.bTeethLowerVisible	= pdmiMouth->bTeethLowerVisible;
 					ttsMouth.bTonguePosn		= pdmiMouth->bTonguePosn;
					ttsMouth.bLipTension		= pdmiMouth->bLipTension;

					// now, call the correct version of the interface..
					if (pnsA)
					{
						pnsA->Visual( pvdVisualData->qTimeStamp,
								  NULL,
								  pvdVisualData->cEnginePhoneme,
								  pvdVisualData->dwHints,
								  pttsMouth);
					}
					if (pnsW)
					{
						WCHAR wcEnginePhoneme;
						WCHAR wcIPAPhoneme=0;
						int iResult;
						// make that a wide char..
						iResult = mbtowc(&wcEnginePhoneme,
							&pvdVisualData->cEnginePhoneme,
							1);
						if (iResult <= 0)
						{
							// character was null or not convertable
							wcEnginePhoneme = L'\0';
						}
#ifdef ENGLISH_US
						// possibly come up with the IPA phonetic..
						wcIPAPhoneme = wUSEnglishIndexToIPA[uiIndex];
#ifdef M_DEBUG
						{
							char szTemp[256];
							sprintf(szTemp, "Visual notification: Phoneme %d(%02x), Eng=%c, IPA=%04x\n",
								(int)pvdVisualData->dwPhoneme,(int)pvdVisualData->dwPhoneme,pvdVisualData->cEnginePhoneme, (int)wcIPAPhoneme);
							OutputDebugString(szTemp);
						}
#endif //M_DEBUG

#endif //ENGLISH_US

						pnsW->Visual( pvdVisualData->qTimeStamp,
								  wcIPAPhoneme,
								  wcEnginePhoneme,
								  pvdVisualData->dwHints,
								  pttsMouth);
					}


				}
				 
			}
			break;
		};
	};

	if ((dwMessage == WM_NSVISUAL) && pvdVisualData)
	{
		// free up the envelope..
#ifdef M_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"NotificationSend freeing %08lx\n",
				pvdVisualData);
			OutputDebugString(szTemp);
		}
#endif //M_DEBUG
		free(pvdVisualData); // do this after we're all done..
	}
	else
	{
#ifdef M_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"NotificationSend not freeing %08lx, msg=%08lx\n",
				pvdVisualData,dwMessage);
			OutputDebugString(szTemp);
		}
#endif //M_DEBUG
	
	}

}



/************************************************************************
CMode - TTS Mode class. The same code handles all modes (French & English)

   inputs:

	  LPUNKNOWN         punkOuter
	  LPFNDESTROYED     pfnDestroy
	  PITTSNOTIFYSINK   ntNotify
	  PIAUDIODEST       ntAudio
*/

CMode::CMode (LPUNKNOWN punkOuter, LPFNDESTROYED pfnDestroy,
			  LPUNKNOWN pAudio)
{

// BUGBUG: When create mode will need other stuff included
   m_pDECtalk            = 0;
   m_cRef                = 0;
   m_punkOuter           = punkOuter;
   m_pfnDestroy          = pfnDestroy;
   m_pModeITTSAttributesW = NULL;
   m_pModeITTSAttributesA = NULL;
   m_pModeITTSCentralW    = NULL;
   m_pModeITTSCentralA    = NULL;
   m_pModeITTSDialogsW    = NULL;
   m_pModeITTSDialogsA    = NULL;
   //m_pTextList           = NULL;	// tek 10aug97 removed
   m_pNotify             = NULL;      //MVP:05/31/96
   //m_pIDList             = NULL;	// tek 20aug97 removed
   m_fSpeaking           = TRUE;
   m_dwVolume            = 0x8000;
   m_pNotifyList            = NULL;

   m_fClaimed            = FALSE;
   m_fPaused             = FALSE;
#ifdef SAPI_GROUP_H_TIMING
   m_fStarted			 = FALSE;
   m_fSentStart			 = FALSE;
   m_qwBaseAudioPosition = 0;
#endif
   m_fDataPending        = FALSE;

   hWndMain              = NULL;
   hWndEdit              = NULL;

   m_bDoNotNotify		 = FALSE;

   m_pAudioIAudioDest    = NULL;
   m_pAudioIAudio        = NULL;
   m_pAudioIUnknown      = pAudio;
   // tek 22sep98 I believe we need to take a ref to this..
   m_pAudioIUnknown->AddRef();


// MVP : Added a flag to denote 16-bit or 8 bit-audio driver
// tek 16mar98 flag superseded. (BATS608/609/620)
   m_bAudioIsEightBit	= FALSE;
   m_bAudioIsMulaw		= FALSE;
   m_dwAudioDestObjectBufferLength =0;
   m_bTextDataDoneFlag = FALSE;
// intialize attributes
   m_wPitch = 0;             //MVP:05/31/96
#ifdef SAPI_GROUP_F_INTERFACES
   // MGS 02/04/1998 changed to 1
   m_dwRealTime =1;          //MVP:05/31/96
#else
   m_dwRealTime =0;          //MVP:05/31/96
#endif
   m_dwSpeed =   180;        //MVP:05/31/96

   // tek 18aug97 initialize the new notification stuff..
   InitializeCriticalSection(&m_csSequenceNumber);
   InitBufNotifySinkList();
   m_dwSequenceNumber=0;
   m_dwPlayingSequenceNumber=0;
   // load up the messages..
	m_uiBookMarkMessage = RegisterWindowMessage("DECtalkBookmarkMessage");
	m_uiWordPosMessage = RegisterWindowMessage("DECtalkWordPosMessage");
	m_uiStopMessage = RegisterWindowMessage("DECtalkStopMessage");
	m_uiStartMessage = RegisterWindowMessage("DECtalkStartMessage");	
	m_uiVisualMessage = RegisterWindowMessage("DECtalkVisualMessage");

#ifdef SAPI_GROUP_H_TIMING
#ifdef M_DEBUG
	// log startup in constructor.
	{
		char szTemp[1024];
		sprintf(szTemp,"CMode constructor built %s %s\n",
			__DATE__,__TIME__);
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
#endif // SAPI_GROUP_H_TIMING

// BUGBUG: Will need to initialize other stuff

	m_dwSpeaker=0;
	m_iShutdownCount=0;
	m_hModeWnd=NULL;
	m_pnlNotifyList=NULL;

   //ID_Mode_Shutdown = RegisterWindowMessage("DECtalkOLEMsg1");
}

// we get here when we ::release the last *user* reference to a ITTSCentral.
// this will release all the internal mode references, and cause the CMode 
// destructor to run.
void CMode::ModeShutdown()
{
	m_iShutdownCount++;
	// tek 17sep98 it is not clear that we need to wait for more than one call, but
	// leave it here for now..
	
//	if ( m_iShutdownCount < SHUTDOWN_COUNT )
//	{
//		PostMessage( m_hModeWnd, ID_Mode_Shutdown, 0L, 0L );
//	}
//	else
	{
		// kill off the synthesizer. This used to be in ~CMode.
		if ( m_pDECtalk )
		{
			// tek 08jan98 we have to be careful about the audio destination
			// here. If we call TextToSpeechShutdown and the audio device later
			// decides to send us a lazy AudioStop, the m_pDECtalk pointer
			// will be dead. So, we do a reset (which should clear out any samples),
			// then we'll pump messages to make sure everything posted is cleared,
			// then we'll pass in a NULL notify sink to make sure the object
			// never gets called again.
			TextToSpeechReset(m_pDECtalk,FALSE);
			PeekAndPump();
#ifdef moved_to_destructor
			if (m_pAudioIAudioDest    )
			{
				m_pAudioIAudio->PassNotify(NULL, IID_IAudioDestNotifySink);
			}
#endif
#ifdef  MOVED_DOWN
			TextToSpeechShutdown( m_pDECtalk );
			m_pDECtalk = NULL; // all gone..

#endif
			// this PostMessage will REALLY shut it down.. after
			// any final messages from the TTSShutdown have gone by..
			//PostMessage( m_hModeWnd, ID_Mode_Shutdown, 0L, 0L );
		}
		{
			// Unregister
			if (m_pNotifyList) {
				NotificationUnRegisterAll (m_pNotifyList);
#ifdef moved_to_destructor
				delete m_pNotifyList;
#endif
			};
			// tek 21sep98 same for the bufnotifysinks..
			FreeAllBufNotifySinks();

			
			// release the audio stuff
			if (m_pAudioIAudioDest    )
			{
//				DWORD dwRef;
				// tek 22sep98 make sure all the bookmarks are back,
				// so we don't leak memory..
				m_pAudioIAudio->Flush();
			}
			if (m_pDECtalk)
			{
				TextToSpeechShutdown( m_pDECtalk );
				m_pDECtalk = NULL; // all gone..
			}
			if (m_pAudioIAudioDest    )
			{
				DWORD dwRef;

				// tek 22sep98 we have to pass in a null notification sink, else
				// we may get called after we've died; the notification
				// sink will still exist, but the CMode references won't.
				m_pAudioIAudio->PassNotify(NULL, IID_IAudioDestNotifySink);

				// now we can release it safely.
				dwRef = m_pAudioIAudioDest->Release();
#ifdef M_DEBUG
				{
					char szTemp[256];
					sprintf(szTemp,"m_pAudioIAudioDest->Release() shows %ld remaining at %lu\n",
						dwRef, timeGetTime());
					OutputDebugString(szTemp);
				}
#endif //M_DEBUG
			}
			if (m_pAudioIAudio    ) 
			{
				DWORD dwRef=m_pAudioIAudio->Release();
			}
			if (m_pAudioIUnknown    ) 
			{
				DWORD dwRef=m_pAudioIUnknown->Release();
			}
			
			// be careful; CModeNotify doesn't take a ref to CMode.. so,
			// if we release all those ITTS objects, we'll have comitted
			// suicide before we can dereference m_pNotify..
			if (NULL != m_pNotify) 
			{
				m_pNotify->Release();
#ifdef moved_to_destructor
				m_pNotify=NULL;
#endif
			}
			

			// tek 17sep98 release (DON'T delete) the contained interfaces.
			if (NULL != m_pModeITTSAttributesA) 
				m_pModeITTSAttributesA->Release();
			if (NULL != m_pModeITTSAttributesW)	
				m_pModeITTSAttributesW->Release();
			if (NULL != m_pModeITTSCentralA   ) 
				m_pModeITTSCentralA->Release();
			if (NULL != m_pModeITTSCentralW   )	
				m_pModeITTSCentralW->Release();
			if (NULL != m_pModeITTSDialogsA   ) 
				m_pModeITTSDialogsA->Release();
			if (NULL != m_pModeITTSDialogsW   ) 
				m_pModeITTSDialogsW->Release();

			// that will have been the last CMode ref, so CMode should be 
			// "destructable" here..
			// that means all the member variables are now dead. Be careful.
		}
		
	}
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CMode::ModeShutdown completed at %lu\n",timeGetTime());
		OutputDebugString(szTemp);
//		ODSFlush();
	}
#endif //M_DEBUG
}
// This is the destructor for the mode object
//
CMode::~CMode (void)
{
	assert(m_cRef == 0); // make sure there are no refs left..

	// BUGBUG: Free up other stuff here

	// tek 17sep98 much of this stuff has been moved to ModeShutdown.

#ifdef WILLOWPOND
   if (m_pEngUnlock)			delete m_pEngUnlock;
#endif   

   if (NULL != m_pModeITTSAttributesA) delete m_pModeITTSAttributesA;
   if (NULL != m_pModeITTSAttributesW) delete m_pModeITTSAttributesW;
   if (NULL != m_pModeITTSCentralA   ) delete m_pModeITTSCentralA;
   if (NULL != m_pModeITTSCentralW   ) delete m_pModeITTSCentralW;
   if (NULL != m_pModeITTSDialogsA   ) delete m_pModeITTSDialogsA;
   if (NULL != m_pModeITTSDialogsW   ) delete m_pModeITTSDialogsW;

   // MVP : The TextToSpeechShutdown API calls DestroyWindow through CloseAudio
   //  routine. So the below line is not necessary.
      if (hWndMain ) DestroyWindow (hWndMain);
   
//	  if (m_pAudioIAudio)
//   	m_pAudioIAudio->PassNotify(NULL, IID_IAudioDestNotifySink);
//   if (m_pAudioIAudioDest    ) m_pAudioIAudioDest->Release();
//   if (m_pAudioIAudio    ) m_pAudioIAudio->Release();
//   if (m_pAudioIUnknown    ) m_pAudioIUnknown->Release();
	if (m_pNotifyList)
		delete m_pNotifyList;
   if (m_pNotify)
      delete m_pNotify;
}

// WIH Right now this returns a BOOL, it should probably return an
// error. Fix this.

// tek 16mar98 bats 608/609/620.
// This previously only worked correctly for 11kHz 16-bit formats (unless you were
// lucky). Modified to accept any of, and to attempt in order: 
//		11kHz 16b PCM mono
//		11kHz  8b PCM mono
//		 8kHz 16b PCM mono
//		 8kHz  8b PCM mono
// This routine sets the sample rate of the VTM, and sets the CMode member
// variables m_bAudioIsEightBit and m_bAudioIsMulaw as appropriate. 
//
// Although everything that is needed to support mulaw formats is here, I
// have no way to test these formats so they are disabled.
//
// Somebody, somewhere, looks at those variables and performs the appropriate
// audio conversion (PA_Queue, I think, but as I write I haven't determined if
// if can do that). It is important that the samples be converted before they
// are queued, because all of the timing code will fall apart if it happens 
// when the samples are sent to the device (as in DAPI).

BOOL CMode::FInit (void)
{
	LPUNKNOWN   pIUnknown = (LPUNKNOWN) this;
	WNDCLASS    wc;
	WAVEFORMATEX    wfex;
	BOOL        bEOF;
	unsigned int uiSampleRate=0;

	if (NULL != m_punkOuter) pIUnknown = m_punkOuter;

	// WIH Constructor for the Audio Destination Object

	BOOL bDoNotHaveAudioFormat = TRUE;

	if (!FAILED(m_pAudioIUnknown->QueryInterface(IID_IAudio, (VOID**)&m_pAudioIAudio)) &&
		!FAILED (m_pAudioIUnknown->QueryInterface(IID_IAudioDest, (VOID**) &m_pAudioIAudioDest)) ) 
	{
		SDATA       sd;
		sd.pData = 0; // (PVOID) &wfex;
		sd.dwSize = 0; // sizeof(wfex);
		HRESULT hResult = m_pAudioIAudio->WaveFormatGet( &sd );
		
		if ( SUCCEEDED( hResult ))
		{

			LPWAVEFORMATEX pWaveFmt = (LPWAVEFORMATEX)sd.pData;
			// decide whether we support this existing format..
			if (pWaveFmt->nChannels == 1) // only support mono.
			{
				switch (pWaveFmt->wFormatTag)
				{
				case WAVE_FORMAT_PCM:
					// bits per sample..
					if (pWaveFmt->wBitsPerSample == 16)
					{
						m_bAudioIsEightBit = FALSE;
					}
					else if (pWaveFmt->wBitsPerSample == 8)
					{
						m_bAudioIsEightBit = TRUE;
					}
					else
					{
						break; // only 8- and 16-bit formats.
					}
					
					// sample rate..
					if (  (pWaveFmt->nSamplesPerSec == 8000)
						||(pWaveFmt->nSamplesPerSec == 11025) )
					{
						uiSampleRate = pWaveFmt->nSamplesPerSec;
					}
					else
					{
						break; // only 8k/11k supported.
					}
					
					// this is an OK format..
					bDoNotHaveAudioFormat = FALSE;
					m_bAudioIsMulaw = FALSE;
					
					break;
					
				case WAVE_FORMAT_MULAW:
#ifdef MULAW_SUPPORT
					// bits per sample
					if (pWaveFmt->wBitsPerSample == 8)
					{
						m_bAudioIsEightBit = TRUE;
					}
					else
					{
						break; // only 8bit mulaw
					}
					// sample rate..
					if (  (pWaveFmt->nSamplesPerSec == 8000)
						||(pWaveFmt->nSamplesPerSec == 11025) )
					{
						uiSampleRate = pWaveFmt->nSamplesPerSec;
					}
					else
#endif //MULAW_SUPPORT
					{
						break; // only 8k/11k supported.
					}
					
					// this is an OK format..
					bDoNotHaveAudioFormat = FALSE;
					m_bAudioIsMulaw = TRUE;
					
					break;
				}// switch (wFormatTag)
			}// if (mono) 
			
			
			
			//  Free the memory allocated by the call to the WaveFormatGet() function.
			
			CoTaskMemFree( pWaveFmt );
			// tek 24sep98 NEW BEHAVIOR: if a format was set and we don't like it, 
			// do NOT attempt to set one on our own.
			if (bDoNotHaveAudioFormat)
			{
				// tek 24sep98 have to kill off the object refs we took.
				m_iShutdownCount = SHUTDOWN_COUNT+1;
				ModeShutdown();
				
				return FALSE;
			}
		}
		
		// if the existing audio format is not one of the chosen few, start 
		// trying to set it to the formats we can use.
		if ( bDoNotHaveAudioFormat )
		{
			// need to put the size data into the SDATA struct before we do
			// anything with it (tek 31jul96)
			sd.dwSize = sizeof(wfex);
			
			// see if it likes the wave-format
			// Talk to the audio object and see if it can do 11 kHz, 16-bit mono
			
			wfex.wFormatTag = WAVE_FORMAT_PCM;
			wfex.nChannels = 1;
			wfex.nSamplesPerSec = 11025;
			wfex.nAvgBytesPerSec = 22050;
			wfex.nBlockAlign = 2;
			wfex.wBitsPerSample = 16;
			wfex.cbSize = 0;
			
			sd.pData = (PVOID) &wfex;
			
			if ( FAILED( m_pAudioIAudio->WaveFormatSet( sd )))
			{
				// do nothing
			}
			else 
			{
				bDoNotHaveAudioFormat = FALSE; // search no more.
			}
			// now try again, if needed.
			// 11K 8b PCM
			if (bDoNotHaveAudioFormat)
			{
				
				wfex.wFormatTag = WAVE_FORMAT_PCM;
				wfex.nChannels = 1;
				wfex.nSamplesPerSec = 11025;
				wfex.nAvgBytesPerSec = 11025;
				wfex.nBlockAlign = 1;
				wfex.wBitsPerSample = 8;
				wfex.cbSize = 0;
				
				if (FAILED( m_pAudioIAudio->WaveFormatSet( sd ))) 
				{
					// do nothing
				}
				else
				{
					bDoNotHaveAudioFormat = FALSE;
				}
			} // (inner) bDoNotHaveAudioFormat
			// 8K 16b PCM
			if (bDoNotHaveAudioFormat)
			{
				
				wfex.wFormatTag = WAVE_FORMAT_PCM;
				wfex.nChannels = 1;
				wfex.nSamplesPerSec = 8000;
				wfex.nAvgBytesPerSec = 16000;
				wfex.nBlockAlign = 2;
				wfex.wBitsPerSample = 16;
				wfex.cbSize = 0;
				
				if (FAILED( m_pAudioIAudio->WaveFormatSet( sd ))) 
				{
					// do nothing
				}
				else
				{
					bDoNotHaveAudioFormat = FALSE;
				}
			} // (inner) bDoNotHaveAudioFormat
			// 8K 8b PCM
			if (bDoNotHaveAudioFormat)
			{
				
				wfex.wFormatTag = WAVE_FORMAT_PCM;
				wfex.nChannels = 1;
				wfex.nSamplesPerSec = 8000;
				wfex.nAvgBytesPerSec = 8000;
				wfex.nBlockAlign = 1;
				wfex.wBitsPerSample = 8;
				wfex.cbSize = 0;
				
				if (FAILED( m_pAudioIAudio->WaveFormatSet( sd ))) 
				{
					// do nothing
				}
				else
				{
					bDoNotHaveAudioFormat = FALSE;
				}
			} // (inner) bDoNotHaveAudioFormat
#ifdef MULAW_SUPPORT
			// 11K 8b MULAW
			if (bDoNotHaveAudioFormat)
			{
				
				wfex.wFormatTag = WAVE_FORMAT_MULAW;
				wfex.nChannels = 1;
				wfex.nSamplesPerSec = 11025;
				wfex.nAvgBytesPerSec = 11025;
				wfex.nBlockAlign = 1;
				wfex.wBitsPerSample = 8;
				wfex.cbSize = 0;
				
				if (FAILED( m_pAudioIAudio->WaveFormatSet( sd ))) 
				{
					// do nothing
				}
				else
				{
					bDoNotHaveAudioFormat = FALSE;
				}
			} // (inner) bDoNotHaveAudioFormat
			// 8K 8b MULAW
			if (bDoNotHaveAudioFormat)
			{
				
				wfex.wFormatTag = WAVE_FORMAT_MULAW;
				wfex.nChannels = 1;
				wfex.nSamplesPerSec = 8000;
				wfex.nAvgBytesPerSec = 8000;
				wfex.nBlockAlign = 1;
				wfex.wBitsPerSample = 8;
				wfex.cbSize = 0;
				
				if (FAILED( m_pAudioIAudio->WaveFormatSet( sd ))) 
				{
					// do nothing
				}
				else
				{
					bDoNotHaveAudioFormat = FALSE;
				}
			} // (inner) bDoNotHaveAudioFormat
#endif //MULAW_SUPPORT
			
			// see if we managed to find SOME format..
			if (bDoNotHaveAudioFormat)
			{
				// tek 24sep98 have to kill off the object refs we took.
				m_iShutdownCount = SHUTDOWN_COUNT+1;
				ModeShutdown();

				return FALSE;
			}
			
			//  Get the sample rate for the ::SetSampleRate() function
			//  (called later on in this function.
			
			uiSampleRate = wfex.nSamplesPerSec;
			// set up everything else..
			switch (wfex.wFormatTag)
			{
			case WAVE_FORMAT_PCM:
				m_bAudioIsMulaw = FALSE;
				break;
			case WAVE_FORMAT_MULAW:
				m_bAudioIsMulaw = TRUE;
				break;
			default:
				return FALSE; // something went wrong.
			} // switch wFormatTag
			switch (wfex.wBitsPerSample)
			{
			case 8:
				m_bAudioIsEightBit = TRUE;
				break;
			case 16:
				m_bAudioIsEightBit = FALSE;
				break;
			default:
				return FALSE; // something went wrong
			} // switch bitspersample
			
		} //(outer) bDoNotHaveAudioFormat
		// Get the audio-destination-object's internal memory size and store it for later use.
		
		m_pAudioIAudioDest->FreeSpace(&m_dwAudioDestObjectBufferLength,&bEOF);
	}
	else
	{
		// couldn't get an audio destination. Die here.
		return FALSE;
	}


	// by now we should have set uiSampleRate, unless there is a logical flaw
	// above.. so, just make sure..
	if (uiSampleRate == 0)
	{
		return FALSE; // somehow didn't get a sample rate??
	}


	// Allocate all of the contained interfaces

	m_pModeITTSCentralW    = new CModeITTSCentralW ((LPVOID)this, pIUnknown);
	m_pModeITTSCentralA    = new CModeITTSCentralA (this, pIUnknown);
	m_pModeITTSDialogsW    = new CModeITTSDialogsW (this, pIUnknown);
	m_pModeITTSDialogsA    = new CModeITTSDialogsA (this, pIUnknown);
	m_pModeITTSAttributesW = new CModeITTSAttributesW (this, pIUnknown);
	m_pModeITTSAttributesA = new CModeITTSAttributesA (this, pIUnknown);
	// tek 20aug97 removed
	//m_pTextList            = new CList(); 
	//m_pIDList              = new CList();
	m_pNotifyList             = new CList();
	
	
	// tek 17sep98 take a reference to the contained interfaces
	m_pModeITTSCentralW->AddRef();
	m_pModeITTSCentralA->AddRef();
	m_pModeITTSDialogsW->AddRef();
	m_pModeITTSDialogsA->AddRef();
	m_pModeITTSAttributesW->AddRef();
	m_pModeITTSAttributesA->AddRef();

	assert(ITTSCENTRAL_INTERNAL_REFERENCES == 2); // tek 17sep98 must match the destructor

	m_pNotify              = new CModeNotify((void*) this);
	m_pNotify->AddRef();

#ifdef WILLOWPOND
	m_pEngUnlock = new CEngUnlock(this, pIUnknown);
	bUnlocked = FALSE;
#endif

	// Pass in the notification mode so that it gets notification

	if (m_pAudioIAudioDest && m_pNotify)
		m_pAudioIAudio->PassNotify((PVOID)m_pNotify, IID_IAudioDestNotifySink);


	// create a window to represent the TTS engine.
	// Real engines don't do this, but its great for testing

	/* create the class */

	memset (&wc, 0, sizeof(wc));
	wc.style = CS_HREDRAW | CS_VREDRAW;
	wc.lpfnWndProc = ModeWindowProc;
	wc.hInstance = ghInstance;
	wc.hIcon = LoadIcon(NULL, MAKEINTRESOURCE(IDI_APPLICATION));
	wc.hCursor = LoadCursor (NULL, MAKEINTRESOURCE(IDC_ARROW));
	wc.hbrBackground = (HBRUSH) (COLOR_BACKGROUND+1);
	wc.lpszMenuName = NULL;
	wc.lpszClassName = "TTSModeClass";
	wc.cbWndExtra = sizeof(long);
	
	RegisterClass (&wc);

	// create the window

	hWndMain = CreateWindow (
	  wc.lpszClassName, "Text to Speech Mode", WS_OVERLAPPEDWINDOW,
	  CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,
	  NULL, NULL, ghInstance, (VOID*) this
	  );

	m_hModeWnd = hWndMain;

	ShowWindow (hWndMain, SW_HIDE);
	
	//  Initialize the shutdown count.

	m_iShutdownCount = 0;

	// tek 13aug97 init all the things we use for buffer management
	m_dwSequenceNumber=0;

	// BUGBUG: Will need to initialize other stuff
	// BUGBUG: Make comment that would make sure that database is loaded, etc.


	MMRESULT mmStatus = TextToSpeechStartup( hWndMain,
						 &m_pDECtalk,
						 WAVE_MAPPER,
						 REPORT_OPEN_ERROR );

	if ( mmStatus )
	{
		return FALSE;  // Error
	}
	// set up the copy of the flags that the audio driver sees..
	SetAudioSampleOutFormat();

 	// tek 08aug97 initialize the InAudioReset flag..
	m_pDECtalk->pAudioHandle->bInAudioReset=FALSE;
	// tek 08aug97 and the send request flag.. and the randry flag..
	m_pDECtalk->pAudioHandle->bSendSamplesRequested = FALSE;
	m_pDECtalk->pAudioHandle->bAudioRanDry = FALSE;

	// tek bats665: determine if this is a file destination or not..
	{
		LPUNKNOWN pIUnk=NULL;
		if (FAILED(m_pAudioIUnknown->QueryInterface(IID_IAudioFile, (VOID**)&pIUnk)))
		{
			// no interface; not a file.
			m_pDECtalk->pAudioHandle->bAudioIsFile = FALSE;			
		}
		else
		{
			// interface; is a file. QueryInterface gives us a reference, so 
			// release it first..
			pIUnk->Release();
			m_pDECtalk->pAudioHandle->bAudioIsFile = TRUE;	
		}
	}

	// tek 01aug97 bats 423 
	// load the pointer to this object so that we can later access the
	// member functions.
	m_pDECtalk->pAudioHandle->pcMode = this;
	//  Set the sample rate used by dectalk.

	::SetSampleRate( m_pDECtalk, uiSampleRate );

//	m_pModeITTSCentralA->AudioPause();
//	m_pModeITTSCentralW->AudioPause();
//	m_pModeITTSCentralA->AudioResume();
//	m_pModeITTSCentralW->AudioResume();
//	m_pModeITTSCentralA->AudioReset();
//	m_pModeITTSCentralW->AudioReset();



	return (m_pModeITTSAttributesW
		&& m_pModeITTSAttributesA
		&& m_pModeITTSCentralW
		&& m_pModeITTSCentralA
		&& m_pModeITTSCentralW
		&& m_pModeITTSDialogsA
		&& m_pAudioIAudio
		&& m_pAudioIAudioDest
		&& m_pNotifyList
		&& m_pNotify
		//&& m_pTextList && m_pIDList
		);

	// BUGBUG: Eventually check for m_pITTSNotifySink and m_pAudioIAudioDest being valid
}


// MVP : new member fn is added for CMode to initialize speaker.
// This function is called while enumerating engine modes.
void InitializeSpeaker(PCMode pMode,UINT uiSpeakerID,const char *pSpeakerName)
{
   PTTSMODEINFOW  pTTSInfo = &pMode->m_TTSModeInfo;
   pMode->m_dwSpeaker=uiSpeakerID;

	memcpy(pTTSInfo,&cttsDefaultModeInfoW[uiSpeakerID],sizeof(TTSMODEINFOW)); 	

	 //MVP: Set the speaker in TTS speech engine
	TextToSpeechSetSpeaker(pMode->m_pDECtalk,uiSpeakerID);
}



/*************************************************************************
CMode::SendAudioIfCan - This function looks at the amount of free space
   in the digital audio destination, and if there's enough, it does some
   TTS processing (convert text to digital audio) and sends the digital
   audio to the output device.

inputs
   none
returns
   HRESULT - error
*/
#ifdef NOTUSED
HRESULT CMode::SendAudioIfCan(void)
{
   DWORD    dwFree;
   HRESULT  hRes;
   BOOL     bEOF;
   CHAR     c;

   if (!m_fSpeaking) return NOERROR;

   while (TRUE)
	  {
	  BYTE     bPCM[1024];
	  DWORD    i;

// Dont do this unless have data to convert

	  if (!m_pTextList->GetNumElems()) return NOERROR;

// Check for sufficient free space at audio dest (& whether we're at end)

	  hRes = m_pAudioIAudioDest->FreeSpace(&dwFree, &bEOF);

	  if (hRes) return hRes;

	  if (bEOF)
		 {
		 m_fSpeaking = FALSE;                      // stop speaking at end
		 //m_fDataPending  = FALSE;               // no more data SDK beta 2
		 return NOERROR;                           // do nothing
		 }

// Out minimum block size is 256 samples

	  if (dwFree < sizeof(bPCM)) return NOERROR;   // available is too small//
// A bookmark, here, denotes a character's worth of data.
// When play encounters the bookmark - it notifies the app.

	  m_pAudioIAudioDest->BookMark((DWORD) c);          // but pMode->BookMark prints

// create a sawtooth wave for demonstration purposed

	  for (i = 0; i < sizeof(bPCM); i++) bPCM[i] = (BYTE) (i * 16);

// add it

	  hRes = m_pAudioIAudioDest->DataSet(bPCM, sizeof(bPCM));
	  if (hRes) return hRes;
	  }

   return NOERROR;
}

#endif

void CMode::Print1Char(HWND hWnd, CHAR ch)
{
   CHAR     c[2];
   INT      iLen;

   c[0]  =  ch;
   c[1]  = '\0';

   iLen = GetWindowTextLength(hWndEdit);
   SendMessage (hWndEdit, EM_SETSEL    , (WPARAM) iLen, (LPARAM) iLen);
   SendMessage (hWndEdit, EM_REPLACESEL, (WPARAM) 0   , (LPARAM) (LPVOID *) c);
}

// MVP : 03/11/96 :BookMarks Implementation
// tek 04aug97 "SAPI fixes"
// These notifications as originally implemented returned the
// wrong timestamp; they are supposed to return the timestamp of the
// sample when they played, not the timestamp "now".
// in order to fix this, we have to send a pointer to a structure
// through ReportTTSStatus and put the ID and the time in that.
void CMode::NotifyBookMarks(PMARK_DATA pMarkData)
{	
	PITTSBUFNOTIFYSINK pbnsSink=NULL;
	pbnsSink = GetBufNotifySink(m_dwPlayingSequenceNumber);

	if(    (pbnsSink)
		&& (!m_pDECtalk->pAudioHandle->bInAudioReset) // tek 14aug97 not if in a reset!
	  )	/* TEK & TQL:04/29/97 BATS#361 */
	{
		   pbnsSink->BookMark(pMarkData->qTimeStamp,
							pMarkData->dwMarkValue);
	}
#ifdef M_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"book notify freeing %08lx at %lu\n",
				pMarkData,timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //M_DEBUG
	free(pMarkData);

}


// MVP : 03/21/96 :WordPosition Implementation prototype
void CMode::NotifyWordPosition(PMARK_DATA pMarkData)
{
	PITTSBUFNOTIFYSINK pbnsSink=NULL;

	pbnsSink = GetBufNotifySink(m_dwPlayingSequenceNumber);

	if(    (pbnsSink)
		&& (!m_pDECtalk->pAudioHandle->bInAudioReset) // tek 14aug97 not if in a reset!
	  )	/* TEK & TQL:04/29/97 BATS#361 */
	{
		pbnsSink->WordPosition(pMarkData->qTimeStamp,
								pMarkData->dwMarkValue);
	}

#ifdef M_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"word notify freeing %08lx at %lu\n",
				pMarkData,timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //M_DEBUG
	free(pMarkData);

}

// tek 15aug97 process a start message
// set the current playing sequence number, so that subsequent notifications 
// know what to do.
void CMode::ProcessStartMessage(PMARK_DATA pMarkData)
{
	PITTSBUFNOTIFYSINK pbnsSink=NULL;

	m_dwPlayingSequenceNumber = pMarkData->dwMarkValue;

	pbnsSink = GetBufNotifySink(m_dwPlayingSequenceNumber);

	if(    (pbnsSink)
		&& (!m_pDECtalk->pAudioHandle->bInAudioReset) // tek 14aug97 not if in a reset!
	  )	/* TEK & TQL:04/29/97 BATS#361 */
	{
		pbnsSink->TextDataStarted(pMarkData->qTimeStamp);
	}

	free(pMarkData);

}

// tek 15aug97 process a start message
// free the mark, conditionally set the done flag, send TextDataDone..?
void CMode::ProcessStopMessage(PMARK_DATA pMarkData)
{
	DWORD dwThisSequenceNumber=0;
	PITTSBUFNOTIFYSINK pbnsNotifySink=NULL;

	// no more notifications on this sequence; zero is never a valid
	// sequence number, so doing this will keep us from looking up
	// a sink.
	m_dwPlayingSequenceNumber=0;
	
	// get the sequence number from the mark packet..
	dwThisSequenceNumber = pMarkData->dwMarkValue;
	EnterCriticalSection(&m_csSequenceNumber);
	if (dwThisSequenceNumber == m_dwSequenceNumber) // tek 13may98 bats666 remove ';'
	{
		// we're done.
#ifdef M_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"ProcessStopMessage setting m_bTextDataDone; seq=%lu, this=%lu at %lu\n",
				m_dwSequenceNumber, dwThisSequenceNumber,timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //M_DEBUG
		m_bTextDataDoneFlag = TRUE; // have to do this in the critical section
									// so we don't miss an incoming block..
	}
	LeaveCriticalSection(&m_csSequenceNumber);
	// report the fact that this buffer is done..
	pbnsNotifySink = this->GetBufNotifySink(dwThisSequenceNumber);
	if (pbnsNotifySink)
		pbnsNotifySink->TextDataDone(pMarkData->qTimeStamp, 0);

	// and free the sink.
	this->FreeBufNotifySink(dwThisSequenceNumber);

#ifdef M_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"stop notify freeing %08lx at %lu\n",
				pMarkData,timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //M_DEBUG
	free(pMarkData);
	// tek 22sep98 if we were paused for a long time, such that the entire
	// utterance started and ended while paused, we may never unclaim. To
	// fix that, make audio happen..
	if (dwThisSequenceNumber == m_dwSequenceNumber)
	{
		ProcessAudio();
	}


}

/**********************************************************************
 *tek 15aug97 this set of routines is used to manage the BufNotifySinks 
 *associated with the TextData calls. They do:
 * InitBufNotifySink():	
 *			initialize the list.
 * SetBufNotifySink(sink, sequence):
 *			take a ref to the sink, and add it to the list.
 * FreeBufNotifySink(sequence):
 *			remove the sink from the list, and release the ref.
 * GetBufNotifySink(sequence):
 *			returns the sink associated with the sequence number, or NULL
 *			if none.
 * GetFirstBufNotifySink(&sequence):
 *			returns the first sink and its sequence number from the list
 *			(for use in winding down the list)
 * FreeAllBufNotifySinks():
 *			frees and releases refs for all the sinks on the list.
 */
// init the list
void CMode::InitBufNotifySinkList(void)
{
	m_pbnlBufNotifyList=NULL;	//not much to init yet..
}
// find a sink on the list
PITTSBUFNOTIFYSINK CMode::GetBufNotifySink(DWORD dwSequenceNumber)
{
	PBUFNOTIFYLIST	pbnlList = m_pbnlBufNotifyList;
	// zero is never on the list, so if asked, just return nothing.
	if (dwSequenceNumber == 0)
	{
#ifdef M_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"INFO: GetBufNotifySink(0).\n");
			OutputDebugString(szTemp);
		}
#endif //M_DEBUG
		return	NULL;
	}

	// thread through the list until we find the one we want..
	while(pbnlList)
	{
		if (pbnlList->dwSequenceNumber == dwSequenceNumber)
			break;
		pbnlList = pbnlList->Next;
	}
	if (pbnlList && pbnlList->pbnsSink)
		return pbnlList->pbnsSink;
	return NULL;
}
// return the first sink on the list
PITTSBUFNOTIFYSINK CMode::GetFirstBufNotifySink(DWORD *pdwSequenceNumber)
{
	PBUFNOTIFYLIST	pbnlList = m_pbnlBufNotifyList;
	// tek 24sep98 validate the pointers
	if (IsBadWritePtr (pdwSequenceNumber, sizeof(DWORD)))
	{
		return NULL;
	}


	// thread through the list until we find the one we want..
	if (pbnlList)
	{
		*pdwSequenceNumber = pbnlList->dwSequenceNumber;
		return pbnlList->pbnsSink;
	}
	// or nothing if the list is empty.
	*pdwSequenceNumber = 0;
	return NULL;
}
// put a sink on the list
HRESULT CMode::SetBufNotifySink(PITTSBUFNOTIFYSINK pbnsSink, DWORD dwSequenceNumber)
{
	PBUFNOTIFYLIST pbnlEntry = NULL;
	// never allow a zero on the list.
	if (dwSequenceNumber == 0)
	{
		fprintf(stderr,"DECtalk: ?attempt to set BufNotifySink with sequence=0?\n");
		return ResultFromScode(E_FAIL);
	}

	pbnlEntry = (PBUFNOTIFYLIST)malloc(sizeof(SINK_DATA));
	if (!pbnlEntry)
		return ResultFromScode (E_OUTOFMEMORY);
	pbnsSink->AddRef();	// take a ref to it..
	pbnlEntry->pbnsSink = pbnsSink;
	pbnlEntry->dwSequenceNumber = dwSequenceNumber;
	pbnlEntry->Next = m_pbnlBufNotifyList;	// thread it on..
	m_pbnlBufNotifyList = pbnlEntry;		// the head of the list.
	return 0;
}
// take a sink off the list..
void CMode::FreeBufNotifySink(DWORD dwSequenceNumber)
{
	PBUFNOTIFYLIST	pbnlThis = m_pbnlBufNotifyList;
	PBUFNOTIFYLIST	pbnlLast = NULL;

	// Shouldn't ever try to free sequence zero..
	if (dwSequenceNumber == 0)
	{
#ifdef M_DEBUG
		OutputDebugString("INFO: FreeBufNotifySink(0)?\n");
#endif //M_DEBUG
		return; // it'll never be there.
	}

	if (!pbnlThis)
		return; // nothing on the list

	// thread through the list until we find the one we want..
	while(pbnlThis)
	{
		if (pbnlThis->dwSequenceNumber == dwSequenceNumber)
			break;
		pbnlLast = pbnlThis;
		pbnlThis = pbnlThis->Next;
	}
	if (pbnlThis)
	{
		if (pbnlThis->pbnsSink)
		{
			
			PITTSBUFNOTIFYSINK pbnsSink=NULL;	// a place to store this so that
												// we can kill any consumers before 
												// releasing
			// unthread it.
			if (pbnlLast)
			{
				pbnlLast->Next = pbnlThis->Next;
			}
			else
			{
				// first element
				m_pbnlBufNotifyList = pbnlThis->Next;
			}
			// now that it's off the list, we can feel free to release the
			// ref.. but, just in case someone, somehow, managed to sneak in,
			// we'll null out the datastructure first.
			pbnsSink = pbnlThis->pbnsSink;;
			pbnlThis->pbnsSink = NULL;

			// now release it
			pbnsSink->Release();
			// and free it.
			free(pbnlThis);
		}
	}
}

// free and release all the sinks on the list..
void CMode::FreeAllBufNotifySinks(void)
{
	PBUFNOTIFYLIST	pbnlThis=m_pbnlBufNotifyList;
	PITTSBUFNOTIFYSINK	pbnsTemp=NULL; // so we can null before we free..
	PBUFNOTIFYLIST	pbnlTemp=NULL;

	// first, null out the root pointer to isolate the list
	m_pbnlBufNotifyList = NULL;
	
	// walk the list..
	while(pbnlThis)
	{
		pbnsTemp = pbnlThis->pbnsSink;
		pbnlThis->pbnsSink = NULL;
		// pick up the next one on the list before we free
		pbnlTemp = pbnlThis->Next;
		// free it.
		free(pbnlThis);
		// release the ref
		pbnsTemp->Release();
		// walk forward.
		pbnlThis = pbnlTemp;
	} // while list


}


/*************************************************************************

CMode::SpeakIfNecessary - Call this whenever a buffer is added or the
   speaking flag is changed. This will start up the audio output device
   if necessary, to start speaking, or will pause the audio output device
   to stop.

inputs
   none
returns
   HRESULT- error
*/
#ifdef NOTUSED
HRESULT        CMode::SpeakIfNecessary(void)
{
HRESULT  hRes;

   if (m_fSpeaking)
	  {
	  hRes = this->SendAudioIfCan();
	  if (hRes) return hRes;
	  return m_pAudioIAudio->Start();
	  }

   else return m_pAudioIAudio->Stop();
}
#endif
// tek 14sep98
// Use this routine to keep things flowing while we're hanging out waiting;
// else we have no way to pump messages.
// tek rewritten and moved into CMode on 08jan99 for bats850.
BOOL CMode::PeekAndPump()
{
#ifdef API_DEBUG
	OutputDebugString("PeekAndPump()\n");
#endif //M_DEBUG
	// just call the generic routine with the audio handle.
	return PumpModeMessage(m_pDECtalk->pAudioHandle);
}

/*************************************************************************
Output - This outputs a string to the mode window.

inputs
   PSTR    pStr - Pointer to the string.
returns
   none
*/

void CMode::Output (PSTR pStr)
{
   int      iLen;

   if (!hWndEdit)    return;

   iLen = GetWindowTextLength (hWndEdit);
   SendMessage (hWndEdit, EM_SETSEL, (WPARAM) iLen, (LPARAM) iLen);
   SendMessage (hWndEdit, EM_REPLACESEL, (WPARAM) 0, (LPARAM) (LPVOID *) pStr);
}


STDMETHODIMP CMode::QueryInterface (REFIID riid, LPVOID *ppv)
{
   *ppv = NULL;

/* always return our IUnkown for IID_IUnknown */

   if (IsEqualIID (riid, IID_IUnknown)) *ppv = (LPVOID) this;

// other interfaces

   if (IsEqualIID(riid, IID_ITTSAttributesW)) *ppv = m_pModeITTSAttributesW;
   if (IsEqualIID(riid, IID_ITTSCentralW   )) *ppv = m_pModeITTSCentralW;
   if (IsEqualIID(riid, IID_ITTSDialogsW   )) *ppv = m_pModeITTSDialogsW;
   if (IsEqualIID(riid, IID_ITTSAttributesA)) *ppv = m_pModeITTSAttributesA;
   if (IsEqualIID(riid, IID_ITTSCentralA   )) *ppv = m_pModeITTSCentralA;
   if (IsEqualIID(riid, IID_ITTSDialogsA   )) *ppv = m_pModeITTSDialogsA;
#ifndef ACI_LICENSE
#ifdef WILLOWPOND
   if (IsEqualIID(riid, IID_IDECUnlockEng)) *ppv = m_pEngUnlock;
#endif
#endif //ACI_LICENSE

// update the reference count

   if (NULL != *ppv) {

	  ((LPUNKNOWN) *ppv)->AddRef();
	  return NOERROR;
	  }

   return ResultFromScode (E_NOINTERFACE);
}


STDMETHODIMP_ (ULONG) CMode::AddRef (void)
{

   return ++m_cRef;
}


STDMETHODIMP_(ULONG) CMode::Release (void)
{
   ULONG    cRefT;
   cRefT = --m_cRef;

// inform destroy that object is going away

   if (0 == m_cRef) {

	   // do we really have an ittscentral at this point?
	  //m_pModeITTSCentralW->AudioReset();
	  // tek 06aug96 this delayed shutdown mechanism doesn't seem
	  // to work; the messages never make it back. So, instead
	  // of that semi-major hack, just sleep a bit to try to 
	  // make sure things are shutdown. WIH says all this confusion
	  // is to make sure all notifications get out before things
	  // go away.. 

	  //PostMessage( m_hModeWnd, ID_Mode_Shutdown, 0L, 0L );

	  //Sleep(100);	// 100ms
	  if (NULL != m_pfnDestroy) 
		  (*m_pfnDestroy)();
	  delete this;
	  }

   return cRefT;
}


/************************************************************************
CModeITTSCentralW - ITTSCentral inteerface
*/

CModeITTSCentralA::CModeITTSCentralA (LPVOID pObj, LPUNKNOWN punkOuter)
{

   m_pObjA = (PCMode)pObj;
   m_cRef = 0;
   (((PCMode) m_pObjA)->m_pModeITTSCentralW)->FInit(pObj, punkOuter);
}


CModeITTSCentralW::CModeITTSCentralW (LPVOID pObj, LPUNKNOWN punkOuter)
{
   m_cRef      = 0;
   m_pObj      = pObj;
   m_punkOuter = punkOuter;
}


// This function is called from the ANSI interface constructor -

CModeITTSCentralW::FInit(LPVOID pObj, LPUNKNOWN punkOuter)
{
   m_cRef      = 0;
   m_pObj      = pObj;
   m_punkOuter = punkOuter;

   return NOERROR;
}


CModeITTSCentralA::~CModeITTSCentralA (void)
{
	// MVP:07/19/96 :Do nothing in the Destructor as it doesn't
	// have any members which are allocated.
	// The below line causes freeing up memory twice.It caused
	// the Memory error when debgging the debug version of
	// DTLKTTSE.DLL
	(((PCMode) m_pObjA)->m_pModeITTSCentralW)->~CModeITTSCentralW();

}


CModeITTSCentralW::~CModeITTSCentralW (void)
{

	// tek 17sep98 verify that the ref count is indeed zero.
	_ASSERTE (m_cRef==0);

}


STDMETHODIMP CModeITTSCentralA::QueryInterface(REFIID riid, LPVOID FAR *ppv)
{
   return (((PCMode) m_pObjA)->m_pModeITTSCentralW)->QueryInterface(riid, ppv);
}


STDMETHODIMP CModeITTSCentralW::QueryInterface(REFIID riid, LPVOID FAR *ppv)
{
   return m_punkOuter->QueryInterface(riid,ppv);
}


STDMETHODIMP_ (ULONG) CModeITTSCentralA::AddRef(void)
{
	m_cRef++;
   return (((PCMode) m_pObjA)->m_pModeITTSCentralW)->AddRef();
}


STDMETHODIMP_ (ULONG) CModeITTSCentralW::AddRef(void)
{
   ++m_cRef;
   return m_punkOuter->AddRef();
}


STDMETHODIMP_ (ULONG) CModeITTSCentralA::Release(void)
{

	ULONG ulRef = --m_cRef;

   (((PCMode) m_pObjA)->m_pModeITTSCentralW)->Release();
   //MGS try this way
//   if (ulRef == 0)
//	   delete this;


   return ulRef;
}


STDMETHODIMP_ (ULONG) CModeITTSCentralW::Release(void)
{
	// tek 17sep98 made self-deleting
	ULONG ulResult;
    --m_cRef;

	ulResult = m_cRef; // save this for returning..
	m_punkOuter->Release();

	// we take exactly two references for our internal use; if that's all that we
	// have left, begin the shutdown process.
	if (ulResult == ITTSCENTRAL_INTERNAL_REFERENCES)
	{
		SendMessage( ((PCMode)m_pObj)->m_hModeWnd, ID_Mode_Shutdown, 0L, 0L );
	}
	else
	{
		// MGS try this way
//		if (0 == m_cRef)
//			delete this;
	}
	return ulResult;
}


STDMETHODIMP CModeITTSCentralA::Inject (PCSTR pszInject)
{
   HRESULT  hRes;
   DWORD    cchInject = MyAStrLen(pszInject) + 1;
   PWSTR    pwszInject;

   pwszInject = (PWSTR) malloc(cchInject * sizeof(WCHAR));

   if (pwszInject)
	  {
	  MultiByteToWideChar(CP_ACP, 0, pszInject, -1, pwszInject, cchInject);
	  hRes = (((PCMode) m_pObjA)->m_pModeITTSCentralW)->Inject(pwszInject);
	  free(pwszInject);
	  return(hRes);
	  }

   else
   
	  return ResultFromScode (E_OUTOFMEMORY);
}


STDMETHODIMP CModeITTSCentralW::Inject (PCWSTR pszInject)
{
#ifdef SAPI_GROUP_F_INTERFACES
	PCMode  pMode = (PCMode) m_pObj;
	char dest[256];
	char src[256];
	unsigned int src_len;
	DWORD dest_pos=0;
	DWORD src_pos=0;


    if (!WideCharToMultiByte(CP_ACP, 0, pszInject, -1, src, 256,0,0))
	{
		return (E_OUTOFMEMORY);
	}

   
	src_len=strlen(src);

	while (src_pos<src_len)
	{
		while ((src_pos<src_len) && (src[src_pos]!='\\'))
		{
			src_pos++;
		}
		ProcessTaggedText(pMode,		// pointer to this object to be able to call dapi functions
						  dest,			// dest
						  &dest_pos,	// dest loc
						  src,			// src
						  &src_pos		// src loc
						  );
		src_pos++; // skip past the ending backslash
	}
	dest[dest_pos]='\0';

	TextToSpeechSpeak(pMode->m_pDECtalk,dest,TTS_NORMAL);

	
	// Ignore this because we dont support tags in the demo
   return ResultFromScode (NOERROR);
#else
      return ResultFromScode (TTSERR_NOTSUPPORTED);
#endif
}


STDMETHODIMP CModeITTSCentralA::ModeGet (PTTSMODEINFOA pModeInfo)
{
   HRESULT        hRes;
   TTSMODEINFOW   ModeInfoW;
	// tek 24sep98 validate arguments
	if (IsBadWritePtr(pModeInfo, sizeof(TTSMODEINFOA))) // tek 08jan98 this should be the ANSI version.
	{
		return E_INVALIDARG;
	}

   hRes = (((PCMode) m_pObjA)->m_pModeITTSCentralW)->ModeGet(&ModeInfoW);

   if (hRes == NOERROR)
	  {
	  pModeInfo->gEngineID = ModeInfoW.gEngineID;

	  WideCharToMultiByte(CP_ACP, 0, ModeInfoW.szMfgName, -1,
						  pModeInfo->szMfgName, TTSI_NAMELEN, NULL, NULL);

	  WideCharToMultiByte(CP_ACP, 0, ModeInfoW.szProductName, -1,
						  pModeInfo->szProductName, TTSI_NAMELEN, NULL, NULL);

	  pModeInfo->gModeID = ModeInfoW.gModeID;

	  WideCharToMultiByte(CP_ACP, 0, ModeInfoW.szModeName, -1,
						  pModeInfo->szModeName, TTSI_NAMELEN, NULL, NULL);

	  pModeInfo->language.LanguageID = ModeInfoW.language.LanguageID;

	  WideCharToMultiByte(CP_ACP, 0, ModeInfoW.language.szDialect, -1,
						  pModeInfo->language.szDialect, LANG_LEN, NULL, NULL);

	  WideCharToMultiByte(CP_ACP, 0, ModeInfoW.szSpeaker, -1,
						  pModeInfo->szSpeaker, TTSI_NAMELEN, NULL, NULL);

	  WideCharToMultiByte(CP_ACP, 0, ModeInfoW.szStyle, -1,
						  pModeInfo->szStyle, TTSI_NAMELEN, NULL, NULL);

	  pModeInfo->wGender          = ModeInfoW.wGender;
	  pModeInfo->wAge             = ModeInfoW.wAge;
	  pModeInfo->dwFeatures       = ModeInfoW.dwFeatures;
	  pModeInfo->dwInterfaces     = ModeInfoW.dwInterfaces;
	  pModeInfo->dwEngineFeatures = ModeInfoW.dwEngineFeatures;
	  }

   return hRes;
}


STDMETHODIMP CModeITTSCentralW::ModeGet (PTTSMODEINFOW pModeInfo)
{

	// tek 24sep98 validate arguments
	if (IsBadWritePtr(pModeInfo, sizeof(TTSMODEINFOW)))
	{
		return E_INVALIDARG;
	}
   if (!pModeInfo) return ResultFromScode (TTSERR_INVALIDPARAM);

   memcpy(pModeInfo, &((PCMode)m_pObj)->m_TTSModeInfo, sizeof(TTSMODEINFOW));

   return NOERROR;
}


STDMETHODIMP CModeITTSCentralA::Phoneme(VOICECHARSET vc, DWORD dwFlags, SDATA dText,
										PSDATA pdPhoneme)
{
   return (((PCMode) m_pObjA)->m_pModeITTSCentralW)->Phoneme(vc, dwFlags, dText,
															 pdPhoneme);
}


STDMETHODIMP CModeITTSCentralW::Phoneme(VOICECHARSET vc, DWORD dwFlags, SDATA dText,
										PSDATA pdPhoneme)
{
   return ResultFromScode(TTSERR_NOTSUPPORTED);
}


STDMETHODIMP CModeITTSCentralA::PosnGet(PQWORD pqTime)
{

	// tek 24sep98 validate arguments
	if (IsBadWritePtr(pqTime, sizeof(QWORD)))
	{
		return E_INVALIDARG;
	}

	return (((PCMode) m_pObjA)->m_pModeITTSCentralW)->PosnGet(pqTime);
}


STDMETHODIMP CModeITTSCentralW::PosnGet(PQWORD pqTime)
{
   PCMode  pMode = (PCMode) m_pObj;
	// tek 24sep98 validate arguments
	if (IsBadWritePtr(pqTime, sizeof(QWORD)))
	{
		return E_INVALIDARG;
	}

   return pMode->m_pAudioIAudio->PosnGet (pqTime);
}

STDMETHODIMP CModeITTSCentralA::TextData(VOICECHARSET eCharacterSet, DWORD dwFlags,
										 SDATA dText, PVOID pNotifyInterface, IID iid)
{
	// tek 25sep98 restructured as a true ANSI function.

	PCMode  pMode = (PCMode) m_pObjA;

	char *pMem = (char *)dText.pData;
	
	// tek 13aug97 things we need for processing start/stop marks, tags, and 
	// wordpos in the incoming buffer.
	char		*pcDest = NULL;		// where we put the results, malloc/realloc
	DWORD	dwDestBufSize = 0;	// how big Dest currently is
	DWORD	dwDestCount = 0;	// where we are in Dest
	DWORD	dwSourceBufSize = 0;	// how much is in pMem
	DWORD	dwSourceCount = 0;	// where we are in pMem
	DWORD	dwWordPosition = 0;	// 
	char		szSubstString[SUBST_STRING_SIZE] = "";	// where the translated string goes
	int		iSubstSize = 0;		// how long the current subst string is
	// tek 03sep97 are we tagged?
	BOOL		bTaggedText = dwFlags&TTSDATAFLAG_TAGGED;             
	// tek 30sep98 check our args.
	if (IsBadReadPtr(dText.pData,4))
	{
		return E_INVALIDARG;
	}
	
	//   HRESULT  hRes;
	
#ifndef ACI_LICENSE	//tek 01mar97
	/* Here is Willowpond re-merge -- 19mar97 ncs */
	
	// #ifdef M_DEBUG
#ifdef WILLOWPOND
	// fail if not unlocked. 
#pragma message("WP lock code installed in TextData")
	if (!(pMode->bUnlocked))
	{
		OutputDebugString("TextData not unlocked.\n");
		return E_FAIL;
	}
	else
	{
		OutputDebugString("TextData OK.\n");
	}
#else
//	OutputDebugString("No WP lock.\n");
#endif // WILLOWPOND
	// #endif // M_DEBUG
#endif //ACI_LICENSE
	// allow only UNICODETEXT
	
	if (eCharacterSet != CHARSET_TEXT)
		return ResultFromScode(TTSERR_INVALIDCHAR);
	if (pNotifyInterface && !IsEqualIID(iid, IID_ITTSBufNotifySinkW))
		return ResultFromScode (TTSERR_INVALIDINTERFACE);
	// Store the notify sink away
	if (pNotifyInterface) // tek only do this if it exists..
	{
		if (IsEqualIID(iid, IID_ITTSBufNotifySinkA))
			if (pMode->SetBufNotifySink((PITTSBUFNOTIFYSINKA) pNotifyInterface, 
														  pMode->m_dwSequenceNumber+1))
														  return ResultFromScode(E_OUTOFMEMORY);
	}
	// tek 13aug97 	keep track of buffers by sequence number
	// (do this here so that we don't have a dangling sequence number if the
	// above SetBufNotifySink failed, though we're in deep trouble if it did
	// anyway..)
	EnterCriticalSection(&pMode->m_csSequenceNumber);
	pMode->m_dwSequenceNumber++;
#ifdef API_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CModeITTSCentralA::TextData seq=%ld at %ld\n",
			pMode->m_dwSequenceNumber,timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //API_DEBUG
	pMode->m_bTextDataDoneFlag = FALSE;        //MVP : 03/22/96 About to start TextData
	LeaveCriticalSection(&pMode->m_csSequenceNumber);
	
	
	
	// MVP: Added :When you start with a pause state,and you press TextData(Play),It
	// should reflect as data is present.
	if (!pMode->m_fClaimed && pMode->m_fPaused) 
	{
		pMode->m_fDataPending = TRUE;
	}
	
	
	// build a new buffer that is large enough to hold the text and the 
	// start/stop messages
	// at this point, we have a null-terminated string. Its not the same as the
	// dwSize. Ugh.
	dwSourceBufSize = strlen( pMem )+1;
	dwDestBufSize = dwSourceBufSize+TEXT_DATA_REALLOC_BLOCK;
	// get the first buffer..
	pcDest = (char *)malloc(dwDestBufSize);
	if (!pcDest)
		return ResultFromScode(E_OUTOFMEMORY);
	
	dwDestCount=0;	// we're at the beginning..
	dwDestCount += sprintf(pcDest,"[:i start %d %d]",
		(unsigned int)(pMode->m_dwSequenceNumber>>16), 
		(unsigned int)(pMode->m_dwSequenceNumber&0xFFFF));
	
	// start copying the input to the output.. 
	for (dwSourceCount=0;dwSourceCount<dwSourceBufSize;dwSourceCount++)
	{
		if (dwDestBufSize < (dwDestCount+SUBST_STRING_SIZE))
		{
			// get a bigger block of memory..
			void *pvTemp=NULL;
			pvTemp = realloc(pcDest,dwDestBufSize+TEXT_DATA_REALLOC_BLOCK);
			if (pvTemp)
			{
				// successfully stretched the block..
				pcDest = (char *)pvTemp;
				dwDestBufSize += TEXT_DATA_REALLOC_BLOCK;
			}
			else
			{
				// oops, realloc failed?
				// free the old block..
				free(pcDest);
				return ResultFromScode(E_OUTOFMEMORY);
			}
		}// if not enough space..
		// decide if we need a wordposition mark..
		if (   (dwSourceCount==0)
			||(isspace(pMem[dwSourceCount-1]))
			)
		{
			int	iI=0;
			// place a word position mark.. 
			iSubstSize = sprintf(szSubstString,"[:i word %d %d]",
				(unsigned int)(dwSourceCount>>16), 
				(unsigned int)(dwSourceCount&0xFFFF));
			for (iI=0;iI<iSubstSize;iI++)
				pcDest[dwDestCount++]=szSubstString[iI];
		}
		// decide whether we need to process a tag
		if (  (!bTaggedText)
			||(pMem[dwSourceCount] != '\\')
			)
		{
			// nothing interesting..		    
			pcDest[dwDestCount++] = pMem[dwSourceCount];
		}
		else
		{
			// this may stick something into the output buffer, and
			// it will chew off some of the input buffer, so we have to 
			// pass in all the pointers..
			ProcessTaggedText(pMode,	// pointer to this object to be able to call dapi functions
				pcDest,		// dest
				&dwDestCount,	// dest loc
				pMem,			// src
				&dwSourceCount	// src loc
				);
		}
							 
		
	} // for dwSourceCount
	// add the stop message..
	dwDestCount--; // back up to before the null..
	{
		int	iI=0;
		// place a word position mark.. 
		iSubstSize = sprintf(szSubstString,"[:sync][:i stop %d %d]",
			(unsigned int)(pMode->m_dwSequenceNumber>>16), 
			(unsigned int)(pMode->m_dwSequenceNumber&0xFFFF));
		if ((strlen(pcDest)+strlen(szSubstString))>sizeof(pcDest))
		{
			void *pvTemp=NULL;
			pvTemp = realloc(pcDest,dwDestBufSize+TEXT_DATA_REALLOC_BLOCK);
			if (pvTemp)
			{
				// successfully stretched the block..
				pcDest = (char *)pvTemp;
				dwDestBufSize += TEXT_DATA_REALLOC_BLOCK;
			}
			else
			{
				// oops, realloc failed?
				// free the old block..
				free(pcDest);
				return ResultFromScode(E_OUTOFMEMORY);
			}
		}
		for (iI=0;iI<=iSubstSize;iI++) // copy the null too..
			pcDest[dwDestCount++]=szSubstString[iI];
	   }

	// MGS fix audio notifications
	if (pMode->m_fStarted==FALSE)
	{
		QWORD   qwTime;
		
		// tek 04aug97 this needs to be PosnGet not TotalGet, I think..
		pMode->m_pAudioIAudio->PosnGet (&qwTime);
		
		SendMessage (pMode->hWndMain, WM_NSAUDIOSTART,
			(DWORD) qwTime, (DWORD) (qwTime >> 32));

		pMode->m_fSentStart=TRUE;

	}		

	
#ifdef M_DEBUG
	{
		OutputDebugString("A::TextData speaking: ");
		OutputDebugString(pcDest);
		OutputDebugString("\n");
	}
#endif //M_DEBUG
	TextToSpeechSpeak( pMode->m_pDECtalk, pcDest, TTS_FORCE ); // tek 15aug97 should not do a force here.
	// send the TextDataStarted from here..
	// we actually want to send TextDataStarted now, even though the previous
	// TextDataDone hasn't happened yet. We send it via a postmessage to the
	// wndproc, because we do't want to knot up the caller.
	
#ifdef SENT_IT_LATER
	{
		PITTSBUFNOTIFYSINK pbnsNotifySink=pMode->GetBufNotifySink(pMode->m_dwSequenceNumber);
		PSINK_DATA psdSinkData=NULL;
		QWORD qwTime=0;
		
		if (pbnsNotifySink)
		{
			psdSinkData = (PSINK_DATA)malloc(sizeof(SINK_DATA));
			if (!psdSinkData)  // uh oh.. bail out..
				return ResultFromScode(E_OUTOFMEMORY);
			
			pbnsNotifySink->AddRef();
			// pack up the sink pointer and the time into a struct that 
			// we can pass as a message..
			// (SinkData can be used for both NotifySink and BufNotifySink, so 
			// the sink is actually a pvoid..)
			psdSinkData->pvNotifySink = (PVOID)(pbnsNotifySink);
			pMode->m_pAudioIAudio->PosnGet (&qwTime);
			psdSinkData->qwTime = qwTime;
			// there is no extra data in this case..
			psdSinkData->dwData1 = 0;
			psdSinkData->dwData2 = 0;
			// now, send the message off to be processed..
			PostMessage (pMode->hWndMain, WM_NSTEXTDATASTARTED,
				(DWORD) qwTime, (DWORD) (psdSinkData));
		}
	}		
#endif
		// now, free that temp buffer too.. 
		free(pcDest);
		return 0;
	
	
}

STDMETHODIMP CModeITTSCentralW::TextData(VOICECHARSET eCharacterSet, DWORD dwFlags,
										 SDATA dText, PVOID pNotifyInterface, IID iid)
{
	PCMode  pMode = (PCMode) m_pObj;

	
	// tek 13aug97 things we need for processing start/stop marks, tags, and 
	// wordpos in the incoming buffer.
	char 	*pcDest = NULL; 	// where we put the results, malloc/realloc
	DWORD	dwDestBufSize = 0;	// how big Dest currently is
	DWORD	dwDestCount = 0;	// where we are in Dest
	DWORD	dwSourceBufSize = 0;	// how much is in pMem
	DWORD	dwSourceCount = 0;	// where we are in pMem
	DWORD	dwWordPosition = 0; // 
	char 	szSubstString[SUBST_STRING_SIZE] = "";	// where the translated string goes
	int		iSubstSize = 0; 	// how long the current subst string is
	// tek 03sep97 are we tagged?
	BOOL 	bTaggedText = dwFlags&TTSDATAFLAG_TAGGED;
	BOOL	bIPAPhonetic = FALSE;
	
	// set this bit if we're supporting IPA
#ifdef ENGLISH_US
	bIPAPhonetic = (eCharacterSet == CHARSET_IPAPHONETIC); // tek 19oct98
#endif //ENGLUSH_US

	// tek 30sep98 check our args.
	if (IsBadReadPtr(dText.pData,4))
	{
		return E_INVALIDARG;
	}

	//	 HRESULT  hRes;
	
#ifndef ACI_LICENSE //tek 01mar97
	/* Here is Willowpond re-merge -- 19mar97 ncs */
	
	// #ifdef M_DEBUG
#ifdef WILLOWPOND
	// fail if not unlocked. 
#pragma message("WP lock code installed in TextData")
	if (!(pMode->bUnlocked))
	{
		OutputDebugString("TextData not unlocked.\n");
		return E_FAIL;
	}
	else
	{
		OutputDebugString("TextData OK.\n");
	}
#else
//	OutputDebugString("No WP lock.\n");
#endif // WILLOWPOND
	// #endif // M_DEBUG
#endif //ACI_LICENSE
	// allow only UNICODETEXT
	// TEK 19OCT98 now also allow unicode ipa phonetic, for what it's worth..
	
	if (!(    (eCharacterSet == CHARSET_TEXT)
		  ||( (eCharacterSet == CHARSET_IPAPHONETIC) && (bIPAPhonetic) )
		 )
		)
		return ResultFromScode(TTSERR_INVALIDCHAR);

	if (pNotifyInterface && !IsEqualIID(iid, IID_ITTSBufNotifySinkW))
		return ResultFromScode (TTSERR_INVALIDINTERFACE);
	// BUGBUG: support ANSI version eventually
	
	// If necessary convert from UNICODE to ASCII
	
	WCHAR *pMem = (WCHAR *)(dText.pData);
	
	// Store the notify sink away
	if (pNotifyInterface) // tek only do this if it exists..
	{
		if (IsEqualIID(iid, IID_ITTSBufNotifySinkW))
			if (pMode->SetBufNotifySink((PITTSBUFNOTIFYSINKW) pNotifyInterface, 
														  pMode->m_dwSequenceNumber+1))
														  return ResultFromScode(E_OUTOFMEMORY);
	}
	// tek 13aug97	keep track of buffers by sequence number
	// (do this here so that we don't have a dangling sequence number if the
	// above SetBufNotifySink failed, though we're in deep trouble if it did
	// anyway..)
	EnterCriticalSection(&pMode->m_csSequenceNumber);
	pMode->m_dwSequenceNumber++;
#ifdef API_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CModeITTSCentralW::TextData seq=%ld at %ld\n",
			pMode->m_dwSequenceNumber,timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //API_DEBUG

	pMode->m_bTextDataDoneFlag = FALSE; 	   //MVP : 03/22/96 About to start TextData
	LeaveCriticalSection(&pMode->m_csSequenceNumber);
	
	
	
	// MVP: Added :When you start with a pause state,and you press TextData(Play),It
	// should reflect as data is present.
	if (!pMode->m_fClaimed && pMode->m_fPaused) 
	{
		pMode->m_fDataPending = TRUE;
	}
	
	
	// build a new buffer that is large enough to hold the text and the 
	// start/stop messages
	// at this point, we have a null-terminated string. Its not the same as the
	// dwSize. Ugh.
	dwSourceBufSize = wcslen( pMem )+1;
	dwDestBufSize = dwSourceBufSize+TEXT_DATA_REALLOC_BLOCK;
	// get the first buffer..
	pcDest = (char *)malloc(dwDestBufSize);
	if (!pcDest)
		return ResultFromScode(E_OUTOFMEMORY);
	
	// tek 19oct98 we may have to enable arpa mode, if we're running 
	// IPA Phonetic..

	if (bIPAPhonetic)
	{		
		dwDestCount=0;	// we're at the beginning..
		dwDestCount += sprintf(pcDest,"[:i start %d %d]%s",
			(unsigned int)(pMode->m_dwSequenceNumber>>16), 
			(unsigned int)(pMode->m_dwSequenceNumber&0xFFFF),
			szArpaOn);
	}
	else
	{
		
		
		dwDestCount=0;	// we're at the beginning..
		dwDestCount += sprintf(pcDest,"[:i start %d %d]%s",
			(unsigned int)(pMode->m_dwSequenceNumber>>16), 
			(unsigned int)(pMode->m_dwSequenceNumber&0xFFFF),
			"");
	}

	// start copying the input to the output.. 
	for (dwSourceCount=0;dwSourceCount<dwSourceBufSize;dwSourceCount++)
	{
		if (dwDestBufSize < (dwDestCount+SUBST_STRING_SIZE))
		{
			// get a bigger block of memory..
			void *pvTemp=NULL;
			pvTemp = realloc(pcDest,dwDestBufSize+TEXT_DATA_REALLOC_BLOCK);
			if (pvTemp)
			{
				// successfully stretched the block..
				pcDest = (char *)pvTemp;
				dwDestBufSize += TEXT_DATA_REALLOC_BLOCK;
			}
			else
			{
				// oops, realloc failed?
				// free the old block..
				free(pcDest);
				return ResultFromScode(E_OUTOFMEMORY);
			}
		}// if not enough space..
		// decide if we need a wordposition mark..
		if (   (dwSourceCount==0)
			||(isspace(pMem[dwSourceCount-1]))
			)
		{
			int	iI=0;
			DWORD dwByteCount = dwSourceCount*sizeof(WCHAR);
			// place a word position mark.. 
			iSubstSize = sprintf(szSubstString,"[:i word %d %d]",
				(unsigned int)(dwByteCount>>16), 
				(unsigned int)(dwByteCount&0xFFFF));
			for (iI=0;iI<iSubstSize;iI++)
				pcDest[dwDestCount++]=szSubstString[iI];
		}
		// decide whether we need to process a tag
		if (  (!bTaggedText)
			||(pMem[dwSourceCount] != '\\')
			)
		{
			// nothing interesting..
			char szConvBuffer[64];	// 64 just "some number"
									// we'd love to use MB_CUR_MAX, but that's not
									// REALLY a constant 8-(
			int iCharsConverted;
#ifdef ENGLISH_US // fcns only exist for us english
			if (bIPAPhonetic) // tek 19oct98 IPA support..
			{
				// have to send in dwSourceCount, because it might need to chew a modifier
				iCharsConverted = IPAToArpa(szConvBuffer, pMem, &dwSourceCount, NULL);
				// may have chewed 1 or 2; always have to back it off because
				// of the for loop.
				//dwSourceCount--;
			}
			else
#endif //ENGLISH_US
			{
				iCharsConverted = wctomb(szConvBuffer, pMem[dwSourceCount]);
			}
			if (iCharsConverted>0)
			{
				// can't strcat, because we don't have null-terminated
				// strings here..
				int iI1;
				// // if this is IPA, we have to consider EVERYTHING arpa..
				if (bIPAPhonetic)
					pcDest[dwDestCount++] = '[';
				for (iI1=0;iI1<iCharsConverted;iI1++)
				{
					pcDest[dwDestCount++] = szConvBuffer[iI1];
				}
				// seal off the arpa container
				if (bIPAPhonetic)
					pcDest[dwDestCount++] = ']';
			}
		}
		else
		{
			// this may stick something into the output buffer, and
			// it will chew off some of the input buffer, so we have to 
			// pass in all the pointers..
			DWORD dwOldDestCount = dwDestCount; // so we can tell if we
												// added text
			// tek 25sep98 for unicode, we use the "W" version of this, which
			// takes UNICODE input, does whatever magic it needs to do, and
			// finally returns the processed tag as ANSI.
			ProcessTaggedTextW(pMode, // pointer to this object to be able to call dapi functions
				pcDest,		// dest
				&dwDestCount,	// dest loc
				pMem,			// src
				&dwSourceCount, // src loc
				bIPAPhonetic
				);
			if (bIPAPhonetic && (dwOldDestCount != dwDestCount))
			{
				int iI;
				for (iI=0;szArpaOn[iI]!='\0';iI++)
					pcDest[dwDestCount++]=szArpaOn[iI];
			}
		}
							 
		
	} // for dwSourceCount
	// add the stop message..
	dwDestCount--; // back up to before the null.. tek uncomment this 07apr99 bats 884
	   {
		   int	iI=0;
		   // place a word position mark.. 
		   iSubstSize = sprintf(szSubstString,"[:sync][:i stop %d %d]",
			   (unsigned int)(pMode->m_dwSequenceNumber>>16), 
			   (unsigned int)(pMode->m_dwSequenceNumber&0xFFFF));
		   if ((strlen(pcDest)+strlen(szSubstString))>sizeof(pcDest))
		   {
			   void *pvTemp=NULL;
			   pvTemp = realloc(pcDest,dwDestBufSize+TEXT_DATA_REALLOC_BLOCK);
			   if (pvTemp)
			   {
				   // successfully stretched the block..
				   pcDest = (char *)pvTemp;
				   dwDestBufSize += TEXT_DATA_REALLOC_BLOCK;
			   }
			   else
			   {
				   // oops, realloc failed?
				   // free the old block..
				   free(pcDest);
				   return ResultFromScode(E_OUTOFMEMORY);
			   }
		   }
		   for (iI=0;iI<=iSubstSize;iI++) // copy the null too..
			   pcDest[dwDestCount++]=szSubstString[iI];
	   }
#ifdef M_DEBUG
	{
		OutputDebugString("W::TextData speaking: ");
		OutputDebugString(pcDest);
		OutputDebugString("\n");
	}
#endif //M_DEBUG
	// MGS fix audio notifications
	if (pMode->m_fStarted==FALSE)
	{
		QWORD   qwTime;
		
		// tek 04aug97 this needs to be PosnGet not TotalGet, I think..
		pMode->m_pAudioIAudio->PosnGet (&qwTime);
		
		SendMessage (pMode->hWndMain, WM_NSAUDIOSTART,
			(DWORD) qwTime, (DWORD) (qwTime >> 32));

		pMode->m_fSentStart=TRUE;

	}		

	   TextToSpeechSpeak( pMode->m_pDECtalk, pcDest, TTS_FORCE ); // tek 15aug97 should not do a force here.
	   // send the TextDataStarted from here..
	   // we actually want to send TextDataStarted now, even though the previous
	   // TextDataDone hasn't happened yet. We send it via a postmessage to the
	   // wndproc, because we do't want to knot up the caller.
	   
#ifdef SEND_IT_LATER
	   {
		   PITTSBUFNOTIFYSINK pbnsNotifySink=pMode->GetBufNotifySink(pMode->m_dwSequenceNumber);
		   PSINK_DATA psdSinkData=NULL;
		   QWORD qwTime=0;
		   
		   if (pbnsNotifySink)
		   {
			   psdSinkData = (PSINK_DATA)malloc(sizeof(SINK_DATA));
			   if (!psdSinkData)  // uh oh.. bail out..
				   return ResultFromScode(E_OUTOFMEMORY);
			   
			   pbnsNotifySink->AddRef();
			   // pack up the sink pointer and the time into a struct that 
			   // we can pass as a message..
			   // (SinkData can be used for both NotifySink and BufNotifySink, so 
			   // the sink is actually a pvoid..)
			   psdSinkData->pvNotifySink = (PVOID)(pbnsNotifySink);
			   ((PCMode)m_pObj)->m_pAudioIAudio->PosnGet (&qwTime);
			   psdSinkData->qwTime = qwTime;
			   // there is no extra data in this case..
			   psdSinkData->dwData1 = 0;
			   psdSinkData->dwData2 = 0;
			   // now, send the message off to be processed..
			   PostMessage (((PCMode)m_pObj)->hWndMain, WM_NSTEXTDATASTARTED,
				   (DWORD) qwTime, (DWORD) (psdSinkData));
		   }
	   }
#endif
		   // now, free that temp buffer too.. 
		   free(pcDest);
		   return 0;
	   
}


STDMETHODIMP CModeITTSCentralA::ToFileTime(PQWORD pqTime, FILETIME * ft)
{
   return (((PCMode) m_pObjA)->m_pModeITTSCentralW)->ToFileTime(pqTime, ft);
}


STDMETHODIMP CModeITTSCentralW::ToFileTime(PQWORD pqTime, FILETIME * ft)
{
   PCMode  pMode = (PCMode) m_pObj;

   return pMode->m_pAudioIAudio->ToFileTime (pqTime, ft);
}


STDMETHODIMP CModeITTSCentralA::AudioPause(void)
{
   return (((PCMode) m_pObjA)->m_pModeITTSCentralW)->AudioPause();
}


STDMETHODIMP CModeITTSCentralW::AudioPause(void)
{
	PCMode  pMode = (PCMode) m_pObj;
	HRESULT  hRes = NULL;
#ifdef M_DEBUG //tek 08aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"::AudioPause at %lu\n",
			timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG

	if (pMode->m_fPaused) 
		return ResultFromScode(TTSERR_ALREADYPAUSED);
	else if (!pMode->m_fPaused && pMode->m_fClaimed) 
	{

		pMode->m_pAudioIAudio->Stop();
		//pMode->m_pAudioIAudio->UnClaim(); //tek 21aug97 removed
		//pMode->m_fClaimed = FALSE;
		pMode->m_fPaused = TRUE;
	}
	else if (!pMode->m_fPaused && !pMode->m_fClaimed) 
	{

		pMode->m_pAudioIAudio->Stop();
		pMode->m_fPaused = TRUE;
	};
	
//  pMode->m_fSpeaking = FALSE;

	//hRes = pMode->SpeakIfNecessary();
	pMode->DECPauseAudio();
	
	return hRes;

  // WIH Currently not using an audio destination object
  // return pMode->SpeakIfNecessary();

  //return (STDMETHODIMP)TextToSpeechPause( pMode->m_pDECtalk );
}

STDMETHODIMP CModeITTSCentralA::AudioReset(void)
{
   return (((PCMode) m_pObjA)->m_pModeITTSCentralW)->AudioReset();
}


STDMETHODIMP CModeITTSCentralW::AudioReset(void)
{
   PCMode   pMode = (PCMode) m_pObj;
   HRESULT hRes =0;      // MVP : return value
   // WIH Currently not using an audio destination object

   // tek 11feb98: according to the SAPI docs, ::AudioReset must do an 
   // implied AudioResume.

   QWORD    qwTime;
   PITTSBUFNOTIFYSINK	pbnsNotifySink=NULL;
#ifdef M_DEBUG
	{
		char szTemp[256]="";
		sprintf(szTemp,"CModeITTSCentralW::AudioReset at %lu\n",
			timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG

// tek 07aug97 set the bInAudioReset flag to tell the world that 
// we're in a reset
	pMode->m_pDECtalk->pAudioHandle->bInAudioReset = TRUE; 
	
   // tek 14aug97 this should happen early..
   // WIH Currently not using an audio destination object
   // MVP : On audio reset ,inorder to not to change the mode,pass 
   // second arg for TextToSpeechReset a FALSE. value "TRUE" changes the
   // mode to startup mode.i.e PAUL 
   TextToSpeechReset( pMode->m_pDECtalk, FALSE );

// MVP: the below if.. else ... statements have Flush() call,But you 
//   can not takeout and make it common outside of the loop.This is 
//  because order of execution of Stop,Flush,UnClaim etc.. is important.
// The order the Reset works is: Stop,Flush,UnClaim.
// It DOES NOT WORK!!! when you call Stop,UnClaim,Flush

// Stop the audio
   if (!pMode->m_fClaimed && !pMode->m_fPaused) {
	  pMode->m_pAudioIAudio->Stop();
	  pMode->m_pAudioIAudio->Flush();
	  }
   else if (pMode->m_fClaimed && !pMode->m_fPaused) {
	  pMode->m_pAudioIAudio->Stop();
	  pMode->m_pAudioIAudio->Flush();
	  pMode->m_pAudioIAudio->UnClaim();
#ifdef M_DEBUG //tek 08aug97
			{
				char szTemp[256]="";
				sprintf(szTemp,"::AudioReset ->Unclaim at %lu\n",timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //M_DEBUG

#ifndef SAPI_GROUP_H_TIMING
	  pMode->m_fClaimed = pMode->m_fPaused = pMode->m_fDataPending = FALSE;
#else
	  pMode->m_fClaimed = pMode->m_fPaused = pMode->m_fDataPending = pMode->m_fStarted = FALSE;
#endif // SAPI_GROUP_H_TIMING
	  }
   else if (!pMode->m_fClaimed && pMode->m_fPaused) {
	  pMode->m_pAudioIAudio->Flush();
#ifndef SAPI_GROUP_H_TIMING
	  pMode->m_fClaimed = pMode->m_fPaused = pMode->m_fDataPending = FALSE;
#else
	  pMode->m_fClaimed = pMode->m_fPaused = pMode->m_fDataPending = pMode->m_fStarted = FALSE;
#endif // SAPI_GROUP_H_TIMING
	  }
   else {
	   // tek 11feb98 why not? the state is claimed, paused; this should be the 
	   // same as claimed not paused, except the stop has already been done.
	  pMode->m_pAudioIAudio->Flush();
	  pMode->m_pAudioIAudio->UnClaim();

#ifdef M_DEBUG //tek 08aug97
			{
				char szTemp[256]="";
				sprintf(szTemp,"::AudioReset ->Unclaim at %lu\n",timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //M_DEBUG
#ifndef SAPI_GROUP_H_TIMING
	  pMode->m_fClaimed = pMode->m_fPaused = pMode->m_fDataPending = FALSE;
#else
	  pMode->m_fClaimed = pMode->m_fPaused = pMode->m_fDataPending = pMode->m_fStarted = FALSE;
#endif // SAPI_GROUP_H_TIMING
	  };

// for (i = 0; i < pList->GetNumElems(); i++)
//    pList->SetElem(i, "", 1);
// MVP: 03/11/96 Uncommented below code for Bookmarks and for other TTSBuf Notifications 
  // while (pMode->m_pTextList->GetNumElems())
   {
  	  DWORD dwI=0;
#ifdef M_DEBUG
	  {
		  char szTemp[256];
		  sprintf(szTemp,"AudioReset sending WM_NSTEXTDATAABORTED at %lu\n",
			  timeGetTime());
		  OutputDebugString(szTemp);
	  }
#endif //M_DEBUG
  	  pMode->m_pAudioIAudio->PosnGet(&qwTime);

		// Notify the app that the buffer is about to be released forcefully
	  // tek 10sep98 bats761: serialize this.
	    while ((pbnsNotifySink = pMode->GetFirstBufNotifySink(&dwI)) || dwI)
		{
			PSINK_DATA psdSinkData = (PSINK_DATA)malloc(sizeof(SINK_DATA));
			if (!psdSinkData)  // uh oh.. bail out..
				return ResultFromScode(E_OUTOFMEMORY);
			
			pbnsNotifySink->AddRef(); // make sure it doesn't go away..
			// pack up the sink pointer and the time into a struct that 
			// we can pass as a message..
			// (SinkData can be used for both NotifySink and BufNotifySink, so 
			// the sink is actually a pvoid..)
			psdSinkData->pvNotifySink = (PVOID)(pbnsNotifySink);
			psdSinkData->qwTime = qwTime;
			psdSinkData->dwData1 = dwI;
			psdSinkData->dwData2 = 0;
			// now, send the message off to be processed..
			PostMessage (((PCMode)m_pObj)->hWndMain, WM_NSTEXTDATAABORTED,
				(DWORD) qwTime, (DWORD) (psdSinkData));
			// take it off the notify list, because this should be the
			// last notification. The AddRef above will keep the 
			// sink around long enough to deliver this notification.
			pMode->FreeBufNotifySink(psdSinkData->dwData1);

		}


	//	  pMode->m_pTextList->RemoveElem(0);
   }

   // WIH Currently not using an audio destination object
   // MVP : On audio reset ,inorder to not to change the mode,pass 
   // second arg for TextToSpeechReset a FALSE. value "TRUE" changes the
   // mode to startup mode.i.e PAUL 
   //TextToSpeechReset( pMode->m_pDECtalk, FALSE );

   pMode->DECAudioReset();
   // tek 11feb98 resume audio, if we're paused..
   if (pMode->m_fPaused)
   {
#ifdef M_DEBUG
	   {
		   char szTemp[256];
		   sprintf(szTemp,"CModeITTSCentralW::AudioReset implied ::AudioResume at %ld\n",
			   timeGetTime());
		   OutputDebugString(szTemp);
	   }
#endif //M_DEBUG
	   AudioResume();
   }
   // tek 07aug97 clear the bInAudioReset flag to tell the world that 
   // we're done..
   pMode->m_pDECtalk->pAudioHandle->bInAudioReset = FALSE;

   return hRes;
}


STDMETHODIMP CModeITTSCentralA::AudioResume(void)
{
   return (((PCMode) m_pObjA)->m_pModeITTSCentralW)->AudioResume();
}


STDMETHODIMP CModeITTSCentralW::AudioResume(void)
{
//#define TTSERR_NOTPAUSED  125 
	PCMode  pMode = (PCMode) m_pObj;
	HRESULT  hRes;
	// tek 21aug97 poked around in here to try to fix pause/resume
	if (!pMode->m_fPaused)
		return ResultFromScode(TTSERR_NOTPAUSED);
	else
	{
		if (!pMode->m_fClaimed) 
		{
			hRes = pMode->m_pAudioIAudio->Claim();
			if (hRes)
				return hRes;
		}
		pMode->m_fClaimed = TRUE;
		pMode->m_fPaused = FALSE;
 #ifdef M_DEBUG //tek 08aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"::AudioResume ->Claim at %lu\n",timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG

		hRes = pMode->m_pAudioIAudio->Start();
		if (hRes)
			return hRes;
 #ifdef M_DEBUG //tek 08aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"::AudioResume ->Start at %lu\n",timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG

		// tek 11feb98 we need to do a DECResumeAudio even if there is no data 
		// pending; else we end up stuck because bPaused is set.
		//  DECResumeAudio resets the Pause flag to FALSE.And also
		//  sends the message ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE,when the
		//  Audio device is INACTIVE. 
		pMode->DECResumeAudio();

		// If there's not data then just call unclaim
		if (!pMode->m_fDataPending) 
		{
 #ifdef M_DEBUG //tek 08aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"::AudioResume ->Unclaim at %lu\n",timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG


			pMode->m_fClaimed = FALSE;
			return pMode->m_pAudioIAudio->UnClaim();
		};
	}
	//else {
	//	// this shouldn't happen
	//	return ResultFromScode (E_FAIL);
	//};

//  pMode->m_fSpeaking = TRUE;
//  hRes = pMode->SpeakIfNecessary();
//  MVP: Still data is present(because pMode->m_fDataPending is TRUE,checked above...)
//  DECResumeAudio resets the Pause flag to FALSE.And also
//  sends the message ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE,when the
//  Audio device is INACTIVE. 
	pMode->DECResumeAudio();
	return hRes;

  // WIH Currently not using an audio destination object
  // return pMode->SpeakIfNecessary();

  //return (STDMETHODIMP)TextToSpeechResume( pMode->m_pDECtalk );
}


STDMETHODIMP CModeITTSCentralA::Register(PVOID pInterface, IID iid, DWORD *pdwKey)
{
	// tek 24sep98 validate the pointers
	if (   (IsBadWritePtr (pInterface, 4))	// we don't really know the size..
		|| (IsBadWritePtr (pdwKey, sizeof(DWORD))) )
	{
		return E_INVALIDARG;
	}
   return (((PCMode) m_pObjA)->m_pModeITTSCentralW)->Register(pInterface, iid,
															  pdwKey);
}


STDMETHODIMP CModeITTSCentralW::Register(PVOID pInterface, IID iid, DWORD *pdwKey)
{
PCMode  pMode = (PCMode) m_pObj;
	// tek 24sep98 validate the pointers
	if (   (IsBadWritePtr (pInterface, 4))	// we don't really know the size..
		|| (IsBadWritePtr (pdwKey, sizeof(DWORD)) ) )
	{
		return E_INVALIDARG;
	}
// MVP : 03/13/96 :Accept both Unicode and Ansi versions.
	// tek 16sep98 actually implement the above comment..
	if (  (IsEqualIID (iid, IID_ITTSNotifySinkW))
		||(IsEqualIID (iid, IID_ITTSNotifySinkA)) )
	{
		
		*pdwKey = NotificationRegister (pMode->m_pNotifyList, pInterface, iid);
		if (!(*pdwKey))
			return ResultFromScode (E_OUTOFMEMORY);
		else
			return NOERROR;
	}
	else
	{	
		return ResultFromScode (TTSERR_INVALIDINTERFACE);
	}

}


STDMETHODIMP CModeITTSCentralA::UnRegister(DWORD dwKey)
{
   return (((PCMode) m_pObjA)->m_pModeITTSCentralW)->UnRegister(dwKey);
}


STDMETHODIMP CModeITTSCentralW::UnRegister(DWORD dwKey)
{
PCMode  pMode = (PCMode) m_pObj;
/* tek 24feb97 BATS 90 fix: correct the sense of the if() */
if (!NotificationUnRegister (pMode->m_pNotifyList, dwKey))
	return ResultFromScode (TTSERR_INVALIDKEY);
else
	return NOERROR;
}


/************************************************************************
CModeITTSAttributesW - ITTSCentral interface
*/

CModeITTSAttributesA::CModeITTSAttributesA (LPVOID pObj, LPUNKNOWN punkOuter)
{

   m_pObjA = (PCMode)pObj;
   m_cRef = 0;
   (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->FInit(pObj, punkOuter);
}


CModeITTSAttributesW::CModeITTSAttributesW (LPVOID pObj, LPUNKNOWN punkOuter)
{

   m_cRef      = 0;
   m_pObj      = pObj;
   m_punkOuter = punkOuter;
}


// This function is called from the ANSI interface constructor -

CModeITTSAttributesW::FInit(LPVOID pObj, LPUNKNOWN punkOuter)
{
   m_cRef      = 0;
   m_pObj      = pObj;
   m_punkOuter = punkOuter;

   return NOERROR;
}


CModeITTSAttributesA::~CModeITTSAttributesA (void)
{
	// MVP:07/19/96 :Do nothing in the Destructor as it doesn't
	// have any members which are allocated.
	// The below line causes freeing up memory twice.It caused
	// the Memory error when debgging the debug version of
	// DTLKTTSE.DLL
	//  (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->~CModeITTSAttributesW();

}


CModeITTSAttributesW::~CModeITTSAttributesW (void)
{
	// tek 17sep98 verify that the ref count is indeed zero.
	_ASSERTE (m_cRef==0);
}


STDMETHODIMP CModeITTSAttributesA::QueryInterface(REFIID riid, LPVOID FAR *ppv)
{

	// tek 24sep98 validate parameter
	if (IsBadWritePtr(ppv, 4)) // don't really know the size
	{
		return E_INVALIDARG;
	}
  return (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->QueryInterface(riid, ppv);
}


STDMETHODIMP CModeITTSAttributesW::QueryInterface(REFIID riid, LPVOID FAR *ppv)
{
	// tek 24sep98 validate parameter
	if (IsBadWritePtr(ppv, 4)) // don't really know the size
	{
		return E_INVALIDARG;
	}

    return m_punkOuter->QueryInterface(riid,ppv);
}


STDMETHODIMP_ (ULONG) CModeITTSAttributesA::AddRef(void)
{
	m_cRef++;
   return (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->AddRef();
}


STDMETHODIMP_ (ULONG) CModeITTSAttributesW::AddRef(void)
{
   ++m_cRef;
   return m_punkOuter->AddRef();
}


STDMETHODIMP_ (ULONG) CModeITTSAttributesA::Release(void)
{
	ULONG ulRef;
	m_cRef--;
	ulRef = m_cRef;

    (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->Release();
//MGS try this way
	//if (ulRef==0)
//		delete this;

	return ulRef;
}


STDMETHODIMP_ (ULONG) CModeITTSAttributesW::Release(void)
{
	// tek 17sep98 made self-deleting
	ULONG ulResult;
    --m_cRef;

 	ulResult = m_cRef; // tek 22sep98 this is what we return..
	m_punkOuter->Release();
		// MGS try this way
//	if (0 == m_cRef)
//		delete this;
	return ulResult;
}


STDMETHODIMP CModeITTSAttributesA::PitchGet(WORD *pdwPitch)
{
	// tek 24sep98 validate arguments
	if (IsBadWritePtr(pdwPitch, sizeof(WORD)))
	{
		return E_INVALIDARG;
	}
   return (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->PitchGet(pdwPitch);
}


STDMETHODIMP CModeITTSAttributesW::PitchGet(WORD *pdwPitch)
{
	// tek 24sep98 validate arguments
	if (IsBadWritePtr(pdwPitch, sizeof(WORD)))
	{
		return E_INVALIDARG;
	}
#ifdef SAPI_GROUP_F_INTERFACES
	int temp;
	GetCurrentPitch(((PCMode)m_pObj)->m_pDECtalk,&temp);
	((PCMode)m_pObj)->m_wPitch= (short)temp;
#endif
	*pdwPitch = ((PCMode)m_pObj)->m_wPitch;
	return NOERROR;
}


STDMETHODIMP CModeITTSAttributesA::PitchSet(WORD dwPitch)
{
   return (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->PitchSet(dwPitch);
}


STDMETHODIMP CModeITTSAttributesW::PitchSet(WORD dwPitch)
{
#ifdef SAPI_GROUP_F_INTERFACES
	/* MGS BATS #626 fixed max_pitch and min_pitch */
#define DECTALK_MIN_PITCH (50)
#define DECTALK_MAX_PITCH (350)

	char temp[256];
	if (dwPitch == TTSATTR_MINPITCH)
		dwPitch = DECTALK_MIN_PITCH;
	if (dwPitch == TTSATTR_MAXPITCH)
		dwPitch = DECTALK_MAX_PITCH;

	if (  (dwPitch > DECTALK_MAX_PITCH)
		||(dwPitch < DECTALK_MIN_PITCH) )
	{
		return ResultFromScode(	TTSERR_VALUEOUTOFRANGE );
	}
#endif
	((PCMode)m_pObj)->m_wPitch = dwPitch;
#ifdef SAPI_GROUP_F_INTERFACES
	sprintf(temp,"[:dv ap %d]",dwPitch);
	TextToSpeechSpeak(((PCMode)m_pObj)->m_pDECtalk,temp,TTS_FORCE);
        TextToSpeechSync(((PCMode)m_pObj)->m_pDECtalk);
#endif
	PostMessage (((PCMode)m_pObj)->hWndMain, WM_NSATTRIBCHANGED, TTSNSAC_PITCH, 0);
	return NOERROR;
}


STDMETHODIMP CModeITTSAttributesA::RealTimeGet(DWORD *pdwReal)
{
	// tek 24sep98 validate arguments
	if (IsBadWritePtr(pdwReal, sizeof(DWORD)))
	{
		return E_INVALIDARG;
	}
   return (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->RealTimeGet(pdwReal);
}


STDMETHODIMP CModeITTSAttributesW::RealTimeGet(DWORD *pdwReal)
{
	// tek 24sep98 validate arguments
	if (IsBadWritePtr(pdwReal, sizeof(DWORD)))
	{
		return E_INVALIDARG;
	}
#ifdef SAPI_GROUP_F_INTERFACES
	/* MGS 02/04/1998 changed to return 1 all the time */
	*pdwReal = 1;
#else
	*pdwReal = ((PCMode)m_pObj)->m_dwRealTime;
#endif
	return NOERROR;
}


STDMETHODIMP CModeITTSAttributesA::RealTimeSet(DWORD dwReal)
{
   return (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->RealTimeSet(dwReal);
}


STDMETHODIMP CModeITTSAttributesW::RealTimeSet(DWORD dwReal)
{
#ifndef SAPI_GROUP_F_INTERFACES
	/* made it always return 1 */
	//((PCMode)m_pObj)->m_dwRealTime = dwReal;
#endif
	PostMessage (((PCMode)m_pObj)->hWndMain, WM_NSATTRIBCHANGED, TTSNSAC_REALTIME, 0);
   return NOERROR;
}


STDMETHODIMP CModeITTSAttributesA::SpeedGet(DWORD *pdwSpeed)
{
	// tek 24sep98 validate arguments
	if (IsBadWritePtr(pdwSpeed, sizeof(DWORD)))
	{
		return E_INVALIDARG;
	}
   return (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->SpeedGet(pdwSpeed);
}


STDMETHODIMP CModeITTSAttributesW::SpeedGet(DWORD *pdwSpeed)
{
   DWORD dwCurSpeed;
   PCMode pMode = (PCMode) m_pObj;

	// tek 24sep98 validate arguments
	if (IsBadWritePtr(pdwSpeed, sizeof(DWORD)))
	{
		return E_INVALIDARG;
	}
   TextToSpeechGetRate(pMode->m_pDECtalk,&dwCurSpeed);
   *pdwSpeed = pMode->m_dwSpeed = dwCurSpeed;
   return NOERROR;
}


STDMETHODIMP CModeITTSAttributesA::SpeedSet(DWORD dwSpeed)
{
   return (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->SpeedSet(dwSpeed);
}
#ifdef TYPING_MODE //tek 13nov97 really should be ACCESS32
#define DECTALK_MIN_RATE (50)
#else
#define DECTALK_MIN_RATE (75)
#endif
#define DECTALK_MAX_RATE (600)

STDMETHODIMP CModeITTSAttributesW::SpeedSet(DWORD dwSpeed)
{
	PCMode pMode = (PCMode) m_pObj;

	// tek 04sep96 handle rate limit requests..
	if (dwSpeed == TTSATTR_MINSPEED)
		dwSpeed = DECTALK_MIN_RATE;
	if (dwSpeed == TTSATTR_MAXSPEED)
		dwSpeed = DECTALK_MAX_RATE;

	if (  (dwSpeed > DECTALK_MAX_RATE)
		||(dwSpeed < DECTALK_MIN_RATE) )
	{
		return ResultFromScode(	TTSERR_VALUEOUTOFRANGE );
	}

	pMode->m_dwSpeed = dwSpeed;
	
	TextToSpeechSetRate(pMode->m_pDECtalk,dwSpeed);

	PostMessage (((PCMode)m_pObj)->hWndMain, WM_NSATTRIBCHANGED, TTSNSAC_SPEED, 0);

   return NOERROR;
}


STDMETHODIMP CModeITTSAttributesA::VolumeGet(DWORD *pdwVolume)
{
	// tek 24sep98 validate arguments
	if (IsBadWritePtr(pdwVolume, sizeof(DWORD)))
	{
		return E_INVALIDARG;
	}
    return (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->VolumeGet(pdwVolume);
}


STDMETHODIMP CModeITTSAttributesW::VolumeGet(DWORD *pdwVolume)
{
  // WIH Currently not using an audio destination object
	HRESULT hRes=0;
	// tek 24sep98 validate arguments
	if (IsBadWritePtr(pdwVolume, sizeof(DWORD)))
	{
		return E_INVALIDARG;
	}
	
	if ((hRes=((PCMode)m_pObj)->m_pAudioIAudio->LevelGet(pdwVolume)))
	{

	return ResultFromScode (TTSERR_NOTSUPPORTED);
	}

	return NOERROR;

}


STDMETHODIMP CModeITTSAttributesA::VolumeSet(DWORD dwVolume)
{
   return (((PCMode) m_pObjA)->m_pModeITTSAttributesW)->VolumeSet(dwVolume);
}


STDMETHODIMP CModeITTSAttributesW::VolumeSet(DWORD dwVolume)
{
   PostMessage (((PCMode)m_pObj)->hWndMain, WM_NSATTRIBCHANGED, TTSNSAC_VOLUME, 0);

  // WIH Currently not using an audio destination object


   if (((PCMode)m_pObj)->m_pAudioIAudio->LevelSet(dwVolume))

	  return ResultFromScode (TTSERR_NOTSUPPORTED);

   return NOERROR;

#ifdef PLAINDECTALK
   return (STDMETHODIMP)SetAudioVolume(((PCMode)m_pObj)->m_pDECtalk->pAudioHandle,
									   dwVolume );
#endif
return NOERROR;
}


/************************************************************************
CModeITTSDialogsW - ITTSDialogs interface
*/

CModeITTSDialogsA::CModeITTSDialogsA(LPVOID pObj, LPUNKNOWN punkOuter)
{

   m_pObjA = (PCMode)pObj;
   m_cRef = 0;	// tek 18sep98 track references
   (((PCMode) m_pObjA)->m_pModeITTSDialogsW)->FInit(pObj, punkOuter);
}


CModeITTSDialogsW::CModeITTSDialogsW (LPVOID pObj, LPUNKNOWN punkOuter)
{


   m_cRef      = 0;
   m_pObj      = pObj;
   m_punkOuter = punkOuter;
}


// This function is called from the ANSI interface constructor -

CModeITTSDialogsW::FInit(LPVOID pObj, LPUNKNOWN punkOuter)
{
   m_cRef      = 0;
   m_pObj      = pObj;
   m_punkOuter = punkOuter;

   return NOERROR;
}


CModeITTSDialogsA::~CModeITTSDialogsA (void)
{

	// MVP:07/19/96 :Do nothing in the Destructor as it doesn't
	// have any members which are allocated.
	// The below line causes freeing up memory twice.It caused
	// the Memory error when debgging the debug version of
	// DTLKTTSE.DLL
	// (((PCMode) m_pObjA)->m_pModeITTSDialogsW)->~CModeITTSDialogsW();

}


CModeITTSDialogsW::~CModeITTSDialogsW (void)
{

	// tek 17sep98 verify that the ref count is indeed zero.
	_ASSERTE (m_cRef==0);

}


STDMETHODIMP CModeITTSDialogsA::QueryInterface(REFIID riid, LPVOID FAR *ppv)
{
	// tek 24sep98 validate parameter
	if (IsBadWritePtr(ppv, 4)) // don't really know the size
	{
		return E_INVALIDARG;
	}
    return (((PCMode) m_pObjA)->m_pModeITTSDialogsW)->QueryInterface(riid, ppv);
}


STDMETHODIMP CModeITTSDialogsW::QueryInterface(REFIID riid, LPVOID FAR *ppv)
{
	// tek 24sep98 validate parameter
	if (IsBadWritePtr(ppv, 4)) // don't really know the size
	{
		return E_INVALIDARG;
	}

      return m_punkOuter->QueryInterface(riid,ppv);
}


STDMETHODIMP_ (ULONG) CModeITTSDialogsA::AddRef(void)
{
	m_cRef++; // tek 18sep98 track references

    return (((PCMode) m_pObjA)->m_pModeITTSDialogsW)->AddRef();
}


STDMETHODIMP_ (ULONG) CModeITTSDialogsW::AddRef(void)
{
   ++m_cRef;

    return m_punkOuter->AddRef();
}


STDMETHODIMP_ (ULONG) CModeITTSDialogsA::Release(void)
{
	ULONG ulRef;
	m_cRef--;
	ulRef = m_cRef;

    // get rid of the outer ref
   (((PCMode) m_pObjA)->m_pModeITTSDialogsW)->Release();
   // see if it's time to die
//MGS try this way
//   if (ulRef == 0)
//	   delete this;
   return ulRef;
}


STDMETHODIMP_ (ULONG) CModeITTSDialogsW::Release(void)
{
	// tek 17sep98 made self-deleting
	ULONG ulResult;
    --m_cRef;

 	ulResult = m_punkOuter->Release();
		// MGS try this way
//	if (0 == m_cRef)
//		delete this;
	return ulResult;
}



STDMETHODIMP CModeITTSDialogsA::AboutDlg (HWND hWndParent, PCSTR pszTitle)
{
   HRESULT  hRes;
   DWORD    dwTitleLen ;//= MyAStrLen(pszTitle) + 1;
   PWSTR    pwszTitle;
   char		*pszRealTitle;

   // tek 24sep98 NULL parent window is just a "do you exist" probe..
   if (hWndParent==NULL)
   {
	   return NOERROR;
   }

	 // return ResultFromScode (TTSERR_NOTSUPPORTED); // tek 19mar98 BATS 627
   if (!pszTitle) // tek deal with default title
   {
	   pszRealTitle = "DECtalk Software Properties";
   }
   else
   {
	   pszRealTitle = (char *)pszTitle;
   }

   dwTitleLen = MyAStrLen(pszRealTitle) + 1;
   pwszTitle = (PWSTR) malloc(dwTitleLen * sizeof(WCHAR));


   if (pwszTitle)
	  {
	  MultiByteToWideChar(CP_ACP, 0, pszRealTitle, -1, pwszTitle, dwTitleLen);
	  hRes = (((PCMode) m_pObjA)->m_pModeITTSDialogsW)->AboutDlg(hWndParent, pwszTitle);
	  free(pwszTitle);
	  return(hRes);
	  }

   else
   
	  return ResultFromScode (E_OUTOFMEMORY);
}


STDMETHODIMP CModeITTSDialogsW::AboutDlg (HWND hWndParent, PCWSTR pszTitle)
{
   char  szTemp[256];
   // tek 24sep98 NULL parent window is just a "do you exist" probe..
   if (hWndParent==NULL)
   {
	   return NOERROR;
   }

	  //return ResultFromScode (TTSERR_NOTSUPPORTED); // tek 19mar98 BATS 627
	AFX_MANAGE_STATE(AfxGetStaticModuleState( )); // get our resources
// a valid handle?

   if (!hWndParent || !IsWindow(hWndParent))

	  return ResultFromScode (SRERR_INVALIDPARAM);

// convert from UNICODE to ANSI

   if (pszTitle)

	  WideCharToMultiByte(CP_ACP, 0, pszTitle, -1, szTemp, sizeof(szTemp), NULL, NULL);


   // go do the dialog..
   CDECtalkDialogs dlg ((CMode *)m_pObj, szTemp,CWnd::FromHandle(hWndParent));
   // figure out which page to select
   int iPageIndex = dlg.GetPageIndex(&dlg.m_AboutDialog);
   dlg.SetActivePage(iPageIndex);
   dlg.DoModal();


   return NOERROR;
}


STDMETHODIMP CModeITTSDialogsA::LexiconDlg (HWND hWndParent, PCSTR pszTitle)
{
   HRESULT  hRes;
   DWORD    dwTitleLen ;//= MyAStrLen(pszTitle) + 1;
   PWSTR    pwszTitle;
   char		*pszRealTitle;
   // tek 24sep98 NULL parent window is just a "do you exist" probe..
   if (hWndParent==NULL)
   {
	   return NOERROR;
   }

	 // return ResultFromScode (TTSERR_NOTSUPPORTED); // tek 19mar98 BATS 627
   if (!pszTitle) // tek deal with default title
   {
	   pszRealTitle = "DECtalk Software Properties";
   }
   else
   {
	   pszRealTitle = (char *)pszTitle;
   }

   dwTitleLen = MyAStrLen(pszRealTitle) + 1;
   pwszTitle = (PWSTR) malloc(dwTitleLen * sizeof(WCHAR));


   if (pwszTitle)
	  {
	  MultiByteToWideChar(CP_ACP, 0, pszRealTitle, -1, pwszTitle, dwTitleLen);
	  hRes = (((PCMode) m_pObjA)->m_pModeITTSDialogsW)->LexiconDlg(hWndParent, pwszTitle);
	  free(pwszTitle);
	  return(hRes);
	  }

   else
   
	  return ResultFromScode (E_OUTOFMEMORY);
}


STDMETHODIMP CModeITTSDialogsW::LexiconDlg (HWND hWndParent, PCWSTR pszTitle)
{
   char  szTemp[256];

	  //return ResultFromScode (TTSERR_NOTSUPPORTED); // tek 19mar98 BATS 627
	AFX_MANAGE_STATE(AfxGetStaticModuleState( )); // get our resources
   // tek 24sep98 NULL parent window is just a "do you exist" probe..
   if (hWndParent==NULL)
   {
	   return NOERROR;
   }
// a valid handle?

   if (!hWndParent || !IsWindow(hWndParent))

	  return ResultFromScode (SRERR_INVALIDPARAM);

// convert from UNICODE to ANSI

   if (pszTitle)

	  WideCharToMultiByte(CP_ACP, 0, pszTitle, -1, szTemp, sizeof(szTemp), NULL, NULL);


   // go do the dialog..
   CDECtalkDialogs dlg ((CMode *)m_pObj, szTemp,CWnd::FromHandle(hWndParent));
   // figure out which page to select
   int iPageIndex = dlg.GetPageIndex(&dlg.m_LexiconDialog);
   dlg.SetActivePage(iPageIndex);
   dlg.DoModal();


   return NOERROR;
}


STDMETHODIMP CModeITTSDialogsA::GeneralDlg (HWND hWndParent, PCSTR pszTitle)
{
   HRESULT  hRes;
   DWORD    dwTitleLen ;//= MyAStrLen(pszTitle) + 1;
   PWSTR    pwszTitle;
   char		*pszRealTitle;
   // tek 24sep98 NULL parent window is just a "do you exist" probe..
   if (hWndParent==NULL)
   {
	   return NOERROR;
   }

	 // return ResultFromScode (TTSERR_NOTSUPPORTED); // tek 19mar98 BATS 627
   if (!pszTitle) // tek deal with default title
   {
	   pszRealTitle = "DECtalk Software Properties";
   }
   else
   {
	   pszRealTitle = (char *)pszTitle;
   }

   dwTitleLen = MyAStrLen(pszRealTitle) + 1;
   pwszTitle = (PWSTR) malloc(dwTitleLen * sizeof(WCHAR));


   if (pwszTitle)
	  {
	  MultiByteToWideChar(CP_ACP, 0, pszRealTitle, -1, pwszTitle, dwTitleLen);
	  hRes = (((PCMode) m_pObjA)->m_pModeITTSDialogsW)->GeneralDlg(hWndParent, pwszTitle);
	  free(pwszTitle);
	  return(hRes);
	  }

   else
   
	  return ResultFromScode (E_OUTOFMEMORY);
}


STDMETHODIMP CModeITTSDialogsW::GeneralDlg (HWND hWndParent, PCWSTR pszTitle)
{
   char  szTemp[256];

	  //return ResultFromScode (TTSERR_NOTSUPPORTED); // tek 19mar98 BATS 627
	AFX_MANAGE_STATE(AfxGetStaticModuleState( )); // get our resources
   // tek 24sep98 NULL parent window is just a "do you exist" probe..
   if (hWndParent==NULL)
   {
	   return NOERROR;
   }
// a valid handle?

   if (!hWndParent || !IsWindow(hWndParent))

	  return ResultFromScode (SRERR_INVALIDPARAM);

// convert from UNICODE to ANSI

   if (pszTitle)

	  WideCharToMultiByte(CP_ACP, 0, pszTitle, -1, szTemp, sizeof(szTemp), NULL, NULL);


   // go do the dialog..
   CDECtalkDialogs dlg ((CMode *)m_pObj, szTemp,CWnd::FromHandle(hWndParent));
   // figure out which page to select
   int iPageIndex = dlg.GetPageIndex(&dlg.m_GeneralDialog);
   dlg.SetActivePage(iPageIndex);
   dlg.DoModal();


   return NOERROR;
}


STDMETHODIMP CModeITTSDialogsA::TranslateDlg (HWND hWndParent, PCSTR pszTitle)
{
   HRESULT  hRes;
   DWORD    dwTitleLen ;//= MyAStrLen(pszTitle) + 1;
   PWSTR    pwszTitle;
   char		*pszRealTitle;
   // tek 24sep98 NULL parent window is just a "do you exist" probe..
   if (hWndParent==NULL)
   {
	   return NOERROR;
   }

	 // return ResultFromScode (TTSERR_NOTSUPPORTED); // tek 19mar98 BATS 627
   if (!pszTitle) // tek deal with default title
   {
	   pszRealTitle = "DECtalk Software Properties";
   }
   else
   {
	   pszRealTitle = (char *)pszTitle;
   }

   dwTitleLen = MyAStrLen(pszRealTitle) + 1;
   pwszTitle = (PWSTR) malloc(dwTitleLen * sizeof(WCHAR));


   if (pwszTitle)
	  {
	  MultiByteToWideChar(CP_ACP, 0, pszRealTitle, -1, pwszTitle, dwTitleLen);
	  hRes = (((PCMode) m_pObjA)->m_pModeITTSDialogsW)->TranslateDlg(hWndParent, pwszTitle);
	  free(pwszTitle);
	  return(hRes);
	  }

   else
   
	  return ResultFromScode (E_OUTOFMEMORY);
}


STDMETHODIMP CModeITTSDialogsW::TranslateDlg (HWND hWndParent, PCWSTR pszTitle)
{
   char  szTemp[256];

	  //return ResultFromScode (TTSERR_NOTSUPPORTED); // tek 19mar98 BATS 627
	AFX_MANAGE_STATE(AfxGetStaticModuleState( )); // get our resources
// a valid handle?
   // tek 24sep98 NULL parent window is just a "do you exist" probe..
   if (hWndParent==NULL)
   {
	   return NOERROR;
   }

   if (!hWndParent || !IsWindow(hWndParent))

	  return ResultFromScode (SRERR_INVALIDPARAM);

// convert from UNICODE to ANSI

   if (pszTitle)

	  WideCharToMultiByte(CP_ACP, 0, pszTitle, -1, szTemp, sizeof(szTemp), NULL, NULL);


   // go do the dialog..
   CDECtalkDialogs dlg ((CMode *)m_pObj, szTemp,CWnd::FromHandle(hWndParent));
   // figure out which page to select
   int iPageIndex = dlg.GetPageIndex(&dlg.m_TranslateDialog);
   dlg.SetActivePage(iPageIndex);
   dlg.DoModal();


   return NOERROR;
}


/***********************************************************************
 CModeNotify - Notification object. This will just pass the audio input
   notifications up to the CMode object.
*/

CModeNotify::CModeNotify (void * pObj)
{	
// Get passed in the CMode object, save this

   m_pObj = pObj;
   m_iRefCnt=0; //tek 25feb97 init ref count.

#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CModeNotify (%08lx) constructor at %ld\n",
			this, timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG

}


CModeNotify::~CModeNotify (void)
{
	// tek 17sep98 verify that the ref count is indeed zero.
#ifdef M_DEBUG
	{
		char szTemp[256];
		sprintf(szTemp,"CModeNotify (%08lx) destructor at %ld\n",
			this, timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	_ASSERTE (m_iRefCnt==0);
}



STDMETHODIMP CModeNotify::QueryInterface (REFIID riid, LPVOID *ppv)
{
	// tek 24sep98 validate parameter
	if (IsBadWritePtr(ppv, 4)) // don't really know the size
	{
		return E_INVALIDARG;
	}
   *ppv = NULL;

   /* always return our IUnkown for IID_IUnknown */

   if (IsEqualIID (riid, IID_IUnknown)
	|| IsEqualIID(riid,IID_IAudioDestNotifySink))

	  *ppv = (LPVOID) this;

// otherwise, cant find

   return ResultFromScode (E_NOINTERFACE);
}



STDMETHODIMP_ (ULONG) CModeNotify::AddRef (void)
{
// normally this increases a reference count, but this object
// is going to be freed as soon as the app is freed, so it doesn't
// matter
// tek 25feb97 (bats 255) for debug purposes, keep explicit
// track of reference counts.

   m_iRefCnt++;
#ifdef M_DEBUG
   {
	   char szTemp[256]="";
	   sprintf(szTemp,"CModeNotify::AddRef: count now %d\n",
		   m_iRefCnt);
	   OutputDebugString(szTemp);
   }
#endif //DEBUG

   return m_iRefCnt;   // BUGBUG: Should I do this?
}



STDMETHODIMP_(ULONG) CModeNotify::Release (void)
{
	// tek 17sep98 made self-deleting
	int iRefCount;
	// tek 25feb97 track ref counts..
	ASSERT(m_iRefCnt != 0);
   m_iRefCnt--;
#ifdef M_DEBUG
   {
	  char szTemp[256]="";
	  sprintf(szTemp,"CModeNotify::Release: count now %d\n",
		  m_iRefCnt);
	  OutputDebugString(szTemp);
	  }
#endif //DEBUG	  
   iRefCount = m_iRefCnt;
		// MGS try this way
//	  if (0 == iRefCount)
//		  delete this;

   return iRefCount;   // BUGBUG: Should I do this?
}



STDMETHODIMP CModeNotify::FreeSpace(DWORD dwBytes, BOOL fEOF)
{
	PCMode pMode = (PCMode) m_pObj;
//  return pMode->SendAudioIfCan();           // add to text to linked list
	pMode->SendMoreAudioSamplesOnNotifyFreeSpace(dwBytes);
	
	return NOERROR;  //MVP:
}


// tek 22aug97 
// audio destination bookmarks are to be used instead of polling for 
// bookmark and visual notifications; this is requred because of the 
// MS suggestion that the way to get early notification is to write
// a custom audio destination that returns bookmarks earlier.
STDMETHODIMP CModeNotify::BookMark(DWORD dwMarkID, BOOL fFlush)
{
	PCMode pMode = (PCMode) m_pObj;
	PMARK_DATA pMarkData = (PMARK_DATA)dwMarkID;
	unsigned int uiMsg=0; 
#ifdef M_DEBUG
	{
		char szTemp[256]="";
		QWORD qwTotal=0;
		QWORD qwPosn=0;
		pMode->m_pAudioIAudio->PosnGet(&qwPosn);
		pMode->m_pAudioIAudio->TotalGet(&qwTotal);
		sprintf(szTemp,"CModeNotify::BookMark %08lx: total=%lu posn=%lu Mark Time=%lu at %lu\n",
			dwMarkID, (DWORD)qwTotal, (DWORD)qwPosn, (DWORD)pMarkData->qTimeStamp,timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG

	// send the message to process the mark packet; decide here 
	// which kind it is (mostly for historical reasons - to avoid
	// changing too much code..)
	if (pMarkData)
	{
		switch (pMarkData->dwMarkType)
		{
		case SPC_type_index|SPC_subtype_bookmark:
			uiMsg = pMode->m_uiBookMarkMessage;
			break;
		case SPC_type_index|SPC_subtype_wordpos:
			uiMsg = pMode->m_uiWordPosMessage;
#ifdef SAPI_GROUP_H_TIMING
			break;
		case SPC_type_index|SPC_subtype_start:
			uiMsg = pMode->m_uiStartMessage;
			break;
		case SPC_type_index|SPC_subtype_stop:
			uiMsg = pMode->m_uiStopMessage;
			break;
		case SPC_type_visual:
			uiMsg = pMode->m_uiVisualMessage;
#endif // SAPI_GROUP_H_TIMING
			break;

		default:
			uiMsg = 0;
#ifdef M_DEBUG
			{
				char szTemp[256]="";
#ifndef SAPI_GROUP_H_TIMING
				sprintf(szTemp,"Unknown mark type %lu in ::BookMark at %lu?",
					pMarkData->dwMarkType, timeGetTime());
#else // SAPI_GROUP_H_TIMING
				sprintf(szTemp,"Unknown mark %08lx type %08lx in ::BookMark at %lu?\n",
					(DWORD)pMarkData, pMarkData->dwMarkType, timeGetTime());
#endif // SAPI_GROUP_H_TIMING
				OutputDebugString(szTemp);
			}
#endif //M_DEBUG
			break;
		}// switch
#ifdef SAPI_GROUP_H_TIMING
	// the visual marks are handled a little differently, because the markdata
	// contains a pointer to the visual info.. so we have to dereference that 
	// that here and free the markdata memory..
#endif // SAPI_GROUP_H_TIMING
	if (uiMsg)
#ifdef SAPI_GROUP_H_TIMING
		{
			if (uiMsg == pMode->m_uiVisualMessage)
			{
				PostMessage(pMode->m_pDECtalk->hWnd,uiMsg,0,(LPARAM)(pMarkData->dwMarkValue));
				free(pMarkData);
			}
			else
			{
#endif // SAPI_GROUP_H_TIMING
		PostMessage(pMode->m_pDECtalk->hWnd,uiMsg,0,(LPARAM)(pMarkData));
#ifdef SAPI_GROUP_H_TIMING
			}
		}
#endif // SAPI_GROUP_H_TIMING
	// the mark data gets freed by the recipient of the message..
	} // if pMarkData


	return NOERROR;
}

STDMETHODIMP CModeNotify::AudioStop(WORD wReason)
{
	// tek 08jan99 modified to test for a valid audio handle; some test apps were access-violating
	// on shutdown,
	QWORD   qwTime;
	LPAUDIO_PARAMS_T pAudioParams; // tek 08aug97
	if (  (m_pObj)
		&&(((PCMode)m_pObj)->m_pDECtalk)
		&&(((PCMode)m_pObj)->m_pDECtalk->pAudioHandle) )
	{
		pAudioParams=((PCMode)m_pObj)->m_pDECtalk->pAudioHandle; // tek 08jan99
	}
	else // bad handle??
	{
#ifdef M_DEBUG	//tek 08aug97
		{
			char szTemp[256]="";
			sprintf(szTemp,"CModeNotify::AudioStop bad ptr! at %lu\n",
				timeGetTime());
			OutputDebugString(szTemp);
			sprintf(szTemp,"CModeNotify::AudioStop m_pObj=%08lx\n",
				(m_pObj));
			OutputDebugString(szTemp);
			if (m_pObj)
			{
				sprintf(szTemp,"CModeNotify::AudioStop m_pDECtalk=%08lx\n",
					(((PCMode)m_pObj)->m_pDECtalk));
				OutputDebugString(szTemp);
				if (((PCMode)m_pObj)->m_pDECtalk)
				{
					sprintf(szTemp,"CModeNotify::AudioStop pAudioHandle=%08lx\n",
						(((PCMode)m_pObj)->m_pDECtalk->pAudioHandle));
					OutputDebugString(szTemp);
				}
			}
//			ODSFlush();
		}
		//assert(FALSE);
#endif //M_DEBUG
		return MMSYSERR_ERROR;
	}

	((PCMode)m_pObj)->m_pAudioIAudio->PosnGet (&qwTime); // tek 20aug97 needs to be Posn rather than Total

#ifdef M_DEBUG	//tek 08aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"CModeNotify::AudioStop at %lu\n",
			timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	// tek 08aug97 have to be a little careful around pause/resume..
	if (!pAudioParams->bPaused)
	{
		//tek 08aug97 set the device state to inactive here..
		EnterCriticalSection( pAudioParams->pcsAudioDeviceState );
		pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_INACTIVE;
		LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

		SetEvent( pAudioParams->hAudioDeviceInactive );

		//tek 08aug97 clear the request flag for safety..
		pAudioParams->bSendSamplesRequested = FALSE;
		// and clear out the out-of-data flag..
		pAudioParams->bAudioRanDry = FALSE;
#ifdef SAPI_GROUP_H_TIMING
		// tek 20feb98 note that the fact that we are no longer "started"
		((PCMode)m_pObj)->m_fStarted = FALSE;
#endif // SAPI_GROUP_H_TIMING

		// we no longer release the bufnotifysink here, because this is
		// done either in AudioReset (for an abort) or 
		// ProcessStopMessage (for normal completion).
	}
	PostMessage (((PCMode)m_pObj)->hWndMain, WM_NSAUDIOSTOP,
		 (DWORD) qwTime, (DWORD) (qwTime >> 32));
	Sleep(0);
   return NOERROR;
}


STDMETHODIMP CModeNotify::AudioStart(void)
{
	QWORD   qwTime;

#ifdef M_DEBUG	//tek 08aug97
	{
		char szTemp[256]="";
		QWORD	qwPosn=0,qwTotal=0;
		((PCMode)m_pObj)->m_pAudioIAudio->PosnGet (&qwPosn);
		((PCMode)m_pObj)->m_pAudioIAudio->TotalGet (&qwTotal);

		sprintf(szTemp,"CModeNotify::AudioStart Posn=%lu Total=%lu at %lu\n",
			(DWORD)qwPosn, (DWORD)qwTotal, timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG

	// tek 04aug97 this needs to be PosnGet not TotalGet, I think..
	((PCMode)m_pObj)->m_pAudioIAudio->PosnGet (&qwTime);

	PostMessage (((PCMode)m_pObj)->hWndMain, WM_NSAUDIOSTART,
		 (DWORD) qwTime, (DWORD) (qwTime >> 32));


   return NOERROR;
}

#define TAG_SIZE	(1024)

// ProcessTaggedTextW preprocesses the UNICODE input text and then uses 
// ProcessTaggedText to actually deal with the tag. It is possible that 
// we may need to be a little smarter here in the future, if we allow
// truly UNICODE text within the tag (e.g. phonemes). 
// 21oct98 This routine now processes the \prn\ tag internally IF we are in 
// IPA Phonetic mode; all other tags are passed on to the ansi version.
void ProcessTaggedTextW(PCMode pMode, char *szDest, DWORD *pdwDestCount, WCHAR *wszSrc, DWORD *pdwWSrcCount, BOOL bIsIPA)
{
	// construct an artificial ANSI buffer to pass to ProcessTaggedText, and handle
	// the update of the src pointer. We basically take the chunk between two
	// backslashes out of the input.
	char szTagBuffer[TAG_SIZE]="";
	int iI;
	int iADestCount=0;
	DWORD dwTemp;
	// tek 21oct98 decide if we need to look for a \prn=\ tag..
	// tek 04nov98 but ONLY if us english
#ifdef ENGLISH_US
	if ( bIsIPA)
	{
		// see if this is a prn tag
		if (_wcsnicmp(&wszSrc[*pdwWSrcCount],L"\\prn=",5) == 0)
		{
			// this is a \prn=\ tag. Walk the source ptr forward, 
			// pull out the grapheme and phoneme parts, and call
			// the user-dictionary updater. 
			// things are wchar at this point..
			WCHAR wszGraphemes[TAG_SIZE]=L"",wszPhonemes[TAG_SIZE]=L"";
			char szGraphemes[TAG_SIZE]="",szPhonemes[TAG_SIZE]="";
			*pdwWSrcCount += 5; // get to the graphemes..
			// get the graphemes..
			for (iI=0;iI<TAG_SIZE;iI++)
			{
				if (wszSrc[*pdwWSrcCount] == L'\0' )
				{
					// bogus, ended within a tag. Abort.
					// back up so the caller sees the '\0'..
					(*pdwWSrcCount)--;
					return;
				}
				if (wszSrc[*pdwWSrcCount] == L'=')
				{
					// end of the grapheme part
					wszGraphemes[iI] = L'\0';
					(*pdwWSrcCount)++; // move to next part.
					break;
				}
				if (wszSrc[*pdwWSrcCount] == L'\\')
				{
					// end of tag; this is a "remove" operation
					// do not advance, so that the phoneme-finder
					// sees it.
					break;
				}
				// else we have to copy the grepheme..
				wszGraphemes[iI] = wszSrc[(*pdwWSrcCount)++];
			}		
			// make sure this isn't a run-on tag..
			if (iI == TAG_SIZE)
			{
				// advance to either the end of the tag or the null, and
				// abort.
				while (   (wszSrc[*pdwWSrcCount] != L'\0')
					   && (wszSrc[*pdwWSrcCount] != L'\\') 
					   )
				{
					(*pdwWSrcCount)++;
				}
				// if this is a null, back up so that the caller sees it.
				if (wszSrc[*pdwWSrcCount-1] != L'\0')
					(*pdwWSrcCount)--;
				// and abort.
				return;
			}
			// get the phonemes..
			for (iI=0;iI<TAG_SIZE;iI++)
			{
				if (wszSrc[*pdwWSrcCount] == L'\0' )
				{
					// bogus, ended within a tag. Abort.
					// back up so the caller sees the '\0'..
					(*pdwWSrcCount)--;
					return;
				}
				if (wszSrc[*pdwWSrcCount] == L'\\')
				{
					// end of the grapheme part
					wszPhonemes[iI] = L'\0';
					(*pdwWSrcCount)++; // move to beyond tag
					break;
				}
				// else copy the phoneme
				wszPhonemes[iI] = wszSrc[(*pdwWSrcCount)++];
			}
			// make sure this isn't a run-on tag..
			if (iI == TAG_SIZE)
			{
				// advance to either the end of the tag or the null, and
				// abort.
				while (   (wszSrc[*pdwWSrcCount] != L'\0')
					   && (wszSrc[*pdwWSrcCount] != L'\\') 
					   )
				{
					(*pdwWSrcCount)++;
				}
				// if this is a null, back up so that the caller sees it.
				if (wszSrc[*pdwWSrcCount-1] != L'\0')
					(*pdwWSrcCount--);
				// and abort.
				return;
			}
			// OK, at this point we have our graphemes and phonemes, and 
			// we've consumed the tag. Get ready to modify the user dictionary.
			// first, if the graphmeme string is null, this is nonsense.
			if (wszGraphemes[0] == L'\0')
			{
				return;
			}
			// convert the graphemes to ascii
			if (wcstombs(szGraphemes,wszGraphemes,TAG_SIZE-1) <= 0)
			{
				// nothing converted
				// abort
				return;
			}
			// if this is a delete request (no phonemes), do it.
			if (wszPhonemes[0] == L'\0')
			{
				dic_entry deEntry;
				strncpy((char *)&deEntry.text[0],szGraphemes,127); //size of dic_entry.text should be a constant!
				deEntry.text[127]='\0'; // be safe
				TextToSpeechDeleteUserEntry(pMode->m_pDECtalk, &deEntry); // delete it.
				return; // all done
			} // delete entry
			// else this must be an add entry
			else
			{
				unsigned char cPhonemes[TAG_SIZE] = "";
				// first, we have to convert the string of phonemes in IPA to arpabet
				if (wcsIPATombsArpa(szPhonemes, cPhonemes, wszPhonemes, TAG_SIZE-1, TAG_SIZE-1)) // make sure it converts
				{
					dic_entry deEntry;
					int iGraphemeLength, iPhonemeLength;
					// be safe
					cPhonemes[TAG_SIZE-1] = '\0';
					// build the string to send.. first, make sure it isn't too long
					iGraphemeLength = strlen(szGraphemes);
					iPhonemeLength = strlen(szPhonemes);
					if ( (iGraphemeLength+iPhonemeLength+2) > 127)
					{
						// too big, just punt.
						return;
					}
					strcpy((char *)deEntry.text,szGraphemes);
					strcpy((char *)&deEntry.text[iGraphemeLength+1],(char *)cPhonemes);
					// do the deed
					//we have to sync up here, because otherwise unexpected things happen..
					// tek 27oct98 WARNING: we can't yet sync up because of message-pump issues!
					// so, unless you've waited for a TextDataDone messages before doing a 
					// user-dictionary change, whether the iten you're touching is actually
					// in the dictionary (and whether you won't screw up royally or even
					// accvio) is unpredictable.
					//TextToSpeechSync(pMode->m_pDECtalk);

					// first, unconditionally remove the entry
					TextToSpeechDeleteUserEntry(pMode->m_pDECtalk, &deEntry); // delete it.
					// then create a new entry
					TextToSpeechAddUserEntry(pMode->m_pDECtalk,&deEntry); // add it.
					// and we're done
					return;
				}


			} // add entry
		} // this is a \prn\ tag
	} // bIsIPA
#endif //ENGLISH_US

	for (iI=0;iI<TAG_SIZE;iI++)
	{
		char szTempBuffer[64];	// should be MB_CUR_MAX, but..
		int	iConverted=0;
		iConverted = wctomb(szTempBuffer, wszSrc[iI+ *pdwWSrcCount]);
		if (iConverted > 0)
		{
			int iJ;
#ifdef M_DEBUG
		{
			char szTemp[256];
			sprintf(szTemp,"PTTW: character %ld+%d [%04x] = [%02x]\n",
				*pdwWSrcCount,iI, (int)wszSrc[iI+ *pdwWSrcCount], szTempBuffer[0]);
			OutputDebugString(szTemp);
		}
#endif //M_DEBUG	
		for (iJ=0;iJ<iConverted;iJ++)
			{
				szTagBuffer[iADestCount++] = szTempBuffer[iJ];
			} // for iJ
		} // if iConverted
		else

#ifdef M_DEBUG
		{
			char szTemp[256];
			sprintf(szTemp,"PTTW: character %d [%04x] did not convert.\n",
				iI, (int)wszSrc[iI+ *pdwWSrcCount], szTempBuffer[0]);
			OutputDebugString(szTemp);
		}
#endif //M_DEBUG
		// check for end of string..
		if ( (wszSrc[iI+ *pdwWSrcCount] =='\0') )
		{
			// incomplete tag, just stop here.
			iI++;
			break;
		}
		// the first thing converted is the backslash. Once past that, 
		// stop converting after the next backslash.
		if ( (iI>0) && (szTempBuffer[0] == '\\') )
		{
			iI++;
			break;
		}
	} // for iI
	szTagBuffer[iADestCount]='\0';
#ifdef M_DEBUG
	{
		char szTemp[512];
		sprintf(szTemp,"PTTW: Tag is %s, iI=%d\n",szTagBuffer,iI);
		OutputDebugString(szTemp);
	}
#endif //M_DEBUG
	// ok, we have the ANSI version of the tag in szTagBuffer. Push the caller's 
	// source counter up by the number of characters we chewed..
	*pdwWSrcCount += (iI-1);
	dwTemp=0; // this is the fake "source pointer"
	// pass the tag on to the ansi tag parser..
	ProcessTaggedText(pMode, szDest, pdwDestCount, szTagBuffer, &dwTemp);

}
// ProcessTaggedText chews off the SAPI tag from the input and puts whatever
// results into the output. Assumes SUBST_STRING_SIZE is available in the output.
// leaves the input pointer one behind the "next" character to process.
void ProcessTaggedText(PCMode pMode, char *szDest, DWORD *dwDestCount, char *szSrc, DWORD *dwSrcCount)
{
	char	szSubstString[SUBST_STRING_SIZE]="";
	char	szInputTag[TAG_SIZE]="";
	int		iI, iTagLen;
	char	*pszTag=NULL;
	char	*pszValue=NULL;
	BOOL	bTagValid=TRUE;
	BOOL	graft=FALSE;
	char	speaker_letter;

		
	// skip the introducer
	
	// copy the tag to the buffer and update the input pointer.

	for (iI=0;iI<TAG_SIZE;iI++)
	{
		(*dwSrcCount)++;
		// copy the character
		szInputTag[iI] = szSrc[*dwSrcCount];
		if (szInputTag[iI] == '\0')
		{
			bTagValid = FALSE;// done, and it's bogus.
			(*dwSrcCount)--; // back up so that the next processed by caller is \0
			break; // note that this leaves SrcCount pointing at the null.
		}
		// check for the \\ case..
		if (   (szInputTag[iI]=='\\')
			 &&(iI==0)
		   )
		{
			bTagValid = FALSE; // escaped backslash
			// copy the backslash
			szDest[(*dwDestCount)++] = szSrc[(*dwSrcCount)];
			// leave the src ptr pointing to the \ 
			break;
			
		}

		if (szInputTag[iI] == '\\')
		{
			szInputTag[iI] = '\0';
			break;
		}

	}
	// see if this was a bogus tag..
	if (!bTagValid)
		return; // nothing to do.

	iTagLen=iI; // remember how long it is, for convenience
	pszTag = &szInputTag[0];

/* the list of tags :
 *	\chr=string[[,string...]\	character of voice
 *	\com=string\	comment
 *	\ctx=string\	context
 *	\emp\			emphasize next word
 *	\eng[[;GUID]]:command\	engine specific tag
 *	\mrk=number\	bookmark
 *	\pau=number\	pause
 *	\pit=number\	pitch
 *	\prn=foo=fu\	pronounce
 *	\pro=number\	prosidy
 *	\prt=string\	part of speech
 *	\rst\			reset
 *	\spd=number\	speed
 *	\vce=charact=value[[,charact=value...]]\	voice
 *	\vol=number\	volume
 */


	// the only tag we worry about so far is the (required) /mrk=#/ tag.
	// but, in general, look for the "=" first..
	for (iI=0;iI<iTagLen;iI++)
	{
		if (szInputTag[iI]=='=')
		{
			szInputTag[iI]='\0';
			pszValue = &szInputTag[iI+1];
		}
	}
	// now, upper the tag (they are case-insensitive), and 
	// see what it is..
	_strupr(pszTag);
	if (!strcmp(pszTag,"CHR"))
	{
		//ignore for now
	} 
	else if (!strcmp(pszTag,"COM")) 
	{
		//this is a comment -- ignore
	} 
	else if (!strcmp(pszTag,"CTX"))
	{
		// context not sure
		// "address" if always supported
		// "c" is supported in punct all
		// "document" this sounds like normal to me
		// "e-mail" translates to e-mail
		// "numbers" are always done
		// "spreadsheet" like a table
		// "unknown" is like normal
		// "normal" is normal
	}
	else if (!strcmp(pszTag,"EMP"))
	{
		// emphasize next word
		graft=TRUE;
		// build the insert string..
		sprintf(szSubstString,"%s[\"]%s",szArpaOn, szArpaOff);
	}
	else if (!strcmp(pszTag,"ENG"))
	{
		// no engine specific tags, ignore
	}
	else if (!strcmp(pszTag,"MRK"))
	{
		int	iRet;
		graft=TRUE;
		// this is a bookmark. Get the value.
		DWORD dwMarkValue=0;
		iRet = sscanf(pszValue,"%lu",&dwMarkValue);
		// tek 23seo98 check for error
		if (  (iRet == 0)
			||(iRet == EOF) )
		{
			dwMarkValue = 0;
		}
		if (dwMarkValue) // 0 is reserved per SAPI spec..
		{
			// build the insert string..
			sprintf(szSubstString,"[:i b %d %d]",
				(int)((dwMarkValue>>16)&0xFFFF),
				(int)(dwMarkValue&0xFFFF));
		}
	}
	else if (!strcmp(pszTag,"PAU"))
	{
		int	iRet;
		graft=TRUE;
		// this is a pause. Get the value.
		DWORD dwMarkValue=0;
		iRet = sscanf(pszValue,"%lu",&dwMarkValue);
		// check for error
		if (  (iRet == 0)
			||(iRet == EOF) )
		{
			dwMarkValue = 0;
		}
		// build the insert string..
		// tek 23sep98 SAPI expects silence, rather than just waiting
		// around. So, we have to stick in a silent phoneme.
		// we're generally a tad long on our durations, and this causes us
		// to fail the MS TTSFUNC suite; so, blindly subtract some time.
		if (dwMarkValue > 500)
			dwMarkValue -= 11;
		// tek 24sep98 the pause value will be zero for either a pause of 
		// zero length, or for invalid syntax. In either case, don't do anything.
		if (dwMarkValue != 0)
		{
			sprintf(szSubstString,"%s[_<%u>]%s",szArpaOn,
				(int)(dwMarkValue&0xFFFF), szArpaOff);
		}
	}
	else if (!strcmp(pszTag,"PIT"))
	{
		int	iRet;
		graft=TRUE;
		// this is a bookmark. Get the value.
		DWORD dwMarkValue=0;
		iRet=sscanf(pszValue,"%lu",&dwMarkValue);
		// tek 24sep98 check for error
		if (  (iRet == 0)
			||(iRet == EOF) )
		{
			dwMarkValue = 0;
		}		// build the insert string..
		if (dwMarkValue != 0)
		{
			sprintf(szSubstString,"[:sync][:dv ap %d]",
				(int)(dwMarkValue&0xFFFF));
		}
	}
	else if (!strcmp(pszTag,"PRN"))
	{
		// not supported in dectalk yet
	}
	else if (!strcmp(pszTag,"PRO"))
	{
		// prosidy, no support in dectalk
	}
	else if (!strcmp(pszTag,"PRT"))
	{
		// no support in dectalk yet
	} else if (!strcmp(pszTag,"RST"))
	{

	  switch (pMode->m_dwSpeaker)
		{
		case 0:
			speaker_letter='p';
			break;
		case 1:
			speaker_letter='b';
			break;
		case 2:
			speaker_letter='h';
			break;
		case 3:
			speaker_letter='f';
			break;
		case 4:
			speaker_letter='d';
			break;
		case 5:
			speaker_letter='k';
			break;
		case 6:
			speaker_letter='u';
			break;
		case 7:
			speaker_letter='r';
			break;
		case 8:
			speaker_letter='w';
			break;
		default:
			speaker_letter='p';

	  }
		graft=TRUE;
		// build the insert string..
		sprintf(szSubstString,"[:sync][:n%c][:vs 50][:rate 180][:skip none][:punct some]",
		speaker_letter);
		// have to reset all tags
		// dont know how to do this...
	} else if (!strcmp(pszTag,"SPD"))
	{
		int iRet;
		graft=TRUE;
		// this is a bookmark. Get the value.
		DWORD dwMarkValue=0;
		iRet=sscanf(pszValue,"%lu",&dwMarkValue);
		// check for error
		if (  (iRet == 0)
			||(iRet == EOF) )
		{
			dwMarkValue = 0;
		}
		if (dwMarkValue != 0)
		{// build the insert string..
		sprintf(szSubstString,"[:sync][:rate %d]",
			(int)(dwMarkValue&0xFFFF));
		}
	} else if (!strcmp(pszTag,"VCE"))
	{
		// dont know
	} else if (!strcmp(pszTag,"VOL"))
	{
		int iRet;
		graft=TRUE;
		// this is a bookmark. Get the value.
		DWORD dwMarkValue=0;
		iRet = sscanf(pszValue,"%lu",&dwMarkValue);
		// check for error
		if (  (iRet == 0)
			||(iRet == EOF) )
		{
			// this failed, do nothing.
		}
		else
		{
		// build the insert string..
		/* MGS 03/03/1998 BATS 610 changed the next line to properly look up the volume */
		/* and make it properly lookup the volume so the number s are close */
		sprintf(szSubstString,"[:sync][:sync][:vs %d]",
			DecodeDectalkVolume( dwMarkValue&0xFFFF)   );
		}
	}
		
	if (graft)
	{
		// now, graft that string onto the dest buffer..
		for (iI=0;iI<SUBST_STRING_SIZE;iI++)
		{	
			if (szSubstString[iI] != '\0')
			{
				szDest[(*dwDestCount)++] = szSubstString[iI];
			}
			else
			{
				break;
			}
		}
	}



}

#ifndef ACI_LICENSE	// 01mar97 tek
#ifdef WILLOWPOND
CEngUnlock::CEngUnlock(LPVOID pObj, LPUNKNOWN punkOuter)
{
	m_cRef = 0;
	m_pObj = pObj;
	m_punkOuter = punkOuter;
}

CEngUnlock::~CEngUnlock(void)
{
	// do nothing.
}

// if the key matches, unlock; else NOTLICENSED
STDMETHODIMP CEngUnlock::Unlock(char *szKey)
{
	PCMode pMode = (PCMode) m_pObj;
	// check the string, and maybe unlock
	if (strcmp(szKey,RTLICENSEKEY)==0)
	{
		pMode->bUnlocked = TRUE;
		return S_OK;
	}
	 else
	{
		return E_FAIL;
	}


}

STDMETHODIMP CEngUnlock::LockCheck(void)
{
	// this does nothing.
	return S_OK;
}

STDMETHODIMP_ (ULONG) CEngUnlock::AddRef(void)
{
	PCEngUnlock peuFoo = this;
   ++m_cRef;
   peuFoo->Unlock("");
   return m_punkOuter->AddRef();
}


STDMETHODIMP_ (ULONG) CEngUnlock::Release(void)
{
   --m_cRef;
   return m_punkOuter->Release();
}

STDMETHODIMP CEngUnlock::QueryInterface(REFIID riid, LPVOID FAR *ppv)
{
   return m_punkOuter->QueryInterface(riid,ppv);
}

#endif //WILLOWPOND
#endif //ACI_LICENSE
