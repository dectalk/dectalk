/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	12	05/14/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	11	05/14/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	10	05/14/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	9	05/14/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	8	05/14/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	7	05/14/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	6	05/14/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	05/14/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	05/14/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	05/14/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	05/14/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	05/14/97	leeber	Initial Version
$
 * Revision 1.1.2.2  1995/07/05  18:14:25  Krishna_Mangipudi
 * 	Moved from ./src/clients
 * 	[1995/07/05  18:13:09  Krishna_Mangipudi]
 *
 * Revision 1.2.2.2  1994/11/07  22:41:22  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  22:11:45  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
 * $EndLog$
 */
/*
**++
** FACILITY:  Workstation Multimedia  (WMM)  v1.0 
** 
** FILE NAME:   
** MODULE NAME: 
**
** MODULE DESCRIPTION: 
** 
** DESIGN OVERVIEW: 
** 
**--
*/
/****************************************************************************
**
**  Copyright (c) Digital Equipment Corporation, 1994 All Rights Reserved.
**  Unpublished rights reserved under the copyright laws of the United States.
**  The software contained on this media is proprietary to and embodies the
**  confidential technology of Digital Equipment Corporation.  Possession, use,
**  duplication or dissemination of the software and media is authorized only
**  pursuant to a valid written license from Digital Equipment Corporation.
**
**  RESTRICTED RIGHTS LEGEND   Use, duplication, or disclosure by the U.S.
**  Government is subject to restrictions as set forth in Subparagraph
**  (c)(1)(ii) of DFARS 252.227-7013, or in FAR 52.227-19, as applicable.
**
****************************************************************************/


/*****************************************************************************
**  PROGRAM:
**      loadgif.c 
**
**  ABSTRACT:
**
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     DAVE 
**       (Dectalk Audio Visual Engineer)
**
**  CREATION DATE:
**     June 10, 1993
**
**  MODIFICATION HISTORY:
**
*******************************************************************************/

/*************************************************************************** 
** Standard header files 
***************************************************************************/
#include <stdio.h>
#include <string.h>

/*************************************************************************** 
** Header files used by all apps using widgets 
***************************************************************************/
#include <Xm/Xm.h>

/***************************************************************************
** Function forward declarations
***************************************************************************/
Pixmap InternalGifGet();   

/***************************************************************************
** Globals 
***************************************************************************/

/***************************************************************************
* GIF headers found in the file
***************************************************************************/
#define WHERE static

typedef unsigned char byte;

/* X stuff */
WHERE Display       *theDisp;
WHERE int           dispcells;
WHERE Colormap      theCmap, LocalCmap;
WHERE Visual        *theVisual;
WHERE XImage        *theImage;

/* global vars for loading the GIF files*/
WHERE unsigned long  cols[256];
WHERE int            quiet, local, DEBUG;

#define IMAGESEP 0x2c
#define EXTENSION 0x21
#define INTERLACEMASK 0x40
#define COLORMAPMASK 0x80
#define ADDTOPIXEL(a) if (Quick) Image[Offset++]=a; else AddToPixel(a)

#define ALLOCATED 3

static int BitOffset,		/* Bit Offset of next code */
    XC, YC,                     /* Output X and Y coords of current pixel */
    Offset,                     /* Offset in output array */
    Pass,			/* Used by output routine if interlaced pic */
    Width, Height,		/* image dimensions */
    BytesPerScanline,		/* bytes per scanline in output raster */
    ColorMapSize,		/* number of colors */
    Background,			/* background color */
    NumUsed,			/* Number of colors really used */
    CodeSize,			/* Code size, read from GIF header */
    ReadMask,			/* Code AND mask for current code size */
    Interlace,
    HasColormap;

static byte *Image;		/* The result array */
static byte *Raster;		/* The raster data stream, unblocked */


    /* The hash table used by the decompressor */
static int  Prefix[4096];
static int  Suffix[4096];


    /* The color map, read from the GIF header */
static byte Red[256], Green[256], Blue[256], used[256];

