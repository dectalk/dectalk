// wSendmail.cpp
// Very simple SMTP Send-mail program for sending command-line level
// emails and CGI-BIN form response for the Windows platform.
//
// The program can run as a command line command, or as a CGI-BIN app, using the
// POST method from any HTTP form.
//
// If used as a CGI-BIN app, the following fields are required:
//		"from" = senders email address (will map to "someone@somewhere.com" if not
//             filled in
//    "RCPT" = Receiver of the email. There can me any number of receivers.
//             This field will typically be hidden.
//             The data value of this filed is a nickname defined in the
//             wsendmail.ini file in your windows directory. This way
//             mail can only be sent *to* mailboxes autorized by you.
//		"subject" = The subject field in the email. Typically used to 
//             identify the HTTP page that generated the email.
//
// Any other form fields will be included in the message body with the filed
// name as a header, and the contents following on the next line.
// This version supports a total of 500 fields. This can be increased by
// changing the MAX_ENTRIES macro below.
//
// The program supports mime 1.0 encoding of European national characters.
// It also applies to the RFC 821 and RFC 822 specs.
//
// This code is donated into the public domain. It is written in a hurry.
// No support is available, but please report bugs to the author.
// Author: Jarle Aase <jgaa@telepost.no>
// Project started: Apr. 26 1996
//
// Syntax for command line mode:
//    wSendmail [-debug] [-verbose] [-sSubject] [-fFrom] someone@somewhere.com mail_body_file
//
// Example:
//    wsendmail jgaa@telepost.no "-sHello, this is a test" -verbose -fme@me.com c:\tmp\mailxx.txt
//    wsendmail jgaa@telepost.no "-sHello, this is a test" -verbose -fme@me.com
//    wsendm~1 jgaa@telepost.no "-sHello, this is a test" -verbose -fme@me.com
// 
// If you modify this code, please send me an email so I can incorporate
// your improvments/bugfixes in the official version.
//
// Jgaa: May. 1 1996 - ver 1.1
//       Added line paramters for logging and subject
//       Fixed a problem with the sending hostname
//
// Jgaa: May. 12 1996 - ver 1.2
//       Changed from Windows to "cleen" Console mode. Logging is now replaced with direct output to console
//       Added -fFrom line parameter
//       Added option to read message body from stdin
//       Increased default number of CGI Form fields to 500
//       Added option to allow CGI forms to bypass security and send to *any* email account
//       Placed HTML header, error and ack message tags to wsendmail.ini
//       -sSubject line paramter can now handle white space if enclosed in brackets
//			 
// M. Spoek: May. 28 1996 - ver 1.2H
//       Added multiple recipients when using command-line args.
//       To send a file to more people, seperate them with a comma, like below:
//       wSendmail person1@place1,person2@place2,person3@place3
//       I think it's up to Jarle to expand this option into pe. a mailing list
//       by using @persons.txt to indicate a list of addresses.
//       This file is not distributed by me.
//       Note: Good work, Jarle! I've been looking for this source!
//             My E-mail is: SoloH@bART.nl
//
// M. Spoek: May. 28 1996 - ver 1.2H
//       Added option @mailinglist to indicate a file with a list of addresses.
//       For this I added the function
//       char * ParseRCTP(char * toWho)
//       and modified some code to make use of it
//       Note: That was my last change to your code, Jarle.
//             I only modified it for my own practicle use, because i've to
//             send files to a lot of people every week.
//             It's your project, so do whatever you like with this addition.
//             I'm not in for the credits, just to support a very handy util!
//             See you!
//
// Jgaa: June 28 1996 - ver 1.3
//			Implemented changes made by M. Spoek in the distribution (Thanks!)
//			Added support for multi-packet reply messages (bugfix)
//			Added MS IIS spesific header support
//			Added option to turn off MIME encoding
//			Fixed a bug in the original MIME  encoding that messed up '=' characters
//
// Jgaa: July 27 1996 - ver 1.4
//			Minor bugfix in memory allocation. Thanks to David Turnbull!
//
// Jgaa: Oct. 6 1996 - ver 1.5
//			Minor bugfix in memory allocation. Thanks to David Turnbull!
//
// Kevinb: Jan 28, 1998 - ver 1.6
//          Added support for -noini and -hHost parameters
//

#define APPNAME "wSendmail"
#define VERSION "1.5"

#include <stdio.h>
#include <stdlib.h>
#include "winsock.h"
#include <time.h>
#include <malloc.h>
#include <memory.h>

#define MAX_ENTRIES 500

