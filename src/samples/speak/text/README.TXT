DECtalk(r) Software Version 5.00 
Release Identifier: V5.00.01 B004
README.TXT
April 2003.

KITS SUPPORTED:

This README file applies to one of the following DECtalk V5.00
Software Development Kits (SDKs):

-DECtalk Software for Linux.
 This SDK supports Intel or StrongARM hardware running Red Hat Linux
 Version 5.0 or higher.  Intel systems must be running kernel 2.2.14
 or later, glibc 2.1 or later, and gtk 1.2.27 or later.  (gtk is only
 required for graphical samples.)  StrongARM systems must be running
 kernel 2.4.0 or later and glibc 2.1 or later.

-DECtalk Software for Windows.
 This SDK supports Intel hardware running Microsoft Windows 95, 98,
 ME, xP, NT, or 2000.

-DECtalk Software for Windows CE.
 This SDK supports an Intel Windows system (95/98/ME/NT/2000) that
 hosts a Microsoft Windows CE system running in one of the following
 configurations:
        Windows CE 2.00 for MS HPC \ SH3 MIPS x86EM.
        Windows CE 2.11 for MS HPC Pro \ SH3 SH4 MIPS ARM x86EM.
        Windows CE 2.11 for Palm-Size PC \ MIPS SH3 X86EM.
        Windows CE 3.00 for Pocket PC \ ARM MIPS SH3 x86EM.

Please check the label on your CD-ROM media to determine which SDK
applies.


GENERAL DESCRIPTION:

This SDK includes applications and application programming interfaces
based on DECtalk text-to-speech synthesis technology from Fonix Corp.


	American English is the only language currently supported by the new technology but work 
is in progress to support the other languages.

	The speech is playable through audio hardware on the supported platforms.

	 
WHAT'S NEW IN DECTALK SOFTWARE V5.00?

DECtalk Software V5.00 contains the following new features:



	DECtalk version 5.0 incorporates a new technology, making DECtalk the first commercially available pseudo-articulatory synthesizer, utilizing a model of the vocal tract developed at Sensimetrics Corp. by Prof. Ken Stevens and colleagues.   
	V5.0 represents the first in step in a new evolution that over time will provide improvements in naturalness, voice tuning, female voices, and ultimately the ability to create individual customized voices that are uniquely recognizable. 

	New features of DECtalk V5.0 

		New vocal tract model, providing a base for more natural speech in this and future versions. 

		A new volume control that allows for positive gain, meaning DECtalk  can be much louder than in the past. The command is [:vol att xxx] where xxx is a number between 0 and 140. It's default volume is also louder than in the past. 

		Improvements have been made so that voice tuning is much less likely to cause undesirable overloads. 

		An expanded set of speaker parameters to allow for more flexibility and power in creating voices. 

		More accurate pronunciations of words. 

		V5.0 contains an initial implementation of a parser to better break text into phrase groups for better and more natural speech.

		More user controls are still being added so the release version will contains yet more controls, as well as improved control over singing and singing dynamics.
		
		

	In this new version you have new speaker definitions that are used with the  [:dv xxx] command. They are:

	ago 	Average area of opening of the vocal cords during a voiced sound.
		Ago is the average area for sonorants in mm squared times  100.
		It's range is from 0 to 1500 with a normal  person being about 400.
		Below 400 it will be a creaky voice above it  will be more breathy.

	aguo 	Average area of opening of the vocal cords for an unvoiced 			      obstruent.
		Agou is for unvoiced obstruents with a typical value that is greater 		than that of AGO and typically greater than 1100 to avoid voicing. A 		suggested value is  1900.
	agvo 	Average area of opening of the vocal cords for an voiced obstruent.
		AGVO is for voiced obstruents and typically should be between the 		value of AGO and AGOU. A suggested value is 800.

	chink       Chink.

  		The chink is a small triangular area at the end of the vocal 			folds that can allow an additional path for airflow from the 			lungs past the vocal folds. The speaker parameter controls how 			tightly the folds can close, with zero being completely closed an 60 		being a leakage area of .6 mm squared. This creates a more breathy 		voice and even small amounts have a perceptual effect on the voice. 

	oq	Open quotient. 
		Open quotient controls the base level of time the vocal folds are 		open during a cycle. The actual value is modified by other factors. 		The perceptual effect of this parameter is minimal and we suggest 		you don't spend much time with this parameter at this time.

	The parameters allow you to have different acceptable realizations of the same phoneme. For example some people produce the "z" sound with a period of voicing which dies out during the phoneme with frication occurring. Another realization has voicing accruing through the entire phoneme with frication present. By simply setting the target value of the agvo parameter between 800 and 1100 for Paul these different variations can be achieved. The change would affect all voiced obstruents but this would be expected within a single speaker.



