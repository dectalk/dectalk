//----------------------------------------------------------------------------
//  Project watchd
//
//  Copyright ) 1996. All Rights Reserved.
//
//  SUBSYSTEM:    watchd.apx Application
//  FILE:         sendmail.cpp
//  AUTHOR:       Joao Carreira (jcar@dei.uc.pt)
//
//  OVERVIEW
//  ~~~~~~~~
//		Class that implements an SMTP mail client and enables an application
//		to send emails.
//
//----------------------------------------------------------------------------
// Joao Carreira
// This class is based on the original code by Jarle Aase, see bellow:
// wSendmail.cpp
// Very simple SMTP Send-mail program for sending command-line level
// emails and CGI-BIN form response for the Windows platform.
//
// The program supports mime 1.0 encoding of European national characters.
// It also applies to the RFC 821 and RFC 822 specs.
// This code is donated into the public domain. It is written in a hurry.
// No support is available, but please report bugs to the author.
// Author: Jarle Aase <jgaa@telepost.no>
// Project started: Apr. 26 1996
// If you modify this code, please send me an email so I can incorporate
// your improvments/bugfixes in the official version.
//
//
#include <stdio.h>
#include <stdlib.h>
#include "winsock.h"
#include <time.h>
#include <string.h>
#include <malloc.h>
#include <memory.h>
#include <winbase.h>
#include "sendmail.h"


extern int _daylight;
extern long _timezone;

/*enum
{
	DO_CONNECT = WM_USER +1
};
*/

static char *days[] = {"Sun", "Mon","Tue", "Wed", "Thu", "Fri", "Sat"};
static char *months[] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};


// Error messages
static char *ErrorMessages[] =
{
	{"Success"},
	{"Bad arguments from form"},
	{"Unable to open temporary mailfile for read"},
	{"Failed to Start Sockets"},
	{"Failed to Resolve Host"},
	{"Failed to obtain socket handle"},
	{"Failed to Connect"},
	{"Failed to Send"},
	{"Failed to Receive"},
	{"Server Error"},
	{"Failed to resolve the host IP name"},
	{"Out of memory"},
	{"Unknown error"},
	{"Bad Message Contents"},
	{"Bad Message Subject"},
	{"Bad Message destination"},
	{"Bad Message Return Path"},
	{"Bad Mail Host"},
	{"Bad Message File"}

};



//********************************************************************
// Name:  TSendMail::TSendMail
// Input:	1) host:	Name of the mail host where the SMTP server resides
//							max accepted length of name = 256
//				2) appname: Name of the application to use in the X-mailer
//								field of the message. if NULL is given the application
//								name is used as given by the GetCommandLine() function
//								max accespted length of name = 100
// Output:	1) error:	Returns the error code if something went wrong or
//                      SUCCESS otherwise.
// Description: CONSTRUCTOR
// Author/Date:  jcar 20/9/96
// History:
//********************************************************************
TSendMail::TSendMail(char *host,
                     char *appname,
                     int *error)
{
	char *cmdline;
   int	i;

   WinsockStarted = FALSE;

	if (host == NULL) {
		*error = BAD_MAIL_HOST;
      return;
	} else if (strlen(host) >= HOST_NAME_LEN) {
		*error = BAD_MAIL_HOST;
      return;
	} else {
   	strcpy(MailHost, host);
	}

	if (appname == NULL) {
		cmdline = GetCommandLine();
		for(i=0; i < (MAX_APPNAME_LENGHT-1); i++) {
			if (cmdline[i] != ' ')
	      	AppName[i] = cmdline[i];
   		else
         	break;
		}
     	AppName[i] = '\0';
	} else if (strlen(appname) >= MAX_APPNAME_LENGHT) {
		appname[MAX_APPNAME_LENGHT-1] ='\0';
		strcpy(AppName, appname);
	} else
		strcpy(AppName, appname);

	// attempt to connect with mail host
	*error = MailConnect();
}



//********************************************************************
// Name:  TSendMail::~TSendMail
// Input:
// Output:
// Description: DESTRUCTOR
// Author/Date:  jcar 20/9/96
// History:
//********************************************************************
TSendMail::~TSendMail() {

	Post("QUIT\r\n");
   Ack();
   // to guarantee that the cleanup is not made twice and
   // compomise the rest of the application if sockets are used
   // elesewhere
   if (WinsockStarted)
		WSACleanup();
}


//********************************************************************
// Name:  char *TSendMail::GetErrorText
// Input:	Error index returned by the menber functions
// Output:  pointer to a string containing the error description
// Description:
// Author/Date:  jcar 20/9/96
// History:
//********************************************************************
char *TSendMail::GetErrorText(int index) {

   if ((index > MAX_ERROR_INDEX) || (index < MIN_ERROR_INDEX))
   	return(ErrorMessages[UNKNOWN_ERROR]);
	else
     	return(ErrorMessages[index]);
}


