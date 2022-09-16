# -----------------------------------------------------------
# Name:				DTPCKITS.MAK
# Creation Date:	24-JAN-1995
# Created By:		Carl Leeber
# Function Summary:	External MAK file, build DECTALK disk kits.
# -----------------------------------------------------------
# Description:
#	This file is intended to build the various disk kits used
#	for the distribution of DECTalk products.
# Note:
#	There are a number of 'hardwired' choices here. As the
#	need arises these should be changed to allow user inputs.
#	An example is the choice of the 'a:' disk drive.
# -----------------------------------------------------------
# Modifications History:
# -----------------------------------------------------------
# 21-FEB-1995 Carl Leeber, Add lickit capability to process.
# 22-FEB-1995 Carl Leeber, Add demokit capability to process.
# 01-MAR-1995 Carl Leeber, Add sdemokit capability (Spanish),
#							change demokit to basic English,
#							lickit files copied to c:\tempkit
#							then to a: drive, clean a: 1st.
# 20-MAR-1995 Carl Leeber, Add wsr.exe and dtpc.dll.
# 24-MAR-1995 Carl Leeber, Add SRCS_VTM_I_EXE_OK to lickit.
# 04-APR-1995 Carl Leeber, Change LICKIT to exclude VTM files,
#							Add LICKITI (incl. VTM_I files) and LICKITF
#							(incl. VTM_F files) using SRCS_VTM_F_EXE_OK.
# 06-APR-1995 Carl Leeber, Comment out (#) macro that makes kit of
#							trade secret files.
# 10-May-1995 Carl Leeber, Add stskit for nish Trade Secret Files
#							Move phmath.asm to non-trade secret status
#							SRCS_PH_ASM is the same for English and
#							Spanish. Should be the same for all languages.
# 17-MAY-1995 Carl Leeber, Add SRCS_USERDIC_EXE, userdic_DEP & alphabet_DEP
#							to LICKITx builds; LICKIT_BASIC_ENGLISH instead
#							of individually repeated SRCS_x_EXE instances. 
# 23-MAY-1995 Carl Leeber, Add gdemokit capability (German), and
#                          	gtskit for Spanish Trade Secret Files
# 26-MAY-1995 Carl Leeber, Added DTPCDIC.DIC to LICKIT_BASIC_ENGLISH in
#							DTPCMACR.MAK.
#						   Add DTPCW.LIB and include files for DTPC.DLL and
#							WSR.EXE for toolkit build.
# 09-JUN-1995 Carl Leeber, Add LICKIT_LICKITRM_TXT macro for readme file.
# 19-JUN-1995 Carl Leeber, Add dtstart_DEP, dtdemo_DEP & dtcommon_DEP
# 22-JUN-1995 Carl Leeber, Add LICKITV to include VTMI & VTMF.EXE.
#							Add MKITROOT to make the temp work directory.
# 26-JUN-1995 Carl Leeber, Add LSHOMO.C and LSHOMO_DEP to LICKITxs.
# 28-JUN-1995 Carl Leeber, Add COMMAND.TXT and UGUIDE.TXT to TOOLKIT.
# 27-OCT-1995 Carl Leeber, Add DRIVRKIT to possible targets. Add
#							PRODUCT_ARGUMENT.
# 20-NOV-1995 Carl Leeber, Add LICKITSP, ..GE and ..FR as local language
#							only source file disks SPA, GER and FRE.EXE.
# 02-FEB-1996 Carl Leeber, Remove ALPHABET & USERDIC.EXE & personal.dtu
#							builds.
# 09-FEB-1996 Carl Leeber, Add announce routine, cmd_tpre_DEP & lickitrm.txt.
# 12-FEB-1996 Carl Leeber, Add pkunzip.exe to LICKITs and TOOLKITs.
# 23-MAY-1996 Carl Leeber, Add SRCS_DTPCDIC_DIC:.zip=.dic to lickitsp build.
# 07-FEB-1997 Trung Ly,    Updated some _DEP macro names to fit new naming convention.
# 17-FEB-1997 Trung Ly,    Updated file to fit new naming convention.
# 19-FEB-1997 Trung Ly,    Moved $(phlog_DEP) from lickiti1 to tskiti1.
# 27-FEB-1997 Trung Ly,    Changed lickitge to lickitgr.
# 05-NOV-1997 Doug Robinson, Added a ndemkitb section...This esentialy kits the NWS demo kit together.
# 02-JUL-1998 Eric Thompson, Added dkitroot to mkitroot so that it will delete the tree if still there.
# 02-JUL-1998 Eric Thompson, removed hardcoded _DEP macro calls at bottom. 
#		replaced with automated implementation and preproc trade secret code stripping. 							
#
# -----------------------------------------------------------
# NMAKE Inference Rules.
# -----------------------------------------------------------
#example:
.c.obj:
.asm.obj:
	@echo wrong place to be building anything!
