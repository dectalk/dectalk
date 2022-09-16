DECtalk® Software Version 4.61
Release Identifier: V4.61.02 R002
README.TXT
April 2001.

KITS SUPPORTED:

This README file applies to one of the following DECtalk V4.61
Software Development Kits (SDKs):

-DECtalk Software for Linux.
 This SDK supports Intel or StrongARM hardware running Red Hat Linux
 Version 5.0 or higher.  Intel systems must be running kernel 2.2.14
 or later, glibc 2.1 or later, and gtk 1.2.27 or later.  (gtk is only
 required for graphical samples.)  StrongARM systems must be running
 kernel 2.4.0 or later and glibc 2.1or later.

-DECtalk Software for Windows.
 This SDK supports Intel hardware running Microsoft Windows 95, 98,
 ME, NT, or 2000.

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
based on DECtalk text-to-speech synthesis technology from Force
Computers, Inc.

DECtalk Software allows applications to convert standard ASCII text
into highly intelligible and natural sounding speech.  Supported
languages include U.S. English, U.K. English, Castilian Spanish,
Latin-American Spanish, German, and French (Beta).

The speech is playable through audio hardware on the supported
platforms.


WHAT'S NEW IN DECTALK SOFTWARE V4.61?

DECtalk Software V4.61 contains the following new features:

-Windows CE support extended to palm-size PCs and pocket PCs (as
 listed above).

-Installation tested on Windows ME.

-Reduced footprint sizes for all platforms.

-Unified phoneme set for all supported languages, allowing you to
 specify phonemes from different languages within the context of your
 current language.

-Support for Version 5.0 of the Microsoft Speech API (SAPI) on Windows
 98, Windows ME, Windows NT, and Windows 2000 platforms.  Installation
 of SAP Version 5.0 support is optional.

-Beta support for the French language.

-Enhanced German.

-Supplemental foreign-language dictionary for German, allowing you to
 include foreign phrases in German speech.

-Addition of a Hebrew complement phoneme set.

-Support for Windows CE Agent, an automatic registry update
 application for Windows CE developers.

-Windows, Windows CE, and Linux SDKs combined on one CD-ROM.

-Windows and Windows CE installations now use InstallShield 6.2 for
 easier, more flexible kit installation, customizing, and maintenance.

-Manual and online help updates.

-Removed APPENDIX1.txt (list of the files being installed).

-Windows SDK changes include:
     Envpatch:
       The application was removed and replaced by InstallShield.
     Windic:
       Fixed language menu to check current language in Multi-language
       mode.
     Dtsample:
       Fixed check marks for the menu of speak, voice, rate,
       languages.

-Windows CE SDK changes include:
     Mailread:
       Added a Windows CE Email reader sample for Windows CE 3.00
       Pocket PC.
     Dtsample:
       Fixed missing menu for x86em.


CUSTOMER PROBLEMS FIXED:

-Corrected various application or system hangs or crashes caused by
 data path, synchronization, and dictionary failures.

-Made voice quality improvements and enhancements.

-Corrected parsing and preprocessing problems.

-Fixed bugs in sample application code.


USING THE NEW DICTIONARY VARIANTS:

DECtalk Software now provides reduced-size pronunciation dictionaries
for U.S. English (small or medium), U.K. English (small), and German
(small).  To use a smaller variant in place of a language's default
dictionary, you must rename the variant to match the name the software
expects:

    dtalk_uss.dic           to      dtalk_us.dic
    dtalk_usm.dic           to      dtalk_us.dic
    dtalk_uks.dic           to      dtalk_uk.dic
    dtalk_grs.dic           to      dtalk_gr.dic.


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


EMBEDDED DISTRIBUTION:

Developers installing DECtalk Software V4.61 as part of their own
distributed product installation should be aware that the license key
and the resulting license and password values have changed from those
in the V4.40, V4.41, V4.50, and V4.51 releases.  Licensees who are
upgrading from a release before V4.60 should check with their Force
Computers sales representative for further information.


INSTALLATION NOTES:

For detailed installation instructions, see the DECtalk Software
Installation Guide, which is provided in PDF and text formats on your
installation CD-ROM.

Before installing this version, please close any already running
DECtalk applications and uninstall any existing DECtalk Software.

For Windows, Windows CE, and Linux:  These SDKs are now combined in a
single CD-ROM that contains U.S. English, U.K. English, Castilian
Spanish, Latin-American Spanish, German, French (Beta), and
Multi-Language (ML) support.

For Windows and Windows CE:  In these SDKs, all the languages are now
combined in one disk image.  The License/key disk image has not
changed.  Installation materials reside in the root directory of the
installation CD-ROM.  You can start the installation automatically, if
autorun is enabled, by inserting the CD-ROM, or manually, by invoking
setup.exe in the root directory.  This activates InstallShield.

For Windows CE:  After performing the Windows CE SDK installation to
the Windows host PC, follow the instructions in the DECtalk Software
Installation Guide to install DECtalk on your CE platform.


OTHER SDK TEXT FILES:

For development hints, refer to the file APPENDIX2.txt.

For a list of Microsoft Speech API functions supported by DECtalk
Software, refer to file APPENDIX3.txt.

For a historical list of previous versions of DECtalk Software, see
APPENDIX4.txt.


PRODUCT INFORMATION UPDATES:

For the latest information about DECtalk products and technology from
Force Computers, visit the DECtalk web page at:

  http://www.forcecomputers.com/product/dectalk/dtalk.htm.


Copyright (c) 2000, 2001 by Force Computers, Inc.
Certain portions (c) 1999 Compaq Computer Corporation.
All rights reserved.

The Force logo and DECtalk are trademarks of Force Computers, Inc.

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