//********************************************************************
// Name:  TSendMail::TSendText
// Input:		1) RPath:	return path of the message
//									Is used to fill the "Return-Path" and the
//									"X-Sender" fields of the message.
//					2) Subject:	Subject field of the message. If NULL is given
//									the subject is set to "No Subject"
//					3) mailTo:	Destination address
//					4) data:		Null terminated string containing the data to be send.
// Output:		Error code or SUCCESS
// Description:
// Author/Date:  jcar 20/9/96
// History:
//********************************************************************
int TSendMail::SendText(char *RPath,
                     char *Subject,
                     char *mailTo,
                     char *data ) {

   int res, i;
   char *p;

	// check for NULL parameters
	if (data == NULL)
		return (BAD_MSG_CONTENTS);
	if (mailTo == NULL)
		return (BAD_MSG_DESTINATION);
	if (RPath == NULL)
		return (BAD_MSG_RPATH);

	// simple checks for the mailto address
   // have ampersand ?
   if (strchr(mailTo, '@') == NULL)
		return (BAD_MSG_DESTINATION);

	sprintf(Buffer,"HELO %s\r\n", LocalHost);

	// in the beggining of the dialog
   // attempt reconnect if the first Post fail
   if ((res = Post(Buffer)) != SUCCESS) {
		WSACleanup();
		WinsockStarted = FALSE;      	
   	MailConnect();
   	if ((res = Post(Buffer)) != SUCCESS)
   		return (res);
	}

   if ((res = Ack()) != SUCCESS)
   	return (res);

	sprintf(Buffer,"MAIL FROM:<%s>\r\n", RPath);
   if ((res = Post(Buffer)) != SUCCESS)
   	return (res);
   if ((res = Ack()) != SUCCESS)
   	return (res);


	sprintf(Buffer,"RCPT TO:<%s>\r\n", mailTo);
   if ((res = Post(Buffer)) != SUCCESS)
   	return (res);
   if ((res = Ack()) != SUCCESS)
   	return (res);

   if ((res = Post("DATA\r\n")) != SUCCESS)
   	return (res);
   if ((res = Ack()) != SUCCESS)
   	return (res);


	// send message header
	if (Subject == NULL)
	   res = PostHeader(RPath, "No Subject", mailTo, FALSE);
	else
	   res = PostHeader(RPath, Subject, mailTo, FALSE);
	if (res != SUCCESS)
   	return(res);


	// send message contents in 1024 chunks
	if (strlen(data) <= 1024) {
		if ((res = Post(data)) != SUCCESS)
      		return (res);
	} else {
	   p = data;
		while (1) {
      	if (*p == '\0')
         	break;
	      if (strlen(p) >= 1024)
         	i = 1024;
			else
         	i = strlen(p);

			// put next chunk in buffer
			strncpy(Buffer, p, i);
     		Buffer[i] = '\0';
         p += i;

         // send chunk
			if ((res = Post(Buffer)) != SUCCESS)
		  		return (res);
		}
   }

	//send termination dot
   if ((res = Post("\r\n.\r\n")) != SUCCESS)
   	return (res);
   if ((res = Ack()) != SUCCESS)
   	return (res);

	return (SUCCESS);
}



//********************************************************************
// Name:  TSendMail::PostHeader
// Input:		1) return path
//					2) Subject
//					3) destination address
//					4) DoMime flag
// Output:		Error code or Success
// Description:
// Author/Date:  jcar 20/9/96
// History:
//********************************************************************
int TSendMail::PostHeader(char *RPath, char *Subject, char *mailTo, bool DoMime)
{

	// Print message header according to RFC 822
	// Return-path, Received, Date, From, Subject, Sender, To, cc

	time_t tNow = time(NULL);
	struct tm *tm = localtime(&tNow);
	int zoneh = abs(_timezone);
	int zonem, res;
   char *p = Buffer;

	p = Buffer;
	zoneh /= (60 * 60);
	zonem = (abs(_timezone) / 60) - (zoneh * 60);

	p += sprintf(Buffer,"Return-Path: %s\r\n", RPath);
	p += sprintf(p,"X-Sender: %s\n", RPath);

	if (DoMime)	{
		p += sprintf(p,"X-Mailer: %s\r\nMime-Version: 1.0\r\nContent-Type: text/plain; charset=\"iso-8859-1\"\r\nContent-Transfer-Encoding: quoted-printable\r\n",
			AppName);

	}	else	{
		p += sprintf(p,"X-Mailer: %s\r\nContent-Type: text/plain; charset=us-ascii\r\n",
			AppName);
	}

	p += sprintf(p, "Date: %s, %02d %s %04d %02d:%02d:%02d %s%02d%02d\r\n",
		days[tm->tm_wday],
		tm->tm_mday,
		months[tm->tm_mon],
		tm->tm_year + 1900,
		tm->tm_hour,
		tm->tm_min,
		tm->tm_sec,
		(_timezone > 0) ? "+" : (_timezone < 0) ? "-" : "",
		zoneh,
		zonem);

	p += sprintf(p,"From: %s\r\n", RPath);
	p += sprintf(p,"Subject: %s\r\n", Subject);
	p += sprintf(p,"To: %s\r\n", mailTo);

	if ((res = Post(Buffer)) != SUCCESS)
   	return(res);

	if ((res = Post("\r\n")) != SUCCESS)
   	return(res);

	return (SUCCESS);
}



