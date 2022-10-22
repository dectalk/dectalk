/************************************************************************/
/* SPEAK SAMPLE PROGRAM FOR THE DECTALK SOFTWARE                        */
/************************************************************************/



#include <windows.h>
#include <commdlg.h>
#include <dlgs.h>       // includes common dialog template defines
#include <cderr.h>      // includes the common dialog error codes
#include <mmsystem.h>
#include <io.h>
#include <stdio.h>
#include <tchar.h>		// For TCHAR mappings 
#include <string.h>
#include <stdlib.h>
#include "ttsapi.h"
#include "speakmul.h"
#include "resource.h"
#include "afxres.h"


#define rateMax 600
#define rateMin 50

#define RATE 0
#define VOLUME 1
#define PLAY 9
#define PAUSE 10
#define STOP 11

#define IDC_BUTTON  1
#define IDR_BUTTON      200
#define IDR_BUTTONS     201

#define fbWidth 64     //face buttons
#define fbHeight 64

#define stWidth  100    //static text for rate control
#define stHeight 20

#define sbWidth  154    //scroll bar fore rate control
#define sbHeight 17

#define slWidth  100    //Static text for Label Speaking Rate
#define slHeight 20

#define border 2

#define pbWidth 32      // push buttons
#define pbHeight 32

#define etWidth  600 - border * 4   //edit text for words to speek
#define etHeight 330 - border * 4

#define awWidth etWidth + border * 4 + 4    //application window
#define awHeight fbHeight + 60 + stHeight + border * 4  + etHeight

#define FILESIZE 256

HWND hwndButton;
HANDLE ghInstance;
char *szAppName = "Speak";

/**********************************************************************/
/*  Global variables.                                                 */
/**********************************************************************/

char szFile[FILESIZE] = "\0";
char szFileTitle[FILESIZE] = "\0";
char szFileSave[FILESIZE] = "\0";
char szFileTitleSave[FILESIZE] = "\0";
char szFindText[FILESIZE];
char szReplaceText[FILESIZE];
HWND hDropWindow;
LPTTS_HANDLE_T phTTS = NULL;
WNDPROC opVoiceControls;
BOOL bPaused = FALSE; // TRUE means Paused
HDC myHdc;
HWND hWndApp;
HPALETTE hPalLogical, hPalOld;
HWND hVolume, hRate, hstRate, hstRateLabel, hSpeakText, hDigital, hFind;
OPENFILENAME OpenWaveName ;
OPENFILENAME OpenFileName ;
OPENFILENAME OpenDictName ;
PBYTE pFileData, pFileDataEnd ;
CHAR         szWaveFilter[] = "Wave Files (*.WAV)\0*.WAV\0All Files (*.*)\0*.*\0";
CHAR         szFilter[] = "Text Files (*.TXT)\0*.TXT\0All Files (*.*)\0*.*\0";
CHAR         szWaveFile[256] = "\0";
CHAR         szWaveFileTitle[256];
HANDLE hFile = 0;
DWORD dwFileSize;
char szBuf[32];
HANDLE hFileMap ;
struct OWNERDRAW {
  HWND hWnd;
  CHAR szSelVoice[80];
  CHAR szTest[80];
  LPBITMAPFILEHEADER  lpbfNormalDib;
  LPBITMAPFILEHEADER  lpbfSelectedDib;
};
struct OWNERDRAW odButton[12];
HWND hPlay, hPause, hStop;
int cBufLen;
//MVP : Multiple instances specific variables
DWORD dwPlayID;
DWORD dwWave16ID;
DWORD dwWave8ID;
DWORD dwWaveMuLawID;
//WNDPROC TTSWave16WndProc;

/****************************************************************************
 *                                                                          *
 *  FUNCTION   : WinMain(HANDLE, HANDLE, LPSTR, int)                        *
 *                                                                          *
 ****************************************************************************/