#	@cl /Ox /G1 /Gs /c /nologo $*.c
# -----------------------------------------------------------
# NMAKE MACRO list of disk kits. Uses library, sources, and
#	compile/assembly files defined in DTPCMACR.MAK
# -----------------------------------------------------------
# Each macro is named in a manner to make it easy to associate
#	the files named in th macro with the end point object that
#	is producted from them (it). Most macros have the prefix
#	SCRS_ followed by the target object name. Therefore
#	SCRS_PHMATH_ASM is the macro of file names that will
#	be dependents of that build. Other macros ahve the prefix
#	TARGET_. These identify a group of macros that lead to the
#	specific target. These file names are included as macros
#	defined in DTPCMACR.MAK
# -----------------------------------------------------------
# File of file name macros associated with each .exe,.sys,.lib.
!INCLUDE dtpcmacr.mak

# -----------------------------------------------------------
# If you fail to give this MAKe file an argument(target) it will
# 	not run and exits with a message to that effect.
# -----------------------------------------------------------
all:
	@echo No Kit Build Option Specified for DTPCKITS 
	@echo DTPCKITS Completed - No Action Taken.

# -----------------------------------------------------------
# These are the primary arguments (targets) that this MAKe
#	file will process.
# -----------------------------------------------------------
# Collection of demo and text files for ISVs.
#	For a 3.5" disk in drive a:. PKZIP format.
# -----------------------------------------------------------
toolkit: announce dtpccjlt.dep cleana toolkitb dkitroot
	@echo TOOLKIT Build Is Completed
	
# -----------------------------------------------------------
# Collection of source files for Licensees.
#	For a 3.5" disk in drive a:.
#	LICKITI provides VTM_I files, LICKITF provides VTM_F files.
#	LICKITV provides VTM_I and VTM_F files on kit disk.
#	LICKIT provides neither file set.
#	LICKITTS makes kit of all trade secret files.
#	DRIVRKIT makes kit of all non-trade secret driver files.
# -----------------------------------------------------------
lickit: announce\
		dtpccjlt.dep cleana mkitroot lickitb lickitrm lickiti1 lickiti2\
		lickiti3 ckitroot dkitroot
	@echo LICKIT Build Is Completed
	
lickiti: announce\
		dtpccjlt.dep cleana mkitroot lickitbi lickitrm lickiti1 lickiti2\
		lickitii lickiti3 ckitroot dkitroot
	@echo LICKIT Build With VTM_I Is Completed
	
lickitf: announce\
		dtpccjlt.dep cleana mkitroot lickitbf lickitrm lickiti1 lickiti2\
		lickitif lickiti3 ckitroot dkitroot
	@echo LICKIT Build With VTM_F Is Completed
	
lickitv: announce\
		dtpccjlt.dep cleana mkitroot lickitbf lickitbi lickitrm lickiti1\
		lickiti2 lickitif lickitii lickiti3 ckitroot dkitroot
	@echo LICKIT Build With VTM_I and VTM_F Is Completed
	
drivrkit: announce\
		dtpccjlt.dep cleana mkitroot drvrktb drvrkit ckitroot dkitroot
	@echo LICKITDV Build Is Completed
	@echo Driver, Loader and Configuration code *ONLY*
 