//********************************************************************
// Name:  TSendMail::TSendFile
// Input:
// Output:
// Description:
// Author/Date:  jcar 20/9/96
// History:
//********************************************************************
int TSendMail::SendFile(char *RPath,
                     char *Subject,
                     char *mailTo,
                     char *mailFile,
                     bool deleteFile,
                     bool doMime )  {

   int res;
   BOOL rread;
   DWORD rbytes;
   HANDLE FileH;

	// check parameters
	if (mailFile == NULL)
		return (BAD_MSG_FILE);
	if (mailTo == NULL)
		return (BAD_MSG_DESTINATION);
	if (RPath == NULL)
		return (BAD_MSG_RPATH);

	// simple checks for the mailto address
   // have ampersand ?
   if (strchr(mailTo, '@') == NULL)
		return (BAD_MSG_DESTINATION);

	// check mail file
	FileH = CreateFile(mailFile, GENERIC_READ,
   							FILE_SHARE_READ, NULL, OPEN_EXISTING,
            	         FILE_ATTRIBUTE_NORMAL, NULL);
	if (FileH == INVALID_HANDLE_VALUE)
		return (FAILED_TO_OPEN_MAILFILE);



	sprintf(Buffer,"HELO %s\r\n", LocalHost);
	// in the beggining of the dialog
   // attempt reconnect if the first Post fail
   if ((res = Post(Buffer)) != SUCCESS) {
		WSACleanup();
		WinsockStarted = FALSE;      
   	MailConnect();
   	if ((res = Post(Buffer)) != SUCCESS)
   		return (res);
	}

   if ((res = Ack()) != SUCCESS)
   	return (res);

	sprintf(Buffer,"MAIL FROM:<%s>\r\n", RPath);
   if ((res = Post(Buffer)) != SUCCESS)
   	return (res);
   if ((res = Ack()) != SUCCESS)
   	return (res);


	sprintf(Buffer,"RCPT TO:<%s>\r\n", mailTo);
   if ((res = Post(Buffer)) != SUCCESS)
   	return (res);
   if ((res = Ack()) != SUCCESS)
   	return (res);

   if ((res = Post("DATA\r\n")) != SUCCESS)
   	return (res);
   if ((res = Ack()) != SUCCESS)
   	return (res);


	// send message header
	if (Subject == NULL)
	   res = PostHeader(RPath, "No Subject", mailTo, doMime);
	else
	   res = PostHeader(RPath, Subject, mailTo, doMime);
	if (res != SUCCESS)
   	return(res);


	// send message contents
   while (1) {
   	// Read data in 1024 chunks
		rread = ReadFile(FileH, Buffer, 1024, &rbytes, NULL);
		if (!rread) {
			CloseHandle(FileH);
			return (FAILED_TO_OPEN_MAILFILE);
		} else  if  (rbytes != 0) {
        	Buffer[rbytes] = '\0';
			if (doMime) {
				if ((res = Post(Map8Bit(Buffer))) != SUCCESS)
   			return (res);
			} else {
         	if ((res = Post(Buffer)) != SUCCESS)
   				return (res);
			}
      } else
      	break;
	} // while

	CloseHandle(FileH);

	//send termination dot
   if ((res = Post("\r\n.\r\n")) != SUCCESS)
   	return (res);
   if ((res = Ack()) != SUCCESS)
   	return (res);

	if (deleteFile)
   	DeleteFile(mailFile);
      
	return (SUCCESS);
}




