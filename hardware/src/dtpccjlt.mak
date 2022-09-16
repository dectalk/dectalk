# -----------------------------------------------------------
# Name: 			DTPCCJLT.MAK
# Creation Date:	30-NOV-1994
# Created By:		Carl Leeber
# Function Summary: Extrnl MAK, creates .dep & calls MAK.
# -----------------------------------------------------------
# Description:
#	This file has is the master external MAKe file for the
#	DTPC product. It checks and updates any .dep files for
#	any .c file builds (may be expended to do .dep for .asm).
#	It then calls NMAKE with dtpccjl1.mak to build the actual
#	dtpc.lib, kernal.sys, cmd.exe, dt_config.exe,
#	lts.exe, ph.exe, dt_driv.exe, usa.exe dt_driv.exe,
#	dt_load.exe and dt_conf.exe.
# -----------------------------------------------------------
# known bugs- 1) Do not edit these files with MSDOS EDIT
#			it will use spaces even when you press tab
#				this is bad.
# -----------------------------------------------------------
# Modifications History:
# -----------------------------------------------------------
#  1-DEC-1994 Carl Leeber, !INCLUDE macros from common file.
#  2-DEC-1994 Carl Leeber, Inline gen'd dtpcincl.dep file.
#  8-DEC-1994 Carl Leeber, Add ASM dependency capability.
# 14-DEC-1994 Carl Leeber, Add DT_*.EXE build capability.
#							Add DTDEMO.EXE to build suite.
# 20-FEB-1995 Carl Leeber, Add all .exe, .sys and .dic files as
#							message targets for later building.
# 08-MAR-1995 Carl Leeber, Add DTPC.DLL and related capability.
# 31-MAR-1995 Carl Leeber, Remove slts & sph_exe bypass objects.
# 14-APR-1995 Carl Leeber, Add COUNT.MAK to build process.
# 06-JUL-1995 Carl Leeber, Add TARGET_ALL_LIB, Fix use of PROTO_CL macro.
# 30-AUG-1995 Carl Leeber, Add TARGET_ARGUMENT & OUTPUT_ARGUMENT macros as
#							a means to pass arguments on command line.
#						   Add argumnts code block to echo passed values.
# 31-AUG-1995 Carl Leeber, Add TARGET_FILEORGN_TXT macro.
# 02-OCT-1995 Carl Leeber, Define OUTPUT_MACRO based on OUTPUT_ARGUMENT.
# 26-OCT-1995 Carl Leeber, Add FAST_BUILD OUTPUT_ARGS & PRODUCT_ARGUMENT.
#							Remove OUTPUT_MACRO. Add /D to OUTPUT_ARGUMENT.
#						   Add COMPILER_FLAGS & ASSEMBLER_FLAGS.
# 22-JAN-1996 Carl Leeber, Add DICTIONARY_PRIO for new PARDIC /P:
#							/O	   old dictionary format, ignore new fields,
#							/P:### convert anything with a priority <= ###,
#							/N	   exclude names from the dictionary.
# 02-FEB-1996 Carl Leeber, Add TARGET_ALL_DTU to full build.
# 21 feb 1996	tek 		merge dtex
# 29-FEB-1996 Carl Leeber, On FAST_BUILD bypass checks & call dtpccjl1.mak.
# 08-MAY-1996 Carl Leeber, Visual check on PRODUCT_ARGUMENT supported type.
# 05-FEB-1997 Trung Ly, Added defaults for LANG_ARGUMENT and PRODUCT_ARGUMENT and
#														made modifications to ensure that they passed
#														into DTPCCJL1.MAK properly. 
# 07-FEB-1997 Trung Ly, Added error check for LANG_ARGUMENT and PRODUCT_ARGUMENT
# 17-FEB-1997 Trung Ly, Fixed error in compile of depend.cpp.
# 27-FEB-1997 Trung Ly, Fixed problem with DICTIONARY_PRIO.
# 27-FEB-1997 Trung Ly, Fixed problem with mkvers.exe and version.h.
# 05-NOV-1997 D. Robinson, Added CUSTOM_ARG outputs and passed custom_Args on to the next makfile
# 21-JAN-1998 BAT#557 Jie Lee, Added Wait.exe to be built before anything else, for the faster machines
# 14-jul-1998 Added changes for SPANISH_LA and SPANISH_SP
# 14-jul-1998 ETT added targets for automatic code stripping which use inline files.
#		these files are created below in inline1, etc.
#
# -----------------------------------------------------------
# NMAKE Inference Rules.
#	If PRODUCT_ARGUMENT is not defined, use DTPC2 as the default
#	argument.
# -----------------------------------------------------------
!IF "$(PRODUCT_ARGUMENT)"=="DTEX"
!ELSEIF "$(PRODUCT_ARGUMENT)"=="DTPC1"
!ELSEIF "$(PRODUCT_ARGUMENT)"=="DTPC2"
!ELSE
error1:
		@echo ERROR - $(PRODUCT_ARGUMENT) is not a correct option for PRODUCT_ARGUMENT
		@echo Please use DTEX, DTPC1, or DTPC2.
