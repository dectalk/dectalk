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
 *    File Name:	wsr_tty.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  WSR DECtalk PC screen handling routines ...     
 *
 ***********************************************************************
 *    Revision History:
 *  001  ADN JUN-29-95  Fixed the layout of the window so the first 
 *								character does not get cut off.
 */

#include	"wsr.h"


/*
 *  globals ..
 */

char	ScreenBuff[MaxLines][MaxChars+2];

short	nFirstLine;
short nLastLine;
short nCurrPos;
int	LastScroll;

/*
 *  static private ...
 */

int	nStdioCharWidth;
int	nStdioCharHeight;
HFONT	hOldFont;

/*
 *  SetupTTY() ... sets up the window for display ...
 */

void	wsrSetupTTY(hDC)
HDC hDC;
{
    RECT	rRect;

    GetClientRect(wsrWnd,&rRect);
    SetViewportOrg(hDC,0,rRect.bottom - ((MaxLines+1) * nStdioCharHeight));
    SetMapMode(hDC, MM_ANISOTROPIC);
    SetWindowExt(hDC,0,0);
    SetViewportExt(hDC,nStdioCharWidth,nStdioCharHeight);
    SetBkMode(hDC,OPAQUE);
    hOldFont = SelectObject(hDC,GetStockObject(TTY_FONT));
}

/*
 *  GetTTYLine() returns a pointer to the desired line ... since the
 *  screen is a ring of lines ...
 */


LPSTR wsrGetTTYLine(which)
short which;
{
    short pos;

    pos = nLastLine + 1;  
    if(pos == MaxLines)
		pos = 0;
    pos = pos + which;
    if(pos > MaxLine)
		pos = pos - MaxLines;
    return((LPSTR)&ScreenBuff[pos][0]);
}

/*
 *  putTTY() places a null terminated string into the buffers ...
 */


void wsrPutTTY(hDC,psOutput)
HDC hDC;
char __far *psOutput;
{
	int	i, j;
	char	*psBuff;
	int	iLinesOut;


	iLinesOut = 0;
	psBuff = ScreenBuff[nLastLine];

	for(i=0;psOutput[i];i++)
		{
		switch(psOutput[i])
			{
/*
 *  cr the current output position back ...
 */

			case '\r':
			   nCurrPos = 0;
            break;

/*
 *  new line ...
 */
			case '\n':

				LastScroll += 1;
				if(IndexFlag)
					wsrScrollIndex();
				for(j=0;j<nCurrPos;j++) 
					psBuff[j] = ' ';
				TextOut(hDC,0,MaxLine,psBuff,j);
				nLastLine = (nLastLine == MaxLine) ? 0 : nLastLine+1;
	  		  	psBuff = ScreenBuff[nLastLine];
	    		for(j=0; j<MaxChars; j++)
					psBuff[j] = '\0';
				nCurrPos = 0;
		 		ScrollWindow(wsrWnd,0,-nStdioCharHeight,NULL,NULL);
				UpdateWindow(wsrWnd);
				break;

			case '\t' :

				j = TAB_SETTING - ((nCurrPos-1) % TAB_SETTING);
				while(j-- && nCurrPos < MaxChars-1)
					{
			        TextOut(hDC,nCurrPos,MaxLine," ",1);
					psBuff[nCurrPos++] = ' ';
					}
				break;


			case '\b':

	   	 	if(nCurrPos > 0)
					{
					nCurrPos -= 0;
					psBuff[nCurrPos] = '\0';
			        TextOut(hDC,nCurrPos,MaxLine," ",1);
	    		 	}
	    		break;

			default:

 				if(nCurrPos < MaxChars-1)
					{
					TextOut(hDC,nCurrPos,MaxLine,&psOutput[i],1);
					psBuff[nCurrPos++] = psOutput[i];
					}
				break;
			}
		}
}

/*
 *  wsrPaintTTY() redraws the screen when needed ...
 */