int APIENTRY WinMain( HINSTANCE hInstance,
					  HINSTANCE hPrevInstance,
					  LPSTR lpCmdLine,
					  int nCmdShow)
{
  int iX;
  int iY;
  int iWidth;
  int iHeight;
  int iShow;
  HWND        hWnd;
  WNDCLASS    wndclass ;
  MSG         msg ;
  int         xScreen, yScreen ;
  MMRESULT    mmStatus ;
  char        *arg[3] ;
  int         i = 1;

  ghInstance= hInstance;

  wndclass.style         = CS_HREDRAW | CS_VREDRAW | CS_DBLCLKS | CS_OWNDC;
  wndclass.lpfnWndProc   = (WNDPROC) WndProc ;
  wndclass.cbClsExtra    = 0 ;
  wndclass.cbWndExtra    = 0 ;
  wndclass.hInstance     = NULL ;
  wndclass.hIcon         = LoadIcon(hInstance, MAKEINTRESOURCE( ICON_APP ));
  wndclass.hCursor       = LoadCursor (NULL, IDC_ARROW) ;
  wndclass.hbrBackground = GetStockObject (BLACK_BRUSH) ;
  wndclass.lpszMenuName  = "SPEAK_MENU" ;
  wndclass.lpszClassName = szAppName ;

  if ( ! RegisterClass( &wndclass ))
	return( FALSE );

  xScreen = GetSystemMetrics( SM_CXSCREEN );
  yScreen = GetSystemMetrics( SM_CYSCREEN );

  GetApplicationParameters( &iX, &iY, &iWidth, &iHeight, &iShow, szFile );

  hWnd = CreateWindow( szAppName,
					   szAppName,
					   WS_CAPTION | WS_SYSMENU
						| WS_OVERLAPPEDWINDOW | WS_VISIBLE
						| WS_MINIMIZEBOX,
					   iX,
					   iY,
					   iWidth,
					   iHeight,
					   NULL, NULL, NULL, NULL );

	/* If window could not be created, return "failure" */

	if ( ! hWnd )
	{
	//error = GetLastError();
	return( FALSE );
	}

	ShowWindow( hWnd, iShow );
	UpdateWindow( hWnd );                /* Sends WM_PAINT message */
	DragAcceptFiles( hWnd, TRUE );       //Accept files dragged from File Manager

										 // Check for command line invocation with filename and dictionary name

	if  (strlen(lpCmdLine))         /* Check for command line parameter */
	{
		   arg[i] =  strtok(lpCmdLine, " ");
		   i++ ;


		   if ((arg[i] =  strtok( NULL, " ")) == NULL)
		   i--;


		 switch (i)
		   {


	//wsprintf(szText,"Length %d" , strlen(lpCmdLine)  );
	//   MessageBox( hWnd, lpCmdLine, NULL, MB_OK );

				   case 2:

					  TextToSpeechUnloadUserDictionary( phTTS );
					  mmStatus = TextToSpeechLoadUserDictionary( phTTS, arg[2] );

					  if ( mmStatus )
					  {
						 if (mmStatus == MMSYSERR_ERROR)
							MessageBox( hWnd,
										"Illegal dictionary format" ,
										"Load User Dictionary",
										MB_OK | MB_ICONSTOP );
						 else
							MessageBox( hWnd,
										"Error in TTS Load Dictionary" ,
										"ERROR",
										MB_OK | MB_ICONSTOP );
					  }


				   case 1:
					 strcpy (szFile,  arg[1]) ;
					 if ( ! MyReadFile( hWnd, szFile ))
					 {
					   DrawMenuBar( hWnd);
					   // reset the title in the title bar to reflect the
					   // new open file
					   SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)szFile);
					   //SendMessage(hSpeakText,WM_SETTEXT,0,(LPARAM)pFileData);
					   //SendMessage(hSpeakText,WM_SETTEXT, 0, (LPARAM)FileBuf);
					   InvalidateRect( hSpeakText, NULL, TRUE );
					   DrawMenuBar( hWnd );
					   SpeakText( hWnd,phTTS );
					 }

				   break ;


				   default:

				   break;
			  }
	   }
	 /* Enter message loop */
	 while (GetMessage (&msg, NULL, 0, 0))
	 {
	   if( !IsDialogMessage( hFind, &msg ) )
		 {
		   TranslateMessage (&msg) ;
		   DispatchMessage (&msg) ;
		 }
	 }

	 return msg.wParam ;
}
//
//  WindowProc
//
LONG APIENTRY WndProc(HWND hWnd,
					  UINT uiMessage,
					  WPARAM wParam,
					  LPARAM lParam)
{
MMRESULT mmStatus;
PAINTSTRUCT ps;
static HMENU hPauseMenu;
static char szPause[] = {"&Pause"};
static char szResume[] = {"&Resume"};
static char * szMenu;
static char * szCurrentSpeaker = " [:nh]";

RECT  lprc;
INT x,y;
UINT uiStatus;

static FARPROC  oldEditProc;
static HBRUSH hOldBrush, hBrush;
static char szVolume[5];
static char szRate[5];
static short wSpos = 180;
static DWORD VolumeLevel;
LPMINMAXINFO  lpmmiSize   ;
DWORD dwStart, dwEnd, dwOffset ;
LONG lSelect;
DWORD      dwTextLen ;
LPSTR     lpEditText, lpSelBuf;
static UINT uiID_Error_Msg;
static UINT uiMessage_Find_Replace;
static  LPFINDREPLACE lpfrText;
CHAR szError[132];
DWORD   dwUse16ColorBitmaps = 0;
int         iBitsPixel,iPlanes = 0;

	switch ( uiMessage )
	{

		case WM_DESTROY:

		  SetApplicationParameters( hWnd, szFile );

	  mmStatus = TextToSpeechShutdown( phTTS );

				  if ( mmStatus )

					   MessageBox( hWnd,
								   "Error Shutting down TTS" ,
								   "ERROR",
								   MB_OK | MB_ICONSTOP );


		  PostQuitMessage(0);
		  break ;

		case WM_CLOSE:

		   if ( SendMessage( hSpeakText, EM_GETMODIFY, 0L, 0L ))
		   {
				if ( AskToSave( hWnd ))        // returns FALSE is yes or no TRUE if CANCEL
				{
				  break ;
				}                            // Cancel pressed

				DestroyWindow( hWnd );
				break;
		   }

		   DestroyWindow( hWnd );
		   break ;

		case WM_CREATE:

			 uiID_Error_Msg = RegisterWindowMessage("DECtalkErrorMessage");
			 uiMessage_Find_Replace = RegisterWindowMessage( "commdlg_FindReplace" );
			 GetClientRect(hWnd, &lprc);
			 hSpeakText = CreateWindow("EDIT", "",
		 WS_CHILD |WS_VISIBLE | WS_HSCROLL | WS_VSCROLL | WS_BORDER | ES_LEFT |
		 ES_MULTILINE | ES_AUTOHSCROLL | ES_AUTOVSCROLL | ES_NOHIDESEL,
								 border * 2, border * 2 + fbHeight,
								 etWidth,
								 etHeight ,
								 hWnd, NULL,NULL, NULL) ;
			 SendMessage(hSpeakText,EM_LIMITTEXT,(WPARAM)0,(LPARAM)0);

		  hRate = CreateWindow("SCROLLBAR", "",
							   WS_CHILD | WS_VISIBLE | SBS_HORZ,
							   border + slWidth,
							   lprc.bottom - (2 * border + sbHeight + 10),
							   sbWidth, sbHeight ,
							   hWnd,  NULL, NULL, NULL);

		SetScrollRange (hRate,SB_CTL,50,600, TRUE); //Set Rate Range 75 - 600 WPM
	SetScrollPos(hRate, SB_CTL, 180 , TRUE)  ;  //Set default rate

		  hstRate = CreateWindow("STATIC", "180 WPM",
							   WS_CHILD | WS_VISIBLE | SS_CENTER | WS_BORDER,
							   slWidth + border + sbWidth,
							   lprc.bottom - (2 * border + sbHeight + 10) ,
							   stWidth ,sbHeight ,
							   hWnd,  NULL, NULL, NULL);



		  hstRateLabel = CreateWindow("STATIC", "Speaking Rate",
							   WS_CHILD | WS_VISIBLE | SS_CENTER,
							   lprc.left + border ,
							   lprc.bottom - (2 * border + sbHeight + 10),
							   slWidth ,slHeight ,
								hWnd,  NULL, NULL, NULL);

		  for (x=9; x<12; x++){
			  odButton[x].lpbfNormalDib   = findHdib(2000 + x);
			  odButton[x].lpbfSelectedDib = findHdib(2100 + x);
			  odButton[x].hWnd = CreateWindow("BUTTON", "",
							   WS_CHILD | WS_VISIBLE | BS_OWNERDRAW,
							   (488 + ((x-9) * pbWidth)),
							   lprc.bottom -( pbHeight + border * 2),
							   pbWidth ,pbHeight ,
							   hWnd,  NULL, NULL, NULL);
		   }
		   //
		  myHdc = GetDC(hWnd);
		  iBitsPixel = GetDeviceCaps(myHdc, BITSPIXEL);
		  iPlanes = GetDeviceCaps(myHdc, PLANES);
		  //sprintf (szError, "Number of planes= %d n %d bits per pixel " ,iPlanes,  iBitsPixel);
		  //MessageBox(hWnd, szError, "Color info", MB_OK);
		  if ((iPlanes * iBitsPixel) < 8 ) dwUse16ColorBitmaps = 1000 ;
		  //ReleaseDC(hWnd, myHdc);


		  //

			for (x=0; x<3; x++) {
				for (y=0; y<3; y++) {
					odButton[y*3+x].lpbfNormalDib   = findHdib(2000 + dwUse16ColorBitmaps + y*3+x);
					odButton[y*3+x].lpbfSelectedDib = findHdib(2100 + dwUse16ColorBitmaps + y*3+x);

					// extract voice selection string from resource
					uiStatus = LoadString(NULL,1000+y*3+x,odButton[y*3+x].szSelVoice,80);

					// extract voice test message from resource
					uiStatus = LoadString(NULL,1100+y*3+x,odButton[y*3+x].szTest,80);

					// create the owner draw buttons for the odButtons
					odButton[y*3+x].hWnd = CreateWindow("BUTTON"," ",
									WS_CHILD | WS_VISIBLE | BS_OWNERDRAW  ,
									(y*3+x) * fbWidth + 10 ,  border, //x * fbWidth + border , y * fbHeight + border,
									fbWidth ,fbHeight ,
									hWnd,  NULL, NULL, NULL);

					// subclass buttons
					#ifdef _WIN64
					opVoiceControls = (WNDPROC)GetWindowLong (odButton[y*3+x].hWnd, GWLP_WNDPROC);
					SetWindowLongPtr(odButton[y*3+x].hWnd, GWLP_WNDPROC, npVoiceControls);
					#else
					opVoiceControls = (WNDPROC)GetWindowLong (odButton[y*3+x].hWnd, GWL_WNDPROC);
					SetWindowLong(odButton[y*3+x].hWnd, GWL_WNDPROC, (LONG)npVoiceControls);
					#endif
				}
				
				#ifdef _WIN64
				opVoiceControls = (WNDPROC)GetWindowLong (odButton[x + PLAY].hWnd, GWLP_WNDPROC);
				SetWindowLongPtr(odButton[x + PLAY].hWnd, GWLP_WNDPROC, npVoiceControls);
				#else
				opVoiceControls = (WNDPROC)GetWindowLong (odButton[x + PLAY].hWnd, GWL_WNDPROC);
				SetWindowLong(odButton[x + PLAY].hWnd, GWL_WNDPROC, (LONG)npVoiceControls);
				#endif
			}

		   
		usePalette(hWnd,"SPEAKPAL");

		mmStatus = TextToSpeechStartup( hWnd,
											 &phTTS,
											 WAVE_MAPPER,
											 REPORT_OPEN_ERROR);

			  if ( mmStatus == MMSYSERR_ERROR)
			  {
				 MessageBox( hWnd, "Can't find DECtalk Dictionary \n dectalk.dic, Shutting down!", "SPEAK ERROR", MB_OK );
				 return( -1 );
			  }

			  if (mmStatus == MMSYSERR_NODRIVER)
			   {
				 MessageBox( hWnd, "No wave device present \n You can continue but only to write wave files",
				 "Warning", MB_OK );
				 mmStatus = TextToSpeechStartup( hWnd,
												 &phTTS,
												 0,
												 DO_NOT_USE_AUDIO_DEVICE );

				 if ( mmStatus == MMSYSERR_ERROR)
				 {
				   MessageBox( hWnd, "Can't find DECtalk Dictionary \n dectalk.dic, Shutting down!", "SPEAK ERROR", MB_OK );
				   return( -1 );
				 }

				 if (mmStatus)
				 {
				   sprintf( szError, "Error = %d", mmStatus );

					  MessageBox( hWnd,
								  szError,
								  "TTS startup with no audio device",
								  MB_OK | MB_ICONSTOP );
				   //MessageBox( hWnd, "Error starting up Text to Speech system",
				   //"Error", MB_OK );
				 }
				}
		   return FALSE;

		case WM_SETFOCUS :
			 SetFocus (hSpeakText) ;
			 return FALSE ;

		case WM_SIZE :  //Reposition all child windows when moved or resized


			 GetClientRect(hWnd, &lprc);
			 MoveWindow (hSpeakText, border * 2, border * 2 + fbHeight,  lprc.right - 8,
												  lprc.bottom - (112), TRUE) ;


			 MoveWindow (hRate,border + slWidth,
							   lprc.bottom - (2 * border + sbHeight + 10),
							   sbWidth, sbHeight , TRUE) ;
			 MoveWindow (hstRateLabel, border, lprc.bottom - (2 * border + sbHeight + 10),slWidth ,slHeight, TRUE) ;
			 MoveWindow (hstRate,  slWidth + border + sbWidth,
							   lprc.bottom - (2 * border + sbHeight + 10) ,
							   stWidth ,sbHeight , TRUE) ;

			 for (x=9; x<12; x++)
			   {
				 MoveWindow( odButton[x].hWnd,  (488 + ((x-9) * pbWidth)),
							   lprc.bottom -( pbHeight + border * 2),
							   pbWidth ,pbHeight , TRUE );
			   }

			 return FALSE ;

		case WM_DROPFILES:

			  // If edit control has been modified ask to save file .
			 if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))

			  {
				if (AskToSave(hWnd))        // returns FALSE is yes or no TRUE if CANCEL

				  break ;                   // Cancel pressed
											// Yes or No pressed
			  }
			 DragQueryFile ((HANDLE)wParam, 0, szFile, sizeof(szFile));
			 mmStatus = TextToSpeechReset(phTTS, FALSE);
				  if ( mmStatus )

					   MessageBox( hWnd,
								  "Error in TTS Reset" ,
								  "ERROR",
								  MB_OK | MB_ICONSTOP );
			 /*bPaused = FALSE;
			 Infostruct.hwndItem = odButton[PAUSE].hWnd;
			 Infostruct.hDC = GetDC(odButton[PAUSE].hWnd);
			 DrawControl(odButton[PAUSE].hWnd, &Infostruct);
			 ReleaseDC(odButton[PAUSE].hWnd, Infostruct.hDC);*/
			 //SendMessage(hwndButton2,WM_SETTEXT,(WPARAM)NULL,(LPARAM)"Pause");

		 if ( ! MyReadFile( hWnd, szFile ))
		{
		   DrawMenuBar( hWnd);
		   // reset the title in the title bar to reflect the
		   // new open file
		   SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)szFile);
		   InvalidateRect( hSpeakText, NULL, TRUE );
		   DrawMenuBar( hWnd );
		   DragFinish ((HANDLE)wParam);
		   SpeakText ( hWnd,phTTS );
		   return FALSE;
		}
		else
		break;

		case WM_DRAWITEM:

		case WM_MEASUREITEM:
	  DrawControl(hWnd, (LPDRAWITEMSTRUCT)lParam); // Owner draw stuff
	  break;

		case WM_COMMAND:
		  menuCommand(hWnd, wParam, lParam);
		  break;

	 case WM_QUERYNEWPALETTE:
		if ((HWND) wParam != hWnd)

			{
 //               myHdc = GetDC(hWnd);
				SelectPalette(myHdc, hPalLogical, FALSE);
				if (RealizePalette(myHdc))
					InvalidateRect(hWnd, NULL, FALSE);
			}

		return 0;


	 case WM_PALETTECHANGED:
		if ((HWND) wParam != hWnd)
			{
 //               myHdc = GetDC(hWnd);
				SelectPalette(myHdc, hPalLogical, FALSE);

				if (RealizePalette(myHdc))
					UpdateColors(myHdc);

			}
		return 0;


		case WM_PAINT:
		  BeginPaint(hWnd, &ps);
				 /*  lpbf = findHdib(2200);
		  lpbi = (LPVOID)((CHAR*)lpbf + sizeof(BITMAPFILEHEADER));
		  dibBits = (LPVOID)((CHAR*)lpbf + lpbf->bfOffBits);

		 // put our DIB on the screen
		 SetDIBitsToDevice(GetDC(hWnd),
					(INT)lprc.right - (lpbi->biWidth + border),
					(INT)fbHeight * 3 + border * 2,
					(DWORD)lpbi->biWidth,
					(DWORD)lpbi->biHeight,
					(INT)0,
					(INT)0,
					(UINT)0, (UINT)lpbi->biHeight ,
					(LPVOID)dibBits,
					(LPBITMAPINFO)lpbi, (UINT)DIB_RGB_COLORS);  */

		  EndPaint(hWnd, &ps);
		  break ;

	case WM_INITMENUPOPUP: /*Enable Paste menu item if clipboard data available*/

			HandleMenuPopup(wParam);

			return FALSE;

		case WM_GETMINMAXINFO:   //Limit minimum size of window

			 lpmmiSize = (LPMINMAXINFO) lParam;
			 lpmmiSize->ptMinTrackSize.x = (LONG)etWidth + border * 4 + 4 ;
			 lpmmiSize->ptMinTrackSize.y = 300L;

			 return FALSE;

		case WM_ERASEBKGND:
	  hBrush = GetStockObject(LTGRAY_BRUSH);
	  hOldBrush = SelectObject((HDC)wParam, hBrush);
	  GetClientRect(hWnd, &lprc);
	  FillRect((HDC)wParam, &lprc, hBrush);
	  break;

	   case WM_CTLCOLORSTATIC:
	  hBrush = GetStockObject(LTGRAY_BRUSH);
		  SetBkColor ((HDC) wParam, RGB ((BYTE)192, (BYTE)192, (BYTE)192));
	  return  (LRESULT) hBrush;

	   case WM_HSCROLL:

		   if (((HWND)lParam) == hRate)
			{
			 wSpos = HandleScrollBar(wParam,wSpos);  // Call Scroll Bar handling routine
			 mmStatus = TextToSpeechSetRate(phTTS,(UINT)wSpos); // New rate returned in wSpos
			   if ( mmStatus )

					   MessageBox( hWnd,
								  "Error Setting Rate" ,
								  "ERROR",
								  MB_OK | MB_ICONSTOP );
		 return FALSE;
			}
			break ;