!ENDIF

!IF !DEFINED(PRODUCT_ARGUMENT)
PRODUCT_ARGUMENT=DTPC2
!ENDIF

# -----------------------------------------------------------
# NMAKE Inference Rules.
#	If LANG_ARGUMENT is not defined, use ENGLISH_US as the default
#	argument.
# -----------------------------------------------------------
!IF "$(LANG_ARGUMENT)"=="ENGLISH_US"
!ELSEIF "$(LANG_ARGUMENT)"=="SPANISH_SP"
!ELSEIF "$(LANG_ARGUMENT)"=="GERMAN"
!ELSEIF "$(LANG_ARGUMENT)"=="SPANISH_LA"
!ELSEIF "$(LANG_ARGUMENT)"=="ENGLISH_UK"
!ELSE
error2:
	@echo ERROR - $(LANG_ARGUMENT) is not a correct option for
	@echo LANG_ARGUMENT.  Please use ENGLISH_US, ENGLISH_UK, SPANISH_SP, SPANISH_LA, or GERMAN.
!ENDIF

!IF !DEFINED(LANG_ARGUMENT)
LANG_ARGUMENT=ENGLISH_US
!ENDIF

# -----------------------------------------------------------
# NMAKE Inference Rules.
#	If FAST_BUILD is defined do NOT do any dependency building.
#	This has the effect of minimizing the compiles & assembles
#	to just the .c or .asm files changed ONLY.
#						NOT FOR PRODUCTION USE!
# -----------------------------------------------------------
!IF !DEFINED(FAST_BUILD)
.c.dep:
	depend $< /D $(PRODUCT_ARGUMENT)

.asm.dep:
	depend $< /D $(PRODUCT_ARGUMENT)

.rc.dep:
	depend $< /D $(PRODUCT_ARGUMENT)

!ENDIF #!IF !DEFINED(FAST_BUILD)

.c.obj:
	@echo $(<F) will be built later.

.asm.obj:
	@echo $(<F) will be built later.

.rc.res:
	@echo $(<F) will be built later.
# -----------------------------------------------------------
# NMAKE MACRO list of library source compile/assembly files.
#	Defined in DTPCMACR.MAK
# -----------------------------------------------------------
# Each macro is named in a manner to make it easy to associate
#	the files named in th macro with the end point object that
#	is producted from them (it). All macros have the prefix
#	SRCS_ followed by the target object name. Therefore
#	SRCS_DTPC_LIB is the macro of file names (SRCS) that will
#	be dependents of DTPC.LIB.
# -----------------------------------------------------------
# Include macros defining all the dependent file names
!INCLUDE dtpcmacr.mak