void wsrPaintTTY()
{
   LPSTR psLine;
   int i,len;
   PAINTSTRUCT ps;
   HDC hDC;
   RECT rcUpdate;
   int nVPaintBeg, nVPaintEnd, nHPaintBeg, nHPaintEnd;

	if(GetUpdateRect(wsrWnd,&rcUpdate,FALSE) == 0)
		return;
	hDC = BeginPaint(wsrWnd, (LPPAINTSTRUCT)&ps );
	wsrSetupTTY(hDC);
	rcUpdate = ps.rcPaint;
	DPtoLP(hDC,(POINT *) &rcUpdate, 2);

/*
 *  figure out which lines need to be displayed ...
 */

    nVPaintBeg = max(0,rcUpdate.top-LastScroll-1);
    nVPaintEnd = min(MaxLines,rcUpdate.bottom+1);
    nHPaintBeg = max (0, rcUpdate.left);
    nHPaintEnd = min (MaxChars, rcUpdate.right+1);

/*
 *  paint them ...
 */

	for(i=nVPaintBeg; i<nVPaintEnd; i++)
		{
	    psLine = wsrGetTTYLine(i)+nHPaintBeg;
		if(len=lstrlen(psLine))
	      TextOut(hDC,nHPaintBeg,i,psLine,len);
      }
	if(IndexFlag && highlight_index != NULL_INDEX)
		wsrSetHighLight(highlight_index,TRUE);
	SelectObject(hDC,hOldFont);
    EndPaint(wsrWnd, (LPPAINTSTRUCT)&ps);
		
}

/*
 *  set up the tty static data structures ...
 */


void wsrInitTTY()
{
    int i,j;
    HDC hDC;
    TEXTMETRIC Metrics;

    for(i=0; i<MaxLines; i++)
		for(j=0; j<=MaxChars; j++)
		    ScreenBuff[i][j] = '\0';
	 for(i=0;i<MaxLines;i++)
		ScreenBuff[i][0]=' ';

    nFirstLine = 0;
    nLastLine = MaxLine;
    nCurrPos = 1;

/*
 *  get the font metrics ..
 */

    hDC = GetDC(wsrWnd);
    hOldFont = SelectObject(hDC,GetStockObject(TTY_FONT));
    GetTextMetrics(hDC,&Metrics);
    SelectObject(hDC,hOldFont);
    ReleaseDC(wsrWnd,hDC);

/*
 *  save the max height and width ..
 */
	nStdioCharWidth = Metrics.tmMaxCharWidth;
    nStdioCharHeight = Metrics.tmHeight + Metrics.tmExternalLeading;

/*
 *  Repaint the whole things ...
 */

	InvalidateRect(wsrWnd,NULL,TRUE);

}


void wsrClearTTY()
{
    int i,j;
    

    for(i=0; i<MaxLines; i++)
		for(j=0; j<=MaxChars; j++)
		    ScreenBuff[i][j] = '\0';
	 for(i=0;i<MaxLines;i++)
		ScreenBuff[i][0]=' ';

    nFirstLine = 0;
    nLastLine = MaxLine;
    nCurrPos = 1;

	InvalidateRect(wsrWnd,NULL,TRUE);
}


/*
 *  Output a string ...
 */

void wsrTextOut(str)
 char __far *str;
{
   HDC hDC;

   hDC = GetDC(wsrWnd);
   wsrSetupTTY(hDC);
   SetBkColor(hDC,BACK_NORMAL);
   SetTextColor(hDC,TEXT_NORMAL);
   wsrPutTTY(hDC,str);
   SelectObject(hDC,hOldFont);
   ReleaseDC(wsrWnd,hDC);
}

void wsrHighLightText(hx,hy,len,color)
int	hx,hy,len;
BOOL	color;
{
	HDC hDC;
	LPSTR psLine;

	hDC = GetDC(wsrWnd);
	wsrSetupTTY(hDC);
	if(color)
		{
		SetTextColor(hDC,TEXT_HIGHLIGHT);
		SetBkColor(hDC,BACK_HIGHLIGHT);
		}
	psLine = wsrGetTTYLine(hx) + hy;
	TextOut(hDC,hy,hx,psLine,len);
	if(color)
		{
		SetTextColor(hDC,TEXT_NORMAL);
		SetBkColor(hDC,BACK_NORMAL);
		}
	SelectObject(hDC,hOldFont);
	ReleaseDC(wsrWnd,hDC);
}