/*      This section implements Right Mouse Button click functionality.
*       This action will cause reading selected text in the Edit
*       Control
*   Parent notify message is used to check for the right mouse button being activated.
*   The selected text is then spoken.
*/

		case WM_PARENTNOTIFY:

			if (LOWORD(wParam) == WM_RBUTTONDOWN)
			{
			   lSelect = SendMessage (hSpeakText, EM_GETSEL,(WPARAM)&dwStart,(LPARAM)&dwEnd) ;

			   if (HIWORD (lSelect) == LOWORD (lSelect))
			   {
				  mmStatus = TextToSpeechSpeak(phTTS, "What?", TTS_FORCE);
				  //MessageBox( hWnd, "No data selected", NULL, MB_OK );
				  if ( mmStatus )

					   MessageBox( hWnd,
								  "Error in TTS Speak" ,
								  "ERROR",
								  MB_OK | MB_ICONSTOP );
				  break;
			   }
			   else
				  {
					 dwTextLen = SendMessage(hSpeakText, WM_GETTEXTLENGTH, 0, 0);
					 lpEditText  = (char *)malloc((1 + dwTextLen) * sizeof(char)) ;
					 SendMessage(hSpeakText, WM_GETTEXT, (WPARAM) dwTextLen+1, (LPARAM) lpEditText);
					 lpSelBuf = (char *)malloc((1 + dwEnd - dwStart)  * sizeof(char)) ;
					 strncpy((char*)lpSelBuf,(char*)&lpEditText[dwStart],(1 + dwEnd - dwStart));
					 lpSelBuf[dwEnd - dwStart] = '\0';
					 mmStatus = TextToSpeechSpeak(phTTS, lpSelBuf, TTS_FORCE);
					 if ( mmStatus )

					   MessageBox( hWnd,
								  "Error in TTS Speak" ,
								  "ERROR",
								  MB_OK | MB_ICONSTOP );
					 free (lpSelBuf);
					 free (lpEditText);
				  }
			}
			break;


	   default:
		 if (uiMessage ==  uiID_Error_Msg )

		 {
		   //TextToSpeechReset(phTTS, FALSE);
		   switch (wParam)
		   {

			case ERROR_IN_AUDIO_WRITE:
			MessageBox(hWnd, "Error in Writing Audio", "Async Error",MB_OK | MB_ICONSTOP);
			break;

			case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
			MessageBox(hWnd,
			 "The wave device is in use by another application \n DECtalk will wait until the device is free.",
			 "Warning",MB_OK | MB_ICONSTOP);
			break;

			case ERROR_GETTING_DEVICE_CAPABILITIES:
			MessageBox(hWnd, "Error Getting Audio Device Caps", "Async Error",MB_OK | MB_ICONSTOP);
			break;

			case ERROR_READING_DICTIONARY:
			MessageBox(hWnd, "Error Reading Dictionary File \n dectalk.dic", "Async Error",MB_OK | MB_ICONSTOP);
			break;

			case ERROR_WRITING_FILE:
			MessageBox(hWnd, "Error Writing File", "Async Error",MB_OK | MB_ICONSTOP);
			break;

			case ERROR_ALLOCATING_INDEX_MARK_MEMORY:
			MessageBox(hWnd, "Error allocating Index Mark Memory", "Async Error",MB_OK | MB_ICONSTOP);
			break;

			case ERROR_OPENING_WAVE_FILE:
			MessageBox(hWnd, "Error ", "Error Opening Wave File",MB_OK | MB_ICONSTOP);
			break;

			case ERROR_BAD_WAVE_FILE_FORMAT:
			MessageBox(hWnd, "Error ", "Error Bad Wave File Format",MB_OK | MB_ICONSTOP);
			break;

			case ERROR_UNSUPPORTED_WAVE_FILE_FORMAT:
			MessageBox(hWnd, "Error ", "Error Unsupported Wave File Format",MB_OK | MB_ICONSTOP);
			break;

			case ERROR_UNSUPPORTED_WAVE_AUDIO_FORMAT:
			MessageBox(hWnd, "Error Unsupported Wave Audio Format", "",MB_OK | MB_ICONSTOP);
			break;

			case ERROR_READING_WAVE_FILE:
			MessageBox(hWnd, "Error ", "Error Reading Wave File",MB_OK | MB_ICONSTOP);
			break;
			}
		  }
		 else
				  //
				  // Process "Find-Replace" Messages
				  //
				  if( uiMessage == uiMessage_Find_Replace )
					{
					  lpfrText = ( LPFINDREPLACE ) lParam;

					  if( lpfrText->Flags & FR_DIALOGTERM )
						  hFind = NULL;

					  dwOffset = HIWORD( SendMessage( hSpeakText, EM_GETSEL, 0, 0L ));
					  if( lpfrText->Flags & FR_FINDNEXT )
						  if( !FindSearchString( hSpeakText, &dwOffset, lpfrText ))
				{
				  sprintf( szError, "Search string %s was not found.", lpfrText->lpstrFindWhat );
							  MessageBox( hWnd, szError, "Find Error", MB_OK | MB_ICONEXCLAMATION );
							}

					  return( 0 );
					}

		 return (DefWindowProc (hWnd, uiMessage, wParam, lParam)) ;

	}
	return 0L ;

}
//
// find handle of dib
//

LPVOID findHdib(INT id) {

HRSRC       hDibRes, hDibResInfo;

  // find our DIB in the resource
  hDibResInfo = FindResource(NULL, MAKEINTRESOURCE(id), "DIB");
  if (hDibResInfo == NULL)
	return (LPVOID)ErrMsg("Line %d Error = %d\nFindResource",__LINE__-2,GetLastError());

  // get a handle to the DIB
  hDibRes = LoadResource(NULL, hDibResInfo);
  if (hDibRes == NULL)
	return (LPVOID)ErrMsg("Line %d Error = %d\nLoadResource",__LINE__,GetLastError());
  return (LockResource(hDibRes));

}
//
//#pragma page
//
// Menu Command
//
BOOL menuCommand(HWND hWnd, WPARAM wParam, LPARAM lParam)
{

static char szTextWindow[8192];

static HMENU hPauseMenu;
static char szPause[] = {"&Pause"};
static char szResume[] = {"&Resume"};
static char * szMenu;
static char * szCurrentSpeaker = " [:nh]";
INT i;
RECT lprc;
MMRESULT mmStatus;
CHAR szError[132];
LPCTSTR lpszHelpFile = DTALK_HELP_FILE_NAME;
LPCTSTR lpszHelpTopic = "Speak applet, overview";
HCURSOR hCursor ;
DWORD dwStart, dwEnd, dwTextLen;
LPSTR lpEditText;
LONG lSelect;
//MVP : Multiple instance specific related.
CHAR szTTSInstanceName [30];
LPTTS_HANDLE_T phTTSWave16 = NULL;
HWND hWndTTS16 = NULL;
CHAR szClassName[100];

  switch (LOWORD(wParam)) {

		  case IDM_HELP:

                   WinHelp( hWnd,
                            lpszHelpFile,
                            HELP_PARTIALKEY,
                            lpszHelpTopic );

//              Changed the help access... 4/18/97 cjl
#if 0
                   WinHelp( hWnd,
                            lpszHelpFile,
                            HELP_CONTEXT,
                            IDH_Speak_Program_Applet_Index );
#endif

		break;

	  case  IDM_ABOUT:

			DialogBox( ghInstance,
					   MAKEINTRESOURCE(DLG_ABOUT),
					   hWnd,
					   (DLGPROC)AboutDlgProc );
			break;

	  case  IDM_FILE_OPEN:

			  // If edit control has been modified ask to save file .
			if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))

			  {
				if (AskToSave(hWnd))        // returns FALSE is yes or no TRUE if CANCEL

				  break ;                   // Cancel pressed
											// Yes or No pressed
			  }

			strcpy( szFileSave, szFile );
			strcpy( szFileTitleSave, szFileTitle );

		if ( MyOpenFile( hWnd, szFileSave, szFileTitleSave ) == 0 )
		{
				strcpy( szFile, szFileSave );
				strcpy( szFileTitle, szFileTitleSave );
		DrawMenuBar( hWnd);
		// reset the title in the title bar to reflect the
		// new open file
				SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)szFile);
				InvalidateRect( hWnd, NULL, TRUE );
				TextToSpeechReset(phTTS, FALSE); //Flush out data and reset TTS
		}
		break;


	  case IDM_FILE_NEW:
				// If edit control has been modified ask to save file .
			if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))

			  {
				if (AskToSave(hWnd))        // returns FALSE is yes or no TRUE if CANCEL

				  break ;                   // Cancel pressed
											// Yes or No pressed
			  }
				SetWindowText( hWnd, "Speak\0") ;
				SendMessage(hSpeakText, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
				SendMessage(hSpeakText,WM_CUT,0,0L);
				SendMessage(hSpeakText, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
				return FALSE;

	  case IDM_SAVE:

					GetWindowText( hWnd, szError, 30) ;
					if (strcmp  (szError,  "Speak\0") == 0)
						if (SaveFileAs ( hWnd) )
						{
						  SetWindowText( hWnd, OpenFileName.lpstrFile );
						  DrawMenuBar ( hWnd );
						}
						else
						return FALSE ;

					 else

					   SaveFile ( hWnd) ;
					   return FALSE ;

		  case IDM_SAVEAS:

					if (SaveFileAs ( hWnd) )
					{
					  SetWindowText( hWnd, OpenFileName.lpstrFile );
					  DrawMenuBar ( hWnd );
					}

					return FALSE ;


		  case IDM_LOAD_DIC:

			   if (GetDictName( hWnd ) == TRUE )

				{
					TextToSpeechUnloadUserDictionary(phTTS);
					mmStatus = TextToSpeechLoadUserDictionary(phTTS,OpenDictName.lpstrFile) ;
					if ( mmStatus )
					{
					  if (mmStatus == MMSYSERR_ERROR)

					  MessageBox( hWnd,
								  "Dictionary already loaded or illegal format" ,
								  "Load User Dictionary",
								  MB_OK | MB_ICONSTOP );

					  else
					  MessageBox( hWnd,
								  szError,
								  "Load User Dictionary",
								  MB_OK | MB_ICONSTOP );
					}
					 break;
				 }

				else

				/*MessageBox( hWnd,
								  "Couldn't get Dictionary Name",
								  "Load User Dictionary",
								  MB_OK | MB_ICONSTOP );
															 */
				break;

		  case IDM_UNLOAD_DIC:

				  mmStatus = TextToSpeechUnloadUserDictionary(phTTS) ;
					if ( mmStatus )
					{
					  sprintf( szError, "Error = %d", mmStatus );

					  MessageBox( hWnd,
								  szError,
								  "Unload User Dictionary",
								  MB_OK | MB_ICONSTOP );
					}
					break;

		   case IDM_WAVE1116:
		   //MVP : Multiple instance specific :
		   // Create Another TTS Instance
		   // This instance will be used to write to wave files with 16-bit.
		   strcpy(szTTSInstanceName,"TTSWave16");
 
		   if(CreateTTSObject(szTTSInstanceName,&dwWave16ID,&hWndTTS16,
			   phTTSWave16,TTSWave16WndProc) != MMSYSERR_NOERROR)
		   {
			   return (-1);
		   }
		   
		   phTTSWave16 = (LPTTS_HANDLE_T)dwWave16ID;
		   if (SaveWaveName ( hWnd ))
		   {
				mmStatus = TextToSpeechOpenWaveOutFile(phTTSWave16, OpenWaveName.lpstrFile, WAVE_FORMAT_1M16);
				if ( mmStatus )
				{
					sprintf( szError, "Error = %d", mmStatus );

					  MessageBox( hWnd,
								  szError,
								  "OpenWaveOutFile 16 bit linear",
								  MB_OK | MB_ICONSTOP );
				}
				hCursor = SetCursor (LoadCursor (NULL, IDC_WAIT));
				ShowCursor (TRUE) ;
				SpeakText (hWnd,phTTSWave16);
				mmStatus = TextToSpeechCloseWaveOutFile(phTTSWave16);
				if ( mmStatus )

					   MessageBox( hWnd,
								  "Error in TTS Close Wave File" ,
								  "ERROR",
								  MB_OK | MB_ICONSTOP );

				//Get the Instance window class name ,destroy the window,and UnRegister Instance window.
				GetClassName(hWndTTS16,(LPTSTR)szClassName,100);
				DestroyWindow(hWndTTS16);
				UnregisterClass((LPCTSTR)szClassName,ghInstance);

				ShowCursor  (FALSE) ;
				SetCursor (hCursor) ;
				if ( mmStatus )
				{
					  sprintf( szError, "Error = %d", mmStatus );

					  MessageBox( hWnd,
								  szError,
								  "CloseWaveOutFile",
								  MB_OK | MB_ICONSTOP );
				}
		   }

			  break;

			case IDM_WAVE1108:
				if (SaveWaveName ( hWnd ) )
				 {
					 mmStatus = TextToSpeechOpenWaveOutFile(phTTS, OpenWaveName.lpstrFile, WAVE_FORMAT_1M08);
					 if ( mmStatus )
					{
					  sprintf( szError, "Error = %d", mmStatus );

					  MessageBox( hWnd,
								  szError,
								  "OpenWaveOutFile 8 bit Linear",
								  MB_OK | MB_ICONSTOP );
					}
					 hCursor = SetCursor (LoadCursor (NULL, IDC_WAIT));
					 ShowCursor (TRUE) ;
			 SpeakText ( hWnd,phTTS ) ;
			 mmStatus = TextToSpeechCloseWaveOutFile(phTTS);
			  if ( mmStatus )

					   MessageBox( hWnd,
								  "Error in TTS Close Wave File" ,
								  "ERROR",
								  MB_OK | MB_ICONSTOP );

			 ShowCursor  (FALSE) ;
			 SetCursor (hCursor) ;
				  }
					 break;

			case IDM_MULAW:
					if (SaveWaveName ( hWnd ) )
				 {
					 mmStatus = TextToSpeechOpenWaveOutFile(phTTS, OpenWaveName.lpstrFile, WAVE_FORMAT_08M08);
					 if ( mmStatus )
					{
					  sprintf( szError, "Error = %d", mmStatus );

					  MessageBox( hWnd,
								  szError,
								  "OpenWaveOutFile �Law",
								  MB_OK | MB_ICONSTOP );
					}
					 hCursor = SetCursor (LoadCursor (NULL, IDC_WAIT));
					 ShowCursor (TRUE) ;
					 SpeakText ( hWnd,phTTS ) ;
			 mmStatus = TextToSpeechCloseWaveOutFile(phTTS);
			 if ( mmStatus )

					   MessageBox( hWnd,
								  "Error in TTS Close Wave File" ,
								  "ERROR",
								  MB_OK | MB_ICONSTOP );
			 ShowCursor  (FALSE) ;
			 SetCursor (hCursor) ;

				  }
					 break;

	  //case  IDCANCEL:


	  case  IDM_EXIT:

			// If edit control has been modified ask to save file .
			if (SendMessage(hSpeakText, EM_GETMODIFY,0L,0L))

			  {
				if (AskToSave(hWnd))        // returns FALSE is yes or no TRUE if CANCEL

				  break ;                   // Cancel pressed

				  DestroyWindow( hWnd );
				  break;
			  }


			   DestroyWindow( hWnd );
			   break ;

		  case ID_EDIT_CUT:

		SendMessage(hSpeakText,WM_CUT,0,0L);
		break;

	  case ID_EDIT_COPY:

		SendMessage(hSpeakText,WM_COPY,0,0L);
		break;

		  case ID_EDIT_PASTE:

		SendMessage(hSpeakText,WM_PASTE,0,0L);
		break;

		  case ID_EDIT_CLEAR:

		SendMessage(hSpeakText,WM_CLEAR,0,0L);
		break;

	  case ID_EDIT_SELECT_ALL:
		SendMessage(hSpeakText, EM_SETSEL, (WPARAM)(INT)0L, (LPARAM)(INT)-1L);
		SetFocus(hSpeakText);
		//InvalidateRect( hSpeakText, NULL, TRUE );
		//UpdateWindow(hSpeakText);

		break;

	  case ID_EDIT_UNDO:

		SendMessage(hSpeakText, EM_UNDO, 0L, 0L);
		break;

	  case ID_FIND:
		lSelect = SendMessage( hSpeakText, EM_GETSEL, (WPARAM)&dwStart, (LPARAM)&dwEnd );
		if( HIWORD( lSelect ) != LOWORD( lSelect ))
		  {
			dwTextLen = SendMessage( hSpeakText, WM_GETTEXTLENGTH, 0, 0);
			lpEditText = (char *)malloc((1+dwTextLen) * sizeof( char ));
			SendMessage(hSpeakText, WM_GETTEXT, (WPARAM) dwTextLen+1, (LPARAM)lpEditText);
			strncpy(szFindText, (char *)&lpEditText[dwStart], dwEnd - dwStart );
			szFindText[dwEnd - dwStart] = '\0';
			free( lpEditText );
		  }
		hFind = FindDialog( hWnd );
		GetClientRect( hFind, &lprc );
		MoveWindow( hFind, 200, 0, lprc.right + 10, lprc.bottom + 20, TRUE );

		break;


	  default:

			for (i=0; i<9; i++)
			  if (lParam == (LPARAM)odButton[i].hWnd)
			 {
				mmStatus = TextToSpeechSpeak(phTTS, odButton[i].szSelVoice,TTS_NORMAL);
				if ( mmStatus )

					   MessageBox( hWnd,
								  "Error in TTS Speak" ,
								  "ERROR",
								  MB_OK | MB_ICONSTOP );

				mmStatus = TextToSpeechSpeak(phTTS, odButton[i].szTest,TTS_FORCE);

				//SendMessage(hSpeakText, EM_GETSEL,(WPARAM) &dwStart,(LPARAM) &dwEnd);
				//SendMessage(hSpeakText, EM_SETSEL,(WPARAM)(INT) -1L,(LPARAM)(INT) -1L);
				SetFocus(hSpeakText);
				if ( mmStatus )

					   MessageBox( hWnd,
								  "Error in Speak" ,
								  "ERROR",
								  MB_OK | MB_ICONSTOP );
			 }

		break;
	}

  return(0);
}