typedef struct {
    char *name;
    char *val;
} entry;


// Return values
enum
{
	SUCCESS,
	FAILED_TO_PARSE_ARGUMENTS,
	FAILED_TO_OPEN_MAILFILE,
	FAILED_TO_START_SOCKETS,
	FAILED_TO_RESOLVE_HOST,
	FAILED_TO_OBTAIN_SOCKET_HANDLE,
	FAILED_TO_CONNECT,
	FAILED_TO_SEND,
	FAILED_TO_RECEIVE,
	SERVER_ERROR,
	FAILED_TO_GET_HOSTNAME,
	OUT_OF_MEMORY,
	UNKNOWN_ERROR
};


// Error messages
char *ErrorMessages[] =
{
	{"Success"},
	{"Bad arguments from form"},
	{"Unable to open temporary mailfile for read"},
	{"FAILED_TO_START_SOCKETS"},
	{"FAILED_TO_RESOLVE_HOST"},
	{"FAILED_TO_OBTAIN_SOCKET_HANDLE"},
	{"FAILED_TO_CONNECT"},
	{"FAILED_TO_SEND"},
	{"FAILED_TO_RECEIVE"},
	{"SERVER_ERROR"},
	{"Failed to resolve the host IP name"},
	{"Out of memory"},
	{"Unknown error"}
};

// Messages

enum
{
	DO_CONNECT = WM_USER +1
};

// Global Variables:
char *mailTo; // Change made by M. Spoek. Best to make it dynamic.
char mailFile[MAX_PATH];
char Host[127]; // SMTP Host IP name
char Rpath[127]; // Return path *and* sender email address. Use the same name for both.
char DeleteFileWhenUsed[8]; // Boolean yes or no. If Yes, delete the mailfile when processed
entry entries[MAX_ENTRIES];
BOOL IsCGI = FALSE;
BOOL SupressCGI = FALSE;
BOOL DebugFlag = FALSE;
BOOL VerboseFlag = FALSE;
BOOL PauseFlag = FALSE;
char DoMime[8];
char UseIIS[8];	// Use IIS header
char Subject[256];
char *myname;
WSADATA Data;
char HTMLhead[1024 * 5];
char HTMLok[1024 * 5];
char HTMLfail[1024 * 5];
char RestrictEmail[8]; // If "Yes" only accept email receivers defined in wsendmail.ini
char WSENDMAIL_INI[] = "wsendmail.ini";


// Foward declarations of functions included in this code module:

char * ParseRCTP(char * toWho); // added by M.Spoek
char *makeword(char *line, char stop);
char *fmakeword(FILE *f, char stop, int *len);
char x2c(char *what);
void unescape_url(char *url);
void plustospace(char *str);
void getword(char *word, char *line, char stop);
void unescape_url(char *url);
int rind(char *s, char c);
int getline(char *s, int n, FILE *f);
void send_fd(FILE *f, FILE *fd);
int ind(char *s, char c);
void escape_shell_cmd(char *cmd);
BOOL ParseCgiInfo();
char *MyGetEnv(char *tag);
void mail_connect();
BOOL Post(SOCKET sc, LPCSTR msg);
BOOL Ack(SOCKET sc);
char *Map8Bit(LPCSTR Text);
char *__Map8Bit(LPCSTR Text);
unsigned long GetAddr (LPSTR szHost);
void DoQuit(int rval);
char *cgiLookup(char *tag, char *def);
void usage(char *str);
unsigned long GetAddr (LPSTR szHost);

