#define ROMBASE      0xC00000L
#define ROMSIZE      (512*1024)


#define GPIO         0x2e0
/*
 *  gpio interface ...
 */
#define	DSP_RESET		(0x1)
#define	V5BOFF			(0x2)
#define	VPPON			(0x4)
#define	DSPDMADONE		(0x8)
#define	EXTPWR			(0x10)
#define	BATTOK			(0x20)
#define	V5BOK			(0x40)
#define	DSPFAULT		(0x80)

#define UART         0x2f8

#define NUMSAMPLES   64

#define DMA_CHANNEL  7

/* dma controller.. */
#define LOW_DMA_MODE		0x0b

#define DMA_ADDR_REG 		0xcc
#define DMA_COUNT_REG 		0xce
#define DMA_STAT_CMD 		0xD0
#define DMA_REQUEST 		0XD2
#define DMA_SINGLE_MASK	0XD4
#define DMA_MODE		0XD6
#define DMA_CLRPTR		0XD8
#define DMA_MASTERCLEAR	0XDA
#define DMA_CLRMASK		0XDC
#define DMA_ALLMASK		0XDE

#define DMA_PAGE5		0X8B
#define DMA_PAGE6		0X89
#define DMA_PAGE7		0X8A

#define DMA_BLOCK    0x80
#define DMA_READ     0x08
#define DMA_DEMAND   0x00


extern short int irq0vec, irq1vec, irq2vec, irq3vec, irq4vec, irq4vec;
extern short int irq5vec, irq6vec, irq7vec, irq8vec;

/* interrupt controller */
#define PIC0	0x20
#define PIC1	0xa0

#define INT_OFF	asm("cli");
#define INT_ON		asm("sti");

#define S_EOI	(0x60)



/* uart*/
#define UART_IER	(UART+1)
#define UART_LSR	(UART+5)


#define ETBEI	(BIT1)
#define TEMT	(BIT6)


struct digitized_packet
	{
	short int type;
	unsigned short int samples[NUMSAMPLES];
	};

#define DIGITIZED_PKT 0x05