//
// DrawControl
//
INT DrawControl(HWND hWnd, LPDRAWITEMSTRUCT lpInfo)
{
INT  i;
UINT uiStatus;
LPBITMAPFILEHEADER   lpbf;
LPBITMAPINFOHEADER   lpbi;
LPVOID dibBits;

  //  Select our palette into the Device DC
  hPalOld = SelectPalette (lpInfo->hDC, hPalLogical, FALSE);
  if (hPalOld == FALSE)
	return ErrMsg ("Line %d Error = %d\nSelectPalette",__LINE__,GetLastError());

  // Activate palette
  uiStatus = RealizePalette (myHdc);
  if (uiStatus == GDI_ERROR)
	return ErrMsg ("Line %d Error = %d\nRealizePalette",__LINE__,GetLastError());

  for (i=0; i<12; i++)
	if (lpInfo->hwndItem == odButton[i].hWnd) {
	  lpbf = odButton[i].lpbfNormalDib;
	  if (lpInfo->itemState & ODS_SELECTED)
		lpbf = odButton[i].lpbfSelectedDib;
	}
   if (lpInfo->hwndItem == odButton[PAUSE].hWnd) {   //Is this pause button?

	  if (bPaused)
		lpbf = odButton[PAUSE].lpbfSelectedDib;
	  else
		lpbf = odButton[PAUSE].lpbfNormalDib;
   }
  lpbi = (LPVOID)((CHAR*)lpbf + sizeof(BITMAPFILEHEADER));
  dibBits = (LPVOID)((CHAR*)lpbf + lpbf->bfOffBits);


  // put our DIB on the screen
  SetDIBitsToDevice((HDC)lpInfo->hDC,
					(INT)0, (INT)0,
					(DWORD)lpbi->biHeight,
					(DWORD)lpbi->biWidth,
					(INT)0, (INT)0,
					(UINT)0, (UINT)lpbi->biHeight ,
					(LPVOID)dibBits,
					(LPBITMAPINFO)lpbi, (UINT)DIB_RGB_COLORS);

  return(0);
}
/**********************************************************************/
/**********************************************************************/
/*  Function to Speak Text.                                           */
/**********************************************************************/
/**********************************************************************/

BOOL SpeakText( HANDLE hWnd,LPTTS_HANDLE_T phTTS )

{

DWORD      dwTextLen ;
LPSTR      lpEditText ;
MMRESULT   mmStatus ;
char       szError[32] ;

		   dwTextLen = SendMessage(hSpeakText, WM_GETTEXTLENGTH, 0, 0);
		   lpEditText  = (char *)malloc((1 + dwTextLen) * sizeof(char)) ;
		   SendMessage(hSpeakText, WM_GETTEXT,(WPARAM) dwTextLen +1, (LPARAM) lpEditText);
		   mmStatus = TextToSpeechSpeak(phTTS, lpEditText, TTS_FORCE);
	//	   mmStatus = TextToSpeechSpeak(phTTS, "hi", TTS_FORCE);
		   if ( mmStatus )

					   MessageBox( hWnd,
								  "Error in TTS Speak" ,
								  "ERROR",
								  MB_OK | MB_ICONSTOP );
		   free(lpEditText);

		   if ( mmStatus )
			 {
				 sprintf( szError, "Error = %d", mmStatus );
				 MessageBox( hWnd, szError, "TextToSpeechSpeak", MB_OK | MB_ICONSTOP );
			 }
	return FALSE;

}
/**********************************************************************/
/**********************************************************************/
/*  Function to Open a file.                                          */
/**********************************************************************/
/**********************************************************************/

INT MyOpenFile( HANDLE hWnd,
				char szFile[],
				char szFileTitle[] )
{
  OpenFileName.lStructSize       = sizeof(OPENFILENAME);
  OpenFileName.hwndOwner         = hWnd;
  OpenFileName.hInstance         = (HANDLE) ghInstance;
  OpenFileName.lpstrFilter       = szFilter;
  OpenFileName.lpstrCustomFilter = (LPSTR) NULL;
  OpenFileName.nMaxCustFilter    = 0L;
  OpenFileName.nFilterIndex      = 1L;
  OpenFileName.lpstrFile         = szFile;
  OpenFileName.nMaxFile          = 256;
  OpenFileName.lpstrFileTitle    = szFileTitle;
  OpenFileName.nMaxFileTitle     = 256;
  OpenFileName.lpstrInitialDir   = NULL;
  OpenFileName.lpstrTitle        = "Open a File";
  OpenFileName.nFileOffset       = 0;
  OpenFileName.nFileExtension    = 0;
  OpenFileName.lpstrDefExt       = "txt";
  OpenFileName.lCustData         = 0;
  OpenFileName.Flags =
	OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY;

  if ( GetOpenFileName(&OpenFileName))
  {
	if ( MyReadFile( hWnd, OpenFileName.lpstrFile ))
	{
	  return( TRUE );
	}
  }
  else
  {
	ProcessCDError(CommDlgExtendedError(), hWnd );
	return( TRUE );
  }
  return( FALSE );
}

/**********************************************************************/
/**********************************************************************/
/*  Function to Read a file.                                          */
/**********************************************************************/
/**********************************************************************/

int MyReadFile( HWND hWnd, char * szReadFile )
{




  // open the file

   hFile = CreateFile( szReadFile,
					  GENERIC_READ,
					  FILE_SHARE_READ,
					  (LPSECURITY_ATTRIBUTES)NULL,
					  OPEN_EXISTING,
					  FILE_ATTRIBUTE_NORMAL,
					  (HANDLE)NULL ) ;

	if ( hFile == INVALID_HANDLE_VALUE )
	{
	  MessageBox( hWnd, "File open failed.", NULL, MB_OK );
	  return( TRUE );
	}
		hFileMap = CreateFileMapping(hFile, NULL, PAGE_READONLY, 0, 0, NULL);
		pFileData = MapViewOfFile(hFileMap, FILE_MAP_READ, 0, 0, 0);
		dwFileSize = GetFileSize(hFile, &dwFileSize);
		pFileDataEnd = &pFileData[dwFileSize];
		//pFileData[dwFileSize] = 'a' ;
		SendMessage(hSpeakText, WM_SETTEXT, 0, (LPARAM)pFileData);
		if (! UnmapViewOfFile ( pFileData ))
		 {
		  MessageBox( hWnd, "File Unmap in MyReadFile Failed", "ERROR", MB_OK | MB_ICONSTOP );
		  return FALSE ;
		 }
		  CloseHandle(hFileMap);
		  CloseHandle(hFile);

		  return FALSE;


	//dwFileSize = GetFileSize( hFile, NULL);
	//sprintf(szBuf,"file size is %d", dwFileSize);
	// MessageBox( hWnd, szBuf, "INFO", MB_OK );

	// read it's contents into a buffer


}
/****************************************************************************
*
*    FUNCTION: AskToSave(HWND)
*
*    PURPOSE:  Puts up a Message box asking to save - yes, no or cancel
*
*    COMMENTS:
*
*
*    RETURN VALUES:
*        TRUE  -  Cancel button pushed
*        FALSE -  Yes or No pushed
*
****************************************************************************/
BOOL AskToSave( HWND hWnd )
{
int iResponse ;
char szBuf[128];


			 iResponse = MessageBox(hWnd,
			 "The Text in this file has changed. \n\n Do you wish to save the changes?",
			 "Speak" ,  MB_YESNOCANCEL | MB_ICONEXCLAMATION )  ;

			   switch (iResponse)
			   {
				 case IDYES:

				 GetWindowText( hWnd, szBuf, 30) ;
				 if (strcmp  (szBuf,  "Speak\0") == 0)
					{
					  if (!SaveFileAs ( hWnd ))
						return TRUE;
					  return FALSE;
					}
				 else
				   {
					 SaveFile ( hWnd ) ;
					 return FALSE ;
				   }
				   break;

				 case IDCANCEL:
				 return TRUE;
				 break;

				 case IDNO:
				 return FALSE ;
				 break;
			   }


}
/**********************************************************************/
/**********************************************************************/
/*  Function to Get Dictionary Name.                                  */
/**********************************************************************/
/**********************************************************************/