main(int argc, char **argv)
{
	int NoINI = FALSE;
	char *p;
	myname = *argv;
	int TokenNum = 0;
	int args = argc;

	if ((p = strrchr(myname,'\\')) != NULL)
		myname = ++p;

	/* Pre-parse before loads */
	while(--args)
	{
		p = argv[args];
		if (*p == '-')
		{
			if (*++p == 'n')	NoINI = TRUE;
		}
	}

	// Get (or create) .ini file data
	if (NoINI) {
		strcpy(Host, "localhost");
		strcpy(UseIIS, "Yes");
		strcpy(DoMime, "Yes");
		strcpy(Rpath, "someone@somewhere.com");
		strcpy(DeleteFileWhenUsed, "No");
		strcpy(HTMLhead, "<html><body><H1>Mail Confirmation</H1><hr><p>");
		strcpy(HTMLok, "<h4>Message sent.</h4></body></html>\n");
		strcpy(HTMLfail, "<H3>Error %d %s.<br> Message could not be forwarded</h3></body></html>\n");
		strcpy(RestrictEmail,"Yes");
	} else {
		GetPrivateProfileString(APPNAME,"SMTP Host","",Host,sizeof(Host),WSENDMAIL_INI);
		GetPrivateProfileString(APPNAME,"Return Path","",Rpath,sizeof(Rpath),WSENDMAIL_INI);
		GetPrivateProfileString(APPNAME,"Delete File When Used","",DeleteFileWhenUsed,sizeof(DeleteFileWhenUsed),WSENDMAIL_INI);
		GetPrivateProfileString(APPNAME,"HTML Head","",HTMLhead,sizeof(HTMLhead),WSENDMAIL_INI);
		GetPrivateProfileString(APPNAME,"HTML OK","",HTMLok,sizeof(HTMLok),WSENDMAIL_INI);
		GetPrivateProfileString(APPNAME,"HTML Fail","",HTMLfail,sizeof(HTMLfail),WSENDMAIL_INI);
		GetPrivateProfileString(APPNAME,"Restrict Email","",RestrictEmail,sizeof(RestrictEmail),WSENDMAIL_INI);
		GetPrivateProfileString(APPNAME,"Mime Encoding","",DoMime,sizeof(DoMime),WSENDMAIL_INI);
		GetPrivateProfileString(APPNAME,"IIS header","",UseIIS,sizeof(UseIIS),WSENDMAIL_INI);

		if (!*Host)
		{
			WritePrivateProfileString(APPNAME,"SMTP Host","localhost",WSENDMAIL_INI);
			WritePrivateProfileString("Nicknames","someone","someone@somewhere.com",WSENDMAIL_INI);
			GetPrivateProfileString(APPNAME,"SMTP Host","",Host,sizeof(Host),WSENDMAIL_INI);
		}

		if (!*UseIIS)
		{
			WritePrivateProfileString(APPNAME,"IIS header","Yes",WSENDMAIL_INI);
			GetPrivateProfileString(APPNAME,"IIS header","",UseIIS,sizeof(UseIIS),WSENDMAIL_INI);
		}

		if (!*DoMime)
		{
			WritePrivateProfileString(APPNAME,"Mime Encoding","Yes",WSENDMAIL_INI);
			GetPrivateProfileString(APPNAME,"Mime Encoding","",DoMime,sizeof(DoMime),WSENDMAIL_INI);
		}

		if (!*Rpath)
		{
			WritePrivateProfileString(APPNAME,"Return Path","someone@somewhere.com",WSENDMAIL_INI);
			GetPrivateProfileString(APPNAME,"Return Path","",Rpath,sizeof(Rpath),WSENDMAIL_INI);
		}

		if (!*DeleteFileWhenUsed)
		{
			WritePrivateProfileString(APPNAME,"Delete File When Used","No",WSENDMAIL_INI);
			GetPrivateProfileString(APPNAME,"Delete File When Used","",DeleteFileWhenUsed,sizeof(DeleteFileWhenUsed),WSENDMAIL_INI);
		}

		if (!*HTMLhead)
		{
			WritePrivateProfileString(APPNAME,"HTML Head","<html><body><H1>Mail Confirmation</H1><hr><p>",WSENDMAIL_INI);
			GetPrivateProfileString(APPNAME,"HTML Head","",HTMLhead,sizeof(HTMLhead),WSENDMAIL_INI);
		}

		if (!*HTMLok)
		{
			WritePrivateProfileString(APPNAME,"HTML OK","<h4>Message sent.</h4></body></html>\n",WSENDMAIL_INI);
			GetPrivateProfileString(APPNAME,"HTML OK","",HTMLok,sizeof(HTMLok),WSENDMAIL_INI);
		}

		if (!*HTMLfail)
		{
			WritePrivateProfileString(APPNAME,"HTML Fail","<H3>Error %d %s.<br> Message could not be forwarded</h3></body></html>\n",WSENDMAIL_INI);
			GetPrivateProfileString(APPNAME,"HTML Fail","",HTMLfail,sizeof(HTMLfail),WSENDMAIL_INI);
		}

		if (!*RestrictEmail)
		{
			WritePrivateProfileString(APPNAME,"Restrict Email","Yes",WSENDMAIL_INI);
			GetPrivateProfileString(APPNAME,"Restrict Email","",RestrictEmail,sizeof(RestrictEmail),WSENDMAIL_INI);
		}
	}

	while(--argc)
	{
		p = *++argv;
		if (*p == '-')
		{
			switch(*++p)
			{
				case 'd': DebugFlag = TRUE; break;
				case 'v': VerboseFlag = TRUE; break;
				case 's': strcpy(Subject, p+1); break;
				case 'f': strcpy(Rpath,p+1); break;
				case 'h': strcpy(Host, p+1); break;
				case 'm': strcpy(DoMime,"No"); break;
				case 'p': PauseFlag = TRUE; break;
				case 'C': SupressCGI = TRUE; break;
				case 'n': NoINI = TRUE; break;
				default:
					usage(*argv);
			}
		}
		else
		{
			switch(TokenNum++)
			{
				case 0: mailTo = ParseRCTP(p); break; // changed by M. Spoek
				case 1: strcpy(mailFile,p); break;
				default: 
					usage(NULL);
			}
		}
	}

	if (!ParseCgiInfo() && !mailTo) // changed by M. Spoek
		usage(NULL);

	mail_connect();

	delete mailTo;

	return 0; // Just to make the compiler happy
}

