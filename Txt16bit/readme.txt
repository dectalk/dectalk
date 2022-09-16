DECtalk PC V4.2 Release Notes

This document summarizes the enhancements, performance
considerations, known problems, and restrictions for the
DECtalk PC V4.2 software. 

The document provides a chronological listing, newest first, 
of the release notes for Version 4.2 of DECtalk software. 
The listing is helpful to users of earlier versions of the
software. 

DECtalk PC V4.2C Release Notes,                03/26/96.

USER GUIDE.
We have updated the User Guide again with the intent of 
providing more and better information.

EIDE CDROMs.
We have found that the DECtalk PC (internal) and the DECtalk Express 
(external) will not work with PCs that have certain EIDE CDROMs intalled.
If you have this problems, please refer to the CDROM.TXT file on your 
Installation Disk.

On-board Processor.
The operating system that runs in the micro-processor on the 
DECtalk PC board has been modified to be more efficient and 
hopefully more responsive. 

DT_CONF Eliminated.
The second change was to eliminate the DT_CONF.EXE utility 
program. The initialization and checking functions that it 
performed have been incorporated into the DT_DRIV.EXE driver.
The status of the diagnostic is displayed to the user which 
should help in providing better problem solving.

FILE NAME CHANGES.
If you are upgrading from a previous version of DECtalk PC, please note
that the new standard directory that contain the DECtalk files is DECTALK2.  
The new batch file that loads all the appropriate files onto the board is 
DT2.BAT.

INSTALL PROGRAM.
If you have any problems with your installation, please call the Customer
Support Center at 1-800-354-9000, option 4.

The INSTALL program using the Custom Install feature now also 
allows the user to specify the Base I/O Address that the board 
is set at.

Plug and Play
The Plug and Play configuration file is named !DTC07BA.CFG.

Version Number.
The program SAY.EXE will speak the version number of the installed 
DECtalk PC2 software.

TESTDT2
The program TESTDT2 will provide a step-by-step diagnostic of the 
installed DECtalk PC2.

"BUG" Fixes.
Other minor changes were made to fix problems reported by users 
and developers.

DTDEMO VOLUME
The DECtalk default volume setting is 5.  When using DTDEMO.EXE if you first
use the 'D' option for 'down volume', it decrements the volume by 5 so 
nothing will be heard.  Use the 'U' option for 'up volume' to restore the
volume setting to 5.

Notes for Developers.
DT_DRIV.EXE now returns the status of its self-test diagnostic 
routine in the lower byte of the status word.

REMINDER:  Faster and faster processors (Pentium 133 and greater)
make it important NOT to use the I/O priority command. 


DECtalk PC V4.2B Release Notes.        01/26/95.

ENHANCEMENTS.

DECtalk PC V4.2B includes enhancements in the following areas.
     A. "Cleaner" installations.
     B. Expanded User information.
     C. Expanded DTDEMO program.
     D. Expanded Pronunciation rules.
     E. Homograph processing.
     F. Naturalness and intelligibility.
     G. Digitized sound file processing.
     H. Expanded dictionary.
     I. User dictionary enhancements.
     J. Multi-lingual architecture.
     K. Improved indexing.
     L. Parameter setup and recall commands.
     M. A Plug and Play configuration file.

INSTALLATION.
The startup of DECtalk will now be less "verbose" with its screen
output messages. Error trapping will now cause DECtalk to exit
out of its startup command sequence if a problem is detected.
This should help diagnosing installation problems. In fact, it
should help eliminate support calls when there isn't a problem,
but just confusion caused by the seemingly conflicting screen
output messages.

UPGRADES.
If you are upgrading the DECtalk PC software from a previous
version, please review the upgrade instructions in the file
UPGRADE.TXT.

NOTE: Prior to upgrading previous versions of the DECtalk PC
software, the DECtalk specific command lines must be removed from
the AUTOEXEC.BAT file. The lines are usually at the end of the
file and look like this:

     CD \DECtalk
     DT_DRIV -r >nul
     DT_CONF
     DT_DRIV -c
     DT_LOAD Kernel.sys cmd.exe ph.exe lts.exe dtpc.dic
     DT_start