BOOL GetDictName( HANDLE hWnd )

{
CHAR szDictFilter[] = "Dictionary Files (*.DIC)\0*.DIC\0All Files (*.*)\0*.*\0";
static char szDict[256];
static char szDictTitle[256];
strcpy( szDict, "");
strcpy( szDictTitle, "");



  OpenDictName.lStructSize       = sizeof(OPENFILENAME);
  OpenDictName.hwndOwner         = hWnd;
  OpenDictName.hInstance         = (HANDLE) ghInstance;
  OpenDictName.lpstrFilter       = szDictFilter;
  OpenDictName.lpstrCustomFilter = (LPSTR) NULL;
  OpenDictName.nMaxCustFilter    = 0L;
  OpenDictName.nFilterIndex      = 1L;
  OpenDictName.lpstrFile         = szDict;
  OpenDictName.nMaxFile          = 256;
  OpenDictName.lpstrFileTitle    = szDictTitle;
  OpenDictName.nMaxFileTitle     = 256;
  OpenDictName.lpstrInitialDir   = NULL;
  OpenDictName.lpstrTitle        = "Load a Dictionary";
  OpenDictName.nFileOffset       = 0;
  OpenDictName.nFileExtension    = 0;
  OpenDictName.lpstrDefExt       = "dic";
  OpenDictName.lCustData         = 0;
  OpenDictName.Flags =
	OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY;

  if ( GetOpenFileName(&OpenDictName))


  return TRUE ;
  else
  {
	ProcessCDError(CommDlgExtendedError(), hWnd );
  }
  return( FALSE );
}
/****************************************************************************
*
*    FUNCTION: HandleScrollBar()
*
*    PURPOSE:  Handle all "Seaking Rate" Scroll Bar Logic
		   Line logic changes speaking rate in increments of 5 Words Per Minute
		   Page Logic Changes in 20 word per minutes
		   Thumbtrack is rounded to 5 WPM boundries
*
*    COMMENTS: The return value is the new selected rate in WPM
*
*
****************************************************************************/

SHORT  HandleScrollBar(WPARAM wParam, SHORT wSpos)


{

static  CHAR szText[12] ="\0";

	switch(LOWORD(wParam))
			{

			 case SB_PAGEDOWN:         // Increment Rate Slider by 20 to Max of 600
				if (wSpos > 580)
				   wSpos = 600;
				else
				   wSpos += 20;
				break;

			 case SB_LINEDOWN:         // Increment Rate Slider by 5 to Max of 600
				if (wSpos > 595)
				   wSpos = 600;
				else
				   wSpos   += 5;
				break;

			 case SB_PAGEUP:           // Decrement Rate Slider by 20 to Min of 75
				if (wSpos < 95)
				   wSpos = 75;
				else
				   wSpos   -= 20;
				break;

			 case SB_LINEUP:           // Increment Rate Slider by 5 to Max of 75
				if (wSpos < 80)
				   wSpos = 75;
				else
				   wSpos   -= 5;
				break;

			 case SB_TOP:              // Rate Slider to Max
				wSpos   =600;
				break;

			 case SB_BOTTOM:           // Rate Slider to Min
				wSpos   = 75;
				break;

			 case SB_THUMBPOSITION:

			 case SB_THUMBTRACK:
				wSpos = ((HIWORD(wParam))/5)*5;       // Round speaking rate to nearest 5

			 default:
			 break;
			}
			 SetScrollPos(hRate, SB_CTL, wSpos , TRUE)  ; // Set Slider Control position
		 wsprintf(szText,"%d WPM" ,wSpos );
		 SetWindowText(hstRate,szText );   // Display Rate in Static control
			 return (wSpos);
}

/**********************************************************************/
/**********************************************************************/
/*  Error Handler.                                                    */
/**********************************************************************/
/**********************************************************************/

void ErrorHandler( HANDLE hWnd, CHAR * szError, CHAR * szAppName )
{
  MessageBeep(0);
  MessageBox( hWnd, szError, szAppName,
		  MB_ICONEXCLAMATION | MB_OK );
  return;
}


//
//
//

LRESULT CALLBACK npVoiceControls (HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
static char szTextWindow[8192];
MMRESULT mmStatus;
 switch(msg) {



   case WM_LBUTTONUP:
		if (hWnd == odButton[PLAY].hWnd){
	  SendMessage(hSpeakText,
				  WM_GETTEXT,
				  sizeof(szTextWindow),
				  (LPARAM)szTextWindow);

	  SpeakText( hWnd,phTTS );
	  SetFocus(hSpeakText);
		}

		if (hWnd == odButton[PAUSE].hWnd)
		{
		  if ( ! bPaused )
		  {
			if ( TextToSpeechPause( phTTS ) == MMSYSERR_NOERROR )
			 SetFocus(hSpeakText);
			{
			  bPaused = TRUE;
			}
		  }
		  else
		  {
			if ( TextToSpeechResume( phTTS ) == MMSYSERR_NOERROR )
			SetFocus(hSpeakText);
			{
			  bPaused = FALSE;
			}
		  }
		}

		if (hWnd == odButton[STOP].hWnd)
		{
		  mmStatus = TextToSpeechReset( phTTS, FALSE );
		  if ( mmStatus )

					   MessageBox( hWnd,
								  "Error in TTS Reset" ,
								  "ERROR",
								  MB_OK | MB_ICONSTOP );
		 //bPaused = FALSE;
		 /* Infostruct.hwndItem = odButton[PAUSE].hWnd;
		  Infostruct.hDC = GetDC(odButton[PAUSE].hWnd);
		  DrawControl(odButton[PAUSE].hWnd, &Infostruct);
		  ReleaseDC(odButton[PAUSE].hWnd, Infostruct.hDC); */
		  SetFocus(hSpeakText);
		}

   default:
		return CallWindowProc (opVoiceControls, hWnd, msg, wParam, lParam);
   }
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: AboutDlgProc                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: October 5, 1994                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*      This dialog procedure is for the about box.                   */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd      Handle to window.                                     */
/*                                                                    */
/*    uiMsg     Message being sent to the window.                     */
/*                                                                    */
/*    wParam    Specific argument to message.                         */
/*                                                                    */
/*    lParam    Specific argument to message.                         */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    The return value is specific to the message that was            */
/*    received. It is FALSE if this dialog procedure does not handle  */
/*    a message (an exception is the WM_INITDIALOG message where      */
/*    TRUE is always returned).                                       */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define MAX_STRING 512

BOOL APIENTRY AboutDlgProc( HWND hWnd,
							UINT uiMsg,
							WPARAM wParam,
							LPARAM lParam )
{
  HWND hDlgItem;
  LPSTR pString;
  char szInstaller[MAX_STRING];
  char szCompany[MAX_STRING];

  switch( uiMsg )
  {
  case WM_INITDIALOG:

	/******************************************************************/
	/*  Display some OS version information.                          */
	/******************************************************************/

	pString = (LPSTR)malloc( MAX_STRING * sizeof(CHAR));

	if ( pString == NULL )
	{
	  MessageBox( hWnd, "Out of Memory", "Error", MB_OK );
	  return( TRUE );
	}

	AppGetWindowsVersion( pString, NULL );
	hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_VERSION_OS );
	SetWindowText( hDlgItem, pString );

	AppGetWindowsVersion( NULL, pString );
	hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_VERSION_PLATFORM );
	SetWindowText( hDlgItem, pString );

	/******************************************************************/
	/*  Get the installer name and company.                           */
	/******************************************************************/

	GetInstallationInfo( szInstaller, szCompany );

	AppGetWindowsVersion( NULL, pString );
	hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_REG_INSTALLER );
	SetWindowText( hDlgItem, szInstaller );

	AppGetWindowsVersion( NULL, pString );
	hDlgItem = GetDlgItem( hWnd, IDD_ABOUT_REG_COMPANY );
	SetWindowText( hDlgItem, szCompany );

	free( pString );

	return( TRUE );

  case WM_COMMAND:

	if ( LOWORD( wParam ) == IDOK || LOWORD( wParam ) == IDCANCEL )
	{
	  EndDialog( hWnd, ( IDOK == LOWORD( wParam )));
	}
	break;

  default:

	break;
  }
  return( FALSE );
}

/**********************************************************************/
/**********************************************************************/

INT ErrMsg (PSTR sz,...)
{
	CHAR ach[128];

//    wvsprintf (ach, sz, (LPSTR)(&sz+1));   /* Format the string */
	MessageBox (NULL, ach, NULL, MB_OK|MB_ICONEXCLAMATION|MB_APPLMODAL);
	return FALSE;
}

/**********************************************************************/
/**********************************************************************/
//
// usePalette
//

INT usePalette(HWND hWnd, CHAR* szPalResName){

LOGPALETTE  *pPalData;
HRSRC       hPalRes, hPalData;
UINT        uiStatus;

//         myHdc = GetDC(hWnd);
		  hPalRes = FindResource(ghInstance, szPalResName, "MYPALETTE");
		  if (hPalRes == NULL)
		return ErrMsg("Line %d Error = %d\nFindResource",__LINE__,GetLastError());

		  hPalData = LoadResource(NULL, hPalRes);
		  if (hPalData == NULL)
		return ErrMsg("Line %d Error = %d\nLoadResource",__LINE__,GetLastError());

		  pPalData = (LPVOID)((CHAR*)LockResource(hPalData) + 0x14);
		  hPalLogical = CreatePalette(pPalData);
		  if (hPalLogical == NULL)
		return ErrMsg("Line %d Error = %d\nCreatePalette",__LINE__,GetLastError());

		  //  Select our palette into the Device DC
		  hPalOld = SelectPalette (myHdc, hPalLogical, FALSE);
		  if (hPalOld == FALSE)
			return ErrMsg ("Line %d Error = %d\nSelectPalette",__LINE__,GetLastError());

		 // Activate palette
		 uiStatus = RealizePalette (myHdc);
		 if (uiStatus == GDI_ERROR)
		   return ErrMsg ("Line %d Error = %d\nRealizePalette",__LINE__,GetLastError());
}
/****************************************************************************
*
*    FUNCTION: SaveFile(HWND)
*
*    PURPOSE:  Saves current contents of edit control to current filename.
*
*    COMMENTS:
*
*
*    RETURN VALUES:
*        TRUE - The file was saved successfully
*        FALSE - The file was not saved .
*
****************************************************************************/
BOOL SaveFile( HWND hWnd)
{
LRESULT lResult ;


	 hFile = CreateFile( szFile,
					  GENERIC_READ | GENERIC_WRITE,
					  FILE_SHARE_READ,
					  (LPSECURITY_ATTRIBUTES)NULL,
					  CREATE_ALWAYS,
					  FILE_ATTRIBUTE_NORMAL,
					  (HANDLE)NULL ) ;

	if ( hFile == INVALID_HANDLE_VALUE )
	{
	  MessageBox( hWnd, "File open failed.", NULL, MB_OK );
	  return( FALSE );
	}

		hFileMap = CreateFileMapping(hFile,
									(LPSECURITY_ATTRIBUTES)NULL,
									 PAGE_READWRITE,
									 0,
		(SendMessage(hSpeakText, WM_GETTEXTLENGTH, 0, 0)),NULL);

		pFileData = MapViewOfFile(hFileMap, FILE_MAP_WRITE, 0, 0, 0);
		lResult  = SendMessage(hSpeakText, WM_GETTEXTLENGTH, 0 ,0 ) ;
		SendMessage(hSpeakText, WM_GETTEXT, lResult + 1, (LPARAM)pFileData );
		if (! UnmapViewOfFile ( pFileData ))
		 {
		  MessageBox( hWnd, "File Unmap Failed", "ERROR", MB_OK | MB_ICONSTOP );
		  return FALSE ;
		 }
		  CloseHandle(hFileMap);
		  CloseHandle(hFile);
		  SendMessage(hSpeakText, EM_SETMODIFY, (WPARAM)(INT)FALSE, 0L);
		  return TRUE;


}