/****************************************************************************
**
**  ReadImageData 
**
**  FUNCTIONAL DESCRIPTION:
**
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
**
****************************************************************************/
int ReadImageData( FILE *fp )
{
    long filesize, filepos;
    int ch;
    byte *ptr1;

    filepos = ftell( fp );
    fseek( fp, 0L, 2 );
    filesize = ftell( fp ) - filepos;
    fseek( fp, filepos, 0 );

    if( !(Raster = (byte *) malloc( filesize )))
      return( 1 );

    ptr1 = Raster;
    while(( ch = getc( fp )) > 0 )
    {
	if( (int) fread( ptr1, 1, ch, fp ) < (int) ch)
	    return( 1 );
	ptr1 += ch;
    }

    return( 0 );
}

/****************************************************************************
**
**  ReadCode 
**
**  FUNCTIONAL DESCRIPTION:
**
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
**
****************************************************************************/
int ReadCode()
{
    int RawCode, ByteOffset, BitShift;

    ByteOffset = BitOffset / 8;
    BitShift = BitOffset % 8;
    BitOffset += CodeSize;
    if( BitShift + CodeSize < 8 )
        return(( Raster[ByteOffset] >> BitShift ) & ReadMask );
    else {
	RawCode = Raster[ByteOffset] + (0x100 * Raster[ByteOffset + 1]);
	if( BitShift + CodeSize >= 16 )
	    RawCode += (0x10000 * Raster[ByteOffset + 2]);
	return((RawCode>>BitShift) & ReadMask);
    }
}

/****************************************************************************
**
**  AddToPixel 
**
**  FUNCTIONAL DESCRIPTION:
**
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
**
****************************************************************************/
void AddToPixel( byte Index )
{
    if( YC < Height ) 
	Image[YC*BytesPerScanline+XC] = Index;

    if( !used[Index] ) {
	used[Index] = TRUE;
	NumUsed++;
    }
    if( ++XC == Width ) {
	XC = 0;
	if( Interlace ) {
	    switch( Pass ) {
		case 0: YC += 8; if( YC >= Height ) {Pass++, YC = 4; } break;
		case 1: YC += 8; if( YC >= Height ) {Pass++, YC = 2; } break;
		case 2: YC += 4; if( YC >= Height ) {Pass++, YC = 1; } break;
		case 3: YC += 2; break;
		default: break;
	    }
	}
	else 
	    YC++;
    }
}