void usage(char *str)
{
	fprintf(stderr,"%s %s - donated into the Public Domain by Jarle Aase\n", APPNAME, VERSION);
	fprintf(stderr,"THIS PROGRAM IS NOT LISENCED TO GOVERNMENTAL OR MILITARY USE.\n");
	if (str)
		fprintf(stderr,"%s: Unknown parameter\n", str);

	fprintf(stderr,"Usage: %s [-debug] [-noini] [-hHost] [-verbose] [-CGI] [-mime] [-sSubject] [-fFrom] [-pause] {to[,to] | @addr_list_file} mail_file\n", myname);
	fprintf(stderr,"Usage: %s [-debug] [-noini] [-hHost] [-verbose] [-CGI] [-mime] [-sSubject] [-fFrom] {to[,to] | @addr_list_file} < message\n", myname);
	fprintf(stderr,"-CGI will supress the automatic CGI mode and allow piping from Pearl scripts\n");
	fprintf(stderr,"Line parameters are not used when running as CGI-BIN app.\n\n");

	if (PauseFlag)
	{
		printf("Press ENTER tp continue...");
		getc(stdin);
	}
	exit(-1);
}

// function added by M.Spoek
char * ParseRCTP(char * toWho)
{
	FILE *toFile;
	long s;
	char *rctp, *next;

	if (!toWho || !*toWho)
	{
		DoQuit(FAILED_TO_PARSE_ARGUMENTS);
		return NULL;
	}

	if (*toWho == '@')
	{
		if ((toFile = fopen(toWho + 1,"r")) == NULL)
		{
			DoQuit(FAILED_TO_OPEN_MAILFILE);
			return toWho;
		}
		fseek(toFile, 0, SEEK_END);
		s = ftell(toFile);
		fseek(toFile, 0, SEEK_SET);
		if ((rctp = (char *)malloc(s)) == NULL)
		{
			DoQuit(OUT_OF_MEMORY);
			return toWho;
		}
		next = rctp;
		while (!feof(toFile))
		{
			fgets(next, 256, toFile);
			next += strlen(next) - 1;
			if (*next == '\n')
				*next = ',';
			next++;
		}
		next--;
		if (*next == ',')
			*(next) = '\0';
		fclose(toFile);
	}
	else
	{
		if ((rctp = (char *)malloc(strlen(toWho)+1)) == NULL)
		{
			DoQuit(OUT_OF_MEMORY);
			return toWho;
		}
		strcpy(rctp, toWho);
	}

	return rctp;
}


void DoQuit(int rval)
{
	if (IsCGI)
	{
		if (rval)
			printf(HTMLfail, rval, ErrorMessages[rval]);
		else
			printf(HTMLok);
	}

	if (DebugFlag || VerboseFlag)
	{
		if (rval)
			fprintf(stderr,"%s: Error %d %s\n", myname, rval, ErrorMessages[rval]);
		else
			fprintf(stderr,"%s: Transaction successfully completed\n", myname);
	}

	if (PauseFlag)
	{
		printf("Press ENTER tp continue...");
		getc(stdin);
	}

	exit(rval);
}