# -----------------------------------------------------------
#	Local Language ONLY framework file disk kits
# -----------------------------------------------------------
lickitsp: announce\
		dtpccjlt.dep cleana mkitroot licktspb licktsp1 ckitroot dkitroot
	@echo LICKIT Build With Spanish ONLY Is Completed
	
lickitgr: announce\
		dtpccjlt.dep cleana mkitroot licktgrb licktgr1 ckitroot dkitroot
	@echo LICKIT Build With German ONLY Is Completed
	
# -----------------------------------------------------------
#	Trade Secret files for Local Language ONLY disk kits
# -----------------------------------------------------------
tskit: announce dtpccjlt.dep cleana mkitroot tskitb tskiti1 tskiti2
	@echo TSKIT Build with TRADE SECRET CODE Is Completed
	
stskit: announce dtpccjlt.dep cleana mkitroot stskitb tskiti1
	@echo STSKIT Build with TRADE SECRET CODE Is Completed
	@echo SPANISH Language *ONLY*
	
gtskit: announce dtpccjlt.dep cleana mkitroot gtskitb tskiti1
	@echo GTSKIT Build with TRADE SECRET CODE Is Completed
	@echo GERMAN Language *ONLY*
	
# -----------------------------------------------------------
# Collection of source, object and executable files for Demos.
#	For a 3.5" disk in drive a:.
# -----------------------------------------------------------
#	Basic dtpc
demokit: announce dtpccjlt.dep cleana demokitb
#	@echo DEMOKIT Build Is Completed
	
#	Spanish dtpc
sdemokit: announce dtpccjlt.dep cleana sdemkitb
#	@echo SDEMOKIT Build Is Completed
	
#	German dtpc
gdemokit: announce dtpccjlt.dep cleana gdemkitb
#	@echo GDEMOKIT Build Is Completed
	
# -----------------------------------------------------------
# Collection of executable, text and demo files for End Users.
#	For a 3.5" disk in drive a:. INSTALL format.
# -----------------------------------------------------------
ins3kit: announce dtpccjlt.dep isvkitb
# Add cleana to above when implemented
	@echo ISVKIT Not Implemented Yet
#	@echo ISVKIT Build Is Completed
	
# -----------------------------------------------------------
# Collection of executable, text and demo files for End Users.
#	For a 5.25" disk in drive b:. INSTALL format.
# -----------------------------------------------------------
ins5kit: announce dtpccjlt.dep relkitb
# Add cleana to above when implemented
	@echo RELKIT Not Implemented Yet
#	@echo RELKIT Build Is Completed

# -----------------------------------------------------------
# Files of dependency definitions for every source file.
#	This file generated by an inline command in dtpccjlt.mak
#	This INCLUDE *MUST* follow the all psuedo target!
!INCLUDE dtpcincl.dep
	
# -----------------------------------------------------------
announce :
		@echo *******************************************************************************
        @echo *****************$(SRCS_DTPCKITS_MAK) Last Revised; 15-JUL-1998************************
		@echo *******************************************************************************