//********************************************************************
// Name:  TSendMail::MailConnect
// Input:	None
// Output:	None
// Description: Connect to the mail host and receive the welcome message.
// Author/Date:  jcar 20/9/96
// History:
//********************************************************************
int TSendMail::MailConnect()
{

   int res;

	//Init Winsock
	if (!WinsockStarted) {
		if (WSAStartup(MAKEWORD(1, 1), &Data) != 0)
			return (FAILED_TO_START_SOCKETS);
		WinsockStarted = TRUE;
	}      

	// Create Socket
	if ((sc = socket(PF_INET,SOCK_STREAM,0)) == INVALID_SOCKET)
		return (FAILED_TO_OBTAIN_SOCKET_HANDLE);

  	// Get our own host name
	if (gethostname(LocalHost,HOST_NAME_LEN))
		return(FAILED_TO_GET_HOSTNAME);

	// Resolve the servers IP
	adr = gethostbyname(MailHost);
	if (!adr)
		return(FAILED_TO_RESOLVE_HOST);

	// Connect to server
	sin.sin_family = AF_INET;
	sin.sin_port = htons(25);
	sin.sin_addr.S_un.S_addr = GetAddr(MailHost);

	if (connect(sc, (LPSOCKADDR)&sin, sizeof(sin)))
		return (FAILED_TO_CONNECT);

	// receive Server welcome message
	res = Ack() ;
   return (res);
}






//********************************************************************
// Name:  TSendMail::Post
// Input:
// Output:
// Description:
// Author/Date:  jcar 20/9/96
// History:
//********************************************************************
int TSendMail::Post(LPCSTR msg)
{
	int len = strlen(msg);
	int slen;
	int index = 0;

	while(len > 0)	{
		if ((slen = send(sc,msg + index,len,0)) < 1)
			return(FAILED_TO_SEND);
		len -= slen;
		index += slen;
	}
	return (SUCCESS);
}



//********************************************************************
// Name:  TSendMail::Ack
// Input:
// Output:
// Description:
// Get the response from the server. We only want to know if the
// last command was successful.
// Author/Date:  jcar 20/9/96
// History:
//********************************************************************
int TSendMail::Ack()
{
	static char *buf;
	int rlen;
	int Index = 0;
	int Received = 0;

	if (!buf)
		if ((buf = (char *)malloc(1024 * 4)) == NULL)
			return(OUT_OF_MEMORY);

again:

	if ((rlen = recv(sc,buf + Index,((1024 * 4) - 1) - Received,0)) < 1)
		return(FAILED_TO_RECEIVE);

	Received += rlen;
	buf[Received] = 0;
	//err_msg	fprintf(stderr,"Received: (%d bytes) %s", rlen, buf + Index);

	// Check for newline
	Index += rlen;
	if ((buf[Received -2] != '\r') || (buf[Received -1] != '\n'))
		// err_msg			fprintf(stderr,"Incomplete server message. Awaiting CRLF\n");
		goto again; // Incomplete data. Line must be terminated by CRLF

	if (buf[0] > '3')
		return(SERVER_ERROR);

	return (SUCCESS);
}




//********************************************************************
// Name:  char * TSendMail::Map8Bit(LPCSTR Text)
// Input:
// Output:
// Description:
// Map european characters. Use MIME 1.0 encoding
// Author/Date:  jcar 20/9/96
// History:
//********************************************************************
char *TSendMail::Map8Bit(LPCSTR Text)
{

	int BufLen = (strlen(Text) * 2) + 1024;
	static char *buf;
	char *p, *pp;

	if (buf)
		delete buf;

	p = buf = new char[BufLen];

	while(*Text)
	{
		if ((*Text == '\n') && (Text[1] == '.') && (Text[2] == '\r'))
			*p++ = '.';

		if ((((unsigned char)*Text) > 127) || (*Text == '='))
		{
			char mybuf[16];
			sprintf(mybuf,"=%02X", (unsigned int)((unsigned char)*Text));
			pp = mybuf;
			while(*pp)
				*p++ = *pp++;
			Text++;
			continue;
		}
		*p++ = *Text++;
		continue;
	}
	*p = 0;
	return buf;
}





//********************************************************************
// Name:  unsigned long GetAddr (LPSTR szHost)
// Input:
// Output:
// Description: Given a string, it will return an IP address.
//   - first it tries to convert the string directly
//   - if that fails, it tries o resolve it as a hostname
//
// WARNING: gethostbyname() is a blocking function
// Author/Date:  jcar 20/9/96
// History:
//********************************************************************
unsigned long TSendMail::GetAddr(LPSTR szHost)
{
  LPHOSTENT lpstHost;
  u_long lAddr = INADDR_ANY;

  /* check that we have a string */
  if (*szHost) {

    /* check for a dotted-IP address string */
    lAddr = inet_addr (szHost);

    /* If not an address, then try to resolve it as a hostname */
    if ((lAddr == INADDR_NONE) && (strcmp(szHost, "255.255.255.255"))) {

      lpstHost = gethostbyname(szHost);
      if (lpstHost) {  /* success */
        lAddr = *((u_long FAR *) (lpstHost->h_addr));
      } else {
        lAddr = INADDR_ANY;   /* failure */
      }
    }
  }
  return (lAddr);
} /* end GetAddr() */

