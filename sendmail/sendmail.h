//----------------------------------------------------------------------------
//  Project watchd
//  
//  Copyright ) 1996. All Rights Reserved.
//
//  SUBSYSTEM:    watchd.apx Application
//  FILE:         sendmail.h
//  AUTHOR:       Joao Carreira
//
//  OVERVIEW
//  ~~~~~~~~
//
//----------------------------------------------------------------------------
#if !defined(sendmail_h)              // Sentry, use file only if it's not already included.
#define sendmail_h

#define HOST_NAME_LEN	256
#define MAX_APPNAME_LENGHT 100
#define  MAX_ERROR_INDEX		17
#define  MIN_ERROR_INDEX		0
#define  MAIL_BUFFER_SIZE		(1024*4) // 4k buffer
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
	UNKNOWN_ERROR,
	BAD_MSG_CONTENTS,
	BAD_MSG_SUBJECT,
	BAD_MSG_DESTINATION,
	BAD_MSG_RPATH,
	BAD_MAIL_HOST,
   BAD_MSG_FILE
};





class TSendMail {
  public:
    TSendMail(char*, char*, int*);
    ~TSendMail();

   int SendText(char *RPath, char *Subject, char *mailTo, char *data);
	int SendFile(char *RPath, char *Subject, char *mailTo, char *mailFile, bool deleteFile, bool domime);
	char *GetErrorText(int index);

  protected:

	int MailConnect();
   int PostHeader(char*, char*, char*, bool);
	int Post(LPCSTR msg);
	int Ack();
	char *Map8Bit(LPCSTR Text);
	unsigned long GetAddr(LPSTR szHost);

	char Buffer[MAIL_BUFFER_SIZE]; 

   // socket related data
	SOCKET sc;
	WSADATA Data;
	struct hostent *adr;
	SOCKADDR_IN sin;
   bool WinsockStarted;

	// values set by the constructor
   char AppName[MAX_APPNAME_LENGHT];
	char MailHost[HOST_NAME_LEN];
	char LocalHost[HOST_NAME_LEN];

};




#endif // sendmail_h