# -----------------------------------------------------------
# NOTES: The '!' causes NMAKE to execute the generic command
#	for each dependent file, ONE AT A TIME.
# 	The '@' surpresses the command action line display.
#	The '-' ignores error codes from the specific command.
#	The '/' allows for one command option per instance.
# OPTIONS:	I: Ignore error codes from all commands.
#			S: Suppresses the display of all commands.
#			C: Suppresses display of default NMAKE outputs.
#			V: All macros to be inherited in recursive NMAKE.
#	   NOLOGO: Suppresses the NMAKE copyright message.
# -----------------------------------------------------------
# toolkitb and its dependent psuedo targets cause a temporary
#	directory structure to be created and populated with files
#	for the developers tool kit disk, zips the files/directories
#	to drive a:, copies a readme file to a:, then deletes all
#	the files and temporary directories.
# Remember this parent action is done last...
#		the dependent psuedo targets get done 1st.
# The macro TOOLKIT_DIR is a list of directories, NOT FILES!
# The macro TOOLKIT_ROOT is the root directory and drive for
#	all the temporary work files and directories.
# -----------------------------------------------------------
toolkitb : 	tlktdirb	tlkttopb	tlktbbsb	tlktcdrb\
			tlktdmob	tlktdicb	tlktdigb	tlktdllb\
			tlktdldb	tlktspcb	tlktmbdb	tlktmddb\
			tlktphnb	tlktpmbb	tlktpmdb	tlktppyb\
			tlktmanb	tlktchpb	tlktcmdb	tlktsngb\
			tlkttprb    tlktgenb
	@echo Zip all files to toolkit.ZIP.
	@-del toolkit.zip
	pkzip -rP toolkit.zip $(TOOLKIT_ROOT)\*.*
	@echo Copy toolkit.zip file to a: drive
	copy toolkit.zip a:
	@-del toolkit.zip
	@echo Copy readme file to a: drive
	copy kitrdme.txt a:readme.txt
	@echo Copy pkunzip.exe to a: drive
	copy c:\pkzip\pkunzip.exe a:
	@echo DECtalk Product Built
	
tlktdirb :
	@echo TOOLKIT: building a Developer's Toolkit Disk
	@echo Make temporary work directories below $(TOOLKIT_ROOT).
	@<<dtpcdmak.bat
mkdir $(TOOLKIT_DIR: = ^
mkdir )
<<

tlkttopb : $(TOOLKIT_TOP_ALL)
	@echo Copy files from VERSIONs release area to directories.
	!copy $** c:\temptkit
	
tlktbbsb : $(TOOLKIT_BBS_ALL)
	!copy $** c:\temptkit\bbs

tlktcdrb : $(TOOLKIT_CDROM_ALL)
	!copy $** c:\temptkit\cdrom

tlktdmob : $(TOOLKIT_DEMO_ALL)
	!copy $** c:\temptkit\demo

tlktdicb : $(TOOLKIT_DICTION_ALL)
	!copy $** c:\temptkit\diction

tlktdigb : $(TOOLKIT_DIGITIZE_ALL)
	!copy $** c:\temptkit\digitize

tlktdllb : $(TOOLKIT_DLL_ALL) $(copyrite_DEP) $(dll_box_DEP)\
			$(dll_conf_DEP)   $(dll_cust_DEP) $(dll_file_DEP)\
			$(dll_ini_DEP)    $(dll_io_DEP)   $(dll_main_DEP)\
			$(dll_user_DEP)   $(dll_wnd_DEP)  $(drv_main_DEP)\
			$(dll_dtpc_DEP)   $(TARGET_ALL_DLL)
	!copy $** c:\temptkit\dll

tlktdldb : $(TOOLKIT_DLL_DEMO_ALL)	$(wsr_char_DEP) $(wsr_file_DEP)\
			$(wsr_ind_DEP) $(wsr_main_DEP)	$(wsr_tty_DEP) $(wsr_DEP)
	!copy $** c:\temptkit\dll\demo

tlktspcb : $(TOOLKIT_DT_SPECS_ALL)
	!copy $** c:\temptkit\dt_specs

tlktmbdb : $(TOOLKIT_MULTBORD_ALL)
	!copy $** c:\temptkit\multbord

tlktmddb : $(TOOLKIT_MULTBORD_DEMO_ALL)
	!copy $** c:\temptkit\multbord\demo

tlktphnb : $(TOOLKIT_PHONE_ALL)
	!copy $** c:\temptkit\phone

tlktpmbb : $(TOOLKIT_PHONE_MULT_BRD_ALL)
	!copy $** c:\temptkit\phone\multbord

tlktpmdb : $(TOOLKIT_PHONE_MULT_BRD_DEMO_ALL)
	!copy $** c:\temptkit\phone\multbord\demo

tlktppyb : $(TOOLKIT_PLUGPLAY_ALL)
	!copy $** c:\temptkit\plugplay
			