void mail_connect()
{
	//Init Winsock
	SOCKET sc;
	int nBufLen = 1024 * 16;
	char *buf = (char *) malloc(nBufLen); // 16 kb dynamic buffer
	FILE *fp = stdin;
	char *p;


	if (!buf)
		DoQuit(OUT_OF_MEMORY);

	if (!IsCGI && *mailFile)
	{
		if ((fp = fopen(mailFile,"r")) == NULL)
		{
			DoQuit(FAILED_TO_OPEN_MAILFILE);
			return;
		}
	}

	if (WSAStartup(MAKEWORD(1, 1), &Data) != 0)
	{
		DoQuit(FAILED_TO_START_SOCKETS);
		return;
	}

	// Create Socket
	if ((sc = socket(PF_INET,SOCK_STREAM,0)) == INVALID_SOCKET)
	{
		DoQuit(FAILED_TO_OBTAIN_SOCKET_HANDLE);
		return;
	}

	// Resolve the servers IP
	struct hostent *adr;
	adr = gethostbyname(Host);
	if (!adr)
	{
		DoQuit(FAILED_TO_RESOLVE_HOST);
		return;
	}
	
	// Connect to server
	SOCKADDR_IN sin;
	sin.sin_family = AF_INET;
	sin.sin_port = htons(25);
	sin.sin_addr.S_un.S_addr = GetAddr(Host);
	
	if (connect(sc,(LPSOCKADDR)&sin,sizeof(sin)))
	{
		DoQuit(FAILED_TO_CONNECT);
		return;
	}

	Ack(sc); // Server welcome message

	// Get our own host name
#define LOCAL_HOST_NAME_LEN 256
	char *LocalHost= new char[LOCAL_HOST_NAME_LEN];
	if (gethostname(LocalHost,LOCAL_HOST_NAME_LEN))
	{
		if (DebugFlag)
			fprintf(stderr,"%s: gethostname() failed. Winsock error code is %d\n", myname, WSAGetLastError());
		DoQuit(FAILED_TO_GET_HOSTNAME);
	}

	sprintf(buf,"HELO %s\r\n", LocalHost); Post(sc,buf); 	Ack(sc);	

	sprintf(buf,"MAIL FROM:<%s>\r\n", cgiLookup("from",Rpath)); Post(sc,buf); Ack(sc);

	char *addrptr;
	char *addrbuf = addrptr = new char[1024 * 5];

	addrptr += sprintf(addrptr,"To:");
	if (IsCGI)
	{
		char mybuf[127];
		int i;
		int cnt = 0;
		char tostr[] = "RCPT";
		for(i = 0; (i < MAX_ENTRIES) && entries[i].name; i++)
		{
			if (strcmp(entries[i].name,tostr))
				continue;
			// Get the nick from .ini file
			if (!entries[i].val)
			{
				printf("Missing RCPT value - don't know who to send to.<br>");
				continue;
			}
			GetPrivateProfileString("Nicknames",entries[i].val,"",mybuf,sizeof(mybuf),WSENDMAIL_INI);
			if (!*mybuf)
			{
				if (toupper(*RestrictEmail) == 'Y')
				{
					printf("Receiver %s is not autorized for receiving mail.<br>\n", entries[i].val);
					continue;
				}
				strcpy(mybuf,entries[i].val); // Just accept it...
			}

			sprintf(buf,"RCPT TO:<%s>\r\n", mybuf); Post(sc,buf); Ack(sc);
			addrptr += sprintf(addrptr," %s\r\n", mybuf);
		}
	}
	else
	{
		// changes made by M. Spoek
		// now there can be more than one reciepients like:
		// soloh@bart.nl,someone@somewhere.com
		char *next, *toNext = mailTo;

		while ((next = strchr(toNext, ',')) != NULL)
		{
			*next = '\0';
			sprintf(buf,"RCPT TO:<%s>\r\n", toNext); Post(sc,buf); Ack(sc);
			addrptr += sprintf(addrptr," %s\r\n", toNext);
			toNext = next + 1;
			if ((addrptr - buf) > (nBufLen - 512))
			{
				// Increase buffer size
				nBufLen += (1024 * 16);
				int i = addrptr - buf;
				if ((buf = (char *)realloc(buf,nBufLen)) == NULL)
					DoQuit(OUT_OF_MEMORY);
				addrptr = buf + i;
			}
		}
		sprintf(buf,"RCPT TO:<%s>\r\n", mailTo); Post(sc,buf); Ack(sc);
		addrptr += sprintf(addrptr," %s\r\n", mailTo);
	}

	Post(sc,"DATA\r\n"); Ack(sc);

	// Print message header according to RFC 822
	// Return-path, Received, Date, From, Subject, Sender, To, cc

	char *pbuf = p = new char[1024 * 10]; // 10 KB reserved for header
	time_t tNow = time(NULL);
	struct tm *tm = localtime(&tNow);
	char *days[] = {"Sun", "Mon","Tue", "Wed", "Thu", "Fri", "Sat"};
	char *months[] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
	extern int _daylight;
  extern long _timezone;
	extern char *_tzname[2];
	int zoneh = abs(_timezone);
	int zonem;

	zoneh /= (60 * 60);
	zonem = (abs(_timezone) / 60) - (zoneh * 60);


	p += sprintf(pbuf,"Return-Path: %s\r\n", 
		cgiLookup("from",Rpath));
		
	if (IsCGI)
	{
		p += sprintf(p,"Received: from %s (%s) (HTTP mail-response form from %s) with SMTP (%s %s)\r\n",
			MyGetEnv("REMOTE_HOST"),
			MyGetEnv("REMOTE_ADDR"),
			MyGetEnv("SERVER_NAME"),
			APPNAME, VERSION);
	}

	p += sprintf(p,"X-Sender: %s\n",
		cgiLookup("from",Rpath));

	if (toupper(*DoMime) == 'Y')
	{
		p += sprintf(p,"X-Mailer: %s %s\r\nMime-Version: 1.0\r\nContent-Type: text/plain; charset=\"iso-8859-1\"\r\nContent-Transfer-Encoding: quoted-printable\r\n",
			APPNAME, VERSION);
	}
	else
	{
		p += sprintf(p,"X-Mailer: %s %s\r\nContent-Type: text/plain; charset=us-ascii\r\n",
			APPNAME, VERSION);
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

	p += sprintf(p,"From: %s\r\n",
		cgiLookup("from",Rpath));

	p += sprintf(p,"Subject: %s\r\n", 
		cgiLookup("subject",*Subject ? Subject : "No Subject"));

	Post(sc,pbuf);
	delete pbuf;

	Post(sc,addrbuf);
	delete addrbuf;

	Post(sc,"\r\n"); // Empty line to indicate end of header

	if (!IsCGI && (fp == stdin) && VerboseFlag)
	{
		PauseFlag = FALSE;
		fprintf(stderr,"%s: Type message text. Press ^Z (CTRL + Z) when done\n", myname);
	}
	
	if (IsCGI) // CGI mode
	{
		for(int i = 0; (i < MAX_ENTRIES) && entries[i].name; i++)
		{
			if (!*entries[i].name || !*entries[i].val  || !*entries[i].val)
				continue; // Avoyd extra blank lines in the message body

			if (!strcmp(entries[i].name,"subject"))
				continue;

			if (!strcmp(entries[i].name,"RCPT"))
				continue;

			if (!strcmp(entries[i].name,"from"))
				continue;

			Post(sc,Map8Bit(entries[i].name));
			if (!strcmp(entries[i].val,"."))
				Post(sc,".\r\n");
			else
				Post(sc,"\r\n");
			Post(sc,Map8Bit(entries[i].val));
			Post(sc,"\r\n\r\n");
		}
	}
	else // Command line mode
	{
		while(fgets(buf,nBufLen - 3, fp))
		{
			p = buf + strlen(buf);
			if (p > buf)
			{
				if (*p == '\n')
				{
					*p++ = '\r';
					*p++ = '\n';
					*p = 0;
				}
			}

			if (!strcmp(buf,"."))
				Post(sc,".\r\n");
			Post(sc,Map8Bit(buf));
		}
		if (fp != stdin)
		{
			fclose(fp);
			if ((*DeleteFileWhenUsed == 'Y') || (*DeleteFileWhenUsed == 'y'))
				_unlink(mailFile);
		}
	}
	
	Post(sc,"\r\n.\r\n"); Ack(sc);

	Post(sc,"QUIT\r\n"); Ack(sc);

	DoQuit(SUCCESS);
}


BOOL Post(SOCKET sc, LPCSTR msg)
{
	int len = strlen(msg);
	int slen;
	int index = 0;

	if (DebugFlag)
		fprintf(stderr,"Posting: %s", msg);

	while(len > 0)
	{
		while (msg[index] == '.') {
			index += 1;
			len -= 1;
			if (len == 0)	return TRUE;
		}
		if ((slen = send(sc,msg + index,len,0)) < 1)
		{
			printf("Try to send the following: %s\n",msg + index);
			printf("Info: Len: %d\n",len);
			DoQuit(FAILED_TO_SEND);
			return FALSE;
		}
		len -= slen;
		index += slen;
	}
	return TRUE;
}

// Get the response from the server. We only want to know if the
// last command was successful. If any error occurs, we just shut
// down.
BOOL Ack(SOCKET sc)
{
	static char *buf;
	int rlen;
	int Index = 0;
	int Received = 0;

	if (!buf)
		if ((buf = (char *)malloc(1024 * 4)) == NULL)
			DoQuit(OUT_OF_MEMORY);

again:
	if ((rlen = recv(sc,buf + Index,((1024 * 4) - 1) - Received,0)) < 1)
	{
		DoQuit(FAILED_TO_RECEIVE);
		if (DebugFlag)
			fprintf(stderr,"Error: Unable to receive from host\n");
		return FALSE;
	}
	Received += rlen;
	buf[Received] = 0;
	if (DebugFlag)
		fprintf(stderr,"Received: (%d bytes) %s", rlen, buf + Index);

	// Check for newline
	Index += rlen;
	if ((buf[Received -2] != '\r') || (buf[Received -1] != '\n'))
	{
		if (DebugFlag)
			fprintf(stderr,"Incomplete server message. Awaiting CRLF\n");
		goto again; // Incomplete data. Line must be terminated by CRLF
	}

	if (buf[0] > '3')
	{
		// Error code
		if (IsCGI)
		{
			printf("<h3>SMTP server error: %s</h3>\n", buf);
		}
		DoQuit(SERVER_ERROR);
		return FALSE;
	}
	return TRUE;
}


// Map european characters. Use MIME 1.0 encoding
char *Map8Bit(LPCSTR Text)
{
	if (toupper(*DoMime) != 'Y')
		return __Map8Bit(Text);

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


// Don't map characters. Jure return a copy.
char *__Map8Bit(LPCSTR Text)
{
	static char *buf;
	char *p;

	if (buf)
		delete buf;
	
	if ((p = buf = strdup(Text)) == NULL)
		DoQuit(OUT_OF_MEMORY);
	
	return buf;
}


// The following code is borrowed from the sample code at http://www.sockets.com
/*-----------------------------------------------------------
 * Function: GetAddr()
 *
 * Description: Given a string, it will return an IP address.
 *   - first it tries to convert the string directly
 *   - if that fails, it tries o resolve it as a hostname
 *
 * WARNING: gethostbyname() is a blocking function
 */
unsigned long GetAddr (LPSTR szHost) 
{
  LPHOSTENT lpstHost;
  u_long lAddr = INADDR_ANY;
  
  /* check that we have a string */
  if (*szHost) {
  
    /* check for a dotted-IP address string */
    lAddr = inet_addr (szHost);
  
    /* If not an address, then try to resolve it as a hostname */
    if ((lAddr == INADDR_NONE) &&
        (strcmp(szHost, "255.255.255.255"))) {
      
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

//----------------------------------------------------------------------------------------
// CGI-BIN support
// Added Apr. 27 1996
// Code modified from original source at http://south.ncsa.uiuc.edu/

#define LF 10
#define CR 13

void getword(char *word, char *line, char stop) {
    int x = 0,y;

    for(x=0;((line[x]) && (line[x] != stop));x++)
        word[x] = line[x];

    word[x] = '\0';
    if(line[x]) ++x;
    y=0;

    while(line[y++] = line[x++]);
}

char *makeword(char *line, char stop) {
    int x = 0,y;
    char *word = (char *) malloc(sizeof(char) * (strlen(line) + 1));

    for(x=0;((line[x]) && (line[x] != stop));x++)
        word[x] = line[x];

    word[x] = '\0';
    if(line[x]) ++x;
    y=0;

    while(line[y++] = line[x++]);
    return word;
}

char *fmakeword(FILE *f, char stop, int *cl) {
    int wsize;
    char *word;
    int ll;

    wsize = 2048;
    ll=0;
    word = (char *) malloc(sizeof(char) * (wsize + 1));

    while(1) {
        word[ll] = (char)fgetc(f);
        if(ll==wsize) {
            word[ll+1] = '\0';
            wsize+=2048;
            word = (char *)realloc(word,sizeof(char)*(wsize+1));
        }
        --(*cl);
				if (word[ll] < 0)
				{
					// Something is wrong. Stop reading from stdin. 
					printf("Warning: Error reading from server pipe. %d bytes left to read<br>\n", *cl);
					word[ll] = 0;
					*cl = 0;
				}
        if((word[ll] == stop) || (feof(f)) || (!(*cl))) {
            if(word[ll] != stop) ll++;
            word[ll] = '\0';
            return word;
        }
        ++ll;
    }
}

char x2c(char *what) {
    register char digit;

    digit = (what[0] >= 'A' ? ((what[0] & 0xdf) - 'A')+10 : (what[0] - '0'));
    digit *= 16;
    digit += (what[1] >= 'A' ? ((what[1] & 0xdf) - 'A')+10 : (what[1] - '0'));
    return(digit);
}

void unescape_url(char *url) {
    register int x,y;

    for(x=0,y=0;url[y];++x,++y) {
        if((url[x] = url[y]) == '%') {
            url[x] = x2c(&url[y+1]);
            y+=2;
        }
    }
    url[x] = '\0';
}

void plustospace(char *str) {
    register int x;

    for(x=0;str[x];x++) if(str[x] == '+') str[x] = ' ';
}

int rind(char *s, char c) {
    register int x;
    for(x=strlen(s) - 1;x != -1; x--)
        if(s[x] == c) return x;
    return -1;
}

int getline(char *s, int n, FILE *f) {
    register int i=0;

    while(1) {
        s[i] = (char)fgetc(f);

        if(s[i] == CR)
            s[i] = fgetc(f);

        if((s[i] == 0x4) || (s[i] == LF) || (i == (n-1))) {
            s[i] = '\0';
            return (feof(f) ? 1 : 0);
        }
        ++i;
    }
}

void send_fd(FILE *f, FILE *fd)
{
    int num_chars=0;
    char c;

    while (1) {
        c = fgetc(f);
        if(feof(f))
            return;
        fputc(c,fd);
    }
}

int ind(char *s, char c) {
    register int x;

    for(x=0;s[x];x++)
        if(s[x] == c) return x;

    return -1;
}

void escape_shell_cmd(char *cmd) {
    register int x,y,l;

    l=strlen(cmd);
    for(x=0;cmd[x];x++) {
        if(ind("&;`'\"|*?~<>^()[]{}$\\",cmd[x]) != -1){
            for(y=l+1;y>x;y--)
                cmd[y] = cmd[y-1];
            l++; /* length has been increased */
            cmd[x] = '\\';
            x++; /* skip the character */
        }
    }
}


/* 
 * This is a simple program to mail the results of a feedback form to you.
 * Please read the documentation at http://south.ncsa.uiuc.edu/forms.html
 * before using.
 * Thanks (Eric Bina & Rob McCool)
 */



//main(int argc, char *argv[]) {
BOOL ParseCgiInfo()
{
    register int x,m=0;
    int cl;
		char *p = getenv("CONTENT_LENGTH");

		if (SupressCGI || !p || !*p)
			return FALSE; // Not CGI mode


		cl = atoi(p);
		if (toupper(*UseIIS) == 'Y')
			printf("HTTP/1.0 200 OK\nContent-Type: text/html\n\n\n");
		else
			printf("Content-type: text/html%c%c",10,10);
		printf(HTMLhead);

		p = getenv("REQUEST_METHOD");
			
		if(!p || strcmp(p,"POST") || !cl) 
		{
        printf("This script should be referenced with a METHOD of POST.\n");
        printf("It must also contain some info to send");
        DoQuit(FAILED_TO_PARSE_ARGUMENTS);
    }

		 for(x=0;cl && (!feof(stdin));x++) {
        m=x;
        entries[x].val = fmakeword(stdin,'&',&cl);
        plustospace(entries[x].val);
        unescape_url(entries[x].val);
        entries[x].name = makeword(entries[x].val,'=');
    }

	for(int i = 0; i < MAX_ENTRIES; i++)
	{
		if (entries[i].name || entries[i].val)
		{
			//printf("entries[%i].name = '%s' <br>", i, entries[i].name ? entries[i].name : "not assigned");
			//printf("entries[%i].val = '%s' <br><br>", i, entries[i].val ?  entries[i].val : "not assigned");

			printf("%s: ", entries[i].name ? entries[i].name : "not assigned");
			printf("%s<br>", entries[i].val ?  entries[i].val : "not assigned");
		}
	}

	IsCGI = TRUE;

	return TRUE;
}


// End of code from http://south.ncsa.uiuc.edu/

char *cgiLookup(char *tag, char *def)
{
	for(int i = 0; (i < MAX_ENTRIES) && entries[i].name; i++)
	{
		if (!strcmp(entries[i].name,tag))
			return (entries[i].val && *entries[i].val) ? entries[i].val : def;
	}

	return def;
}

char *MyGetEnv(char *tag)
{
	char *p = getenv(tag);
	if (!p)
		return "(NULL)";
	char *rval = new char[strlen(p)+1];
	strcpy(rval,p);
	return rval;
}



