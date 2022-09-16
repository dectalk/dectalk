# -----------------------------------------------------------
# Name: 			DTPCCJL1.MAK
# Creation Date:	30-NOV-1994
# Created By:		Carl Leeber
# Function Summary: External MAK file, master build DECTALK prod.
# -----------------------------------------------------------
# Description:
#	This file is intended to build the protos of the .C files
#	that make up DTPC.LIB, into LIBP.H. This is done by creating
#	a LIBP.TMP file by piping the output of the C++ compiler
#	with the Zg option. The LIBP.TMP is then copied to LIBP.H.
# -----------------------------------------------------------
# Modifications History:
# -----------------------------------------------------------
#  1-DEC-1994 Carl Leeber, !INCLUDE macros from common file.
#  5-DEC-1994 Carl Leeber, Added .c.obj rule w/.des flags.
#  8-DEC-1994 Carl Leeber, Added .asm.obj rule w/.des flags.
#						   Added kernel.sys and cmd.exe.
# 13-DEC-1994 Carl Leeber, Added lts and ph.exe.
# 14-DEC-1994 Carl Leeber, Add DT_*.EXE build capability.
#							Add DTDEMO.EXE to build suite.
# 03-JAN-1995 Carl Leeber, Add definitions of compiler options,
#							Add target object specific cl options.
# 05-JAN-1995 Carl Leeber, Add alphabet.exe, userdic.exe
# 06-JAN-1995 Carl Leeber, Add alts.exe, dtstart.exe pardic.exe
# 09-JAN-1995 Carl Leeber, Add browser capability (.sbr files).
# 17-JAN-1995 Carl Leeber, Delete each *p.h file, make dummy
#							replacement file then tmp proto.
# 01-FEB-1995 Carl Leeber, Add dtvoc.exe and mdemo.exe
# 02-FEB-1995 Carl Leeber, Add mul_read.exe build capability.
# 08-FEB-1995 Carl Leeber, Add SLTS.EXE and SPH.EXE capability
# 10-FEB-1995 Carl Leeber, Add SPA.EXE, DTPC_437.EXE, DTPC_850.EXE,
#							DTPC_863.EXE, SDTSTART.EXE and
#							SDTDEMO.EXE  capability
# 13-FEB-1995 Carl Leeber, Add TARGET_ALL_DIC macro and
#							dtpc_dic.dic generation capability.
#							Dtpc_dic.dic currently disabled.
# 20-FEB-1995 Carl Leeber, Add PHCLASS.C and PHCLASS.H to process
# 23-FEB-1995 Carl Leeber, Add sdtpcdic.dic to TARGET_ALL_DIC
#							macro and to generation capability.
#							Add spardic.exe/.bsc to process.
# 27-FEB-1995 Carl Leeber, Change dtpc_dic to dtpcdic in all uses.
# 08-MAR-1995 Carl Leeber, Add DTPC.DLL and related capability.
#						--->*NOTE: dtpcW.lib is also created*<--
# 22-MAR-1995 Carl Leeber, Add /D i386 to PH compile for int
#							version of PHVDEF.C for VTM. Add same
#							to kernel.sys, cmd.exe,lts.exe
#							alts.exe, slts.exe, sph.exe, dtpc.lib
# 23-MAR-1995 Carl Leeber, Add VTM integer code to process.
# 28-MAR-1995 Carl Leeber, Add German lts and ph to process.
#							(GLTS commented out: dtpcmacr.mak)
# 03-APR-1995 Carl Leeber, Add VTM floating point code to process. Add
#							VTM_F_C.TXT use _TS for MACROS containing
#							Trade Secret files.
# 22-MAY-1995 Carl Leeber, Changed options for WSR.EXE to match Ed's.
#							** Not Fixed Yet **
# 23-MAY-1995 Carl Leeber, Add GER, GDTDEMO, GDTSTART.EXE to process.
# 24-MAY-1995 Carl Leeber, Add GPARDIC.EXE.
# 26-MAY-1995 Carl Leeber, Use MSVC created WSR.MAK to build WSR.EXE.
# 13-JUN-1995 Carl Leeber, Add DTSTARP, SDTSTARP & GDTSTARP.H.
# 23-JUN-1995 Carl Leeber, Fixed (again!) rc.res. compile rule to:
#							@rc /nologo /dNDEBUG /r $*.rc
# 29-JUN-1995 Carl Leeber, Add PROTO_CL macro for prototype compiler.
# 30-JUN_1995 Carl Leeber, Add WSR.BSC & .SBR build to fix WSR.MAK error.
# 06-JUL-1995 Carl Leeber, Add TARGET_ALL_LIB, Fix use of PROTO_CL macro.
# 10-JUL-1995 Carl Leeber, Add GLBLCLVR_EXE target.
# 31-JUL-1995 Carl Leeber, Add LOCAL_DISC macro & FDTSTART & FDTDEMO.EXE.
# 02-AUG-1995 Carl Leeber, Add /j option to cl commands for French.
# 10-AUG-1995 Carl Leeber, Add option for DTPC2 in compiles.
# 11-AUG-1995 Carl Leeber, Add PCBOOT, HEXOBJ, MKBOOT & MKBOOT1.EXE.
# 30-AUG-1995 Carl Leeber, Add OUTPUT_ARGUMENT macro for compiler options.
# 31-AUG-1995 Carl Leeber, Add TARGET_FILEORGN_TXT macro.
# 19-SEP-1995 Carl Leeber, Add /D GERMAN to glts.exe compile.
# 26-OCT-1995 Carl Leeber, Add COMPILE_ARGUMENT to compile lines.
#						   Add COMPILER_FLAGS & ASSEMBLER_FLAGS.
# 04-JAN-1996 Carl Leeber, Add DOSLIB to CMD.EXE build for stdlibd.h.
# 22-JAN-1996 Carl Leeber, Add DICTIONARY_PRIO
# 24-JAN-1996 Carl Leeber, Add PRIODIC.EXE build.
# 25-JAN-1996 Carl Leeber, Add GRAPHICSLIB to PRIODIC.EXE link.
# 02-FEB-1996 Carl Leeber, Add ALPHABET & USERDIC.EXE & personal.dtu builds.
#							Add G/SUSERDIC.EXE builds.			  
# 21 feb 1996 tek		merge dtex
# 21-FEB-1996 Carl Leeber, Add SRCS_LTSN_EXE, etc, macros for New LTS.
#							Add LS_PROTP.H build.
# 06-MAR-1996 Carl Leeber, Add LLIB to PRIODIC.EXE Link step.
# 07-MAR-1996 Carl Leeber, Add OLDNAMELIB to PRIODIC.EXE Link step, too.
# 22-MAR-1996 Carl Leeber, Make GPARDIC build with /p:300.
# 01-APR-1996 Carl Leeber, Add GERMAN to /D of GLTSP.H build.
# 01-MAY-1996 Carl Leeber, Change default DICTIONARY_PRIO to 600.
# 21-MAY-1996 tek	Added mfg_load
# 10-JUN-1996 cjl	Added SRCS_DTSPEAK_EXE, dtspeak.exe & lang variants
# 11-JUN-1996 cjl	Removed SRCS_DTSPEAK_EXE and targets.
# 24-JUN-1996 cjl	Added mfg_load.exe back in (yes it was deleted).
# 05-FEB-1997 tql	Added support for pseudo-hierarchical build.
# 10-FEB-1997 tql	Added build of dic_sp.dic and dic_gr.dic.
# 17-FEB-1997 tql	Added changes to support the new naming convention. (e.g. SPEAK_US.EXE)
# 27-FEB-1997 tql	Corrected problems with dic_us.dic and dic_gr.dic.
# 20-AUG-1997	DR	Coreected unziping and building of dic_uss.dic for dtex
# 05-NOV-1997 DR	Cleaned up the dic_uss.dic section and added nws_us.dic target section.
#					Now, when CUSTOM_ARGS==NWSNOAA a NWS_US.DIC is outputed.
# 30-DEC-1997 cjl       Add UK to build.
# 15-JAN-1998 jl        BAT#557 Add wait statement before and after proto file generation
# 16-JAN-1998 jl        BAT#553 Finished UK to build
# 14-JUL-1998 mfg	Added changes for SPANISH_LA and SPANISH_SP builds 
# 14-JUL-1998 ETT changed some single macros into duals for the automatic code stripping.
#		including: SRCS_CMD_EXE & SRCS_DTPC_LIB
# 18-MAR-1999 cjl       Added changes for NWS Spanish_LA dictionary builds.
# 01apr99	tek	dictionary compiler changes
# 08mar00	commented out the alphbetizer and userdic not needed anymore
# -----------------------------------------------------------
# NMAKE Inference Rules.
# -----------------------------------------------------------
.c.obj:
	@echo Using general compile options for build of $*.c
	@cl $(COMPILER_FLAGS) /Ox /G1 /Gs /c /D $(OUTPUT_ARGUMENT) /nologo $*.c