tlktmanb : $(TOOLKIT_REF_MAN_ALL)
	!copy $** c:\temptkit\ref_man

tlktchpb : $(TOOLKIT_REF_MAN_REF_CHAP_ALL)
	!copy $** c:\temptkit\ref_man\ref_chap

tlktcmdb : $(TOOLKIT_SHRT_CMD_ALL)
	!copy $** c:\temptkit\shrt_cmd

tlktsngb : $(TOOLKIT_SONGS_ALL)
	!copy $** c:\temptkit\songs

tlkttprb : $(TOOLKIT_TAPE_REC_ALL)
	!copy $** c:\temptkit\tape_rec

tlktgenb : $(TOOLKIT_GEN_MAN_ALL)
	!copy $** c:\temptkit\gen_man

# -----------------------------------------------------------

lickitb :	$(LICKIT_BASIC_ENGLISH)
	@echo LICKIT: building a Licensees Disk Kit without VTM files.
	@echo LICKIT Copy Group: LICKITB
	@echo Copying non-trade secret source files to $(TOOLKIT_ROOT)
# !copy $** $(TOOLKIT_ROOT)
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL

lickitbi :	$(LICKIT_BASIC_ENGLISH)	$(SRCS_VTM_I_EXE_OK)
	@echo LICKIT: building a Licensees Disk Kit with VTM_I files.
	@echo LICKIT Copy Group: LICKITBI
	@echo Copying non-trade secret source files to $(TOOLKIT_ROOT)
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL
	
lickitbf :	$(LICKIT_BASIC_ENGLISH)	$(SRCS_VTM_F_EXE_OK)
	@echo LICKIT: building a Licensees Disk Kit with VTM_F files.
	@echo LICKIT Copy Group: LICKITBF
	@echo Copying non-trade secret source files to $(TOOLKIT_ROOT)
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL

lickitrm :	$(LICKIT_LICKITRM_TXT)
	@echo Copying LICKIT README.TXT files to $(TOOLKIT_ROOT)
	@echo LICKIT Copy Group: LICKITRM
	!copy $** $(TOOLKIT_ROOT)\readme.txt

# ETT 06/30/1998 the files being included here should match what was here.
# the files are created in dtpccjlt.mak

!INCLUDE lickiti1.tmp

!INCLUDE lickiti2.tmp

!INCLUDE lickiti3.tmp

!INCLUDE lickitii.tmp

!INCLUDE lickitif.tmp

tskitb :	$(SRCS_LTS_US_EXE)		$(SRCS_PH_EXE)		$(SRCS_ALTS_EXE)\
			$(SRCS_VTM_I_EXE_TS) $(SRCS_VTM_F_EXE_TS)
	@echo TSKIT: building a Licensees Disk Kit w/ ONLY TRADE SECRET files.
	@echo TSKIT Copy Group: TSKITB
	@echo Copying TRADE SECRET source files to $(TOOLKIT_ROOT)
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL
	
!INCLUDE tskiti1.tmp

!INCLUDE tskiti2.tmp

stskitb :	$(SRCS_LTS_SP_EXE)	$(SRCS_PH_SP_EXE)\
			$(SRCS_VTM_I_EXE_TS) $(SRCS_VTM_F_EXE_TS)
	@echo STSKIT: building a Licensees Disk Kit w/ ONLY TRADE SECRET files.
	@echo SPANISH Language *ONLY*
	@echo STSKIT Copy Group: STSKITB
	@echo Copying TRADE SECRET source files to $(TOOLKIT_ROOT)
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL

gtskitb :	$(SRCS_LTS_GR_EXE)	$(SRCS_PH_GR_EXE)\
			$(SRCS_VTM_I_EXE_TS) $(SRCS_VTM_F_EXE_TS)
	@echo GTSKIT: building a Licensees Disk Kit w/ ONLY TRADE SECRET files.
	@echo GERMAN Language *ONLY*
	@echo GTSKIT Copy Group: GTSKITB
	@echo Copying TRADE SECRET source files to $(TOOLKIT_ROOT)
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL
	