/****************************************************************************
**
**  DecodeImage 
**
**  FUNCTIONAL DESCRIPTION:
**
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
**
****************************************************************************/
int DecodeImage()
{
    /* An output array used by the decompressor */
    static byte OutCode[1025];
    int Quick = 0,
	InitCodeSize = 0,
	InCode = 0,
	MaxCode = 0,
	ClearCode = 0,
	EOFCode = 0,
	CurCode = 0,
	OldCode = 0,
	FreeCode = 0,
	OutCount = 0,
	FinChar = 0,
	BitMask = 0;

    BitMask = ColorMapSize - 1;

    ClearCode = ( 1 << CodeSize );
    EOFCode = ClearCode + 1;
    FreeCode = ClearCode + 2;

    CodeSize++;
    InitCodeSize = CodeSize;
    MaxCode = ( 1 << CodeSize );
    ReadMask = MaxCode - 1;

    if( !(Image = (byte *)malloc(Width * Height)))
	return( 1 );

    BytesPerScanline = Width;

    /***************************************************/
    /* Decompress the file, continuing until you see   */
    /* the GIF EOF code.  One obvious enhancement is   */
    /* to add checking for corrupt files here.         */
    /***************************************************/

    Quick = (local && !Interlace);
    Offset = 0; 

    if (DEBUG) fprintf(stderr,"Decoding...\n");

    InCode = ReadCode();

    while (InCode != EOFCode) {

        /***************************************************/
        /* Clear code sets everything back to its initial  */
        /* value, then reads the immediately subsequent    */
        /* code as uncompressed data.                      */ 
        /***************************************************/ 

        if (InCode == ClearCode) {
	    CodeSize = InitCodeSize;
	    MaxCode = (1 << CodeSize);
	    ReadMask = MaxCode - 1;
	    FreeCode = ClearCode + 2;
	    CurCode = OldCode = InCode = ReadCode();
	    FinChar = CurCode & BitMask;
	    ADDTOPIXEL(FinChar);
        }
        else {

            /***************************************************/ 
            /* If not a clear code, then must be data: save    */
            /* same as CurCode */
            /***************************************************/ 

	    CurCode = InCode;

            /***************************************************/ 
            /* If greater or equal to FreeCode, not in the hash*/
            /* table yet; repeat the last character decoded    */
            /***************************************************/ 

	    if (CurCode >= FreeCode) {
	        CurCode = OldCode;
	        OutCode[OutCount++] = FinChar;
	    }

            /***************************************************/ 
            /* Unless this code is raw data, pursue the chain  */
	    /* pointed to by CurCode through the hash table to */
	    /* its end; each code in the chain puts its        */
	    /* associated output code on the output queue.     */
            /***************************************************/ 
	    while (CurCode > BitMask) {
	        if (OutCount >= 1024) {
	    	    fprintf(stderr,"\nCorrupt GIF file (OutCount)!\n");
                    exit(1);  
                }
	        OutCode[OutCount++] = Suffix[CurCode];
	        CurCode = Prefix[CurCode];
	    }

            /******************************************************/ 
            /* The last code in the chain is treated as raw data. */
            /******************************************************/ 
	    /* OutCode[OutCount++] = FinChar = CurCode &BitMask*/;
	    FinChar = CurCode & BitMask;
	    ADDTOPIXEL(FinChar);

            /*******************************************************/ 
	    /* Now we put the data out to the Output routine. It's */
	    /* been stacked LIFO, so deal with it that way...      */
            /*******************************************************/ 
	    while (OutCount>0)
	        ADDTOPIXEL(OutCode[--OutCount]);

            /*******************************************************/ 
            /* Build the hash table on-the-fly. No table is stored */
	    /* in the file.                                        */
            /*******************************************************/ 

	    Prefix[FreeCode] = OldCode;
	    Suffix[FreeCode] = FinChar;
	    OldCode = InCode;

            /*******************************************************/ 
            /* Point to the next slot in the table.  If we exceed  */
	    /* the current MaxCode value, increment the code size  */
	    /* unless it's already 12.  If it is, do nothing: the  */
	    /* next code decompressed better be CLEAR              */
            /*******************************************************/ 

	    FreeCode++;
	    if (FreeCode >= MaxCode) {
	        if (CodeSize < 12) {
		    CodeSize++;
		    MaxCode *= 2;
		    ReadMask = (1 << CodeSize) - 1;
	        }
	    }
        }
	InCode = ReadCode();
    }

    free(Raster);
    return 0;
}