.asm.obj:
	@echo Using general assembly options for build of $*.asm
	@$(MASM_PATH)\bin\ml $(ASSEMBLER_FLAGS) /D $(OUTPUT_ARGUMENT) /nologo /c /WX /Zp1 /Sl 180 /Sa $*.asm
	
#	@rc /nologo /dNDEBUG /r $*.rc
#	@rc -I . -DRC_INVOKED -p -E -I . -I $(LOCAL_DISK)\msvc\include -I $(LOCAL_DISK)\msvc\mfc\include -D NDEBUG $*.rc
.rc.res:
	@echo Using general compile options for build of $*.rc
	@rc /nologo /dNDEBUG /r $*.rc

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
# File of file name macros associated with each .exe,.sys,.lib.,
#	.dic extension
!INCLUDE dtpcmacr.mak

# Remove MSVC.BND file at startup of this MAK file. 5/23/95 cjl
!if [if exist MSVC.BND del MSVC.BND]
!endif

all: argumnts\
		$(TARGET_ALL_LIB) $(TARGET_ALL_SYS) $(TARGET_ALL) $(TARGET_ALL_DIC)\
		$(TARGET_ALL_DLL) $(TARGET_ALL_VTM) $(TARGET_FILEORGN_TXT)\
		$(TARGET_PERSONAL_DTU)
	@echo DTPCCJL1 Completed

# -----------------------------------------------------------
# If there are 'arguments' passed to dtpccjl1.mak via the
#	command line when run, this block of code will show values.
argumnts :
		@echo $(SRCS_DTPCCJL1_MAK) Last Revised; 27-FEB-1997
		@echo.
		@echo	Macro Name		  Argument(s) Passed
		@echo OUTPUT_ARGUMENT:	$(OUTPUT_ARGUMENT)
		@echo PRODUCT_ARGUMENT: $(PRODUCT_ARGUMENT)
		@echo LANG_ARGUMENT:	$(LANG_ARGUMENT)
		@echo COMPILER_FLAGS:	$(COMPILER_FLAGS)
		@echo ASSEMBLER_FLAGS:	$(ASSEMBLER_FLAGS)
		@echo CUSTOM_ARGS:		$(CUSTOM_ARGS)
		@echo DICTIONARY_PRIO:	$(DICTIONARY_PRIO)
		@echo.

# -----------------------------------------------------------
# This section generates bsc from sbr files.
# -----------------------------------------------------------
browser : cleanup $(TARGET_ALL_SYS:.sys=.bsc) $(TARGET_ALL:.exe=.bsc)
	@echo browser build Completed
	-del *.sbr
	@echo browser post-build cleanup Completed
	
cleanup :
	-del *.bsc				  
	
	-del *.sbr
	@echo browser pre-build cleanup Completed