demokitb :	$(TARGET_ALL_TXT)	$(TARGET_ALL_BAT)	$(TARGET_ALL_SYS)\
			$(TARGET_ALL_BASIC)	$(TARGET_DIC_US_DIC)\
			$(TARGET_ALL_DLL)
	@echo DEMOKIT: building a Demo Kit Disk
	!copy $** a:
	@echo DECtalk Product Built

sdemkitb :	$(TARGET_ALL_TXT)	$(TARGET_ALL_BAT)	$(TARGET_ALL_SYS)\
			$(TARGET_ALL_BASIC)	$(TARGET_ALL_SPANISH) $(TARGET_DIC_SP_DIC)\
			$(TARGET_ALL_DLL)
	@echo SDEMOKIT: building a Demo Kit Disk
	!copy $** a:
	@echo DECtalk Product Built

gdemkitb :	$(TARGET_ALL_TXT)	$(TARGET_ALL_BAT)	$(TARGET_ALL_SYS)\
			$(TARGET_ALL_BASIC)	$(TARGET_ALL_GERMAN) $(TARGET_DIC_GR_DIC)\
			$(TARGET_ALL_DLL)
	@echo GDEMOKIT: building a Demo Kit Disk
	!copy $** a:
	@echo DECtalk Product Built

#-DR added NWS to this stuff 10/30/97  SHOULDN'T $(TARGET_NWS_US_DIC) BE $(TARGET_ALL_DIC)???
ndemkitb :	$(TARGET_ALL_TXT)	$(TARGET_ALL_BAT)	$(TARGET_ALL_SYS)\
			$(TARGET_ALL_BASIC)	$(TARGET_NWS_US_DIC)\
			$(TARGET_ALL_DLL)
	@echo NDEMOKIT: building a Demo Kit Disk
	!copy $** a:
	@echo DECtalk Product Built

ins3kitb : 
	@echo INS3KIT: building a End User Installation Disk
	@echo INS3KIT Not Implemented Yet
	@echo DECtalk Product Built
	
ins5kitb : 
	@echo INS5KIT: building a End User Installation Disk
	@echo INS5KIT Not Implemented Yet
	@echo DECtalk Product Built
	
drvrktb :	$(SRCS_DT_CONF_EXE) $(SRCS_DT_LOAD_EXE) $(SRCS_DT_DRIV_EXE)
	@echo DRIVRKIT: building a Licensees Disk Kit with just DRIVER files.
	@echo DRIVRKIT Copy Group: DRVRKTB
	@echo Copying non-trade secret driver source files to $(TOOLKIT_ROOT)
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL

!INCLUDE drvrkit.tmp
	
licktspb :	 $(SRCS_DIC_SP_DIC:.zip=.dic) $(SRCS_SPA_EXE)
	@echo LICKITSP: building a Licensees Disk Kit with just Spanish files.
	@echo LICKITSP Copy Group: LICKTSPB
	@echo Copying non-trade secret Spanish source files to $(TOOLKIT_ROOT)
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL

licktsp1 :	$(spa_main_DEP)
	@echo Copying non-trade secret include files to $(TOOLKIT_ROOT)
	@echo LICKITSP Copy Group: LICKTSP1
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL

licktgrb :      $(SRCS_GER_EXE)
        @echo LICKITGR: building a Licensees Disk Kit with just German files.
        @echo LICKITGR Copy Group: LICKTGRB
	@echo Copying non-trade secret German source files to $(TOOLKIT_ROOT)
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL

licktgr1 :      $(ger_main_DEP)
	@echo Copying non-trade secret include files to $(TOOLKIT_ROOT)
        @echo LICKITGR Copy Group: LICKTGR1
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL

licktfrb :	$(SRCS_FRE_EXE)
	@echo LICKITFR: building a Licensees Disk Kit with just French files.
	@echo LICKITFR Copy Group: LICKTFRB
	@echo Copying non-trade secret French source files to $(TOOLKIT_ROOT)
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL

