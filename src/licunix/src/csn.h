/*
COPYRIGHT
	<strong>
	(c) Copyright 1997, 1998, 1999, 2000, 2001, 2002  All rights reserved.<br>
	<br>
	This is an unpublished work, and is confidential and proprietary technology and 
	information of fonix corporation.<br>
	No part of this code may be reproduced, used or disclosed without written consent 
	of fonix corporation in each and every instance.<br>
	</strong>
*/

#ifndef	__CSN_H__
#define	__CSN_H__

//#define DECODE_ONLY


//#include	"FnxStdlib.h"
//#include	"cDefines.h"

#define	INVALID_SERIALNUMBER	(-100)
#define	INVALID_ENABLEKEY		(-101)
#define	INVALID_FIELD			(-200)

#define	SNFLAGSVARIANT			(0x0001)		// channel capacity is defined at init time
#define	SNFLAGSMASTER			(0x0002)		// serial number is a master (i.e. pool capacity)
#define	SNFLAGSSUBMASTER		(0x0004)		// serial number allows submasters
#define	SNFLAGSSYNTHBATCH		(0x0008)		// serial number will allow synthesis in batch mode
#define	SNFLAGSUNUSED			(0x0010)		// unused flag

// Functionality Enabler Bit Definitions
#define	FNCUVCORE				(0)		// unlimited vocabulary tts engine
#define	FNCCVCORE				(1)		// custom vocabulary tts engine
#define	FNCML1CORE				(2)		// multi language tts engine #1

#define	FNCLHRS2X				(10)	// Lenert and Houspie Real Speak 2.0 tts engine
#define	FNCELLS2X				(11)	// Elan Linux server 2.0 tts engine

////////////////
#define  FNCEL3X					(12)    // Elan 3.0 tts engine
#define  FNCART1X				(13)	// Lucent Articulator version 01
#define  FNCACT5X				(14)    // Loquendo Actor version 5.0
#define  FNCNV1X					(15)    // AT&T Natural Voices  ver. 1.0
#define  FNCRVC3X				(16)	// Rhetorical Voices ver. 3.0

#define  FNCEMAILEX				(20)	// Extended functionality for EMAIL for sManager
#define  FNCTELEPHONY			(21)	// Telephony support for sManager
#define  FNCSOCKET				(22)	// Socket Support for sManager

	struct	anSNFields
	{
		char	prodFamily;		// 'A' - 'Z'				1d
		char	prodName;		// 'A' - 'Z'				1d
		int		verMajor;		// 0 - 35					1d
		int		verMinor;		// 0 - 35					1d
		int		relCode;		// 0 - 9					1d
		int		serializer;		// 0 - 2,147,483,647		6d
		int		keyCode;		// 0 - 99					2d
		int		expiration;		// 0 - 35					1d
		int		channels;		// 0 - 1295 (60,466,175)	2d (5d)
		int		flags;			// 0 - 31 (1,2,4,8,16)		1d

		int		creationDate;	// 0001 - 9912				3d

		int		masterID;		// 0 - 46655				3d
		int		serializerInc;	// 0 - 35					1d

		// enable code factors
		int		ttsEnblFactor;	// 0 - 31					1d
		int		asrEnblFactor;	// 0 - 31					1d
		int		fncEnblFactor;	// 0 - 31					1d

		int		checksum;
	};
	typedef	struct anSNFields	SNFields;
	typedef	SNFields*			SNFieldsPtr;
	
	// Installer Prototyps
	 int				 snIDecode ( char *serialNumber );
	 int				 snIGetProdFamily ( );
	 int				 snIGetProdName ( );
	 int				 snIGetVerMajor ( );
	 int				 snIGetVerMinor ( );
	 int				 snIGetRelCode ( );
	 int				 snIGetSerializer ( );
	 int				 snIGetKeyCode ( );
	 int				 snIGetExpiration ( );
	 int				 snIGetChannels ( );
	 int				 snIGetFlags ( );
	 int				 snIGetDate ( );

	 int				 snIGetMasterID ( );
	 int				 snIGetCreationDate ( );
	 int				 snIGetSerializerInc ( );

	 int				 snIGetTTSEnableFactor ( );
	 int				 snIGetASREnableFactor ( );
	 int				 snIGetFncEnableFactor ( );
	 int				 snIGetSerialNumberChecksum ( );
	 int				 snITTSEnablerDecode ( char *enableKey, int factor, int snChecksum );
	 int				 snIGetTTSLanguageState ( int languageID );
	 int				 snIASREnablerDecode ( char *enableKey, int factor, int snChecksum );
	 int				 snIGetASRLanguageState ( int languageID );
	 int				 snIFuncEnablerDecode ( char *enableKey, int factor, int snChecksum );
	 int				 snIGetFuncState ( int funcID );

	
	// Prototypes
	 void*			 snNewFieldsPtr ( );
	 void				 snDeleteFieldsPtr ( void *fields );
	 int				 snDecode ( char *serialNumber, void *fields );
	 unsigned long	 snGetDecodeChecksum ( );
	 char				 snGetProdFamily ( void *fields );
	 char				 snGetProdName ( void *fields );
	 int				 snGetVerMajor ( void *fields );
	 int				 snGetVerMinor ( void *fields );
	 int				 snGetRelCode ( void *fields );
	 int				 snGetSerializer ( void *fields );
	 int				 snGetKeyCode ( void *fields );
	 int				 snGetExpiration ( void *fields );
	 int				 snGetChannels ( void *fields );
	 int				 snGetFlags ( void *fields );
	 int				 snGetDate ( );

	 int				 snGetMasterID ( void *fields );
	 int				 snGetCreationDate ( void *fields );
	 int				 snGetSerializerInc ( void *fields );

	 int				 snGetTTSEnableFactor ( void *fields );
	 int				 snGetASREnableFactor ( void *fields );
	 int				 snGetFncEnableFactor ( void *fields );
	 int				 snGetSerialNumberChecksum ( void *fields );
	 int				 snEnablerDecode ( char *enableKey, int *bitArray, int *nBits, int factor, int snChecksum );

#ifndef	DECODE_ONLY
#define	SERIALNUMBER_1			(0)		// version 5.0 standard serial number
#define	SERIALNUMBER_2			(1)		// version 5.0 extended master serial number
#define	SERIALNUMBER_3			(2)		// version 5.0 extended client serial number

		 int			 snEncode ( void *fields, int type, char *serialNumber );
		 int			 snEnablerEncode ( int *bitArray, int nBits, int factor, int snChecksum, char *enableKey );
#endif

#endif