PLUG and PLAY SUPPORT.
The Install disk for the DECtalk PC includes a configuration file
named !dtc07aa.cfg which can be used with the ISA Configuration
Utility (ICU) that is now shipping with many new PCs.  To find
more about Plug and Play, please read PLUGPLAY.TXT.

USER INFORMATION.
The documentation has been expanded to provide more information
to the user with regards to using the DECtalk PC with DOS
commands, using files created with word processors, playing
digitized sound files, embedding commands in text files and using
headphones.

DTDEMO.
The DTDEMO demo program has been expanded to provide the
capability to select the different voices and to play a digitized
sound file.  The volume up and volume down commands have been
changed to go up or down 5 steps instead of one to make the
volume change more noticeable.

DECtalk BBS
The DECtalk BBS has moved. The new number is 508-467-3806.

IMPROVED PRONUNCIATION.
Much effort has been expended to significantly improve DECtalks
pronunciation of irregular text. DECtalk used to frequently
default to spelling file names etc.  DECtalk will now very rarely
resort to spelling. For example it now would handle "747max.doc"
by saying "seven hundred forty seven max dot doc". It also
recognizes telephone numbers and speaks them differently than
regular numbers, like people do.

The number of changes are too numerous to explain all of them in
this document. Try letting DECtalk speak some difficult text
including file names, hyphenated words or words separated with
slashes. There will be some cases where combinations of various
punctuation e.g. quotes, periods, slashes, hyphens and decimal
points may cause the DECtalk to not handle the punctuation as you
would normally expect it to. Please let us know when you find one
of these situations and we will try to address in future
releases.

In addition, DECtalk's ability to differentiate homographs has
been greatly improved. Homographs are when two different words
are spelled the same but pronounced differently. For example, "He
will lead it." cannot be pronounced correctly unless you know
whether the subject is a stained glass window or a trip. DECtalk
can also say, "He will wind the clock on a windy day." and get
it correct.

Many other detailed speech improvements have been added to
improve DECtalks naturalness and intelligibility.  For example
"riding" and "writing" produce the same speech sounds in English
and in the past they both sounded the same with DECtalk. Now you
can tell one from the other.  Improvements have been made in all
areas of the synthesizer; additions to the dictionary,
improvements to the duration rules, improvements to the acoustic-
phonetics and other areas.

DIGITIZED SPEECH.
DECtalk can now play digitized 8 bit mono sound files in the
Sound Blaster VOC format. Recording rates of 4KHz to 22khz are
supported. The playing of these files is demonstrated in the
dtdemo program. A new program PLAY.EXE for playing sound files is
documented in the User Guide.

USER DICTIONARY ENHANCEMENTS.
The previous user dictionary compiler command has been replaced
by USER_DIC.BAT.  This command alphabetizes the user dictionary
list and compiles the new loadable user dictionary.

The user dictionary now supports suffix stripping.  Only the root
word (eg. socket) needs to be entered into the user dictionary
list, but all its variations (eg. socketed, sockets, socketing)
will be recognized.