# -----------------------------------------------------------
# Files of dependency definitions for every source file.
#	This file generated by an inline command in dtpccjlt.mak
#	This INCLUDE *MUST* follow the all psuedo target!
!INCLUDE dtpcincl.dep

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
#				CRITICAL NMAKE FEATURE NOTE:
# -----------------------------------------------------------
# The section below deals with those c code compiles that
#	require specific options to work. It is *CRITICAL* to note
#	that this section exploits an NMAKE feature of multiply
#	defined, single colon (:) targets.
#
#	The DEPEND program (used in dtpccjlt.mak to build
#	dependency files) creates in each .dep file, the target
#	definition of the form fred.obj : fred.c dependents.h.
#	These .obj files are usually built using the locally
#	defined inference rule .c.obj: that is located above
#	in this .mak file. This is the proper action for a
#	single colon, singlely defined target, with no command
#	line definition.
#
#	Many targets require special compile options. These are
#	defined below as single colon definitions,
#		*IN ADDITION TO THE DEFINITION IN THE .DEP FILE*.
#	This is refered to as a multiply defined, single colon
#	target, in this case two single colon lines, with one
#	having a command or action line and the other does not.
#
#	The result is that the inference rule is *NOT* used,
#	but the specific cl command associated with one of the
#	multiple definitions is used instead. All dependencies
#	of both definition lines are used however.
# -----------------------------------------------------------
# Compiler options used:
#	/Asnw:	Small memory model; SS!=DS; DS not loaded on entry
#	/Asnu:	Small memory model; SS!=DS; DS loaded on entry
#	/Asnd:	Small memory model; SS==DS (default)
#		/Ox:	Turns on most optimization options
#	/Ob2:	Inline *ANY* suitable function
#	/FPa:	Alternate Math Optimizing
#	/Fr:	Generate a *.sbr file without local variables
#	/FR:	Generate a *.sbr file including local variables
#	/c: 	Compile without linking
#	/Zp2:	Pack structures on 2 byte boundries.
#	/Zp1:	Pack structures on 1 byte boundries.
#	/G1:	Generate instructions for a 80186.
#	/G0:	Generate instructions for a 80086 (default).
#	/Gs:	Remove stack-check calls.
#	/Zl:	Remove default library name from object file.
#	/I: 	Additional path to search for #INCLUDE files, before
#				using system areas but after default area.
# -----------------------------------------------------------
#
#	For dt_driv.exe:
$(SRCS_DT_DRIV_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnu /Ox /FPa /c /Zp1 /G0 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Ic:\windev\include $*.c
#	For dt_conf.exe:
$(SRCS_DT_CONF_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /Zp1 /G0 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Ic:\windev\include $*.c
#	For dtpc.lib: Note: i386 = int version of CMD.H for VTM.
$(SRCS_DTPC_LIB:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnw /Ox /FPa /c /Zp2 /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /D i386 $*.c
$(SRCS_DTPC_LIB2:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnw /Ox /FPa /c /Zp2 /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /D i386 $*.c
#	For kernel.sys: Note: i386 = int version of CMD.H for VTM.
$(SRCS_KERNEL_SYS:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnw /Ox /Ob2 /FPa /c /Zp2 /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /D i386 $*.c
#	For cmd.exe: Note: i386 = int version of CMD.H for VTM.
$(SRCS_CMD_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
$(SRCS_CMD_EXE2:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
#	For lts.exe: Note: i386 = int version of CMD.H for VTM.
$(SRCS_LTS_US_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
#	For ph.exe: Note: i386 = int version of PHVDEF.C/CMD.H for VTM.
$(SRCS_PH_US_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
#	For usa.exe:
$(SRCS_USA_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#	For alts.exe: Note: i386 = int version of CMD.H for VTM.
$(SRCS_ALTS_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
$(SRCS_START_US_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#       For lts_uk.exe: Note: i386 = int version of CMD.H for VTM
$(SRCS_LTS_UK_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
#       For ph_uk.exe: Note: i386 = int version of PHVDEF.C/CMD.H for VTM.
$(SRCS_PH_UK_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
#	For uk.exe:
$(SRCS_UK_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#       For start_uk.exe:
$(SRCS_START_UK_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#       For dic.exe
$(SRCS_DIC_EXE:.c=.obj) :
        @cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#       For dtvoc.exe:
$(SRCS_DTVOC_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#       For mdemo.exe:
$(SRCS_MDEMO_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
$(SRCS_MUL_READ_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#	For lts_sp.exe: Note: i386 = int version of CMD.H for VTM.
$(SRCS_LTS_SP_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
#	For ph_sp.exe: Note: i386 = int version of SPHVDEF.C/CMD.H for VTM.
$(SRCS_PH_SP_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
#	For spa.exe:
$(SRCS_SPA_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#       For lts_la.exe:
$(SRCS_LTS_LA_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
#       For ph_la.exe:
$(SRCS_PH_LA_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
#	For la.exe:
$(SRCS_LA_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#       For start_la.exe:
$(SRCS_START_LA_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#	For dtpc_437.exe:
$(SRCS_DTPC_437_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#	For dtpc_850.exe:
$(SRCS_DTPC_850_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#	For dtpc_863.exe:
$(SRCS_DTPC_863_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#	For start_sp.exe:
$(SRCS_START_SP_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
$(SRCS_DTPC_DLL:.c=.obj) :
	@cl $(COMPILER_FLAGS) /nologo /W3 /ALw /c /O1 /D "NDEBUG" /GD $*.c
#	Temporary Fix for WSR.EXE 5/26/95 cjl
#	For Windows wsr.exe
$(SRCS_WSR_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /nologo /Gc /W3 /AM /c /O1 /D "NDEBUG" /GA $*.c
	For Integer version of VTM; vtm_i.exe:
$(SRCS_VTM_I_EXE:.c=.obj):
	@cl $(COMPILER_FLAGS) /D $(OUTPUT_ARGUMENT) /nologo /D DECVOC /c /G0 /Gs $*.c
#	For lts_gr.exe: Note: i386 = int version of CMD.H for VTM.
$(SRCS_LTS_GR_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
#	For ph_gr.exe: Note: i386 = int version of SPHVDEF.C/CMD.H for VTM.
$(SRCS_PH_GR_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl /D i386 $*.c
#	For Floating Point version of VTM; vtm_f.exe:
$(SRCS_VTM_F_EXE:.c=.obj):
	@cl $(COMPILER_FLAGS) /D $(OUTPUT_ARGUMENT) /nologo /D DECVOC /c /G0 /Gs $*.c
#	For ger.exe:
$(SRCS_GER_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
#	For start_gr.exe:
$(SRCS_START_GR_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /Zl $*.c
$(SRCS_GLBLCLVR_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /AH /W3 /Fr /c /G2 /D $(OUTPUT_ARGUMENT) /nologo /Zi $*.c
#	For pcboot.exe:
$(SRCS_PCBOOT_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /W1 /D $(OUTPUT_ARGUMENT) /nologo /Asnd /Od /f- /FPa /c /Zp1	/G1 /Gs /Fc $*.c
#	For hexobj.exe:
$(SRCS_HEXOBJ_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /D $(OUTPUT_ARGUMENT) /nologo /Ox /c /Zp1 $*.c
#	For mkboot.exe:
$(SRCS_MKBOOT_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /D $(OUTPUT_ARGUMENT) /nologo /Ox /c /Zp1 $*.c
#	For mkboot1.exe:
$(SRCS_MKBOOT1_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /D $(OUTPUT_ARGUMENT) /nologo /Ox /c /Zp1 $*.c
#	For priodic.exe:
$(SRCS_PRIODIC_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /D $(OUTPUT_ARGUMENT) /nologo $*.c
#	For alphabet.exe:
#$(SRCS_ALPHABET_EXE:.c=.obj) :
#	@cl $(COMPILER_FLAGS) /c /D $(OUTPUT_ARGUMENT) /nologo $*.c
#	For udic_us.exe:
$(SRCS_UDIC_US_EXE:.c=.obj) :
	cl $(COMPILER_FLAGS) /c /D $(OUTPUT_ARGUMENT) /nologo $*.c
#	For udic_uk.exe:
$(SRCS_UDIC_UK_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /c /D $(OUTPUT_ARGUMENT) /nologo $*.c
#	For udic_uk.exe:
$(SRCS_UDIC_LA_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /c /D $(OUTPUT_ARGUMENT) /nologo $*.c
#	For udic_la.exe:
$(SRCS_UDIC_SP_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /c /D $(OUTPUT_ARGUMENT) /nologo $*.c
#	For udic_gr.exe:
$(SRCS_UDIC_GR_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /c /D $(OUTPUT_ARGUMENT) /nologo $*.c
#	For dt_load.exe:
!IF "$(PRODUCT_ARGUMENT)"=="DTEX"
$(SRCS_DT_LOAD_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo $*.c
!ELSE
$(SRCS_DT_LOAD_EXE:.c=.obj) :
	@cl $(COMPILER_FLAGS) /Asnd /Ox /FPa /c /G1 /Gs /D $(OUTPUT_ARGUMENT) /nologo /I$(MSVC_PATH)\include $*.c
!ENDIF

# -----------------------------------------------------------

personal.dtu : personal.tab
	@echo Alphbetize dictionary
#	@alphabet $*
	@echo Building a user dictionary
#	@userdic $*

priodic.exe : $(SRCS_PRIODIC_EXE:.c=.obj)
	@echo Building PRIODIC.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:4096 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB) $(GRAPHICSLIB) $(LLIB) $(OLDNAMELIB);
<<KEEP
	@echo PRIODIC.EXE Built

mkboot.exe : $(SRCS_MKBOOT_EXE:.c=.obj)
	@echo Building MKBOOT.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:4096 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(LLIB);
<<KEEP
	@echo MKBOOT.EXE Built

mkboot1.exe : $(SRCS_MKBOOT1_EXE:.c=.obj)
	@echo Building MKBOOT1.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:4096 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(LLIB);
<<KEEP
	@echo MKBOOT1.EXE Built

pcboot.exe : $(SRCS_PCBOOT_EXE:.c=.obj) $(SRCS_PCBOOT_ASM:.asm=.obj)
	@echo Building PCBOOT.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:4096 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(LLIB);
<<KEEP
	@echo PCBOOT.EXE Built

hexobj.exe : $(SRCS_HEXOBJ_EXE:.c=.obj)
	@echo Building HEXOBJ.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:4096 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(LLIB);
<<KEEP
	@echo HEXOBJ.EXE Built

glblclvr.exe : $(SRCS_GLBLCLVR_EXE:.c=.obj)
	@echo Building GLBLCLVR.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(LLIB);
<<KEEP
	@echo GLBLCLVR.EXE Built

parsetst.exe : $(SRCS_PARSETST_EXE:.c=.obj)
	@echo Building PARSETST.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo PARSETST.EXE Built

phclass.exe : $(SRCS_PHCLASS_EXE:.c=.obj)
	@echo Building PHCLASS.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo PHCLASS.EXE Built

start_gr.exe : $(SRCS_START_GR_EXE:.c=.obj)
	@echo Building START_GR.EXE
	@link /NOLOGO /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo START_GR.EXE Built

demo_gr.exe : $(SRCS_DEMO_GR_EXE:.c=.obj)
	@echo Building DEMO_GR.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo DEMO_GR.EXE Built

gr.exe : $(SRCS_GER_EXE:.c=.obj) $(SRCS_GER_ASM:.asm=.obj) dtpc.lib
	@echo Building GR.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo GR.EXE Built

vtm_f.exe : $(SRCS_VTM_F_EXE:.c=.obj)
	@echo Building VTM_F.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ON:N @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo VTM_F.EXE Built

ph_gr.exe : $(SRCS_PH_GR_EXE:.c=.obj) $(SRCS_PH_GR_ASM:.asm=.obj) dtpc.lib
	@echo Building PH_GR.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo PH_GR.EXE Built

lts_gr.exe : $(SRCS_LTS_GR_EXE:.c=.obj) $(SRCS_LTS_GR_ASM:.asm=.obj) dtpc.lib
	@echo Building LTS_GR.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo LTS_GR.EXE Built

vtm_i.exe : $(SRCS_VTM_I_EXE:.c=.obj)
	@echo Building VTM_I.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ON:N @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo VTM_I.EXE Built

#	Temporary Fix for WSR.EXE 5/26/95 cjl
wsr.exe : dtpcw.lib $(SRCS_WSR_EXE) $(SRCS_WSR_RC) wsr.bsc
	@echo Building WSR.EXE
	$(MAKE)/NOLOGO /S /C /F $(SRCS_WSR_MAK) wsr.exe
	@echo WSR.EXE Built

#	Temporary Fix for WSR.EXE 5/26/95 cjl
#wsr.exe :: $(SRCS_WSR_RC:.rc=.res)
#
#wsr.exe :: dtpcw.lib $(SRCS_WSR_EXE:.c=.obj)
#	@echo Building WSR.CRF
#	echo >NUL @<<$(@B).crf
#$(SRCS_WSR_EXE:.c=.obj +^
#)
#$(@B).exe
#$(@B).map
#$(LOCAL_DISK)\msvc\lib\+
#$(LOCAL_DISK)\msvc\mfc\lib\+
#oldnames libw mlibcew dtpcw commdlg.lib olecli.lib olesvr.lib shell.lib
#$(WSR_DEF);
#<<KEEP
#	@echo WSR.CRF Built
#	@echo Linking WSR.EXE
#	@link /NOLOGO /ONERROR:NOEXE /NOD /PACKC:61440 /STACK:10240 /ALIGN:16 @$(@B).crf  
#	@echo WSR.EXE Linked
#	@echo Building WSR.EXE with Windows Resource Compiler
#	@rc /v WSR.RES $@
#	@copy $(@B).CRF MSVC.BND
#	@echo WSR.EXE Built with Windows Resource Compiler
#
#wsr.exe :: wsr.res
#	if not exist MSVC.BND rc /nologo WSR.RES $@
	
dtpcw.lib : dtpc.dll
	@echo Building DTPCW.LIB
	@implib /nologo /nowep $(@F) $**
	@echo DTPCW.LIB Built

dtpc.dll :: $(SRCS_DTPC_DLL:.c=.obj) $(SRCS_DTPC_RC:.rc=.res)
	@echo Building DTPC.CRF
	echo >NUL @<<$(@B).crf
$(SRCS_DTPC_DLL:.c=.obj +^
)
$(@B).dll
$(@B).map
$(LOCAL_DISK)\msvc\lib\+
$(LOCAL_DISK)\msvc\mfc\lib\+
oldnames libw ldllcew commdlg.lib olecli.lib olesvr.lib shell.lib
$(DLL_DEF);
<<KEEP
	@echo DTPC.CRF Built
	@echo Linking DTPC.DLL
	@link /NOLOGO /ONERROR:NOEXE /NOD /NOE /PACKC:61440 /ALIGN:16 /MAP:FULL @$(@B).crf
	@echo DTPC.DLL Linked
	@echo Building DTPC.DLL with Windows Resource Compiler
	@rc /nologo DLL_DTPC.RES $@
	@copy $(@B).CRF MSVC.BND
	@echo DTPC.DLL Built with Windows Resource Compiler

start_la.exe : $(SRCS_START_LA_EXE:.c=.obj)
	@echo Building START_LA.EXE
	@link /NOLOGO /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo START_LA.EXE Built

demo_la.exe : $(SRCS_DEMO_LA_EXE:.c=.obj)
	@echo Building DEMO_LA.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo DEMO_LA.EXE Built

start_sp.exe : $(SRCS_START_SP_EXE:.c=.obj)
	@echo Building START_SP.EXE
	@link /NOLOGO /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo START_SP.EXE Built

demo_sp.exe : $(SRCS_DEMO_SP_EXE:.c=.obj)
	@echo Building DEMO_SP.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo DEMO_SP.EXE Built

dtpc_437.exe : $(SRCS_DTPC_437_EXE:.c=.obj) $(SRCS_DTPC_437_ASM:.asm=.obj) dtpc.lib
	@echo Building DTPC_437.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo DTPC_437.EXE Built

dtpc_850.exe : $(SRCS_DTPC_850_EXE:.c=.obj) $(SRCS_DTPC_850_ASM:.asm=.obj) dtpc.lib
	@echo Building DTPC_850.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo DTPC_850.EXE Built

dtpc_863.exe : $(SRCS_DTPC_863_EXE:.c=.obj) $(SRCS_DTPC_863_ASM:.asm=.obj) dtpc.lib
	@echo Building DTPC_863.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo DTPC_863.EXE Built

sp.exe : $(SRCS_SPA_EXE:.c=.obj) $(SRCS_SPA_ASM:.asm=.obj) dtpc.lib
	@echo Building SP.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo SP.EXE Built

ph_sp.exe : $(SRCS_PH_SP_EXE:.c=.obj) $(SRCS_PH_SP_ASM:.asm=.obj) dtpc.lib
	@echo Building PH_SP.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo PH_SP.EXE Built

lts_sp.exe : $(SRCS_LTS_SP_EXE:.c=.obj) $(SRCS_LTS_SP_ASM:.asm=.obj) dtpc.lib
	@echo Building LTS_SP.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo LTS_SP.EXE Built

la.exe : $(SRCS_LA_EXE:.c=.obj) $(SRCS_LA_ASM:.asm=.obj) dtpc.lib
	@echo Building LA.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo LA.EXE Built

ph_la.exe : $(SRCS_PH_LA_EXE:.c=.obj) $(SRCS_PH_LA_ASM:.asm=.obj) dtpc.lib
	@echo Building PH_LA.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo PH_LA.EXE Built

lts_la.exe : $(SRCS_LTS_LA_EXE:.c=.obj) $(SRCS_LTS_LA_ASM:.asm=.obj) dtpc.lib
	@echo Building LTS_LA.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo LTS_LA.EXE Built


mul_read.exe : $(SRCS_MUL_READ_EXE:.c=.obj)
	@echo Building MUL_READ.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo MUL_READ.EXE Built

mdemo.exe : $(SRCS_MDEMO_EXE:.c=.obj)
	@echo Building MDEMO.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo MDEMO.EXE Built

dtvoc.exe : $(SRCS_DTVOC_EXE:.c=.obj)
	@echo Building DTVOC.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo DTVOC.EXE Built

dic_us.dic : $(SRCS_DIC_US_DIC) dic.exe
!IF "$(PRODUCT_ARGUMENT)" == "DTEX"
		@echo Building DIC_USS.TXT
		@if EXIST dic_uss.txt del dic_uss.txt
		@-pkunzip -o dic_uss.zip
		@echo DIC_USS.TXT Built
		@echo Building DIC_US.DIC
		@-dic dic_uss.txt dic_us.dic $(DICTIONARY_PRIO)
		-del dic_uss.txt
												   
!ELSE
		@echo Building DIC_US.TXT
		@if EXIST dic_us.txt del dic_us.txt
		@pkunzip -o dic_us.zip
		@echo DIC_US.TXT Built
		@echo Building DIC_US.DIC
		@-dic dic_us.txt dic_us.dic $(DICTIONARY_PRIO)
		-del dic_us.txt
!ENDIF
	@echo DIC_US.DIC Built

dic_sp.dic : $(SRCS_DIC_SP_DIC) dic.exe
	@echo Building DIC_SP.TXT
	-del dic_sp.txt
	@pkunzip -o dic_sp.zip
	@echo DIC_SP.TXT Built
	@echo Building DIC_SP.DIC
		@-dic dic_sp.txt dic_sp.dic $(DICTIONARY_PRIO)
	-del dic_sp.txt
	@echo DIC_SP.DIC Built


dic_la.dic : $(SRCS_DIC_LA_DIC) dic.exe
	@echo Building DIC_LA.TXT
	-del dic_la.txt
	@pkunzip -o dic_la.zip
	@echo DIC_LA.TXT Built
	@echo Building DIC_LA.DIC
		@-dic dic_la.txt dic_la.dic $(DICTIONARY_PRIO)
	-del dic_la.txt
	@echo DIC_LA.DIC Built


dic_gr.dic : $(SRCS_DIC_GR_DIC) dic.exe
	@echo Building DIC_GR.TXT
	-del dic_gr.txt
	@pkunzip -o dic_gr.zip
	@echo DIC_GR.TXT Built
	@echo Building DIC_GR.DIC
# Express uses a dictionary priority of 300
!IF "$(PRODUCT_ARGUMENT)" == "DTEX"
	@-dic dic_gr.txt dic_gr.dic /p:300
!ELSE
	@-dic dic_gr.txt dic_gr.dic $(DICTIONARY_PRIO)
!ENDIF
	-del dic_gr.txt
	@echo DIC_GR.DIC Built

nws_la.dic : $(SRCS_NWS_LA_DIC) dic.exe
        @echo Building DIC_LA.TXT....
        @if EXIST dic_la.txt del dic_la.txt
        @-pkunzip -o dic_la.zip
        @echo DIC_LA.TXT BUILT
        @echo Building NWS_LA.DIC....
        @-dic dic_la.txt NWS_LA.dic $(dictionary_prio)
        -del dic_la.txt
        @echo NWS_LA.DIC BUILT

nws_us.dic : $(SRCS_NWS_US_DIC) dic.exe
	@echo Building DIC_NWS.TXT....
	@if EXIST dic_nws.txt del dic_nws.txt
	@-pkunzip -o dic_nws.zip
	@echo DIC_NWS.TXT BUILT
	@echo Building NWS_US.DIC....
	@-dic dic_nws.txt NWS_US.dic $(dictionary_prio)
	-del dic_nws.txt
	@echo NWS_US.DIC BUILT


dic_uk.dic : $(SRCS_DIC_UK_DIC) dic.exe
        @echo Building DIC_UK.TXT
        -del dic_uk.txt
        @pkunzip -o dic_uk.zip
        @echo DIC_UK.TXT Built
        @echo Building DIC_UK.DIC
                @-dic dic_uk.txt dic_uk.dic $(DICTIONARY_PRIO)
        -del dic_uk.txt
        @echo DIC_UK.DIC Built

dic.exe : $(SRCS_DIC_EXE:.c=.obj)
	@echo Building DIC.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo DIC.EXE Built

start_us.exe : $(SRCS_START_US_EXE:.c=.obj)
	@echo Building START_US.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo START_US.EXE Built


start_uk.exe : $(SRCS_START_UK_EXE:.c=.obj)
	@echo Building START_UK.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo START_UK.EXE Built

alts.exe : $(SRCS_ALTS_EXE:.c=.obj) $(SRCS_ALTS_ASM:.asm=.obj) dtpc.lib
	@echo Building ALTS.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo ALTS.EXE Built

udic_us.exe : $(SRCS_UDIC_US_EXE:.c=.obj)
	@echo Building UDIC_US.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo UDIC_US.EXE Built


udic_uk.exe : $(SRCS_UDIC_UK_EXE:.c=.obj)
	@echo Building UDIC_UK.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo UDIC_UK.EXE Built

udic_sp.exe : $(SRCS_UDIC_SP_EXE:.c=.obj)
	@echo Building UDIC_SP.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo UDIC_LA.EXE Built

udic_la.exe : $(SRCS_UDIC_LA_EXE:.c=.obj)
	@echo Building UDIC_LA.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo UDIC_SP.EXE Built

#tek 01apr99 this looks like it had a typo.. fixed..
udic_gr.exe : $(SRCS_UDIC_GR_EXE:.c=.obj)
	@echo Building UDIC_GR.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo UDIC_GR.EXE Built

#alphabet.exe : $(SRCS_ALPHABET_EXE:.c=.obj)
#	@echo Building ALPHABET.EXE
#	pause
#	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
#$(**: = +^
#)
#$(@F)
#$(@B).map
#$(DOSLIB);
#<<KEEP
#	@echo ALPHABET.EXE Built
#	pause
#

demo_us.exe : $(SRCS_DEMO_US_EXE:.c=.obj)
	@echo Building DEMO_US.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo DEMO_US.EXE Built

demo_uk.exe : $(SRCS_DEMO_UK_EXE:.c=.obj)
	@echo Building DEMO_UK.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo DEMO_UK.EXE Built

dt_driv.exe : $(SRCS_DT_DRIV_EXE:.c=.obj)
	@echo Building DT_DRIV.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:1024 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo DT_DRIV.EXE Built

dt_load.exe : $(SRCS_DT_LOAD_EXE:.c=.obj)
	@echo Building DT_LOAD.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:4096 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo DT_LOAD.EXE Built

!IF "$(PRODUCT_ARGUMENT)"=="DTEX"
mfg_load.exe : $(SRCS_DT_LOAD_EXE:.c=.obj)
	@echo Building MFG_LOAD.EXE
	@link /NOLOGO /ONERROR:NOEXE /M /ST:4096 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB) $(OLDNAMELIB);
<<KEEP
	@echo MFG_LOAD.EXE Built
!ENDIF


dt_conf.exe : $(SRCS_DT_CONF_EXE:.c=.obj)
	@echo Building DT_CONF.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
$(DOSLIB);
<<KEEP
	@echo DT_CONF.EXE Built

uk.exe : $(SRCS_UK_EXE:.c=.obj) $(SRCS_UK_ASM:.asm=.obj) dtpc.lib
	@echo Building UK.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo UK.EXE Built

ph_uk.exe : $(SRCS_PH_UK_EXE:.c=.obj) $(SRCS_PH_UK_ASM:.asm=.obj) dtpc.lib
	@echo Building PH_UK.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo PH_UK.EXE Built

lts_uk.exe : $(SRCS_LTS_UK_EXE:.c=.obj) $(SRCS_LTS_UK_ASM:.asm=.obj) dtpc.lib
	@echo Building LTS_UK.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
        @echo LTS_UK.EXE Built

us.exe : $(SRCS_USA_EXE:.c=.obj) $(SRCS_USA_ASM:.asm=.obj) dtpc.lib
	@echo Building US.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo US.EXE Built

ph_us.exe : $(SRCS_PH_US_EXE:.c=.obj) $(SRCS_PH_US_ASM:.asm=.obj) dtpc.lib
	@echo Building PH_US.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo PH_US.EXE Built

lts_us.exe : $(SRCS_LTS_US_EXE:.c=.obj) $(SRCS_LTS_US_ASM:.asm=.obj) dtpc.lib
	@echo Building LTS_US.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo LTS_US.EXE Built

cmd.exe : $(SRCS_CMD_EXE:.c=.obj) $(SRCS_CMD_EXE2:.c=.obj) $(SRCS_CMD_ASM:.asm=.obj) dtpc.lib
	@echo Building CMD.EXE
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:8192 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib $(DOSLIB);
<<KEEP
	@echo CMD.EXE Built
	
# 21feb96 tek
!IF "$(PRODUCT_ARGUMENT)"=="DTEX"
kernel.sys : $(SRCS_KERNEL_ASM:.asm=.obj) $(SRCS_KERNEL_SYS:.c=.obj) dtpc.lib implode.lib
	@echo Building KERNEL.SYS for DECtalk Express
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:512 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib +
implode.lib;
<<KEEP
	@echo KERNEL.SYS Built

!ELSE
kernel.sys : $(SRCS_KERNEL_ASM:.asm=.obj) $(SRCS_KERNEL_SYS:.c=.obj) dtpc.lib
	@echo Building KERNEL.SYS for DECtalk PC
	@link /NOLOGO /ONERROR:NOEXE /NOD /M /ST:512 @<<$(@B).tmp
$(**: = +^
)
$(@F)
$(@B).map
dtpc.lib;
<<KEEP
	@echo KERNEL.SYS Built


!ENDIF

dtpc.lib : $(SRCS_DTPC_LIB:.c=.obj) $(SRCS_DTPC_LIB2:.c=.obj)
	@echo Building DTPC.LIB
	lib /NOL dtpc.lib @<<lib.lrf
-+$(?: = &^
-+);
<<
	@echo DTPC.LIB Built

# -----------------------------------------------------------
# This section builds the prototype header (*p.h) files.
# For each *P.H file, the macro SRCS_*_# is defined in the
#	file DTPCMACR.MAK. Each file in the macro is checked and
#	if *ANY* is newer than the *P.H file the file is rebuilt.
# NOTE: The 'extra' step of creating a temporary file is needed
#	since the *P.H is included in the various library source
#	files listed in the NMAKE MACRO SRCS or SCRS_ASM. The
#	compiler can not open the file at the same time as it is
#	being written to by the compiler via the pipe.
# NOTE: A different C compiler defined by the macro PROTO_CL is
#	used to build the prototype files.
# -----------------------------------------------------------
dtstarp.h  : dtstarp.tmp
	copy $(@B).tmp $(@F)
	@echo $(@F) Built
	
dtstarp.tmp  : $(SRCS_START_US_EXE:.c=.dep)
	@echo Building $(@B).h
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> $(@B).tmp
        wait 2

sdtstarp.h : sdtstarp.tmp
	copy $(@B).tmp $(@F)
	@echo $(@F) Built
	
sdtstarp.tmp : $(SRCS_START_SP_EXE:.c=.dep)
	@echo Building $(@B).h
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> $(@B).tmp
        wait 2

gdtstarp.h : gdtstarp.tmp
	copy $(@B).tmp $(@F)
	@echo $(@F) Built
	
gdtstarp.tmp : $(SRCS_START_GR_EXE:.c=.dep)
	@echo Building $(@B).h
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> $(@B).tmp
        wait 2

vtm_fp.h : vtm_fp.tmp
	copy vtm_fp.tmp vtm_fp.h
	@echo VTM_FP.H Built
	
vtm_fp.tmp : $(SRCS_VTM_F_EXE:.c=.dep)
	@echo Building VTM_FP.H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> vtm_fp.tmp
        wait 2

gdtdemp.h : gdtdemp.tmp
	copy $(@B).tmp $(@B).h
	@echo $(@B).H Built
	
gdtdemp.tmp : $(SRCS_DEMO_GR_EXE:.c=.dep)
	@echo Building $(@B).H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> $(@B).tmp
        wait 2

gphp.h : gphp.tmp
	copy $(@B).tmp gphp.h
	@echo $(@B).H Built
	
gph.tmp : $(SRCS_PH_GR_EXE:.c=.dep)
	@echo Building $(@B).H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> $(@B).tmp
        wait 2

gltsp.h : gltsp.tmp
	copy $(@B).tmp $(@B).h
	@echo $(@B).H Built
	
gltsp.tmp : $(SRCS_LTS_GR_EXE:.c=.dep)
	@echo Building $(@B).H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
        !-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> $(@B).tmp
        wait 2

vtm_ip.h : vtm_ip.tmp
	copy vtm_ip.tmp vtm_ip.h
	@echo VTM_IP.H Built
	
vtm_ip.tmp : $(SRCS_VTM_I_EXE:.c=.dep)
	@echo Building VTM_IP.H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> vtm_ip.tmp
        wait 2

sdtdemp.h : sdtdemp.tmp
	copy $(@B).tmp $(@B).h
	@echo $(@B).H Built
	
sdtdemp.tmp : $(SRCS_DEMO_SP_EXE:.c=.dep)
	@echo Building $(@B).H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> $(@B).tmp
        wait 2

sphp.h : sphp.tmp
	copy $(@B).tmp $(@B).h
	@echo $(@B).H Built
	
sphp.tmp : $(SRCS_PH_SP_EXE:.c=.dep)
	@echo Building $(@B).H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> $(@B).tmp
        wait 2

sltsp.h : sltsp.tmp
	copy $(@B).tmp $(@B).h
	@echo $(@B).H Built
	
sltsp.tmp : $(SRCS_LTS_SP_EXE:.c=.dep)
	@echo Building $(@B).H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> $(@B).tmp
        wait 2

mdemop.h : mdemop.tmp
	copy mdemop.tmp mdemop.h
	@echo MDEMOP.H Built
	
mdemop.tmp: $(SRCS_MDEMO_EXE:.c=.dep)
	@echo Building MDEMOP.H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> mdemop.tmp
        wait 2
	
altsp.h : altsp.tmp
	copy altsp.tmp altsp.h
	@echo ALTSP.H Built
	
altsp.tmp: $(SRCS_ALTS_EXE:.c=.dep)
	@echo Building ALTSP.H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> altsp.tmp
        wait 2
	
dtdemp.h : dtdemp.tmp
	copy $(@B).tmp $(@B).h
	@echo $(@B).H Built
	
dtdemp.tmp : $(SRCS_DEMO_US_EXE:.c=.dep)
	@echo Building $(@B).H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> $(@B).tmp
        wait 2

tsrp.h : tsrp.tmp
	copy tsrp.tmp tsrp.h
	@echo TSRP.H Built
	
tsrp.tmp : $(SRCS_DT_DRIV_EXE:.c=.dep)
	@echo Building TSRP.H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> tsrp.tmp
        wait 2

ldrp.h : ldrp.tmp
	copy ldrp.tmp ldrp.h
	@echo LDRP.H Built
	
ldrp.tmp : $(SRCS_DT_LOAD_EXE:.c=.dep)
	@echo Building LDRP.H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> ldrp.tmp
        wait 2

cnfp.h : cnfp.tmp
	copy cnfp.tmp cnfp.h
	@echo CNFP.H Built
	
cnfp.tmp : $(SRCS_DT_CONF_EXE:.c=.dep)
	@echo Building CNFP.H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> cnfp.tmp
        wait 2

php.h : php.tmp
	copy $(@B).tmp $(@B).h
	@echo $(@B).H Built
	
php.tmp : $(SRCS_PH_US_EXE:.c=.dep)
	@echo Building $(@B).H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> $(@B).tmp
        wait 2

ls_protp.h : ls_protp.tmp
	copy ls_protp.tmp ls_protp.h
	@echo LS_PROTP.H Built
	
ls_protp.tmp : $(SRCS_LTSN_EXE:.c=.dep)
	@echo Building LS_PROTP.H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> ls_protp.tmp
        wait 2

ltsp.h : ltsp.tmp
	copy $(@B).tmp $(@B).h
	@echo $(@B).H Built
	
ltsp.tmp : $(SRCS_LTS_US__EXE:.c=.dep)
	@echo Building $(@B).H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> $(@B).tmp
        wait 2

cmdp.h : cmdp.tmp
	copy cmdp.tmp cmdp.h
	@echo CMDP.H Built

cmdp.tmp : $(SRCS_CMD_EXE:.c=.dep) $(SRCS_CMD_EXE2:.c=.obj)
	@echo Building CMDP.H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo /D PROTO_BUILD $(**F:.dep=.c) >> cmdp.tmp	
        wait 2

kernp.h : kernp.tmp
	copy kernp.tmp kernp.h
	@echo KERNP.H Built
	
kernp.tmp : $(SRCS_KERNEL_SYS:.c=.dep)
	@echo Building KERNP.H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> kernp.tmp	
        wait 2
	
libp.h : libp.tmp
	copy libp.tmp libp.h
	@echo LIBP.H Built

libp.tmp : $(SRCS_DTPC_LIB:.c=.dep) $(SRCS_DTPC_LIB2:.c=.dep)
	@echo Building LIBP.H
	-del $(@B).h
	@echo <<$(@B).h (a dummy) has been created.
/*This is a dummy file*/
<<KEEP
	-del $(@B).tmp
        wait 2
	!-$(PROTO_CL) /W0 /Zg /c /D $(OUTPUT_ARGUMENT) /nologo $(**F:.dep=.c) >> libp.tmp
        wait 2
	@echo $(@B).tmp has been created.

# -----------------------------------------------------------
# This section contain the ability to generate sbr and bsc files.
# -----------------------------------------------------------
mkboot.bsc : $(SRCS_MKBOOT_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

mkboot1.bsc : $(SRCS_MKBOOT1_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

pcboot.bsc : $(SRCS_PCBOOT_EXE:.c=.sbr) $(SRCS_PCBOOT_ASM:.asm=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

hexobj.bsc : $(SRCS_HEXOBJ_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

wsr.bsc : $(SRCS_WSR_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

start_gr.bsc : $(SRCS_START_GR_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

demo_gr.bsc : $(SRCS_DEMO_GR_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

ger.bsc : $(SRCS_GER_EXE:.c=.sbr) $(SRCS_GER_ASM:.asm=.sbr) $(SRCS_DTPC_LIB:.c=.sbr) $(SRCS_DTPC_LIB2:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

ph_gr.bsc : $(SRCS_PH_US_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

lts_gr.bsc : $(SRCS_LTS_GR_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

demo_sp.bsc : $(SRCS_DEMO_SP_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

start_sp.bsc : $(SRCS_START_SP_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

dtpc_863.bsc : $(SRCS_DTPC_863_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

dtpc_850.bsc : $(SRCS_DTPC_850_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

dtpc_437.bsc : $(SRCS_DTPC_437_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

spa.bsc : $(SRCS_SPA_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

ph_sp.bsc : $(SRCS_PH_SP_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

lts_sp.bsc : $(SRCS_LTS_SP_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

mul_read.bsc : $(SRCS_MUL_READ_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

mdemo.bsc : $(SRCS_MDEMO_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

dtvoc.bsc : $(SRCS_DTVOC_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

dic.bsc : $(SRCS_DIC_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

start_us.bsc : $(SRCS_START_US_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

alts.bsc : $(SRCS_ALTS_EXE:.c=.sbr) $(SRCS_ALTS_ASM:.asm=.sbr) $(SRCS_DTPC_LIB:.c=.sbr) $(SRCS_DTPC_LIB2:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

udic_us.bsc : $(SRCS_UDIC_US_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

alphabet.bsc : $(SRCS_ALPHABET_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

demo_us.bsc : $(SRCS_DEMO_US_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

dt_driv.bsc : $(SRCS_DT_DRIV_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

dt_load.bsc : $(SRCS_DT_LOAD_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

dt_conf.bsc : $(SRCS_DT_CONF_EXE:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

usa.bsc : $(SRCS_USA_EXE:.c=.sbr) $(SRCS_USA_ASM:.asm=.sbr) $(SRCS_DTPC_LIB:.c=.sbr) $(SRCS_DTPC_LIB2:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

ph_us.bsc : $(SRCS_PH_US_EXE:.c=.sbr) $(SRCS_PH_US_ASM:.asm=.sbr) $(SRCS_DTPC_LIB:.c=.sbr) $(SRCS_DTPC_LIB2:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

lts_us.bsc : $(SRCS_LTS_US_EXE:.c=.sbr) $(SRCS_LTS_US_ASM:.asm=.sbr) $(SRCS_DTPC_LIB:.c=.sbr) $(SRCS_DTPC_LIB2:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

cmd.bsc : $(SRCS_CMD_EXE:.c=.sbr) $(SRCS_CMD_EXE2:.c=.obj) $(SRCS_CMD_ASM:.asm=.sbr) $(SRCS_DTPC_LIB:.c=.sbr) $(SRCS_DTPC_LIB2:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

kernel.bsc : $(SRCS_KERNEL_ASM:.asm=.sbr) $(SRCS_KERNEL_SYS:.c=.sbr) $(SRCS_DTPC_LIB:.c=.sbr) $(SRCS_DTPC_LIB2:.c=.sbr)
	@echo Building $(@F)
	@BSCMAKE /n /nologo /o$(@B).bsc @<<$(@B).tmp
$(**F)
<<KEEP
	@echo $(@F) Built

$(SRCS:.c=.sbr):
	@-cl /Zs /W0 /D $(OUTPUT_ARGUMENT) /nologo /FR $*.c

$(SRCS_ASM:.asm=.sbr):
	@-$(MASM_PATH)\bin\ml /D $(OUTPUT_ARGUMENT) /nologo /Zs /W0 /FR $*.asm
	@-SBRPACK /nologo $*.sbr
# -----------------------------------------------------------
$(TARGET_FILEORGN_TXT) : glblclvr.exe
	@echo Building Updated File Organization Report: $(@F)
	glblclvr
	@echo $(@F) Built
	
# -----------------------------------------------------------
