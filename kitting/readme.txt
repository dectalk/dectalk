  DECtalk[TM] Software Version 4.60,                               August 18, 2000. 

                              Release Identifier: V4.60.15 R011

  KITS SUPPORTED:	
  This readme file applies to one of the following Software Developer Kits (SDK)
   for DECtalk Software Version 4.60, Release:  
  
        UNIX SDK for Compaq Tru64 (formerly DIGITAL) UNIX Operating Systems. This
           SDK supports: 

             ALPHA hardware running Tru64 UNIX versions 3.2G and 4.0 through 4.0E.

        or, 

        WINDOWS SDK for Windows Operating Systems. This SDK supports: 

             INTEL hardware running Windows 95, Windows 98, and
                Windows NT version 4.00, and 

             ALPHA hardware running Windows NT version 4.00
	     note: the  ALPHA Windows NT version is based on the last released 
	           version not this BETA code release.
	

        or, 

        CE SDK for Windows CE[R] using a Windows NT[R] host. This SDK supports: 

             INTEL hardware running Windows NT version 4.00
 
		the kit includes:

		Windows CE 2.00 \ SH3 MIPS x86em

		Windows CE 2.11 \ SH3 SH4 MIPS ARM x86em


 
  Please check the label on your CD-ROM media to determine which SDK applies.
  
  GENERAL DESCRIPTION:	
  This SDK includes applications and application programming interfaces based on 
  FORCE Computers Inc. prominent text-to-speech synthesis technology. 

  DECtalk Software allows applications to convert standard ASCII
  text into highly intelligible and natural sounding speech. Supported
  languages are American English, British English, Castilian Spanish, 
  Latin-American Spanish and German.

  For a UNIX SDK: 
        The speech is playable through audio hardware on Alpha computers. 

  For a WINDOWS SDK: 
        The speech is playable through audio hardware on Intel personal and Alpha 
           computers. 

  For a CE SDK: 
        The speech is playable through audio hardware on MIPS,SH3,SH4 or StrongARM P D A. 

  ENHANCEMENTS:	


  DECtalk Software version 4.60: 
	Additional Windows CE platform Support WinCE 211/SH4,MIPS
	Linux/Security on SARM, Intel
	Doc/HTML/man/help updates
	Windows CE Email reader sample 
	Voice enhancments
	Full Access32 Windows CE Support
	Vocal enhancment in the German Language
	Windows CE Windic application is included so that user(s) can create their own user 
		dictionary on the device Win 211 support only.

        Installation Tested on Windows 98. 
        Disabled License Error Pop-up Window From DAPI Engine. 
        Significantly Increased SAPI Compliance; see APPENDIX3.TXT. 
        Enhanced Spanish Latin American and Spanish Castillian.
        A static version of WINDIC .exe for the WINDOWS host to support a user
        	defined dictionary, and Full registry support. 

        Many Bugs Fixed, Including:
             Various Application or System Hangs or Crashes Caused by 
             Data Path, Syncronization and Dictionary Failures Corrected.
             Memory Leaks Corrected.
             User Dictionary Compiler Failures Corrected.
	     Registry entries fixed for Windows CE user dictinary

	     windows:
	     	Envpatch:
		It can now change the default language if in multi language already
	        
                windic:
                Fixed language menu to check current language in Multi language
		
		dtsample:
                Fixed check marks for the menu of speak, voice, rate, languages 

             windows CE:
                dtsample:
                Fixed check marks for the menu of speak, voice, rate, languages 

	Windows 2000 tested
	Reduced size dictionaries included for English, UK, and German
	
	note: to use the new dictionaries they must be renamed

	dtalk_uss.dic		to	dtalk_us.dic
	dtalk_usm.dic		to	dtalk_us.dic
	dtalk_uks.dic		to	dtalk_uk.dic
	dtalk_grs.dic		to	dtalk_gr.dic			


	
  CURRENT KNOWN PROBLEMS: 
         For WINDOWS, Static Access32, the developer MUST include the Microsoft 
           library WINMM.LIB in the link process. 
        8kHz voice outputs have lower quality than 11.025kHz. 
        O L E ITTSCentral::TextData function doesn't accept a NULL 
           value for the NotifyInterface (the 4th C++ argument).  
        Uninstalling AFTER a multi-language install may not remove everything. 
        SAPI Not Always Working. 
        Intermittently, the In-Line Log Command May Hang Engine. 
        Dictionaries of One Language Are Loadable into Engines of Another.
        Failed memory allocations my not cause an error return from engine.
        

  DOCUMENTATION NOTES: 

          For any SDK, the German language is now supported. 

          For any SDK, Say Filtered-letter works like Say Letter, but filters-out
             control characters encountered in the text string. 

          For a WINDOWS SDK, the correct installation information is that each 
             language specific image set consists of a set of 8 disk images. These 
             separate into a 4 disk image set for installation on Intel processors and a 
             4 disk image set for installation on Alpha processors. Further,  "g r" is the 
             two character German langauge indicator. (Update to Installation Guide, 
             Page 1-4)). 

  
  EMBEDDED DISTRIBUTION: 
  Developers installing DECtalk Software as part of their own distributed product 
  installation should be aware that the license key, and the resulting license and 
  password values have changed from that in the V4.40, V4.41, V4.50 or V4.51 
  releases and the V4.60 version of DECtalk Software. Licensees should check with 
  their technical contact at FORCE for further information. 

  INSTALLATION:	
  NOTE: Before installing this version, please close any already running 
  DECtalk applications and uninstall any existing DECtalk Software. 

  For a WINDOWS SDK or a UNIX SDK: 
     The SDK is comprised of a single CD-Rom that contains English U S, 
        English U K, Spanish, Spanish Latin American, German and
        Multi-Language (ML) installation disk image sets.

  For a CE SDK: 
     The SDK is comprised of a single CD-Rom that contains English U S, 
        English U K, Spanish, Spanish Latin American and German installation
        disk image sets. CE now supports Multi-Language (ML). 

     Each language specific image set consists of a set of 3 to 6 disk images. 
	Each disk image set is further separated into install disk images 
	and an incremental license/key disk image. 

     Select the disk image set for the desired language. The languages are 
        in separate directories on the CD-Rom and are identified as follows: 
           "us" is American English, 
           "uk" is British English, 
           "sp" is Castillian Spanish, 
           "la" is Latin American Spanish, and 
           "gr" is German. 

     Identify the install disk images that make up the install kit and the 
        single disk image that has the incremental license/key program. 

     Select disk image 1.  Run the program SETUP.EXE from the installation 
        disk image.  This may be done two ways.  Either click on program 
        SETUP.EXE in the file manager, or in an MSDOS window, select the CD-Rom 
        drive by typing the proper drive letter (f:), then change default to 
        the language specific directory, then type SETUP and press Enter. 
        The setup program will then prompt for any additional information (i.e.
        Username, company, destination drive, etc.). 

    This completes the installation to the host PC. Follow your P D A's 
        software upload and installation proceedure to install DECtalk on 
        the P D A. 

  OTHER SDK TEXT FILES: 
  For a listing of files contained in the source diskette, please refer 
  to file APPENDIX1.txt. 

  For development hints, please refer to file APPENDIX2.txt.	 

  For a list of Microsoft Speech API functions supported by DECtalk 
  Software, please refer to file APPENDIX3.txt. 

  For a historical list of previous release versions of DECtalk Software see 
  APPENDIX4.txt. 

  DECtalk ® products and technology have been acquired by Force Computers,
  Inc.  Any references to Digital Equipment Corporation, such as in the
  Setup program, no longer apply and should be disregarded.  Future
  revisions of DECtalk materials will be updated accordingly.


 (c) 1999 Digital Equipment Corporation. All rights reserved.	
 (c) 1999 SMART Modular Technologies. All rights reserved.	
 (c) 2000 Force Computers. All rights reserved.	
 [R] Microsoft, Windows NT, Windows 95, Windows 98 and Windows CE are 
 registered trademarks of Microsoft Corporation.	
 [R] PostScript is a registered trademark of Adobe Systems, Inc.
 [TM]Intel is a trademark of Intel Corporation.	
 [TM]The Digital Logo, Alpha, DEC, and Digital are 
 trademarks of Digital Equipment Corporation.	
 [TM] DECtalk and SMART are trademarks of FORCE Computer Inc.