# Macro for building dtpcincl.dep. NO SPACES ALLOWED in 'text'.
INCLUDELINE = ^#This_is_file:dtpcincl.c $(SRCS)
# -----------------------------------------------------------
# The depend.exe is checked 1st with NMAKE to see if it is
#	up-to-date from its sources.
# The SRCS list is checked one at a time to see if any .dep
#	file is newer than its .c parent. If the dependent file
#	is newer, rebuild it via depend $(SCRS.c=.dep).
# Invoke the NMAKE program to then actually build the dtpc
#	software using the .mak file that includes the .dep files.
# -----------------------------------------------------------
# NOTES: The '!' causes NMAKE to execute the generic command
#	for each dependent file, ONE AT A TIME.
#	The '@' surpresses the command action line display.
#	The '-' ignores error codes from the specific command.
#	The '/' allows for one command option per instance.
# OPTIONS:	I: Ignore error codes from all commands.
#			S: Suppresses the display of all commands.
#			C: Suppresses display of default NMAKE outputs.
#			V: All macros to be inherited in recursive NMAKE.
#	   NOLOGO: Suppresses the NMAKE copyright message.
# -----------------------------------------------------------

# if there is an "unexpected -del" error here make sure that there is
#  a tab, not spaces before -del.
all : argumnts wait.exe version.h dtpccjlt.dep\
	inline1 inline2 inline3 inlineii inlineif\
	inlinet1 inlinet2 inlinedr
	-del dtpccjlt.dep
	@echo <<dtpccjlt.dep has been created.
This is file dtpccjlt.dep
This file is used to trigger NMAKE w/dtpccjl1.mak
<<KEEP
	@echo The $(LANG_ARGUMENT) Version of $(PRODUCT_ARGUMENT) is Built.

# -----------------------------------------------------------
# If there are 'arguments' passed to dtpccjlt.mak via the
#	command line when run, this block of code will test values.
# -----------------------------------------------------------
argumnts :
		@echo $(SRCS_DTPCCJLT_MAK) Last Revised; 27-FEB-1997
	@echo .
	@echo	Macro Name		  Argument(s) Passed
	@echo TARGET_ARGUMENT:	$(TARGET_ARGUMENT)
	@echo OUTPUT_ARGUMENT:	$(OUTPUT_ARGUMENT)
	@echo PRODUCT_ARGUMENT: $(PRODUCT_ARGUMENT)
	@echo LANG_ARGUMENT:	$(LANG_ARGUMENT)
	@echo COMPILER_FLAGS:	$(COMPILER_FLAGS)
	@echo ASSEMBLER_FLAGS:	$(ASSEMBLER_FLAGS)
	@echo CUSTOM_ARGS:		$(CUSTOM_ARGS)
	@echo FAST_BUILD:		$(FAST_BUILD)
	@echo DICTIONARY_PRIO:	$(DICTIONARY_PRIO)
!IF DEFINED(FAST_BUILD)
	@echo *** DO NOT USE FAST_BUILD FOR PRODUCTION BUILDS! ***
!ENDIF
	@echo .
# -----------------------------------------------------------
# Add /D to PRODUCT_ARGUMENT macro if defined and merge with
#	OUTPUT_ARGUMENT both into OUTPUT_ARGS.
# -----------------------------------------------------------
!IF !DEFINED(OUTPUT_ARGUMENT)
OUTPUT_ARGS = $(PRODUCT_ARGUMENT) /D $(LANG_ARGUMENT)
!ELSEIF DEFINED(OUTPUT_ARGUMENT)
OUTPUT_ARGS = $(OUTPUT_ARGUMENT) /D $(PRODUCT_ARGUMENT) /D $(LANG_ARGUMENT) 
!ENDIF

# -----------------------------------------------------------
# Provide DICTIONARY_PRIO a default value.
# -----------------------------------------------------------
!IF DEFINED(DICTIONARY_PRIO)
DICTIONARY_PRIO = /p:$(DICTIONARY_PRIO)
!ELSE
DICTIONARY_PRIO = /p:600
!ENDIF
# -----------------------------------------------------------
# This pseudotarget causes the specified *p.tmp files to be
#	deleted 1st forcing a rebuild of them and the resultant
#	*p.h files. This is usefull for breaking chicken-and-egg
#	problems.