/****************************************************************************
**
**  ColorDicking 
**
**  FUNCTIONAL DESCRIPTION:
**
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
**
****************************************************************************/
int ColorDicking()
{
    /* we've got the picture loaded, we know what colors are needed. get 'em */
    int i,j;
    register byte *ptr;
    static Window  mainW;
    static XColor  defs[256];
    static int EGApalette[16][3] = {
  		{0,0,0},       {0,0,128},     {0,128,0},     {0,128,128}, 
  		{128,0,0},     {128,0,128},   {128,128,0},   {200,200,200},
  		{100,100,100}, {100,100,255}, {100,255,100}, {100,255,255},
  		{255,100,100}, {255,100,255}, {255,255,100}, {255,255,255} };

    if (!HasColormap)
    {
	if (DEBUG) fprintf(stderr,"Using EGA palette as default\n");
        for (i=0; i<ColorMapSize; i++) {
            Red[i] = EGApalette[i&15][0];
            Green[i] = EGApalette[i&15][1];
            Blue[i] = EGApalette[i&15][2];
            used[i] = True;
	    }
    }

    for (i=j=0; i<ColorMapSize; i++)
    {
        if (local || used[i])
	{
	    defs[i].red   = Red[i]<<8;
	    defs[i].green = Green[i]<<8;
	    defs[i].blue  = Blue[i]<<8;
	    defs[i].flags = DoRed | DoGreen | DoBlue;
	    defs[i].pixel = i;
        }
    }
    if (local && HasColormap)
    { 
	LocalCmap=XCreateColormap(theDisp,mainW,theVisual,AllocAll);
	XStoreColors(theDisp,LocalCmap,defs,ColorMapSize);
	return 0;
    }

    if (!quiet) fprintf(stderr,"Allocating %d colors...\n",NumUsed);

    /* Allocate the X colors for this picture */
    for (i=j=0; i<ColorMapSize; i++)
    {
        if (local || used[i])
	{
            if (!XAllocColor(theDisp,theCmap,&defs[i])
	      || defs[i].red != Red[i]<<8
	      || defs[i].green != Green[i]<<8
              || defs[i].blue != Blue[i]<<8) /* Not an exact match! */
	    { 
                j++;
		defs[i].pixel = 0xffff;
            }
	    else used[i]=ALLOCATED;
            cols[i] = defs[i].pixel;
        }
	else cols[i]=i;
    }
    if (j) 		/* failed to pull it off */
    {
        XColor ctab[256];
        int dc = (dispcells<256) ? dispcells : 256;

        if (!quiet)
	    fprintf(stderr,"Failed to allocate %d out of %d colors. \n%s",
			  j,NumUsed,  "   Searching for resembling colors\n");

        /* read in the color table */
        for (i=0; i<dc; i++) ctab[i].pixel = i;
        XQueryColors(theDisp, theCmap, ctab, dc);
                
        /* run through the used colors.  any used color that has a pixel
           value of 0xffff wasn't allocated.  for such colors, run through
           the entire X colormap and pick the closest color */

        for (i=0; i<ColorMapSize; i++)
	{
            if (used[i] && cols[i]==0xffff)   /* an unallocated pixel */
	    {
                long mdist = 0x7FFFFFFL;  /* MAXLONG */
		int close = -1;
                long d;
                long r = Red[i]<<8;
                long g = Green[i]<<8;
                long b = Blue[i]<<8;

                for (j=0; j<dc; j++)
		{
                    d = 5*abs(r-ctab[j].red)
		      + 3*abs(g-ctab[j].green) +
		        1*abs(b-ctab[j].blue);
                    if (d<mdist) { mdist=d; close=j; }
                }
                if (close<0) return 1;
                cols[i] = ctab[close].pixel;
            }
        }	
    }
    if (!quiet) fprintf(stderr, "Building XImage...\n");
    ptr = Image;
    for (i=0; i<Height; i++)
        for (j=0; j<Width; j++,ptr++) 
            *ptr = (byte) cols[*ptr];
    return 0;
}


/****************************************************************************
**
**  ReadColormap 
**
**  FUNCTIONAL DESCRIPTION:
**
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
**
****************************************************************************/
void ReadColormap( FILE *fp )
{
    static byte colormap[3*256];
    byte *ptr=colormap;
    int i;

    if (DEBUG) fprintf(stderr,"Reading Color map...\n");
    fread(colormap, ColorMapSize, 3, fp);
    for (i = 0; i < ColorMapSize; i++) {
        Red[i] = (*ptr++);
        Green[i] = (*ptr++);
        Blue[i] = (*ptr++);
        used[i] = 0;
    }
    NumUsed=0;
}


