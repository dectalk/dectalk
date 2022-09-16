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
 *    File Name:	186.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  80186 i/o register and bit definitions ... 
 *
 ***********************************************************************
 *    Revision History:
 * 13dec95	...tek		merge dtex
 *
 */
 
#ifndef r186H
#define r186H 1

/*#ifndef  R186_REG_DEFS */
/*#define  R186_REG_DEFS   1  */

#ifndef DTEX /* express doesn't have a 186.. */

extern   unsigned int r186_io_base;

/*
 * relocation register ...
 */

#define  R186_RELREG  (r186_io_base + 0xFE)

/*
 *  memory controller registers ...
 */

#define  R186_UMCS    (r186_io_base + 0xA0)
#define  R186_LMCS    (r186_io_base + 0xA2)
#define  R186_PACS    (r186_io_base + 0xA4)
#define  R186_MPCS    (r186_io_base + 0xA8)
#define  R186_MMCS    (r186_io_base + 0xA6)

/*
 *  dma controllers ...
 */

#define  R186_DMA0_CW     (r186_io_base + 0xCA)
#define  R186_DMA0_TC     (r186_io_base + 0xC8)
#define  R186_DMA0_DPH    (r186_io_base + 0xC6)
#define  R186_DMA0_DPL    (r186_io_base + 0xC4)
#define  R186_DMA0_SPH    (r186_io_base + 0xC2)
#define  R186_DMA0_SPL    (r186_io_base + 0xC0)


#define  R186_DMA1_CW     (r186_io_base + 0xDA)
#define  R186_DMA1_TC     (r186_io_base + 0xD8)
#define  R186_DMA1_DPH    (r186_io_base + 0xD6)
#define  R186_DMA1_DPL    (r186_io_base + 0xD4)
#define  R186_DMA1_SPH    (r186_io_base + 0xD2)
#define  R186_DMA1_SPL    (r186_io_base + 0xD0)

/*
 * DMA Control word bit defs 
 */

#define WORD    0x0001                  /* Word mode (not byte mode)    */
#define START 0x0002                    /* Start channel (with CHG).    */
#define STOP    0x0000                  /* Stop channel  (with CHG).    */
#define CHG     0x0004                  /* Write alters ST/STOP bit     */
#define TDRQ    0x0010                  /* Timer #2 triggers DMA cycle  */
#define HIPCH   0x0020                  /* High priority channel        */
#define USYN    0x0000                  /* Unsynchronized               */
#define SSYN    0x0040                  /* Source synchronization       */
#define DSYN    0x0080                  /* Destination synchronization  */
#define INT     0x0100                  /* Interrupt enable on TC stop  */
#define TC         0x0200                       /* Stop DMA on TC               */
#define SINC    0x0400                  /* Increment source             */
#define SDEC    0x0800                  /* Decrement source             */
#define SIO     0x0000                  /* Source is I/O                */
#define SMEM    0x1000                  /* Source is memory             */
#define DINC    0x2000                  /* Increment destination        */
#define DDEC    0x4000                  /* Decrement destination        */
#define DIO     0x0000                  /* Destination is I/O           */
#define DMEM    0x8000                  /* Destination is memory        */



/*
 *  timer control ...
 */

#define  R186_TIM0_CW    (r186_io_base + 0x50)
#define  R186_TIM0_MXA   (r186_io_base + 0x52)
#define  R186_TIM0_MXB   (r186_io_base + 0x54)
#define  R186_TIM0_CNT   (r186_io_base + 0x56)

#define  R186_TIM1_CW    (r186_io_base + 0x58)
#define  R186_TIM1_MXA   (r186_io_base + 0x5A)
#define  R186_TIM1_MXB   (r186_io_base + 0x5C)
#define  R186_TIM1_CNT   (r186_io_base + 0x5E)

#define  R186_TIM3_CW    (r186_io_base + 0x60)
#define  R186_TIM3_MXA   (r186_io_base + 0x62)
#define  R186_TIM3_CNT   (r186_io_base + 0x66)

/*
 *  Interrupt controller
 */

#define  R186_INT_EOI     (r186_io_base + 0x22)
#define  R186_INT_POLL    (r186_io_base + 0x24)
#define  R186_INT_POLL_ST (r186_io_base + 0x26)
#define  R186_INT_MASK    (r186_io_base + 0x28)
#define  R186_INT_PMASK   (r186_io_base + 0x2A)
#define  R186_INT_SERV    (r186_io_base + 0x2C)
#define  R186_INT_REQ     (r186_io_base + 0x2E)
#define  R186_INT_STAT    (r186_io_base + 0x30)
#define  R186_INT_TIM     (r186_io_base + 0x32)
#define  R186_INT_DMA0    (r186_io_base + 0x34)
#define  R186_INT_DMA1    (r186_io_base + 0x36)
#define  R186_INT_0       (r186_io_base + 0x38)
#define  R186_INT_1       (r186_io_base + 0x3A)
#define  R186_INT_2       (r186_io_base + 0x3C)
#define  R186_INT_3       (r186_io_base + 0x3E)

#endif /*DTEX*/
#endif