killp : all
	-del libp.tmp
	-del kernp.tmp
	-del cmd.tmp
	-del lts.tmp
	-del ph.tmp
	-del tsrp.tmp
	-del ldrp.tmp
	-del cnfp.h
	-del dtdemp.h

# -----------------------------------------------------------
# The .dep files serve two functions. 1) If there is an updated
#	.c file, the corresponding .dep file must be created
#	before the invocation of NMAKE w/dtpccjl1.mak, since
#	dtpccjl1.mak includes the generated .dep files from here.
#	2) Since the .dep files are always updated when the .c files
#	are updated, they are used in dtpccjl1.mak to trigger the
#	building of the *p.h files, since a 'catch22' exists
#	otherwise (the *.c files are dependent on the *p.h file
#	and the same *p.h file is dependent on the same *.c files).

# -----------------------------------------------------------
# If doing a fast build, don't check everything, just go to next NMAKE
#	level!

!IF DEFINED(FAST_BUILD)
dtpccjlt.dep : $(SRCS) $(SRCS_ASM)
	$(MAKE)/NOLOGO /S /C /F dtpccjl1.mak "OUTPUT_ARGUMENT = $(OUTPUT_ARGS)"\
	 "PRODUCT_ARGUMENT = $(PRODUCT_ARGUMENT)" \
	 "LANG_ARGUMENT = $(LANG_ARGUMENT)" \
	 "COMPILER_FLAGS = $(COMPILER_FLAGS)" "ASSEMBLER_FLAGS = $(ASSEMBLER_FLAGS)"\
 "DICTIONARY_PRIO = $(DICTIONARY_PRIO)" \
"CUSTOM_ARGS = $(CUSTOM_ARGS)" $(TARGET_ARGUMENT)


!ELSEIF !DEFINED(FAST_BUILD)
dtpccjlt.dep : $(SRCS:.c=.obj) $(SRCS_ASM:.asm=.obj) \
					$(SRCS:.c=.dep) $(SRCS_ASM:.asm=.dep) \
					$(SRCS) $(SRCS_ASM) $(SRCS_DIC) \
					dtpccjl1.mak dtpcmacr.mak dtpcincl.dep \
					$(TARGET_ALL) $(TARGET_ALL_SYS) $(TARGET_ALL_DIC)\
					$(SRCS_RC) $(SRCS_RC:.rc=.res) $(SRCS_RC:.rc=.dep)\
					$(TARGET_FILEORGN_TXT) $(TARGET_ALL_DTU)
	$(MAKE)/NOLOGO /S /C /F dtpccjl1.mak "OUTPUT_ARGUMENT = $(OUTPUT_ARGS)"\
	 "PRODUCT_ARGUMENT = $(PRODUCT_ARGUMENT)" \
	 "LANG_ARGUMENT = $(LANG_ARGUMENT)" \
	 "COMPILER_FLAGS = $(COMPILER_FLAGS)" "ASSEMBLER_FLAGS = $(ASSEMBLER_FLAGS)"\
 "DICTIONARY_PRIO = $(DICTIONARY_PRIO)" \
"CUSTOM_ARGS = $(CUSTOM_ARGS)" $(TARGET_ARGUMENT)
!ENDIF

# -----------------------------------------------------------
# This command group is responsible for building dtpcincl.dep
#	that contains one !INCLUDE *.dep for EVERY *.dep file
#	created by depend.exe elsewhere in this mak file. It uses
#	NMAKE's inline file generation command "<<" to create the
#	file using the SRCS macro that is !INCLUDEd via the
#	dtpcmacr.mak above. A special macro INCLUDELINE is used as
#	a work-around for NMAKE's preprocessor not allowing the 1st
#	line to contain a "!INCLUDE" (can only be done with an
#	macro expansion). Note: the main.dep is a duplicate and
#	fixes the problem of the last !INCLUDE needing a filename.
#	Count.exe is used to scan the DEP files created by depend.exe
#	and find the total count of lines of code found. This number is
#	added together and written out to a file dtpct.dat.