/****************************************************************************
*
*    FUNCTION: SaveFileAs(HWND)
*
*    PURPOSE:  Saves current contents of edit control to new filename.
*
*    COMMENTS:
*
*
*    RETURN VALUES:
*        TRUE - The file was saved successfully
*        FALSE - The file was not saved .
*
****************************************************************************/
BOOL SaveFileAs( HWND hWnd)
{


   strcpy( szFile, "");
   strcpy( szFileTitle, "");

   OpenFileName.lStructSize       = sizeof(OPENFILENAME);
   OpenFileName.hwndOwner         = hWnd;
   OpenFileName.hInstance         = (HANDLE) ghInstance;
   OpenFileName.lpstrFilter       = szFilter;
   OpenFileName.lpstrCustomFilter = (LPSTR) NULL;
   OpenFileName.nMaxCustFilter    = 0L;
   OpenFileName.nFilterIndex      = 1L;
   OpenFileName.lpstrFile         = szFile;
   OpenFileName.nMaxFile          = sizeof(szFile);
   OpenFileName.lpstrFileTitle    = szFileTitle;
   OpenFileName.nMaxFileTitle     = sizeof(szFileTitle);
   OpenFileName.lpstrInitialDir   = NULL;
   OpenFileName.lpstrTitle        = "Save File As";
   OpenFileName.nFileOffset       = 0;
   OpenFileName.nFileExtension    = 0;
   OpenFileName.lpstrDefExt       = "txt";
   OpenFileName.lCustData         = 0;
   OpenFileName.Flags             = OFN_OVERWRITEPROMPT | OFN_PATHMUSTEXIST | OFN_CREATEPROMPT |
									OFN_HIDEREADONLY ;
   OpenFileName.lpfnHook          = (LPOFNHOOKPROC) (FARPROC) NULL ;
   OpenFileName.lpTemplateName    = (LPSTR) NULL ;



   if (GetSaveFileName(&OpenFileName))
   return (SaveFile ( hWnd )) ;
   else

   {
	   ProcessCDError(CommDlgExtendedError(), hWnd ) ;
	   return FALSE ;

   }


}
/****************************************************************************
*
*    FUNCTION: SaveWaveName(HWND)
*
*    PURPOSE:  Gets filename for Wave out to file.
*
*    COMMENTS: This function fills in the OpenWaveName OPENFILENAME Structure
*
*
*    RETURN VALUES:
*        TRUE - The filename was retrieved
*        FALSE - The filename was not retreived .
*
****************************************************************************/
BOOL SaveWaveName( HWND hWnd )
{

   OpenWaveName.lStructSize       = sizeof(OPENFILENAME);
   OpenWaveName.hwndOwner         = hWnd;
   OpenWaveName.hInstance         = (HANDLE) ghInstance;
   OpenWaveName.lpstrFilter       = szWaveFilter;
   OpenWaveName.lpstrCustomFilter = (LPSTR) NULL;
   OpenWaveName.nMaxCustFilter    = 0L;
   OpenWaveName.nFilterIndex      = 1L;
   OpenWaveName.lpstrFile         = szWaveFile;
   OpenWaveName.nMaxFile          = sizeof(szWaveFile);
   OpenWaveName.lpstrFileTitle    = szWaveFileTitle;
   OpenWaveName.nMaxFileTitle     = sizeof(szWaveFileTitle);
   OpenWaveName.lpstrInitialDir   = NULL;
   OpenWaveName.lpstrTitle        = "Convert to Wave File";
   OpenWaveName.nFileOffset       = 0;
   OpenWaveName.nFileExtension    = 0;
   OpenWaveName.lpstrDefExt       = "wav";
   OpenWaveName.lCustData         = 0;
   OpenWaveName.Flags             = OFN_OVERWRITEPROMPT | OFN_PATHMUSTEXIST | OFN_CREATEPROMPT |
									OFN_HIDEREADONLY ;
   OpenWaveName.lpfnHook          = (LPOFNHOOKPROC) (FARPROC) NULL ;
   OpenWaveName.lpTemplateName    = (LPSTR) NULL ;



   if (GetSaveFileName(&OpenWaveName))
   return TRUE ;
   else

   {
	   ProcessCDError(CommDlgExtendedError(), hWnd ) ;
	   return FALSE ;

   }

}
/****************************************************************************
*
*    FUNCTION: ProcessCDError(DWORD)
*
*    PURPOSE:  Processes errors from the common dialog functions.
*
*    COMMENTS:
*
*        This function is called whenever a common dialog function
*        fails.  The CommonDialogExtendedError() value is passed to
*        the function which maps the error value to a string table.
*        The string is loaded and displayed for the user.
*
*    RETURN VALUES:
*        void.
*
****************************************************************************/
void ProcessCDError(DWORD dwErrorCode, HWND hWnd)
{
   WORD  wStringID;
   CHAR  buf[256];

   switch(dwErrorCode)
	  {
	 case CDERR_DIALOGFAILURE:   wStringID=IDS_DIALOGFAILURE;   break;
	 case CDERR_STRUCTSIZE:      wStringID=IDS_STRUCTSIZE;      break;
	 case CDERR_INITIALIZATION:  wStringID=IDS_INITIALIZATION;  break;
	 case CDERR_NOTEMPLATE:      wStringID=IDS_NOTEMPLATE;      break;
	 case CDERR_NOHINSTANCE:     wStringID=IDS_NOHINSTANCE;     break;
	 case CDERR_LOADSTRFAILURE:  wStringID=IDS_LOADSTRFAILURE;  break;
	 case CDERR_FINDRESFAILURE:  wStringID=IDS_FINDRESFAILURE;  break;
	 case CDERR_LOADRESFAILURE:  wStringID=IDS_LOADRESFAILURE;  break;
	 case CDERR_LOCKRESFAILURE:  wStringID=IDS_LOCKRESFAILURE;  break;
	 case CDERR_MEMALLOCFAILURE: wStringID=IDS_MEMALLOCFAILURE; break;
	 case CDERR_MEMLOCKFAILURE:  wStringID=IDS_MEMLOCKFAILURE;  break;
	 case CDERR_NOHOOK:          wStringID=IDS_NOHOOK;          break;
	 case PDERR_SETUPFAILURE:    wStringID=IDS_SETUPFAILURE;    break;
	 case PDERR_PARSEFAILURE:    wStringID=IDS_PARSEFAILURE;    break;
	 case PDERR_RETDEFFAILURE:   wStringID=IDS_RETDEFFAILURE;   break;
	 case PDERR_LOADDRVFAILURE:  wStringID=IDS_LOADDRVFAILURE;  break;
	 case PDERR_GETDEVMODEFAIL:  wStringID=IDS_GETDEVMODEFAIL;  break;
	 case PDERR_INITFAILURE:     wStringID=IDS_INITFAILURE;     break;
	 case PDERR_NODEVICES:       wStringID=IDS_NODEVICES;       break;
	 case PDERR_NODEFAULTPRN:    wStringID=IDS_NODEFAULTPRN;    break;
	 case PDERR_DNDMMISMATCH:    wStringID=IDS_DNDMMISMATCH;    break;
	 case PDERR_CREATEICFAILURE: wStringID=IDS_CREATEICFAILURE; break;
	 case PDERR_PRINTERNOTFOUND: wStringID=IDS_PRINTERNOTFOUND; break;
	 case CFERR_NOFONTS:         wStringID=IDS_NOFONTS;         break;
	 case FNERR_SUBCLASSFAILURE: wStringID=IDS_SUBCLASSFAILURE; break;
	 case FNERR_INVALIDFILENAME: wStringID=IDS_INVALIDFILENAME; break;
	 case FNERR_BUFFERTOOSMALL:  wStringID=IDS_BUFFERTOOSMALL;  break;

	 case 0:   //User may have hit CANCEL or we got a *very* random error
		return;

	 default:
		wStringID=IDS_UNKNOWNERROR;
	  }

   LoadString(NULL, wStringID, buf, sizeof(buf));
   MessageBox(hWnd, buf, NULL, MB_OK);
   return;
}


/****************************************************************************
*
*  FUNCTION: HandleMenuPopup()
*
*  PURPOSE:  Handle Edit menu popup logic
*
****************************************************************************/

void HandleMenuPopup(WPARAM wParam)
{
  LONG lSelect;
  WORD wEnable ;
  INT iLen;
  if ( IsClipboardFormatAvailable( CF_TEXT ))
	EnableMenuItem((HANDLE)wParam, ID_EDIT_PASTE, MF_ENABLED);
  else
	EnableMenuItem((HANDLE)wParam, ID_EDIT_PASTE, MF_GRAYED);

  /*Enable  menu cut, copy & delete menu items if data is selected */

  lSelect = SendMessage (hSpeakText, EM_GETSEL, 0L, 0L) ;

  if (HIWORD (lSelect) != LOWORD (lSelect))
	wEnable= MF_ENABLED;
  else
	wEnable= MF_GRAYED ;

  EnableMenuItem ((HANDLE)wParam, ID_EDIT_CUT, wEnable);
  EnableMenuItem ((HANDLE)wParam, ID_EDIT_COPY, wEnable);
  EnableMenuItem ((HANDLE)wParam, ID_EDIT_CLEAR, wEnable);
  iLen = GetWindowTextLength( hSpeakText );

		if (iLen == 0)
		{
			EnableMenuItem((HANDLE)wParam, IDM_SAVE, MF_GRAYED);
			EnableMenuItem((HANDLE)wParam, IDM_SAVEAS, MF_GRAYED);
			}

			else
			{
				EnableMenuItem((HANDLE)wParam, IDM_SAVE, MF_ENABLED);
				EnableMenuItem((HANDLE)wParam, IDM_SAVEAS, MF_ENABLED);
			}
  if (SendMessage(hSpeakText, EM_CANUNDO, 0L, 0L))
	  EnableMenuItem((HANDLE)wParam, ID_EDIT_UNDO, MF_ENABLED);
  else
	  EnableMenuItem((HANDLE)wParam, ID_EDIT_UNDO, MF_GRAYED);

  return ;
}

/****************************************************************************
*
*    FUNCTION: FindDialog( HWND hWnd )
*
*    PURPOSE:
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/

HWND FindDialog( HWND hWnd )
{
static FINDREPLACE frText;

	frText.lStructSize      = sizeof( FINDREPLACE );
	frText.hwndOwner        = hWnd;
	frText.hInstance        = NULL;
	frText.Flags        = FR_DOWN | ! FR_WHOLEWORD | ! FR_MATCHCASE;
	frText.lpstrFindWhat    = szFindText;
	frText.lpstrReplaceWith = NULL;
	frText.wFindWhatLen     = sizeof( szFindText );
	frText.wReplaceWithLen  = 0;
	frText.lCustData        = 0;
	frText.lpfnHook     = NULL;
	frText.lpTemplateName   = NULL;

	return( FindText( &frText ));
}

/****************************************************************************
*
*    FUNCTION: FindNextText( )
*
*    PURPOSE:
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/

BOOL FindNextText( HWND hSearch, DWORD *lpdwSearchOffset )
{
	FINDREPLACE frText;

	frText.lpstrFindWhat = szFindText;

	return( FindSearchString( hSearch, lpdwSearchOffset, &frText ));
}

/****************************************************************************
*
*    FUNCTION: FindSearchString( )
*
*    PURPOSE:
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/

BOOL FindSearchString( HWND hSearch, DWORD *lpdwSearchOffset, LPFINDREPLACE lpfr )
{
	DWORD   dwPos;
	LOCALHANDLE hLocal;
	LPSTR   lpstrDoc, lpstrPos, lpstrFind, lpstrDoc1;
	BOOL    bFind = TRUE;
	static char szAlphabet[] = {"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"};

	//
	// Get a pointer to the edit document
	//
	hLocal   = ( HWND ) SendMessage( hSearch, EM_GETHANDLE, 0, 0L );
	lpstrDoc = ( LPSTR ) LocalLock( hLocal );

	//
	// Set the string for up/down searching, make a copy of the strings we search
	// so that the original string on the screen doesn't get munged.
	//
	lpstrFind = ( lpfr->Flags & FR_DOWN ) ?_strdup( lpfr->lpstrFindWhat )
						  : _strrev(_strdup( lpfr->lpstrFindWhat ) );

	lpstrDoc1 = (lpfr->Flags & FR_DOWN ) ?_strdup( lpstrDoc ) : _strrev(_strdup( lpstrDoc ));

	*lpdwSearchOffset = (lpfr->Flags & FR_DOWN ) ? *lpdwSearchOffset
					: strlen( lpstrDoc1 ) - *lpdwSearchOffset + 1;

	//
	// Search the document for the find string
	//
	while( bFind )
	  {
		if( lpfr->Flags & FR_MATCHCASE )
			lpstrPos = strstr( lpstrDoc1 + *lpdwSearchOffset, lpstrFind );
		else
			lpstrPos = strstr( CharLower( lpstrDoc1 ) + *lpdwSearchOffset, CharLower( lpstrFind ) );

		if( lpfr->Flags & FR_WHOLEWORD )
		  {
			//
			// If there are no words matched, then quit looking for one
			//
			if( lpstrPos == NULL )
				bFind = FALSE;
			else
			//
			// if the string was matched, let's see if the next character will make
			// an exact match.  Note, any letter in the alphabet immediately after the last
			// character matched will cause this exact match to fail.
			//
			if( !strspn(( lpstrPos + strlen( lpstrFind )), szAlphabet ))
				bFind = FALSE;
		else
		  {
			//
			// Find the current position in the document and the new start offset
			//
			dwPos = lpstrPos - lpstrDoc1;
			*lpdwSearchOffset = dwPos + strlen( lpstrFind );
		  }
		  }
		else
			bFind = FALSE;
	  }

	LocalUnlock( hLocal );

	//
	// Return an error code if the string cannot be found
	//
	if( lpstrPos == NULL )
		return( FALSE );

	//
	// Find the current position in the document and the new start offset
	// Don't forget, we might have done this in the UP direction.
	//
	dwPos = ( lpfr->Flags & FR_DOWN ) ? lpstrPos - lpstrDoc1
			: strlen(lpstrDoc1) - (lpstrPos - lpstrDoc1) - strlen( lpstrFind );
	*lpdwSearchOffset = dwPos + strlen( lpfr->lpstrFindWhat );

	//
	// Select the found text
	//
	SendMessage( hSearch, EM_SETSEL, dwPos, *lpdwSearchOffset );
	SendMessage( hSearch, EM_SCROLLCARET, 0L, 0L );
	SetFocus( hFind );

	return( TRUE );
}

/****************************************************************************
*
*    FUNCTION: FindValidFind( void )
*
*    PURPOSE:
*
*    COMMENTS:
*
*    RETURN VALUES:
*
****************************************************************************/