/****************************************************************************
**
**  LoadGIF 
**
**  FUNCTIONAL DESCRIPTION:
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
**
****************************************************************************/
int LoadGIF( char *fname )
{
    /* The GIF headers found in the file */
    static byte gifheader[13];
    static byte imageheader[9];

    register byte ch;
    FILE *fp;
    static char id[] = "GIF"; 

    BitOffset = 0,		/* Bit Offset of next code */
    XC = 0, YC = 0,		/* Output X and Y coords of current pixel */
    Offset = 0,                 /* Offset in output array */
    Pass = 0;			/* Used by output routine if interlaced pic */
    ColorMapSize = 0;
    Image = NULL;

    fp = fopen(fname,"r");

    if (!fp) return 1;

    if ( (fread(gifheader, sizeof(gifheader), 1, fp)!=1)
      || (strncmp((char *) gifheader, id, 3)!=0)) {
      fclose(fp);
      return 1;
    }
    if (strncmp((char *) gifheader+3, "87a", 3) &&
	strncmp((char *) gifheader+3, "89a", 3))
	fprintf(stderr,"Warning: %s contains unknown version %c%c%c",
	   fname,gifheader[3],gifheader[4],gifheader[5]);
    HasColormap = ((gifheader[10] & COLORMAPMASK) ? True : False);
    ColorMapSize = 1 << (gifheader[10]&7)+1;

    Background = gifheader[11];		/* background color... not used. */

    /* Read in global colormap. */
    if (HasColormap) ReadColormap(fp);

    /* Check for image extension */
    while ((ch=getc(fp)) == EXTENSION) {
	getc(fp);			/* skip extension code */
	while ((ch=getc(fp))>0)
	    fseek(fp, ch, 1);		/* skip it */
    }
	
    if (ch != IMAGESEP) {
      fclose(fp);
      return 1;
    }

    fread(imageheader,sizeof(imageheader),1,fp);

    Width  = imageheader[4] + 0x100 * imageheader[5];
    Height = imageheader[6] + 0x100 * imageheader[7];

    if (!quiet) 
        fprintf(stderr,"%s: %dx%dx%d\n", fname, Width, Height, ColorMapSize);

    Interlace = ((imageheader[8] & INTERLACEMASK) ? True : False);

    if (imageheader[8] & COLORMAPMASK) 
    {
        HasColormap = True;
        ColorMapSize = 1 << (imageheader[8]&7)+1;
        ReadColormap(fp);
    }
    CodeSize = getc(fp); 
    if (!ReadImageData(fp)) {
      fclose(fp);
      if (DecodeImage())
	return 1;
      return 0;
    } else {
      fclose(fp);
      return 1;
    }
}


/****************************************************************************
**
** InternalGifGet --
**
**      This procedure is invoked to read a Gif file.
**
** Results:
**      A standard Tcl result.
**
** Side effects:
**      None
**
****************************************************************************/
Pixmap InternalGifGet( Display *display, char *filename )   
{
  XGCValues gcv;
  GC gc;
  Pixmap pixmap; 
  static Window rootW;
  static int theScreen;

  DEBUG     = 0;
  Image     = NULL;
  quiet     = 1;
  local     = 0;
  LocalCmap = 0;
  theDisp   = display;
  theScreen = DefaultScreen(theDisp);
  theCmap   = DefaultColormap(theDisp, theScreen);
  rootW     = RootWindow(theDisp, theScreen);
  theVisual = DefaultVisual(theDisp, theScreen);
  dispcells = DisplayCells(theDisp, theScreen);

  /* load and prepare gif */
  if( LoadGIF(filename) ) {
    fprintf(stderr,"Error opening up the GIF file\n");
    exit(0);
  }
  ColorDicking(); 

  /* create pixmap */
  pixmap = XCreatePixmap(theDisp, rootW,
			  Width, Height,
			  DefaultDepth(theDisp, theScreen));

  if (DefaultDepth(theDisp, theScreen) == 1) {
    gcv.function = GXcopy;
    gcv.foreground = BlackPixel(theDisp, theScreen);
    gcv.background = WhitePixel(theDisp, theScreen);
    gc = XCreateGC(theDisp, pixmap, 
		    GCFunction | GCForeground | GCBackground, 
		    &gcv);
    theImage = XCreateImage(theDisp, theVisual,
			    DefaultDepth(theDisp, theScreen),
			    XYBitmap, (int) NULL, (char *)Image,
			    Width, Height, 8, (int) NULL);
    theImage->bitmap_bit_order = MSBFirst;
    theImage->byte_order = MSBFirst;
    XPutImage(theDisp, pixmap, gc, theImage, 0, 0, 0, 0,
	      theImage->width, theImage->height);
  } 
  else {
      gcv.function = GXcopy;
      gc = XCreateGC(theDisp, pixmap, GCFunction, &gcv);
      theImage = XCreateImage(theDisp, theVisual, 8, ZPixmap, 0,
			      (char *)Image, Width, Height, 8, Width);
      theImage->byte_order = MSBFirst;
      XPutImage(theDisp, pixmap, gc, theImage, 0, 0, 0, 0,
		theImage->width, theImage->height);
  }
  
  /* clean up */
  if (theImage) {
    XDestroyImage(theImage);
    theImage = NULL;
  } else {
    if (Image) {
      XFree(Image);
      Image = NULL;
    }
  }
  XFreeGC(theDisp, gc);

  return( pixmap );
}