dtpcincl.dep : $(SRCS:.c=.dep) $(SRCS_ASM:.asm=.dep)\
				$(SRCS_RC:.rc=.dep) dtpcmacr.mak #count.exe
	-del dtpcincl.dep
	@echo <<dtpcincl.dep has been created.
$(INCLUDELINE:.c=.dep^
^!INCLUDE ) $(SRCS_ASM:.asm=.dep^
^!INCLUDE ) $(SRCS_RC:.rc=.dep^
^!INCLUDE ) main.dep
<<KEEP
#	@count $(SRCS:.c=.dep) $(SRCS_ASM:.asm=.dep) $(SRCS_RC:.rc=.dep)

$(SRCS:.c=.dep) : depend.exe

$(SRCS_ASM:.asm=.dep) : depend.exe

$(SRCS_DTPC_RC:.rc=.dep) : depend.exe

# Depend.exe now adds as a comment to the end of each DEP file
#	the count of the number of lines of code in each file involved.
#	The total of all these lines of code per DEP is also listed.
depend.exe : depend.cpp
		@$(PROTO_CL) /Gs /G3 /AH /W3 /D "NDEBUG" /D "_DOS" depend.cpp
		@link /NOLOGO /STACK:32766 depend.obj ;

# Count.exe will read each DEP file and total up all the total counts
#	in each of the DEP files.
count.exe : count.cpp count.mak
	$(MAKE)/NOLOGO /S /C count.mak

$(TARGET_ALL) $(TARGET_ALL_SYS) $(TARGET_ALL_DIC) (TARGET_ALL_DLL) \
  $(TARGET_ALL_LIB) $(TARGET_FILEORGN_TXT) $(TARGET_ALL_DTU) :
	@echo $(@F) will be built later.

# generate the version stamp..
version.h	: 
		-del version.h
		cl -AS /D $(OUTPUT_ARGUMENT) mkvers.c
	mkvers > version.h
	type version.h

wait.exe : wait.c
                @$(PROTO_CL) /Gs /G3 /AH /W3 /D "NDEBUG" /D "_DOS" wait.c
                @link /NOLOGO /STACK:32766 wait.obj ;

# -----------------------------------------------------------------------------
# ETT 06/29/1998 this is where we make the files of the lists of _DEP macros
#		for the lic code, etc.
# dollpars.exe is run in dtpccjl1.mak and the files are !INCLUDED in dtpckits.mak
# NOTE: DO NOT REMOVE THE '~' at the end of the expansion.  it is my EOF char
#	for dollpars. something is broken and won't use the EOF. don't know why.
#	also: the '^' before the '$**' are taken out by dollpars but are needed 
#	to ensure the '$**' gets into the file.
# -----------------------------------------------------------------------------
# ETT: NOTE the expansion macros here have to be in one line for dollpars to parse them correctly!!!
# sorry. The same goes for the preproc lines!

inline1 :
	@echo <<inline1.tmp
lickiti1 : $(SRCS_DTPC_LIB:.c=_DEP)~
	@echo Copying non-trade secret include files to $(TOOLKIT_ROOT)
	@echo LICKIT Copy Group: LICKITI1
	!preproc -i ^$** -o $(TOOLKIT_ROOT)\^$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL~
<<KEEP
	@dollpars -i inline1.tmp -o lickiti1.tmp
	@del inline1.tmp

inline2 :
	@echo <<inline2.tmp