BOOL FindValidFind( void )
{
	return( *szFindText != '\0' );
}

//--------------------------------------------------------------------------;
//
//  DWORD AppGetWindowsVersion
//
//  Description:
//      This function returns the version of Windows that the application
//      is running on plus some platform information.
//
//  Arguments:
//      PTSTR pach: Options pointer to buffer to receive text string of
//      the Windows version and platform.
//
//  Return (LRESULT):
//      The return value will be the version and platform information of
//      the current operating system in the following format:
//
//      0xPPPPMMRR where:
//
//      MM      :   major version of Windows
//      RR      :   minor version (revision) of Windows
//      PPPP    :   the platform the application is running on which
//                  will be one of the following:
//
//                  #ifdef WIN32
//                      the HIWORD() is RESERVED except for the high bit:
//                          high bit is 0 = Windows NT
//                          high bit is 1 = Win32s/Windows 3.1
//                  #else
//                      0xMMRR = Major and Minor version of [MS-]DOS
//                      GetWinFlags() & 0x8000 = Windows on OS/2 (WLO)
//                      GetWinFlags() & 0x4000 = Windows on Windows NT (WOW)
//                  #endif
//
//
//--------------------------------------------------------------------------;

LRESULT _stdcall AppGetWindowsVersion( PTSTR pszEnvironment,
									   PTSTR pszPlatform )
{

	LRESULT lr;
	OSVERSIONINFO  OSVersionInfo;

	OSVersionInfo.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
	GetVersionEx(&OSVersionInfo);

	// Dummy return value 
	lr = OSVersionInfo.dwPlatformId;
	//
	//  if caller wants the environment string version...
	//
	if (NULL != pszEnvironment)
	{
	//
	//
	//
#ifdef WIN32
{
	static TCHAR    szFormatVersion[]   = TEXT("%s Version %u.%.2u");
	static TCHAR    szEnvWinNT[]        = TEXT("Windows NT");
	static TCHAR    szEnvWin95[]        = TEXT("Windows 95");
	static TCHAR    szEnvWin32s[]       = TEXT("Win32s");
	TCHAR			szPlatform[15];

	switch(OSVersionInfo.dwPlatformId) 
	{
		case VER_PLATFORM_WIN32s:
			_tcscpy(szPlatform,szEnvWin32s);
			break;
		case VER_PLATFORM_WIN32_WINDOWS:
			_tcscpy(szPlatform,szEnvWin95);
			break;
		case VER_PLATFORM_WIN32_NT:
			_tcscpy(szPlatform,szEnvWinNT);
			break;
	}

	wsprintf(pszEnvironment, szFormatVersion,
			 (LPSTR)(szPlatform),
			 OSVersionInfo.dwMajorVersion, 
			 OSVersionInfo.dwMinorVersion);
}
#else
{
#ifndef WF_WINNT
	#define WF_WINNT        0x4000
	#define WF_WLO          0x8000
#endif
#ifndef WF_CPUMASK
	#define WF_CPUMASK      0xFC000000
	#define WF_CPU_X86      0
	#define WF_CPU_R4000    1
	#define WF_CPU_ALPHA    2
	#define WF_CPU_CLIPPER  3
#endif

	static TCHAR    szFormatSubSys[]= TEXT("Windows Version %u.%.2u (%s%s)\n%s Subsystem, DOS Version %u.%.2u");
	static TCHAR    szFormatDOS[]   = TEXT("Windows Version %u.%.2u (%s%s)\nDOS Version %u.%.2u");
	static TCHAR    szSubSysWLO[]   = TEXT("WLO");
	static TCHAR    szSubSysWOW[]   = TEXT("WOW");
	static TCHAR    szModeEnhanced[]= TEXT("Enhanced");
	static TCHAR    szModeStandard[]= TEXT("Standard");
	static TCHAR    szEnvPaging[]   = TEXT(", Paging");

	DWORD   dwWinFlags;
	PTSTR   pszMode;

	BYTE    bVerEnvMajor    = HIBYTE(LOWORD(uVerEnv));
	BYTE    bVerEnvMinor    = LOBYTE(LOWORD(uVerEnv));

	dwWinFlags = GetWinFlags();

	pszMode = (dwWinFlags & WF_ENHANCED) ? szModeEnhanced : szModeStandard;
	if (dwWinFlags & (WF_WLO | WF_WINNT))
	{
		wsprintf(pszEnvironment, szFormatSubSys, bVerWinMajor, bVerWinMinor,
				 (LPSTR)pszMode,
				 (LPSTR)((dwWinFlags & WF_PAGING) ? szEnvPaging : gszNull),
				 (LPSTR)((dwWinFlags & WF_WINNT) ? szSubSysWOW : szSubSysWLO),
				 bVerEnvMajor, bVerEnvMinor);
	}
	else
	{
		wsprintf(pszEnvironment, szFormatDOS, bVerWinMajor, bVerWinMinor,
				 (LPSTR)pszMode,
				 (LPSTR)((dwWinFlags & WF_PAGING) ? szEnvPaging : gszNull),
				 bVerEnvMajor, bVerEnvMinor);
	}
}
#endif
	}

	//
	//  if caller wants the platform string version...
	//
	if (NULL != pszPlatform)
	{
#ifdef WIN32
{
	static TCHAR    szFormatPlatform[]  = TEXT("%s%u, %u Processor(s)");
	static TCHAR    szProcessorIntel[]  = TEXT("Intel ");
	static TCHAR    szProcessorMIPS[]   = TEXT("MIPS R");
	static TCHAR    szProcessorAlpha[]  = TEXT("DEC Alpha ");
	static TCHAR    szProcessorDunno[]  = TEXT("Dunno zYz");

	SYSTEM_INFO sysinfo;
	PTSTR       pszProcessor;

	//
	//  this is absolutely silly. one would think that the dwOemId member
	//  would provide something useful like the processor class... but
	//  no, it doesn't--it is always 0.
	//
	GetSystemInfo(&sysinfo);
	switch (sysinfo.wProcessorArchitecture)
	{
		case PROCESSOR_ARCHITECTURE_INTEL:
			pszProcessor = szProcessorIntel;
			break;

		case PROCESSOR_ARCHITECTURE_MIPS:
			pszProcessor = szProcessorMIPS;
			break;

		case PROCESSOR_ARCHITECTURE_ALPHA:
			pszProcessor = szProcessorAlpha;
			break;

		default:
			pszProcessor = szProcessorDunno;
			break;
	}

	//
	//
	//
	wsprintf(pszPlatform, szFormatPlatform, (LPSTR)pszProcessor,
			 sysinfo.dwProcessorType, sysinfo.dwNumberOfProcessors);
}
#else
{
	static TCHAR    szPlat286[]         = TEXT("80286");
	static TCHAR    szPlat386[]         = TEXT("80386");
	static TCHAR    szPlat486[]         = TEXT("i486");
	static TCHAR    szPlatR4000[]       = TEXT("MIPS R4000, Emulation: ");
	static TCHAR    szPlatAlpha21064[]  = TEXT("Alpha 21064, Emulation: ");
	static TCHAR    szPlatClipper[]     = TEXT("Clipper, Emulation: ");
	static TCHAR    szPlat80x87[]       = TEXT(", 80x87");

	DWORD   dwWinFlags;

	dwWinFlags = GetWinFlags();
	pszPlatform[0] = '\0';

	if (dwWinFlags & (WF_WLO | WF_WINNT))
	{
		switch ((dwWinFlags & WF_CPUMASK) >> 26)
		{
			case WF_CPU_X86:
				break;

			case WF_CPU_R4000:
				lstrcpy(pszPlatform, szPlatR4000);
				break;

			case WF_CPU_ALPHA:
				lstrcpy(pszPlatform, szPlatAlpha21064);
				break;

			case WF_CPU_CLIPPER:
				lstrcpy(pszPlatform, szPlatClipper);
				break;
		}
	}

	if (dwWinFlags & WF_CPU286)
		lstrcat(pszPlatform, szPlat286);
	else if (dwWinFlags & WF_CPU386)
		lstrcat(pszPlatform, szPlat386);
	else if (dwWinFlags & WF_CPU486)
		lstrcat(pszPlatform, szPlat486);

	if (dwWinFlags & WF_80x87)
		lstrcat(pszPlatform, szPlat80x87);
}
#endif
	}

	//
	//  return the result
	//
	return (lr);
} // AppGetWindowsVersion()

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: GetInstallationInfo                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: October 5, 1994                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function gets the installer name and company from the */
/*    registry.                                                       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    szInstaller    A pointer to a string that will contain the      */
/*                   name provided during installation.               */
/*                   The returned value will be NULL terminated.      */
/*                                                                    */
/*    szCompany      A pointer to a string that will contain the      */
/*                   company name provided during installation.       */
/*                   The returned value will be NULL terminated.      */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

LPSTR szLocalMachineDECtalk =
  "SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.30";