licktfr1 :	$(fre_main_DEP)
	@echo Copying non-trade secret include files to $(TOOLKIT_ROOT)
	@echo LICKITFR Copy Group: LICKTFR1
	!preproc -i $** -o $(TOOLKIT_ROOT)\$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL

# -----------------------------------------------------------
# This section cleans off the a drive 1st.
# -----------------------------------------------------------
cleana : argumnts
	@echo Clean disk a: of all files 1st
#	@-rmdir /q /s "a:\"
#	if you are in WinNT copy deltree.exe from c:\win95\command
	@deltree/y a:\*.*
#	@deltree/y a:\

# -----------------------------------------------------------
# This section makes the temporary directory to copy all files.
# ETT 07/2/1998 put in dkitroot to remove the dir if there already.
# -----------------------------------------------------------
mkitroot : dkitroot
	@echo Make temporary work directory $(TOOLKIT_ROOT).
	@mkdir $(TOOLKIT_ROOT)

# -----------------------------------------------------------
# This section zips all files from root, then copies to drive a:
# Then a readme file and pkunzip.exe are copied.
# -----------------------------------------------------------
ckitroot :
	@echo Zip all files to lickit.zip.
	@-del lickit.zip
	pkzip -rP lickit.zip $(TOOLKIT_ROOT)\*.*
	@echo Copy lickit.zip file to a: drive
	copy lickit.zip a:
	@-del lickit.zip
	@echo Copy readme file to a: drive
	copy lickitrm.txt a:readme.txt
	@echo Copy pkunzip.exe to a: drive
	copy $(PKZIP_PATH)\pkunzip.exe a:
	@echo DECtalk Product Built

# -----------------------------------------------------------
# This section deletes the temporary directories/subdirectroies.
# -----------------------------------------------------------
dkitroot :
	@echo Clean up all temporary files and directory created for kit.
	@deltree/y $(TOOLKIT_ROOT)\*.*
	@deltree/y $(TOOLKIT_ROOT)

# -----------------------------------------------------------
# This section compares the process file dtpccjlt.dep against
#	all other files in the process. When building a disk kit,
#	*NONE* of these files should be newer than the process
#	control file. This will detect and stop the disk kit build
#	if any file in the flat work area is newer than the process
#	control file (that is *ALWAYS* written out last).
# The correct way to fix this problem is to run DTPCCJLT.MAK
#	and rebuild whatever is newer. In a jam... if you *MUST*
#	you can edit dtpccjlt.dep file, add and delete a blank line,
#	and write it back out. *USER BEWARE* of this method!
# -----------------------------------------------------------
dtpccjlt.dep : $(SRCS:.c=.obj) $(SRCS_ASM:.asm=.obj)\
					$(SRCS:.c=.dep) $(SRCS_ASM:.asm=.dep) $(SRCS_RC:.rc=.dep)\
					$(SRCS) $(SRCS_ASM) $(SRCS_DIC) $(SRCS_RC)\
					dtpccjl1.mak dtpcmacr.mak dtpcincl.dep \
					dtpccjlt.mak dtpc.lib \
					$(TARGET_ALL_TXT) $(TARGET_ALL_BAT) \
					$(TARGET_ALL_SYS) $(TARGET_ALL) $(TARGET_ALL_DIC)\
					$(TOOLKIT_ALL)
	@echo The file(s) $(?F) has(have) been changed
	@echo since $(@F) was created by dtpccjlt.mak.
	@echo Run DTPCCJLT.MAK to correct.
	@echo DTPCKITS Disk Built Aborted
	stop
# -----------------------------------------------------------
# The 'stop' is a *VERY* ugly way to force NMAKE to stop
#	processing, but it does work!
# -----------------------------------------------------------
# If there are 'arguments' passed to dtpccjlt.mak via the
#	command line when run, this block of code will show values.
argumnts :
	@echo   Macro Name        Argument(s) Passed
	@echo PRODUCT_ARGUMENT:   $(PRODUCT_ARGUMENT)
	@echo LANG_ARGUMENT:      $(LANG_ARGUMENT)
	@echo .
# -----------------------------------------------------------