lickiti2 : $(SRCS_DTPC_LIB2:.c=_DEP) $(SRCS_CMD_EXE2:.c=_DEP) $(SRCS_KERNEL_SYS:.c=_DEP) $(SRCS_CMD_EXE2:.c=_DEP) $(SRCS_USA_EXE:.c=_DEP) $(SRCS_DT_CONF_EXE:.c=_DEP) $(SRCS_DT_LOAD_EXE:.c=_DEP) $(SRCS_PH_ASM_OK:.asm=_DEP) $(SRCS_LTS_EXE_OK:.c=_DEP)~
	@echo Copying non-trade secret include files to $(TOOLKIT_ROOT)
	@echo LICKIT Copy Group: LICKITI2
	!preproc -i ^$** -o $(TOOLKIT_ROOT)\^$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL~
<<KEEP
	@dollpars -i inline2.tmp -o lickiti2.tmp
	@del inline2.tmp

inline3 :
	@echo <<inline3.tmp
lickiti3 : $(SRCS_DT_DRIV_EXE:.c=_DEP) $(SRCS_KERNEL_ASM:.asm=_DEP) $(SRCS_ALPHABET_EXE:.c=_DEP) $(SRCS_UDIC_US_EXE:.c=_DEP) $(SRCS_START_US_EXE:.c=_DEP) $(TOOLKIT_DEMO_SRC2:.c=_DEP)~
	@echo Copying non-trade secret include files to $(TOOLKIT_ROOT)
	@echo LICKIT Copy Group: LICKITI3
	!preproc -i ^$** -o $(TOOLKIT_ROOT)\^$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL~
<<KEEP
	@dollpars -i inline3.tmp -o lickiti3.tmp
	@del inline3.tmp

inlineii :
	@echo <<inlineii.tmp
lickitii : $(SRCS_VTM_I_EXE_OK:.c=_DEP)~
	@echo Copying non-trade secret VTM_I include files to $(TOOLKIT_ROOT)
	@echo LICKIT Copy Group: LICKITII
	!preproc -i ^$** -o $(TOOLKIT_ROOT)\^$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL~
<<KEEP
	@dollpars -i inlineii.tmp -o lickitii.tmp
	@del inlineii.tmp

inlineif :
	@echo <<inlineif.tmp
lickitif : $(SRCS_VTM_F_EXE_OK:.c=_DEP)~
	@echo Copying non-trade secret VTM_F include files to $(TOOLKIT_ROOT)
	@echo LICKIT Copy Group: LICKITIF
	!preproc -i ^$** -o $(TOOLKIT_ROOT)\^$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL~
<<KEEP
	@dollpars -i inlineif.tmp -o lickitif.tmp
	@del inlineif.tmp

inlinet1 :
	@echo <<inlinet1.tmp
tskiti1 : $(SRCS_LTS_EXE_TS:.c=_DEP) $(SRCS_PH_EXE_TS:.c=_DEP)~
	@echo Copying TRADE SECRET include files to $(TOOLKIT_ROOT)
	@echo Basic LTS and PH group.
	@echo TSKIT Copy Group: TSKITI1
	!preproc -i ^$** -o $(TOOLKIT_ROOT)\^$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL~
<<KEEP
	@dollpars -i inlinet1.tmp -o tskiti1.tmp
	@del inlinet1.tmp

inlinet2 :
	@echo <<inlinet2.tmp
tskiti2 : $(SRCS_ALTS_EXE_TS:.c=_DEP)~
	@echo Stripping\Copying TRADE SECRET include files to $(TOOLKIT_ROOT)
	@echo Advanced English ALTS group.
	@echo LICKIT Copy Group: TSKITI2
	!preproc -i ^$** -o $(TOOLKIT_ROOT)\^$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL
	@echo Zip all files to tskit.zip.
	@-del tskit.zip
	pkzip -rP tskit.zip $(TOOLKIT_ROOT)\*.*
	@echo Copy zip file to a: drive
	copy tskit.zip a:
	@-del tskit.zip
	@echo DECtalk Product Built~
<<KEEP
	@dollpars -i inlinet2.tmp -o tskiti2.tmp
	@del inlinet2.tmp