static void GetInstallationInfo( LPSTR szInstaller, LPSTR szCompany )
{
  HKEY hKey;
  DWORD dwType;
  DWORD cbData;

  if ( RegOpenKeyEx( HKEY_LOCAL_MACHINE,
					 szLocalMachineDECtalk,
					 0,
					 KEY_QUERY_VALUE,
					 &hKey ) != ERROR_SUCCESS )
  {
	szInstaller[0] = '\0';
	szCompany[0] = '\0';
  }
  else
  {
	cbData = 511;

	if ( RegQueryValueEx( hKey,
						  "Installer",
						  NULL,
						  &dwType,
						  (LPBYTE)szInstaller,
						  &cbData ) != ERROR_SUCCESS )
	{
	  szInstaller[0] = '\0';
	}

	cbData = 511;

	if ( RegQueryValueEx( hKey,
						  "Company",
						  NULL,
						  &dwType,
						  (LPBYTE)szCompany,
						  &cbData ) != ERROR_SUCCESS )
	{
	  szCompany[0] = '\0';
	}

	RegCloseKey( hKey );
  }
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: GetApplicationParameters                                */
/*  Author: Bill Hallahan                                             */
/*  Date: October 6, 1994                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function gets the last window position and show state */
/*    in the registry.                                                */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    piX        A pointer to an integer that will contain the        */
/*               X (horizontal) position of the application           */
/*               window.                                              */
/*                                                                    */
/*    piY        A pointer to an integer that will contain the        */
/*               Y (vertical) position of the application             */
/*               window.                                              */
/*                                                                    */
/*    piWidth    A pointer to an integer that will contain the        */
/*               width of the application window.                     */
/*                                                                    */
/*    piHeight   A pointer to an integer that will contain the        */
/*               height of the application window.                    */
/*                                                                    */
/*    piShow     A pointer to an integer that will contain the        */
/*               show state of the window.                            */
/*                                                                    */
/*    pszFile    A pointer to memory that will contain a NULL         */
/*               terminated string of characters. It must be at       */
/*               least FILESIZE bytes.                                */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

LPSTR szCurrentUsersSpeak =
  "Software\\DigitalEquipmentCorporation\\DECtalk\\4.30\\Applications\\Speak";

static void GetApplicationParameters( int * piX,
									  int * piY,
									  int * piWidth,
									  int * piHeight,
									  int * piShow,
									  char * pszFile )
{
  HKEY hKey;
  DWORD dwType;
  DWORD cbData;
  DWORD dwXY;
  DWORD dwWH;

  /********************************************************************/
  /*  Open the registry for the application.                          */
  /********************************************************************/

  if ( RegOpenKeyEx( HKEY_CURRENT_USER,
					 szCurrentUsersSpeak,
					 0,
					 KEY_QUERY_VALUE,
					 &hKey ) != ERROR_SUCCESS )
  {
	/******************************************************************/
	/*  If the key is not accessible then use default values.         */
	/******************************************************************/

	*piShow = SW_SHOWNORMAL;
	*piX = 0;
	*piY = 0;
	*piWidth = awWidth;
	*piHeight = awHeight;
	*pszFile = '\0';
  }
  else
  {
	/******************************************************************/
	/*  Read the former window SHOW state.                            */
	/******************************************************************/

	cbData = 4;

	if ( RegQueryValueEx( hKey,
						  "Show",
						  NULL,
						  &dwType,
						  (LPBYTE)piShow,
						  &cbData ) != ERROR_SUCCESS )
	{
	  *piShow = SW_SHOWNORMAL;
	}

	/******************************************************************/
	/*  Read the former window X and Y positions.                     */
	/******************************************************************/

	cbData = 4;

	if ( RegQueryValueEx( hKey,
						  "Position",
						  NULL,
						  &dwType,
						  (LPBYTE)&dwXY,
						  &cbData ) != ERROR_SUCCESS )
	{
	  *piX = 0;
	  *piY = 0;
	}
	else
	{
	  *piX = dwXY & 0xFFFF;
	  *piY = ( dwXY >> 16 ) & 0xFFFF;

	  if ( *piX > 32767 )
		*piX = 0;

	  if ( *piY > 32767 )
		*piY = 0;
	}

	/******************************************************************/
	/*  Read the former window width and height.                      */
	/******************************************************************/

	cbData = 4;

	if ( RegQueryValueEx( hKey,
						  "Size",
						  NULL,
						  &dwType,
						  (LPBYTE)&dwWH,
						  &cbData ) != ERROR_SUCCESS )
	{
	  *piWidth = awWidth;
	  *piHeight = awHeight;
	}
	else
	{
	  *piWidth = dwWH & 0xFFFF;
	  *piHeight = ( dwWH >> 16 ) & 0xFFFF;

	  if ( *piWidth > 32767 )
		*piWidth = awWidth;

	  if ( *piHeight > 32767 )
		*piHeight = awHeight;
	}

	/******************************************************************/
	/*  Read the former file title.                                   */
	/******************************************************************/

	cbData = FILESIZE;

	if ( RegQueryValueEx( hKey,
						  "File",
						  NULL,
						  &dwType,
						  (LPBYTE)pszFile,
						  &cbData ) != ERROR_SUCCESS )
	{
	  *pszFile = '\0';
	}

	/******************************************************************/
	/*  Close the registry.                                           */
	/******************************************************************/

	RegCloseKey( hKey );
  }
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: SetApplicationParameters                                */
/*  Author: Bill Hallahan                                             */
/*  Date: October 6, 1994                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function sets the last window position and show state */
/*    in the registry.                                                */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd        A handle to the application window.                 */
/*                                                                    */
/*    pszFile    A pointer to memory that contains a NULL             */
/*               terminated string of characters.                     */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void SetApplicationParameters( HWND hWnd, char * pszFile )
{
  int iX;
  int iY;
  int iWidth;
  int iHeight;
  int iShow;
  HKEY hKey;
  DWORD cbData;
  DWORD dwXY;
  DWORD dwWH;
  DWORD dwDisposition;
  WINDOWPLACEMENT WindowPlacement;

  /********************************************************************/
  /*  Open the registry for the application.                          */
  /********************************************************************/

  if ( RegOpenKeyEx( HKEY_CURRENT_USER,
					 szCurrentUsersSpeak,
					 0,
					 KEY_ALL_ACCESS,
					 &hKey ) != ERROR_SUCCESS )
  {
	/******************************************************************/
	/*  The specified key was NOT found in the registry. Create       */
	/*  the registry entries.                                         */
	/******************************************************************/

	if ( RegCreateKeyEx( HKEY_CURRENT_USER,
						 szCurrentUsersSpeak,
						 0,
						 "",
						 REG_OPTION_NON_VOLATILE,
						 KEY_ALL_ACCESS,
						 NULL,
						 &hKey,
						 &dwDisposition ) != ERROR_SUCCESS )
	{
	  /****************************************************************/
	  /*  Unable to update registry entries. Exit with no error.      */
	  /****************************************************************/

	  return;
	}
  }

  /********************************************************************/
  /*  Set the registry entries for the window placement data.         */
  /********************************************************************/

  WindowPlacement.length = sizeof(WINDOWPLACEMENT);

  if ( GetWindowPlacement( hWnd, &WindowPlacement ))
  {
	cbData = 4;
	iShow = WindowPlacement.showCmd;

	RegSetValueEx( hKey,
				   "Show",
				   0,
				   REG_DWORD,
				   (LPBYTE)&iShow,
				   sizeof( DWORD ));

	/******************************************************************/
	/*  Set the registry entries for the window X and Y coordinates.  */
	/******************************************************************/

	iX = WindowPlacement.rcNormalPosition.left;
	iY = WindowPlacement.rcNormalPosition.top;
	dwXY = ( iY << 16 ) + iX;
	cbData = 4;

	RegSetValueEx( hKey,
				   "Position",
				   0,
				   REG_DWORD,
				   (LPBYTE)&dwXY,
				   sizeof( DWORD ));

	/******************************************************************/
	/*  Set the registry entries for the window width and height.     */
	/******************************************************************/

	iWidth = WindowPlacement.rcNormalPosition.right
			 - WindowPlacement.rcNormalPosition.left;

	iHeight = WindowPlacement.rcNormalPosition.bottom
			  - WindowPlacement.rcNormalPosition.top;

	dwWH = ( iHeight << 16 ) + iWidth;

	cbData = 4;

	RegSetValueEx( hKey,
				   "Size",
				   0,
				   REG_DWORD,
				   (LPBYTE)&dwWH,
				   sizeof( DWORD ));
  }

  /********************************************************************/
  /*  Set the registry entry for the current file title.              */
  /********************************************************************/

  RegSetValueEx( hKey,
				 "File",
				 0,
				 REG_SZ,
				 (LPBYTE)pszFile,
				 1 + strlen( pszFile ));

  /********************************************************************/
  /*  Close the registry.                                             */
  /********************************************************************/

  RegCloseKey( hKey );

  return;
}

  
MMRESULT CreateTTSObject(char *pszInstanceName,PDWORD pdwInstanceID,
						HWND *phWndTTS,LPTTS_HANDLE_T phTTSInst,
						WNDPROC wndProc)
{
	MMRESULT mmStatus =MMSYSERR_NOERROR;
	CHAR szErrString[200];
    CHAR szError[132];

	if(!CreateAWindowForNewTTSSession(pszInstanceName,phWndTTS,wndProc))
	{
		sprintf(szErrString,"Unable to Create %s TTS instance window",pszInstanceName);
		MessageBox(NULL,szErrString,"SPEAK ERROR", MB_OK);
		return (-1);
	}

	mmStatus = TextToSpeechStartup( *phWndTTS,
									&phTTSInst,
									0,
									DO_NOT_USE_AUDIO_DEVICE);

    if ( mmStatus == MMSYSERR_ERROR)
	{
		 MessageBox( *phWndTTS, "Can't find DECtalk Dictionary \n dectalk.dic, Shutting down!", "SPEAK ERROR", MB_OK );
		 return( -1 );
	}

    if (mmStatus)
	{
		sprintf( szError, "Error = %d", mmStatus );

		MessageBox( *phWndTTS,
				  szError,
				  "TTS startup with no audio device",
				  MB_OK | MB_ICONSTOP );
	   //MessageBox( hWnd, "Error starting up Text to Speech system",
	   //"Error", MB_OK );
	}
    
	//MVP : When TextToSpeechStartup is modified to return InstanceID,
	//   initialize the InstanceID below accordingly.
	// For now it is initialized with Speech Handle.

	*pdwInstanceID = (DWORD)phTTSInst;	

	#ifdef _WIN64
	SetWindowLongPtr(*phWndTTS, GWLP_USERDATA, phTTSInst);
	#else
	SetWindowLong(*phWndTTS,GWL_USERDATA,(LONG)phTTSInst);
	#endif

	return (mmStatus);
}


BOOL CreateAWindowForNewTTSSession(char *szInstanceName,HWND *phWnd,WNDPROC wndProc)
{
  WNDCLASS    wndclass ;
  MSG         msg ;

  wndclass.style         = CS_HREDRAW | CS_VREDRAW; 
  wndclass.lpfnWndProc   = (WNDPROC) wndProc ;
  wndclass.cbClsExtra    = 0 ;
  wndclass.cbWndExtra    = 0 ;
  wndclass.hInstance     = ghInstance ;
  wndclass.hIcon         = NULL;
  wndclass.hCursor       = NULL;
  wndclass.hbrBackground = NULL;
  wndclass.lpszMenuName  = NULL;
  wndclass.lpszClassName = szInstanceName ;

  if ( ! RegisterClass( &wndclass ))
	return( FALSE );

  *phWnd = CreateWindow( szInstanceName,
					   szInstanceName,
					   WS_CAPTION | WS_SYSMENU
					   | WS_OVERLAPPEDWINDOW | WS_VISIBLE
					   | WS_MINIMIZEBOX,
					   CW_USEDEFAULT,
					   CW_USEDEFAULT,
					   CW_USEDEFAULT,
					   CW_USEDEFAULT,
					   NULL, NULL, NULL, NULL );

	/* If window could not be created, return "failure" */

	if ( ! *phWnd )
	{
	//error = GetLastError();
	return( FALSE );
	}

	ShowWindow( *phWnd, SW_HIDE );
	UpdateWindow( *phWnd );                /* Sends WM_PAINT message */
}

//MVP : TTS Instance (TTSWave16WndProc)

LONG APIENTRY TTSWave16WndProc(HWND hWndTTS,
					  UINT uiMessage,
					  WPARAM wParam,
					  LPARAM lParam)
{
	LPTTS_HANDLE_T phTTSWaveInst16 = NULL;
	MMRESULT mmStatus = MMSYSERR_NOERROR;


	#ifdef _WIN64
	phTTSWaveInst16 = (LPTTS_HANDLE_T)GetWindowLongPtr(hWndTTS,GWLP_USERDATA);
	#else
	phTTSWaveInst16 = (LPTTS_HANDLE_T)GetWindowLong(hWndTTS,GWL_USERDATA);
	#endif


	switch(uiMessage)
	{
	case WM_DESTROY:
		mmStatus = TextToSpeechShutdown( phTTSWaveInst16);
		if ( mmStatus )
			   MessageBox( hWndTTS,
			   "Error Shutting down TTS" ,
			   "ERROR",
			   MB_OK | MB_ICONSTOP );
		    
		//PostQuitMessage(0);
		return 0L;
	default :
		 return (DefWindowProc (hWndTTS, uiMessage, wParam, lParam)) ;
	}

	return 0L;
}