FAST PCs.
On fast PC processors (486/66's and Pentiums), if a large amount
of text is being sent to the DECtalk at once, it can occupy the
DECtalk so long in the communications task that the speech buffer
runs dry, causing the speech to stop and/or "stutter".

In many cases application developers have incorporated a special case
for fast PC processors to resolve this problem. However, please contact 
us if you encounter this problem. In the interim, try sending smaller
pieces of text to the DECtalk e.g., paragraphs  instead of pages,
etc.

IBM SCREEN READER/DOS
Upgrades for IBM Screen Reader/DOS can be accomplished by sending
a complete set of installation diskettes (1-3 for the 3-1/2 inch
and 1-6 for the 5-1/4 inch) for your PCs Drive A to the following
address:

     Digital Equipment Corporation
     Assistive Technology Group
     200 Forest Street  MRO1-1/L31
     Marlboro, MA  01752

NOTES FOR DEVELOPERS.

DEVELOPER'S TOOLKIT
The DECtalk Developer's Toolkit diskette is available for
download as a ZIP file on the DECtalk BBS. The file name is
TOOLKIT.ZIP. Note: Be sure to unzip it with the -d option to 
restore the subdirectory structure.  

INDEXING.
In version 4.1 reporting of index mark's was not accurate when
indexing was done on a word by word basis. The indexing algorithm
has have been improved so that you can now tell exactly where the
DECtalk speech output is at any point in time. In fact indexes
are now accurate to the phoneme level.

Indexes are markers that an application places in the input text
stream which get reported when the marker reaches the last stage
of the synthesizer. This enables an application to determine
exactly if and when a particular part of speech has in fact been
spoken.

MULTI-LANGUAGE ARCHITECTURE.
This version of DECtalk has incorporated the architecture for
multi-lingual capability. The first indication of this will be
the addition of another file name, USA.EXE, in the DT_LOAD
command line. This particular command loads the file with the
code page, typing table and translation table for American
English.  Additional files will be used for other languages.

Each language, when supported, will have basically three
components. They are: 1. letter-to-sound, 2. phonemic and 3.
interface. For American English, these three components are
LTS.EXE, PH.EXE and USA.EXE. Other languages will have their own
LTS, PH and Lang EXE files. The architecture allows at least two
languages to be loaded simultaneously on the board by just adding
the appropriate file names to the DT_LOAD command line. Switching
between the languages will be done with a simple in-line text
command. The syntax of the new command is [:lang LANG] where LANG
represents the language to be used on all the text following the
command.

TYPING TABLE.
The typing table was changed to more closely reflect the actual
names of keyboard keys. For example the entry in the table for
the Enter key is now "Enter" and not "Carriage Return".

PARAMETER SETUP/RECALL COMMANDS.
Two new in-line text commands have been added which allow strings
of DECtalk voice control commands to be loaded onto the board and
then be recalled with a simple "set variables" command. Up to ten
(10) strings of 64 characters each can be loaded and recalled.


APPENDIX A.    LIST OF FILES.

Files on the Distribution Disk:
FILE,                   Description.
!DTC07BA.CFG        Plug and Play configuration file.
DDB.001             Compressed "DECtalk" files.
DISK.ID             ID of the disk.
INSTALL.DAT         Data relating to the compressed files.
INSTALL.EXE         Installation program.
PLUGPLAY.TXT        Plug and Play text file.
README.TXT          V4.2C Release Notes.
UGUIDE.TXT          ASCII text file of the Install/User Guide.
UPGRADE.TXT         Upgrade instructions.
CDROM.TXT           EIDE CDROM fix.
!DTC07BA.CFG        Configuration file for Plug and Play.

Files Installed in the DECtalk subdirectory:
FILE.                   DESCRIPTION.
ALPHABET.EXE      User dictionary alphabetizer.
CMD.EXE           DECtalk command processor.
COMMAND.TXT       DECtalk command reference text file.
DEC.VOC           Sample Digitized sound file.
DT2.BAT           DECtalk load batch file.
DTDEMO.C          DTDEMO source program file.
DTDEMO.EXE        DECtalk demo program.
DTDEMP.H          DTDEMO header file function prototypes
DTPCDIC.DIC       DECtalk built-in dictionary.
DTTSR.H           DTDEMO tsr command definition header file.
DT_DRIV.EXE       DECtalk MS-DOS terminate and stay resident driver.
DT_LOAD.EXE       DECtalk module program loader.
DTSTART.EXE       Startup message program.
KERNEL.SYS        DECtalk microprocessor kernel.
LTS.EXE           DECtalk letter-to-sound module.
PH.EXE            DECtalk phoneme module.
PLAY.EXE          Play digitized .VOC sound file command.
USER_DIC.EXE      User dictionary compiler.
USA.EXE           American-English environment module.
USER_DIC.BAT      User dictionary .BAT file calls UDIC.EXE
		  and ALPHABET.EXE.

End of file.
