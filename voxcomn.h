/*
 * voxcomn.h
 *  
 * Ver0.10 98/07/29 H.Matsuoka  Start
 * Ver0.20 98/12/03 H.Matsuoka  clean up
 * Ver0.21 98/12/16 H.Matsuoka  change SPK_8BIT
 * Ver0.22 99/ 1/11 H.Matsuoka  change Slparam structure
 * Ver0.23 99/ 2/ 3 H.Matsuoka  add vox top level error
 *
 */

#ifndef VOXTOP_H
#define VOXTOP_H

extern char vsxTopError;
extern char adpTopError;
extern char voxTopError;
extern char vox2TopError;
extern char ppcTopError;

#define VOX_SUCCESS     1
#define VOX_BUF_FULL    -1
#define VOX_MAX_SAMPLE  -2
#define VSC_ERROR       -3

extern short SPK_VOLUME0;
extern short SPK_PREDATA;
extern short SPK_SOFTENING;

typedef struct {
    short offset;
    short shift;
    short limit;
} Slparam;


#ifdef SPK_8BIT
#define SPK_OFFSET    0x80  /* for 8bit D/A or PWM output */
#define SPK_LIMIT     0xfe  /* */
#define SPK_SHIFT     2     /* 10bit -> 8bit */
#define VSX_SPK_SHIFT 4     /* 12bit -> 8bit */
#define ADP_SPK_SHIFT 6     /* 14bit -> 8bit */
#else
#define SPK_OFFSET    0x200 /* for 10bit PWM output */
#define SPK_LIMIT     0x3fe /* */
#define SPK_SHIFT     0     /* 10bit -> 10bit */
#define VSX_SPK_SHIFT 2     /* 12bit -> 10bit */
#define ADP_SPK_SHIFT 4     /* 14bit -> 10bit */
#endif

#ifdef COMPRESS_TOOL
#define LIS_SHIFT     0
#define ADP_LIS_SHIFT 0
#define VSX_LIS_SHIFT 0
#define LIS_OFFSET    0
#else
#define LIS_OFFSET -512     /* for A/D convertor 10 bit unsigned data */
#define LIS_SHIFT     0     /* 10bit -> 10bit */
#define VSX_LIS_SHIFT 2     /* 10bit -> 12bit */
#define ADP_LIS_SHIFT 4     /* 10bit -> 14bit */
#endif
#endif  // #ifndef VOXTOP_H

#define SPLIS_LSHIFT    0x10
#define SPLIS_RSHIFT    0

#define PACKET_SIZE     128

#ifdef SPK_8BIT
#define SPK_PACKET_SIZE 128
#else
#define SPK_PACKET_SIZE 256
#endif 

#define SPLIS_BUF_SIZE  SPK_PACKET_SIZE*3


#ifdef CLOCK40
#define VOX_CPU_CLOCK   40000000
#define SPK_SOFT        1
#else
#define VOX_CPU_CLOCK   20000000
#define SPK_SOFT        3
#endif


/* vox top level function */

unsigned char* vsxSpeak(unsigned char*, int);
unsigned char* vsxListen(int, int, unsigned char*, unsigned char, short);

unsigned char* adpcmSpeak(unsigned char *);
unsigned char* adpcmListen(int, int, unsigned char *, unsigned char, unsigned char *);

unsigned char* voxSpeak(unsigned char *, int, int);
unsigned char* vox2Speak(unsigned char *, int, int);
unsigned char* voxListen(int , int , unsigned char *, unsigned char *);

unsigned char* ppcSpeak(unsigned char*, int, int);
unsigned char* ppcListen(int, int, unsigned char*, unsigned char*);

unsigned char* pcmSpeak(short *);
unsigned char* pcmListen(short *, int);

/* filter function */
int fltInit(int);
int fltFiltering(short *, short *, short);

/* common function */
void setSpeakVolume(short);
void setSpeakSoftening(char);
void voxCodecpy(int*, int*, int* );
void adpcmCodecpy(unsigned char);

/* speak and listen utility */
void slLis2Pcm(short* Src, short* Dst, int Length, Slparam* slParam);
void slPcm2Spk(short* Src, short* Dst, int Length, Slparam* slParam);