inlinedr :
	@echo <<inlinedr.tmp
drvrkit	: $(SRCS_DT_CONF_EXE:.c=_DEP) $(SRCS_DT_LOAD_EXE:.c=_DEP) $(SRCS_DT_DRIV_EXE:.c=_DEP)~
	@echo Copying non-trade secret driver include files to $(TOOLKIT_ROOT)
	@echo DRIVRKIT Copy Group: DRVRKIT
	!preproc -i ^$** -o $(TOOLKIT_ROOT)\^$** -x WILLOWPOND -x _WILLOWPOND -x WILLOW_POND -x 0 -x NEVER -x NEVERDEFINED -x OLD -x DTALK50 -x DTALK_50 -x NOTYET -x NOLONGERUSED -x NOTHING -x NOTUSED -x MBUFDBG -x DEB_MME -x DBGLEV -x DEBUG2 -x DEBUG1 -x DEBUG5 -x DEBUG6 -x DEBUG3 -x ACI_LICENSE -x PHEDIT2 -x _DEBUG -x ACCESS32 -x UNDER_CE -x DEMO -x STATIC_BUILD -x LICENSES -x LICENSE_KEY -x LICENSE_KEY_ERROR -x TYPING_MODE -x FRENCH -x OLD -x DECTALKBETA430 -x SWAHILI -x LICENINC_C -x DTDEMO -x WINDIC_C_STATIC -x NWSNOAA -x PRINTFDEBUG -x __VMS -x NEW_VTM -x DECVOC -x out -x DBGRMO -x THISCODE -x DEBUGIND -x SLOWTALK -x NEWTYPING_MODE -x MSDBG5 -x DEBUG_USER_PROSODICS -x MSDEBUG -x OUTFORNOW -x outforgerman -x OLDRULE -x REWRITERULEFORGERMAN -x DEBUGPHT -x EABDEBUG -x MSDBG4 -x OLD_EAB_PARSER -x FASTTYPING_MODE -x MSDBG6 -x MSDBG7 -x DEBUGALLO -x DBGALO -x SPANISH_obsolete -x THETRILLISNOTGONEBUTITSGOING -x DBGBUR -x NEW_INTONATION -x DEBUGF0 -x NWSNOAALATER -x CREEKMALE -x Experimenting -x OLDCODE -x MSDBG -x MSDBG2 -x MSDBG3 -x DONTKNOW -x NOTWORKING -x ALLINPHDEFSNOW -x DEBUG_targetS -x NEEDSMALLERSIZEBATS681 -x IF_ED_OUT_CODE -x DEBUG_TARGETS -x DBGSCN -x DBGSTX -x ALWAYS -x ENGLISH_UK_Wrong_place -x DEBUGVSET -x PRINTDEBUG -x PRINTFDEBG -x QUESTION -x NEVEREVER -x MOVED_TO_SHARED_MEMORY -x DEBUG_TLOCK -x _DEBUG_TLOCK -x ACNA -x FAA -x LIKE_BUGS -x DBGDIC -x NOVALID -x IGNORE -x ILLEGAL -x LTS_ACNA -x LTS_FRENCH -x vms -x CMD_DBG -x LTS_DBG -x PH_DBG -x VTM_DBG -x MODE_EMAIL -x SKIP_ESCAPE -x NEVERDEFINED -x DEBUGRULS -x DEBUGACT -x SHOWRULES -x NEW_BINARY_PARSER -x DEBUG_PARSER2 -x CMDDEBUG -x LOOK_DEBUG -x DIGIT_DEBUG -x INDEX_DEBUG -x NEW_DEBUG -x DEBUG_RULES -x INDEX_DEBUG2 -x DISPLAY_RULES_TESTED -x SANITY_CHECKING -x aci_license -y VOCAL~
<<KEEP
	@dollpars -i inlinedr.tmp -o drvrkit.tmp
	@del inlinedr.tmp