CUSTOMER PROBLEMS FIXED:

-Ease of tunings voices - The new version makes tuning voice parameters much easier with much less risk of overloads. 

KNOWN PROBLEMS:

-For Windows:  If DECtalk Software is installed and you use Adobe
 Acrobat Version 4.0C or later, you may get a "Program Error" message,
 due to a conflict with SAPI Version 3.0 support.  The reason for the
 error message has to do with SAPI as incorporated into Acrobat.  This
 bug is being investigated.

 Workaround #1:  Go to the directory C:\Program Files\Adobe\Acrobat
 4.0\Reader.  Make a new subdirectory in "Reader" named "temp".  Next,
 go to C:\Program Files\Adobe\Acrobat 4.0\Reader\plug_ins and move the
 file "AcroForm" from the "plug_ins" folder into the the newly created
 "temp" folder.  Make sure the file "AcroForm" is removed from the
 plug_ins folder.  This should allow you to start Acrobat Reader and
 open a document.

 Workaround #2:  If you do not plan to use SAPI with DECtalk, you can
 remove SAPI Version 3.0 support for DECtalk by going to the Speech
 directory for your version of Windows and deleting the files
 dtlkttse_*.dll.  The Speech directory is C:\Windows\Speech for
 Windows 95/98/ME and C:\Winnt\Speech for Windows NT/2000.

-For Windows, SAPI Version 3:  The O L E ITTSCentral::TextData
 function does not accept a NULL value for the NotifyInterface (the
 4th C++ argument).


CAUTIONS:

In older versions of DECtalk the average pitch reference of paul was 117 in 4.61 it was changed to 100. Applications appear to be modifying pitch based on the old standard - so we have reverted to the 117 reference. If you experience any problems with this please lets us know.
*****************************************************


-For Windows, Static Access32:  The developer MUST include the
 Microsoft library WINMM.LIB in the link process.

-Improper use of the Log in-line command may appear to hang the
 engine, because speech output is being directed only to the log file.
 See the Log command description in the DECtalk Software Reference
 Guide for proper use guidelines.

-Dictionaries of one language can be loaded into engines of another.
 However, if you use this feature, you must carefully manage the
 adding and removing of dictionaries to avoid confusion over
 dictionary naming, identity, and associations.


INSTALLATION NOTES:

For detailed installation instructions, see the DECtalk Software
Installation Guide, which is provided in PDF and text formats on your
installation CD-ROM.

Before installing this version, please close any already running
DECtalk applications and uninstall any existing DECtalk Software.

For Windows, Windows CE, and Linux:  These SDKs are now combined in a
single CD-ROM that contains U.S. English and
Multi-Language (ML) support.

For Windows and Windows CE:  In these SDKs, all the languages are now
combined in one disk image.  The License/key disk image has not
changed but its location in the registry has changed 

from 	HKEY_LOCAL_MACHINE\SOFTWARE\DECtalk Software\DECtalk\4.61

to 	HKEY_LOCAL_MACHINE\SOFTWARE\DECtalk Software\DECtalk\5.00. 
 
Installation materials reside in the root directory of the
installation CD-ROM.  You can start the installation automatically, if
autorun is enabled, by inserting the CD-ROM, or manually, by invoking
setup.exe in the root directory the DECtalk installation will be invoked.


OTHER SDK TEXT FILES:

For development hints, refer to the file APPENDIX2.txt.

For a list of Microsoft Speech API functions supported by DECtalk
Software, refer to file APPENDIX3.txt.

For a historical list of previous versions of DECtalk Software, see
APPENDIX4.txt.


PRODUCT INFORMATION UPDATES:

For the latest information about DECtalk products and technology from
Fonix Corporation, visit the DECtalk web page at:

 http://www.fonix.com/products/dectalk

Copyright (c) 2001, 2002, 2003 by Fonix  Corporation.
Copyright (c) 2000, 2001 by Force Computers, Inc.
Certain portions (c) 1999 Compaq Computer Corporation.
All rights reserved.

The Fonix logo and DECtalk are trademarks of Fonix Corporation Inc.

Compaq is a registered trademark of Compaq Computer Corporation.
Intel is a trademark of Intel Corporation.
Linux is a registered trademark of Linus Torvalds.
Microsoft, Windows, Windows 95, Windows 98, Windows ME, Windows NT,
Windows 2000, and Windows CE are registered trademarks of Microsoft
Corporation.
Red Hat is a registered trademark of Red Hat Software, Inc.

Other product names mentioned herein may be trademarks and/or
registered trademarks of their respective companies.

End of file.
