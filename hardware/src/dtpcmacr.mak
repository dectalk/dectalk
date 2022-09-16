# WARNING: THIS IS *NOT* AN NMAKE MAKe FILE. IT IS INCLUDED!
# -----------------------------------------------------------
# Name:                         DTPCMACR.MAK
# Creation Date:         1-DEC-1994
# Created By:           Carl Leeber
# Function Summary:     Include file for DTPC Extrnl MAK files
# -----------------------------------------------------------
# Description:
#       This file has is the master macro include file for all the
#       DTPC NMAKE external MAKe files. 
# -----------------------------------------------------------
# Modifications History:
# -----------------------------------------------------------
# 13-DEC-1994 Carl Leeber, Added macro SRCS_..._ASM=kernel.asm
# 14-DEC-1994 Carl Leeber, Added macro DOSLIB for slibce.lib.
# 							Add DT_*.EXE build capability.
#							Add DTDEMO.EXE to build suite.
# 05-JAN-1995 Carl Leeber, Add alphabet.exe, userdic.exe
# 06-JAN-1995 Carl Leeber, Add alts.exe, dtstart.exe pardic.exe
# 10-JAN-1995 Carl Leeber, Add $(TARGET_ALL) and
#							$(TARGET_ALL_SYS) macros.
# 17-JAN-1995 Carl Leeber, Add slibca.lib macro.
# 24-JAN-1995 Carl Leeber, Add $(TARGET_ALL_TXT) and
#							$(TARGET_ALL_BAT) marcos.
# 30-JAN-1995 Carl Leeber, Add $(TOOLKIT_...) macros for kit builds.
# 01-FEB-1995 Carl Leeber, Add DTVOC and MDEMO.EXE build capability.
# 02-FEB-1995 Carl Leeber, Add MUL_READ.EXE build capability.
# 08-FEB-1995 Carl Leeber, Add SLTS.EXE and SPH.EXE capability
# 10-FEB-1995 Carl Leeber, Add SPA.EXE, DTPC_437.EXE, DTPC_850.EXE,
#							DTPC_863.EXE, SDTSTART.EXE and
#							SDTDEMO.EXE capability
# 13-FEB-1995 Carl Leeber, Add TARGET_ALL_DIC macro and dtpc_dic
#							generation capability.
# 16-FEB-1995 Carl Leeber, Add lickit build capability and SRCS_MAK
#							macro.
# 20-FEB-1995 Carl Leeber, Add PHCLASS.CPP and PHCLASS.H to process
# 23-FEB-1995 Carl Leeber, Add sdtpcdic.dic to process to
#							TARGET_ALL_DIC and spardic.exe.
# 27-FEB-1995 Carl Leeber, Change dtpc_dic to dtpcdic in all uses.
# 08-MAR-1995 Carl Leeber, Add DTPC.DLL and related capability.
#						--->*NOTE: dtpcw.lib is also created*<--
# 09-MAR-1995 Carl Leeber, Add WSR.EXE to process
# 20-MAR-1995 Carl Leeber, Change WSR.EXE to TARGET_ALL_DLL
# 23-MAR-1995 Carl Leeber, Add VTM integer code to process.
# 24-MAR-1995 Carl Leeber, Add VTM_I.TXT & VTM_I_C.TXT use _TS for
#							MACROS containing Trade Secret files.
# 28-MAR-1995 Carl Leeber, Add German lts and ph to process
#							(GLTS commented out in TARGET_ALL_GERMAN)
# 03-APR-1995 Carl Leeber, Add VTM floating point code to process. Add
#							VTM_F_C.TXT use _TS for MACROS containing
#							Trade Secret files.
# 02-MAY-1995 Carl Leeber, Finish debug of GLTS.
# 17-MAY-1995 Carl Leeber, Add LICKIT_BASIC_ENGLISH for kit builds.
# 18-MAY-1995 Carl Leeber, Add TOOLKIT_DLL_WRI for DLL toolkits.
# 23-MAY-1995 Carl Leeber, Add SRCS_GER_EXE, SRCS_GER_ASM,
#							TARGET_ALL_GERMAN, GDTDEMO.EXE. GDTSTART.EXE
# 24-MAY-1995 Carl Leeber, Add GPARDIC.EXE.
# 26-MAY-1995 Carl Leeber, Add DTPCDIC.DIC to LICKIT_BASIC_ENGLISH.
#						   Add SRCS_WSR_ICO, SRCS_WSR_DEF and DTPCW.LIB.
#						   Add SRCS_WSR_MAK, SRCS_PH_EXE_OK, SRCS_PH_EXE_TS,
#							SRCS_PH_ASM_OK, SRCS_PH_ASM_TS, SRCS_LTS_EXE_OK,
#							SRCS_LTS_EXE_TS, SRCS_LTS_ASM_OK ,
#							SRCS_LTS_ASM_TS, SRCS_ALTS_EXE_TS,
#							SRCS_ALTS_EXE_OK, SRCS_ALTS_ASM_OK and
#							SRCS_ALTS_ASM_TS.
# 07-JUN-1995 Carl Leeber, Change ANCA to ACNA. ONLY in this file.
#							Add DTCOMMON.C to yDTSTART_x, yDTDEMO_x.
#							Add TOOLKIT_DECTALK_INI to TOOLKIT.
# 09-JUN-1995 Carl Leeber, Add LICKIT_LICKITRM_TXT macro for readme file.
# 19-JUN-1995 Carl Leeber, Add FLTS.EXE and FPH.EXE to process
# 21-JUN-1995 Carl Leeber, Add FRE.EXE using USA.EXE files as placeholders.
# 26-JUN-1995 Carl Leeber, Add LSHOMO.C and LSHOMO_DEP to LICKITxs.
#							Add WAV_VOC.C. Add PARSERTST.C.
# 28-JUN-1995 Carl Leeber, Add COMMAND.TXT and UGUIDE.TXT to TOOLKIT.
# 29-JUN-1995 Carl Leeber, Add PROTO_CL macro for prototype compiler.
# 06-JUL-1995 Carl Leeber, Add TARGET_ALL_LIB, Fix use of PROTO_CL macro.
# 10-JUL-1995 Carl Leeber, Add GLBLCLVR_EXE target.
#							Add TARGET_OF_ALL_TARGETS.
# 19-JUL-1995 Carl Leeber, Add CMD, KERN, LIB & OPERSYS.TXT to
#							TOOLKIT_GEN_MAN_TXT
# 28-JUL-1995 Carl Leeber, Add newvar.c and report.c to GLBLCLVR_EXE.
# 31-JUL-1995 Carl Leeber, Add LOCAL_DISC macro & French 'dt*' files.
# 03-AUG-1995 Carl Leeber, Removed TARGET_ALL_DIC from
#							TARGET_OF_ALL_TARGETS.
# 10-AUG-1995 Carl Leeber, Add GPIO.C to SRCS_DTPC_LIB macro for DTPC2.
# 11-AUG-1995 Carl Leeber, Add PCBOOT, HEXOBJ, MKBOOT & MKBOOT1.EXE.
# 31-AUG-1995 Carl Leeber, Add TARGET_FILEORGN_TXT macro.
#							Add basevorg & baseforg.txt files to tookkit.
#							Remove fileorgn.txt from toolkit.
# 18-SEP-1995 Carl Leeber, Modify SRCS_GLTS_EXE to include latest German,
#							fix [:say ...] commands & add German dictionary.
# 02-OCT-1995 Carl Leeber, Use OUTPUT_MACRO for SRCS_KERNEL_SYS for DTPC2.
# 19-OCT-1995 Carl Leeber, Add DDB_CFG & INSTALL_DAT disk build files.
# 26-OCT-1995 Carl Leeber, Change OUTPUT_MACRO to PRODUCT_ARGUMENT.
# 31-OCT-1995 Carl Leeber, Add APPENDX_F_TXT.
# 01-NOV-1995 Carl Leeber, Add MUSIC.BAT/MUSICx.TXT to TOOLKIT_MULTBORD_TXT.
# 24-JAN-1996 Carl Leeber, Add PRIODIC.EXE definitions
# 25-JAN-1996 Carl Leeber, Add GRAPHICSLIB definition for PRIODIC update.
# 02-FEB-1996 Carl Leeber, Add ALPHABET & USERDIC.EXE & personal.dtu builds.
#							Add G/SUSERDIC.EXE builds.
# 08-FEB-1996 Carl Leeber, Correct SRCS_PERSONAL_DTU:.tab=.dic to dtu.  
# 21 feb 1996 tek		merge dtex
# 21-FEB-1996 Carl Leeber, Add SRCS_LTSN_EXE, etc, macros for New LTS.
# 12-MAR-1996 Carl Leeber, Fix SRCS IF for DTEX.
# 07-may-1996 tek		fix merge of dtex..
# 07-may-1996 cjl		touched with latest 4-8 board fix.
# 09-may-1996 cjl		DTEX builds to exclude non-working parts.
# 20-may-1996 tek		don't build loader etc for dtex..
# 10-jun-1996 cjl		add SRCS_DTSPEAK_EXE, dtspeak.exe & lang variants
# 11-JUN-1996 cjl		remove SRCS_DTSPEAK_EXE and targets.
# 19-JUN-1996 cjl		comment out mfg_load.exe build code; no source file
# 24-JUN-1996 cjl		add mfg_load.exe back in.
# 17-OCT-1996 cjl		added KIT_DISK
# 28-JAN-1997 tql		Removed all references to LTSN and NEW.
# 29-JAN-1997 tql		Removed all French support.  Also reorganized SRCS and TARGET macros.
# 05-FEB-1997 tql		Temporarily commented out all SPANISH and GERMAN support.
# 10-FEB-1997 tql		Added all needed changes for SPANISH and GERMAN support.
#						Also reorganized and cleaned up macros.
# 14-FEB-1997 tql		Modified target names of language specific files to fit new convention.
#						For example: DTDEMO->DEMO_US, SUSERDIC->UDIC_SP.
# 14-FEB-1997 tql		Removed SPARDIC and GPARDIC.  Only PARDIC is needed.
# 17-FEB-1997 tql		Modified some path macros.  Added macro for PKZIP.
# 17-FEB-1997 tql		Added SRCS_COMMON which contain source macros common to all products.
# 19-FEB-1997 tql		Moved phlog.c from DTPC_LIB to PH_EXE.
# 27-FEB-1997 tql		Changed pardic.exe to dic.exe.
# 27-FEB-1997 tql		Added some path macros needed for DTEX build.
# 05-NOV-1997 DR		BATS295 made watcom, phar386 and other environment variables BATS295 not done
# 05-NOV-1997 DR		Added NWS build macros.  NWS is now in the mak files.
# 11-NOV-1997 DR		BATS295 Finally finished.  Macros are commented out 
#						and environment variables are used instead.
# 30-DEC-1997 cjl               Add UK to builds.
# 21-JAN-1998 jl                BAT#553 Finished UK to builds.
# 14-JUL-1998 mfg		ADDED CHANGES FOR spanish_la AND spanish_SP
# 14-JUL-1998 ETT changed some single macros into duals for the automatic code stripping.
#		including: SRCS_CMD_EXE & SRCS_DTPC_LIB
# 18-MAR-1999 cjl               Added changes for NWS Spanish_LA.
# 31-mar-1999 tek	new user-dic compiler layout
#
# -----------------------------------------------------------
# NMAKE MACRO list of library source compile/assembly files.
# -----------------------------------------------------------
# Each macro is named in a manner to make it easy to associate
#       the files named in th macro with the end point object that
#       is producted from them (it). All macros have the prefix
#       SRCS_ followed by the target object name. Therefore
#       SRCS_DTPC_LIB is the macro of file names (SRCS) that will
#       be dependents of DTPC.LIB.
# -----------------------------------------------------------

SRCS_DTPCCJLT_MAK = dtpccjlt.mak

SRCS_DTPCCJL1_MAK = dtpccjl1.mak

SRCS_DTPCMACR_MAK = dtpcmacr.mak
DATE_DTPCMACR_MAK = 01-NOV-1997   

SRCS_DTPCKITS_MAK = dtpckits.mak

SRCS_WSR_MAK = wsr.mak

KIT_DISK = c:

#DR 11-NOV-1997 
#These macros if uncommented out can override the ENVIRONMENT VARIABLES SET in SETVAR.
#That way if someone wants to specifically set these macros they can.
#But, with setvar set these macros become unneeded and are commented out.
#MSVC_PATH = c:\msvc
#WATCOM_PATH = c:\watcom  
#PHAR_PATH = c:\pahr386
#MASM_PATH = c:\masm611
#PKZIP_PATH = c:\pkzip

PROTO_CL = $(MSVC_PATH)\bin\cl
OLDLIB = $(MSVC_PATH)\lib\slibca.lib
DOSLIB = $(MSVC_PATH)\lib\slibce.lib
LLIB = $(MSVC_PATH)\lib\llibce.lib
OLDNAMELIB = $(MSVC_PATH)\lib\oldnames.lib
GRAPHICSLIB = $(MSVC_PATH)\lib\graphics.lib

DLL_DEF = dll.def

########## LIB START ###########
SRCS_DTPC_LIB = \
 indal.c\
 putstr.c\
 putseq.c\
 putc.c\
 putn.c\
 volset.c\
 volup.c\
 spcwrite.c\
 startf.c\
 sendind.c\
 deflang.c\
 adjind.c\
 adjallo.c\
 resetspc.c\
 indph.c\
 serialu.c\
 statabs.c\
 saveind.c\
 donef.c\
 getc.c\
 statsetu.c\
 statclru.c\
 statabsu.c\
 stattogu.c\
 stattog.c\
 statset.c\
 statclr.c\
 voldown.c\
 spcget.c\
 kdisable.c\
 kenable.c\
 chkind.c

SRCS_DTPC_LIB2 = \
 printf.c\
 puthex.c\
 gpio.c

########## LIB END ##########


########## KERNEL START ##########
!IF "$(PRODUCT_ARGUMENT)"=="DTPC2"

SRCS_KERNEL_SYS = copyrite.c\
 isa.c\
 isa_dma.c\
 iso_char.c\
 main.c\
 spc_driv.c

SRCS_KERNEL_ASM = kernel.asm\
 os.asm\
 queue.asm\
 sema.asm\
 gate.asm\
 isr.asm\
 timer.asm\
 create.asm\
 malloc.asm\
 pipe.asm\
 ring.asm\
 support.asm\
 startup.asm\
 data.asm\
 disp.asm

!ELSEIF "$(PRODUCT_ARGUMENT)"=="DTEX"

SRCS_KERNEL_SYS = copyrite.c\
 iso_char.c\
 main.c\
 serial.c\
 loader.c\
 isa.c\
 express.c\
 spc_driv.c

SRCS_KERNEL_ASM = kernel.asm\
 os.asm\
 queue.asm\
 sema.asm\
 gate.asm\
 isr.asm\
 timer.asm\
 create.asm\
 malloc.asm\
 pipe.asm\
 ring.asm\
 support.asm\
 startup.asm\
 data.asm\
 loadhelp.asm\
 disp.asm
		
!ELSE

SRCS_KERNEL_SYS = copyrite.c\
 isa.c\
 isa_dma.c\
 iso_char.c\
 main.c\
 spc_driv.c

SRCS_KERNEL_ASM = kernel.asm\
 os.asm\
 queue.asm\
 sema.asm\
 gate.asm\
 isr.asm\
 timer.asm\
 create.asm\
 malloc.asm\
 pipe.asm\
 ring.asm\
 support.asm\
 startup.asm\
 data.asm\
 disp.asm
		
!ENDIF
########## KERNEL END ##########
	               
	               
########## CMD START ##########		
SRCS_CMD_EXE = copyrite.c\
 cm_copt.c\
 cm_text.c\
 cm_util.c\
 par_pars.c\
 par_char.c\
 par_dict.c\
 par_rule.c\
 par_ambi.c
				
SRCS_CMD_EXE2 = cm_main.c\
 cm_pars.c\
 cm_phon.c\
 cm_char.c\
 cm_cmd.c

SRCS_CMD_ASM = kernel.asm
########## CMD END ##########
               
               
########## LTS START ##########
SRCS_LTS_EXE_TS = copyrite.c\
 ls_adju.c\
 ls_chari.c\
 ls_consi.c\
 ls_main.c\
 ls_math.c\
 ls_proc.c\
 ls_rtabi.c\
 ls_rule.c\
 ls_spel.c\
 ls_speli.c\
 ls_suff.c\
 ls_suffi.c\
 ls_task.c\
 ls_util.c 
SRCS_LTS_US_EXE_TS = $(SRCS_LTS_EXE_TS)
SRCS_LTS_UK_EXE_TS = $(SRCS_LTS_EXE_TS)
SRCS_LTS_SP_EXE_TS = $(SRCS_LTS_EXE_TS)
SRCS_LTS_GR_EXE_TS = $(SRCS_LTS_EXE_TS)
SRCS_LTS_LA_EXE_TS = $(SRCS_LTS_EXE_TS)

SRCS_LTS_EXE_OK = ls_dict.c\
 ls_homo.c
SRCS_LTS_US_EXE_OK = $(SRCS_LTS_EXE_OK)
SRCS_LTS_UK_EXE_OK = $(SRCS_LTS_EXE_OK)
SRCS_LTS_SP_EXE_OK = $(SRCS_LTS_EXE_OK)
SRCS_LTS_GR_EXE_OK = $(SRCS_LTS_EXE_OK)
SRCS_LTS_LA_EXE_OK = $(SRCS_LTS_EXE_OK)

SRCS_LTS_EXE = $(SRCS_LTS_EXE_TS)\
 $(SRCS_LTS_EXE_OK)
SRCS_LTS_US_EXE = $(SRCS_LTS_EXE)
SRCS_LTS_UK_EXE = $(SRCS_LTS_EXE)
SRCS_LTS_SP_EXE = $(SRCS_LTS_EXE)
SRCS_LTS_GR_EXE = $(SRCS_LTS_EXE)
SRCS_LTS_LA_EXE = $(SRCS_LTS_EXE)

SRCS_LTS_ASM_OK = kernel.asm
SRCS_LTS_US_ASM_OK = $(SRCS_LTS_ASM_OK)
SRCS_LTS_UK_ASM_OK = $(SRCS_LTS_ASM_OK)
SRCS_LTS_SP_ASM_OK = $(SRCS_LTS_ASM_OK)
SRCS_LTS_GR_ASM_OK = $(SRCS_LTS_ASM_OK)
SRCS_LTS_LA_ASM_OK = $(SRCS_LTS_ASM_OK)

SRCS_LTS_ASM = $(SRCS_LTS_ASM_OK)
SRCS_LTS_US_ASM = $(SRCS_LTS_ASM)
SRCS_LTS_UK_ASM = $(SRCS_LTS_ASM)
SRCS_LTS_SP_ASM = $(SRCS_LTS_ASM)
SRCS_LTS_GR_ASM = $(SRCS_LTS_ASM)
SRCS_LTS_LA_ASM = $(SRCS_LTS_ASM)
########## LTS END ##########
                             

########## ALTS START ##########
SRCS_ALTS_EXE_TS = copyrite.c\
 ls_chari.c\
 lsa_main.c\
 ls_math.c\
 ls_proc.c\
 lsa_rtbi.c\
 lsa_rule.c\
 ls_spel.c\
 ls_speli.c\
 ls_suff.c\
 ls_suffi.c\
 lsa_task.c\
 lsa_util.c\
 lsa_adju.c\
 lsa_coni.c\
 lsa_fr.c\
 lsa_gr.c\
 lsa_ir.c\
 lsa_it.c\
 lsa_ja.c\
 lsa_sl.c\
 lsa_sp.c\
 lsa_us.c

SRCS_ALTS_EXE_OK = ls_dict.c\
 ls_homo.c

SRCS_ALTS_EXE = $(SRCS_ALTS_EXE_TS)\
 $(SRCS_ALTS_EXE_OK)

SRCS_ALTS_ASM_OK = kernel.asm

SRCS_ALTS_ASM = $(SRCS_ALTS_ASM_OK)
########## ALTS END ##########


########## PH START ##########                             
SRCS_PH_EXE_TS = copyrite.c\
 phlog.c\
 ph_aloph.c\
 ph_claus.c\
 ph_draw.c\
 ph_drwt0.c\
 ph_inton.c\
 ph_main.c\
 ph_romi.c\
 ph_setar.c\
 ph_sort.c\
 ph_syntx.c\
 ph_syl.c\
 ph_task.c\
 ph_timng.c\
 ph_vdefi.c\
 ph_vset.c  
SRCS_PH_US_EXE_TS = $(SRCS_PH_EXE_TS)
SRCS_PH_UK_EXE_TS = $(SRCS_PH_EXE_TS)
SRCS_PH_SP_EXE_TS = $(SRCS_PH_EXE_TS)
SRCS_PH_GR_EXE_TS = $(SRCS_PH_EXE_TS)
SRCS_PH_LA_EXE_TS = $(SRCS_PH_EXE_TS)

SRCS_PH_EXE = $(SRCS_PH_EXE_TS)
SRCS_PH_US_EXE = $(SRCS_PH_EXE)
SRCS_PH_UK_EXE = $(SRCS_PH_EXE)
SRCS_PH_SP_EXE = $(SRCS_PH_EXE)
SRCS_PH_GR_EXE = $(SRCS_PH_EXE)
SRCS_PH_LA_EXE = $(SRCS_PH_EXE)

SRCS_PH_ASM_OK = phmath.asm\
 kernel.asm
SRCS_PH_US_ASM_OK = $(SRCS_PH_ASM_OK)
SRCS_PH_UK_ASM_OK = $(SRCS_PH_ASM_OK)
SRCS_PH_SP_ASM_OK = $(SRCS_PH_ASM_OK)
SRCS_PH_GR_ASM_OK = $(SRCS_PH_ASM_OK)
SRCS_PH_LA_ASM_OK = $(SRCS_PH_ASM_OK)

SRCS_PH_ASM = $(SRCS_PH_ASM_OK)
SRCS_PH_US_ASM = $(SRCS_PH_ASM)
SRCS_PH_UK_ASM = $(SRCS_PH_ASM)
SRCS_PH_SP_ASM = $(SRCS_PH_ASM)
SRCS_PH_GR_ASM = $(SRCS_PH_ASM)
SRCS_PH_LA_ASM = $(SRCS_PH_ASM)
########## PH END ##########
                            
                            
########## LANG SPECIFIC START ##########
SRCS_USA_EXE = copyrite.c\
 usa_main.c
SRCS_UK_EXE = copyrite.c\
 uk_main.c
SRCS_SPA_EXE = copyrite.c\
 spa_main.c
SRCS_GER_EXE = copyrite.c\
 ger_main.c
SRCS_LA_EXE = copyrite.c\
 la_main.c

SRCS_DEMO_US_EXE = copyrite.c\
 demo_us.c\
 dtcommon.c
SRCS_DEMO_UK_EXE = copyrite.c\
 demo_uk.c\
 dtcommon.c
SRCS_DEMO_SP_EXE = copyrite.c\
 demo_sp.c\
 dtcommon.c
SRCS_DEMO_GR_EXE = copyrite.c\
 demo_gr.c\
 dtcommon.c 
SRCS_DEMO_LA_EXE = copyrite.c\
 demo_la.c\
 dtcommon.c 

SRCS_START_US_EXE = copyrite.c\
 start_us.c\
 dtcommon.c
SRCS_START_UK_EXE = copyrite.c\
 start_uk.c\
 dtcommon.c
SRCS_START_SP_EXE = copyrite.c\
 start_sp.c\
 dtcommon.c
SRCS_START_GR_EXE = copyrite.c\
 start_gr.c\
 dtcommon.c
SRCS_START_LA_EXE = copyrite.c\
 start_la.c\
 dtcommon.c


SRCS_DIC_US_DIC = dic_us.zip
SRCS_DIC_UK_DIC = dic_uk.zip
SRCS_DIC_SP_DIC = dic_sp.zip
SRCS_DIC_SP_DIC = dic_la.zip
SRCS_DIC_GR_DIC = dic_gr.zip
SRCS_NWS_US_DIC = dic_nws.zip
SRCS_NWS_LA_DIC = dic_la.zip

SRCS_UDIC_US_EXE = copyrite.c\
 udic_com.c\
 alphabet.c

SRCS_UDIC_UK_EXE = copyrite.c\
 udic_com.c\
 alphabet.c

SRCS_UDIC_SP_EXE = copyrite.c\
 udic_com.c\
 alphabet.c

SRCS_UDIC_GR_EXE = copyrite.c\
 udic_com.c\
 alphabet.c

SRCS_UDIC_LA_EXE = copyrite.c\
 udic_com.c\
 alphabet.c

########## LANG SPECIFIC END ##########


SRCS_USA_ASM = kernel.asm
SRCS_UK_ASM = kernel.asm
SRCS_SPA_ASM = kernel.asm
SRCS_GER_ASM = kernel.asm
SRCS_LA_ASM = kernel.asm

SRCS_DIC_EXE = copyrite.c\
 dic.c
 
SRCS_DT_CONF_EXE = copyrite.c\
 cnf_main.c

!IF "$(PRODUCT_ARGUMENT)"=="DTEX"
SRCS_DT_LOAD_EXE = mfg_load.c

!ELSE
SRCS_DT_LOAD_EXE = copyrite.c\
 ldr_main.c\
 ldr_file.c\
 ldr_boot.c\
 ldr_swit.c\
 ldr_err.c

!ENDIF

SRCS_DT_DRIV_EXE = copyrite.c\
 tsr_main.c\
 tsr_io.c\
 tsr_com.c\
 tsr_lpt.c\
 tsr_mult.c\
 tsr_swit.c

SRCS_PERSONAL_DTU = personal.tab
 
SRCS_DTVOC_EXE = copyrite.c\
 voc_main.c

SRCS_MDEMO_EXE = copyrite.c\
 mdemo.c

SRCS_MUL_READ_EXE = copyrite.c\
 mul_read.c


SRCS_DTPC_437_EXE = copyrite.c\
 cpg_main.c\
 cpg_437.c
 
SRCS_DTPC_437_ASM = kernel.asm

SRCS_DTPC_850_EXE = copyrite.c\
 cpg_main.c\
 cpg_850.c
 
SRCS_DTPC_850_ASM = kernel.asm

SRCS_DTPC_863_EXE = copyrite.c\
 cpg_main.c\
 cpg_863.c
 
SRCS_DTPC_863_ASM = kernel.asm


SRCS_GLBLCLVR_EXE = copyrite.c\
 glblclvr.c\
 newvar.c\
 report.c
  
########## DLL START ########## 
SRCS_DTPC_DLL = copyrite.c\
 dll_box.c\
 dll_conf.c\
 dll_cust.c\
 dll_file.c\
 dll_ini.c\
 dll_io.c\
 dll_main.c\
 dll_user.c\
 dll_wnd.c\
 drv_main.c
 
SRCS_DTPC_DLL_OBJ = copyrite.c\
 dll_box.c\
 dll_conf.c\
 dll_cust.c\
 dll_file.c\
 dll_ini.c\
 dll_io.c\
 dll_main.c\
 dll_user.c\
 dll_wnd.c\
 drv_main.c 
 
SRCS_DTPC_RC = dll_dtpc.rc
########## DLL END ##########


########## WSR START ##########
SRCS_WSR_EXE = wsr_char.c\
 wsr_file.c\
 wsr_ind.c\
 wsr_main.c\
 wsr_tty.c

SRCS_WSR_RC = wsr.rc

SRCS_WSR_ICO = wsr.ico

SRCS_WSR_DEF = wsr.def
########## WSR END ##########


########## VTM START ##########
SRCS_VTM_I_EXE = $(SRCS_VTM_I_EXE_OK)\
 $(SRCS_VTM_I_EXE_TS)

SRCS_VTM_I_EXE_OK = vtm_i.c\
 vtm_iman.c

SRCS_VTM_I_EXE_TS = decvoc_i.c

SRCS_VTM_I_C_TXT_TS = vtm_i_c.txt

SRCS_VTM_F_EXE = $(SRCS_VTM_F_EXE_OK)\
 $(SRCS_VTM_F_EXE_TS)

SRCS_VTM_F_EXE_OK = vtm_f.c\
 vtm_fman.c

SRCS_VTM_F_EXE_TS = decvoc_f.c

# This is the unified .c file for VTM, w/ original comments
SRCS_VTM_F_C_TXT_TS = vtm_f_c.txt
########## VTM END ##########


SRCS_PCBOOT_EXE = copyrite.c\
pcboot.c

SRCS_PCBOOT_ASM = bootup.asm

SRCS_HEXOBJ_EXE = copyrite.c\
hexobj.c

SRCS_MKBOOT_EXE = copyrite.c\
mkboot.c

SRCS_MKBOOT1_EXE = copyrite.c\
mkboot1.c

SRCS_PRIODIC_EXE = copyrite.c\
priodic.c

#SRCS_ALPHABET_EXE = copyrite.c\
#alphabet.c

# -----------------------------------------------------------
# SRCS_COMMON is a macro of selected macros common to both products.
# -----------------------------------------------------------
SRCS_COMMON = $(SRCS_DTPC_LIB)\
 $(SRCS_DTPC_LIB2)\
 $(SRCS_KERNEL_SYS)\
 $(SRCS_CMD_EXE)\
 $(SRCS_CMD_EXE2)\
 $(SRCS_DT_DRIV_EXE)\
 $(SRCS_DT_LOAD_EXE)\
 $(SRCS_DTVOC_EXE)\
 $(SRCS_MDEMO_EXE)\
 $(SRCS_MUL_READ_EXE)\
 $(SRCS_DTPC_437_EXE)\
 $(SRCS_DTPC_850_EXE)\
 $(SRCS_DTPC_863_EXE)\
 $(SRCS_GLBLCLVR_EXE)\
 $(SRCS_DTPC_DLL)\
 $(SRCS_WSR_EXE)\
 $(SRCS_VTM_I_EXE)\
 $(SRCS_VTM_F_EXE)\
 $(SRCS_LTS_US_EXE)\
 $(SRCS_HEXOBJ_EXE)\
# $(SRCS_MKBOOT_EXE)\
# $(SRCS_MKBOOT1_EXE)\
 $(SRCS_PRIODIC_EXE)\
# $(SRCS_ALPHABET_EXE)\
 $(SRCS_ALTS_EXE)\
 $(SRCS_USA_EXE)\
 $(SRCS_UK_EXE)\
 $(SRCS_SPA_EXE)\
 $(SRCS_LA_EXE)\
 $(SRCS_GER_EXE)\
 $(SRCS_LTS_US_EXE)\
 $(SRCS_LTS_UK_EXE)\
 $(SRCS_LTS_SP_EXE)\
 $(SRCS_LTS_LA_EXE)\
 $(SRCS_LTS_GR_EXE)\
 $(SRCS_PH_US_EXE)\
 $(SRCS_PH_UK_EXE)\
 $(SRCS_PH_SP_EXE)\
 $(SRCS_PH_LA_EXE)\
 $(SRCS_PH_GR_EXE)\
 $(SRCS_DEMO_US_EXE)\
 $(SRCS_DEMO_UK_EXE)\
 $(SRCS_DEMO_SP_EXE)\
 $(SRCS_DEMO_LA_EXE)\
 $(SRCS_DEMO_GR_EXE)\
 $(SRCS_START_US_EXE)\
 $(SRCS_START_UK_EXE)\
 $(SRCS_START_SP_EXE)\
 $(SRCS_START_LA_EXE)\
 $(SRCS_START_GR_EXE)\
 $(SRCS_UDIC_US_EXE)\
 $(SRCS_UDIC_UK_EXE)\
 $(SRCS_UDIC_SP_EXE)\
 $(SRCS_UDIC_LA_EXE)\
 $(SRCS_UDIC_GR_EXE)\
 $(SRCS_DIC_EXE)

# -----------------------------------------------------------
# SRCS is a macro of selected macros !INCLUDEd above.
# -----------------------------------------------------------
!IF "$(PRODUCT_ARGUMENT)"=="DTEX"
SRCS = $(SRCS_COMMON)

# -----------------------------------------------------------
# SRCS is a macro of selected macros !INCLUDEd above.
# -----------------------------------------------------------
!ELSE
SRCS = $(SRCS_COMMON)\
 $(SRCS_PCBOOT_EXE)\
 $(SRCS_DT_CONF_EXE)
 
!ENDIF

# -----------------------------------------------------------
# SRCS_ASM is a macro of selected ASM macros !INCLUDEd above.
# -----------------------------------------------------------
SRCS_ASM = $(SRCS_KERNEL_ASM)\
 $(SRCS_CMD_ASM)\
 $(SRCS_DTPC437_ASM)\
 $(SRCS_DTPC850_ASM)\
 $(SRCS_DTPC863_ASM)\
 $(SRCS_PCBOOT_ASM)\
 $(SRCS_USA_ASM)\
 $(SRCS_UK_ASM)\
 $(SRCS_SPA_ASM)\
 $(SRCS_LA_ASM)\
 $(SRCS_GER_ASM)\
 $(SRCS_ALTS_ASM)\
 $(SRCS_LTS_US_ASM)\
 $(SRCS_LTS_UK_ASM)\
 $(SRCS_LTS_SP_ASM)\
 $(SRCS_LTS_LA_ASM)\
 $(SRCS_LTS_GR_ASM)\
 $(SRCS_PH_US_ASM)\
 $(SRCS_PH_UK_ASM)\
 $(SRCS_PH_SP_ASM)\
 $(SRCS_PH_LA_ASM)\
 $(SRCS_PH_GR_ASM)

# -----------------------------------------------------------
# SRCS_DIC is a macro of selected DIC macros !INCLUDEd above.
# -----------------------------------------------------------
SRCS_DIC = $(SRCS_DIC_US_DIC)\
 $(SRCS_DIC_SP_DIC)\
 $(SRCS_DIC_LA_DIC)\
 $(SRCS_DIC_GR_DIC)\
 $(SRCS_NWS_US_DIC)\
 $(SRCS_NWS_LA_DIC)\
 $(SRCS_DIC_UK_DIC)
 
SRCS_DTU = $(SRCS_PERSONAL_DTU)

# -----------------------------------------------------------
# SRCS_MAK is a macro of selected MAK files !INCLUDEd above.
#	These files go on kit selected kit disks.
# -----------------------------------------------------------
SRCS_MAK = $(SRCS_DTPCCJLT_MAK)\
 $(SRCS_DTPCCJL1_MAK)\
 $(SRCS_DTPCMACR_MAK)\
 $(SRCS_WSR_MAK)

# -----------------------------------------------------------
# SRCS_RC is a macro of selected RC files !INCLUDEd above.
#	These files are used to make the DLL.
# -----------------------------------------------------------
SRCS_RC = $(SRCS_DTPC_RC)\
 $(SRCS_WSR_RC)
 
# -----------------------------------------------------------
# TARGET_ALL, TARGET_ALL_SYS and TARGET_ALL_DIC are macros of
#	all .exe, .sys and .dic targets in the system. The macros
#	further broken up into product groups, BASIC is dtpc with
#	regular LTS, ACNA has ALTS, SPANISH has the spanish exes
#	and NEW is the new C++ code work. The DLL target group has
#	the dtpc.dll and wsr.exe builds. The VTM has the integer or
#	floating point variant builds for vtm_i.exe and vtm_f.exe
#	(Note neither of these are executable!!).
# TARGET_OF_ALL_TARGETS is a macro of all targets. To be used for
#	GLBLCLVR only.
# -----------------------------------------------------------
TARGET_OF_ALL_TARGETS =\
 $(TARGET_ALL)\
 $(TARGET_ALL_SYS)\
 $(TARGET_ALL_LIB)
 

#Specify which target to use
!IF "$(LANG_ARGUMENT)"=="ENGLISH_US"
TARGET_ALL_LANGUAGE = $(TARGET_ALL_ENGLISH)
!ELSEIF "$(LANG_ARGUMENT)"=="ENGLISH_UK"
TARGET_ALL_LANGUAGE = $(TARGET_ALL_ENGLISH_UK)
!ELSEIF "$(LANG_ARGUMENT)"=="SPANISH_LA"
TARGET_ALL_LANGUAGE = $(TARGET_ALL_SPANISH_LA)
!ELSEIF "$(LANG_ARGUMENT)"=="SPANISH_SP"
TARGET_ALL_LANGUAGE = $(TARGET_ALL_SPANISH)
!ELSEIF "$(LANG_ARGUMENT)"=="GERMAN"
TARGET_ALL_LANGUAGE = $(TARGET_ALL_GERMAN)
!ENDIF

!IF "$(PRODUCT_ARGUMENT)"=="DTEX"
TARGET_ALL = \
 $(TARGET_ALL_LANGUAGE)\
 $(TARGET_ALL_BASIC)\
 $(TARGET_ALL_ACNA)\
 $(TARGET_ALL_NEW)\
 $(TARGET_ALL_DLL)\
 $(TARGET_ALL_VTM)\
 $(TARGET_ALL_HEXOBJ)\
# $(TARGET_ALL_MKBOOT)\
# $(TARGET_ALL_MKBOOT1)\
 $(TARGET_ALL_PRIODIC)

!ELSE
TARGET_ALL = \
 $(TARGET_ALL_LANGUAGE)\
 $(TARGET_ALL_BASIC)\
 $(TARGET_ALL_ACNA)\
 $(TARGET_ALL_NEW)\
 $(TARGET_ALL_DLL)\
 $(TARGET_ALL_VTM)\
 $(TARGET_ALL_HEXOBJ)\
 $(TARGET_ALL_PCBOOT)\
# $(TARGET_ALL_MKBOOT)\
# $(TARGET_ALL_MKBOOT1)\
 $(TARGET_ALL_PRIODIC)

!ENDIF

!IF "$(PRODUCT_ARGUMENT)"=="DTEX"
TARGET_ALL_BASIC = \
 cmd.exe\
 dt_driv.exe\
 dtvoc.exe\
 dtpc_437.exe\
 dtpc_850.exe\
 dtpc_863.exe\
 dic.exe\
 mfg_load.exe

!ELSE
TARGET_ALL_BASIC = \
 cmd.exe\
 dt_driv.exe\
 dt_load.exe\
 dt_conf.exe\
 dtvoc.exe\
 mdemo.exe\
 mul_read.exe\
 dtpc_437.exe\
 dtpc_850.exe\
 dtpc_863.exe\
 dic.exe

!ENDIF

TARGET_ALL_ACNA = alts.exe

TARGET_ALL_ENGLISH = lts_us.exe\
 alts.exe\
 ph_us.exe\
 us.exe\
 start_us.exe\
 demo_us.exe\
 udic_us.exe

TARGET_ALL_ENGLISH_UK = lts_uk.exe\
 alts.exe\
 ph_uk.exe\
 uk.exe\
 start_uk.exe\
 demo_uk.exe\
 udic_uk.exe

TARGET_ALL_SPANISH = lts_sp.exe\
 ph_sp.exe\
 sp.exe\
 start_sp.exe\
 demo_sp.exe\
 udic_sp.exe

TARGET_ALL_SPANISH_LA = lts_la.exe\
 ph_la.exe\
 la.exe\
 start_la.exe\
 demo_la.exe\
 udic_la.exe

TARGET_ALL_GERMAN = lts_gr.exe\
 ph_gr.exe\
 gr.exe\
 demo_gr.exe\
 start_gr.exe\
 udic_gr.exe

TARGET_ALL_NEW = glblclvr.exe

TARGET_ALL_SYS = kernel.sys

TARGET_ALL_LIB = dtpc.lib\
 $(TOOLKIT_DTPCW_LIB)

!IF "$(LANG_ARGUMENT)"=="ENGLISH_US"
TARGET_ALL_DIC = $(TARGET_DIC_US_DIC)
!ELSEIF "$(LANG_ARGUMENT)"=="SPANISH_SP"
TARGET_ALL_DIC = $(TARGET_DIC_SP_DIC)
!ELSEIF "$(LANG_ARGUMENT)"=="SPANISH_LA"
TARGET_ALL_DIC = $(TARGET_DIC_LA_DIC)
!ELSEIF "$(LANG_ARGUMENT)"=="GERMAN"
TARGET_ALL_DIC = $(TARGET_DIC_GR_DIC)
!ELSEIF "$(LANG_ARGUMENT)"=="ENGLISH_UK"
TARGET_ALL_DIC = $(TARGET_DIC_UK_DIC)
!ENDIF

#ADDED for the build of NWSNOAA - a custom build  -DR 10/30/97
#ADDED LangArg test for build NWSNOAA LA -CJL 03/18/99
! IF "$(CUSTOM_ARGS)"=="NWSNOAA"
!IF "$(LANG_ARGUMENT)"=="ENGLISH_US"
TARGET_ALL_DIC = $(TARGET_NWS_US_DIC)
! ENDIF
! ENDIF

#ADDED for the build of NWSNOAA LA - a custom build  -CJL 03/18/99
! IF "$(CUSTOM_ARGS)"=="NWSNOAA"
!IF "$(LANG_ARGUMENT)"=="SPANISH_LA"
TARGET_ALL_DIC = $(TARGET_NWS_LA_DIC)
! ENDIF
! ENDIF

TARGET_DIC_US_DIC = dic_us.dic
TARGET_DIC_SP_DIC = dic_sp.dic
TARGET_DIC_LA_DIC = dic_la.dic
TARGET_DIC_GR_DIC = dic_gr.dic
TARGET_NWS_US_DIC = nws_us.dic
TARGET_NWS_LA_DIC = nws_la.dic
TARGET_DIC_UK_DIC = dic_uk.dic

TARGET_ALL_DTU = $(TARGET_PERSONAL_DTU)

TARGET_PERSONAL_DTU = $(SRCS_PERSONAL_DTU:.tab=.dtu)

TARGET_ALL_DLL = dtpc.dll

TARGET_ALL_VTM = vtm_i.exe\
 vtm_f.exe

!IF "$(PRODUCT_ARGUMENT)"=="DTPC1"
TARGET_ALL_PCBOOT = pcboot.exe
!ENDIF
!IF "$(PRODUCT_ARGUMENT)"=="DTPC2"
TARGET_ALL_PCBOOT = pcboot.exe
!ENDIF
TARGET_ALL_HEXOBJ = hexobj.exe
#TARGET_ALL_MKBOOT = mkboot.exe 
#TARGET_ALL_MKBOOT1 = mkboot1.exe
TARGET_ALL_PRIODIC = priodic.exe
 
# -----------------------------------------------------------
# TARGET_ALL_TXT and TARGET_ALL_BAT are macros for all .txt
#	and .bat files included in the process.
# -----------------------------------------------------------
TARGET_ALL_TXT = command.txt\
 readme.txt\
 uguide.txt\
 upgrade.txt\
 version.txt\
 vtm_i.txt\
 vtm_f.txt\
 $(TARGET_FILEORGN_TXT)

TARGET_ALL_BAT = dt.bat\
 mt.bat\
 sdt.bat\
 user_dic.bat\
 verscopy.bat

# -----------------------------------------------------------
# This section defines macros for KIT building using DTPCKITS.MAK
# -----------------------------------------------------------
# TOOLKIT_xxx_yyy are macros for all kit files. xxx is the target
#	subdirectory on the destination distribution disk. yyy is the
#	file type (txt, exe, etc.). a yyy of ALL is a macro of all
#	the macros of the subdirectory group.
# -----------------------------------------------------------
TOOLKIT_ROOT =$(KIT_DISK)\temptkit

TOOLKIT_DIR = \
 $(TOOLKIT_ROOT)\
 $(TOOLKIT_ROOT)\bbs\
 $(TOOLKIT_ROOT)\cdrom\
 $(TOOLKIT_ROOT)\demo\
 $(TOOLKIT_ROOT)\diction\
 $(TOOLKIT_ROOT)\digitize\
 $(TOOLKIT_ROOT)\dll\
 $(TOOLKIT_ROOT)\dll\demo\
 $(TOOLKIT_ROOT)\dt_specs\
 $(TOOLKIT_ROOT)\multbord\
 $(TOOLKIT_ROOT)\multbord\demo\
 $(TOOLKIT_ROOT)\phone\
 $(TOOLKIT_ROOT)\phone\multbord\
 $(TOOLKIT_ROOT)\phone\multbord\demo\
 $(TOOLKIT_ROOT)\ref_man\
 $(TOOLKIT_ROOT)\ref_man\ref_chap\
 $(TOOLKIT_ROOT)\shrt_cmd\
 $(TOOLKIT_ROOT)\songs\
 $(TOOLKIT_ROOT)\tape_rec\
 $(TOOLKIT_ROOT)\plugplay\
 $(TOOLKIT_ROOT)\gen_man

TOOLKIT_ALL = $(TOOLKIT_TOP_ALL)\
 $(TOOLKIT_BBS_ALL)\
 $(TOOLKIT_CDROM_ALL)\
 $(TOOLKIT_DEMO_ALL)\
 $(TOOLKIT_DICTION_ALL)\
 $(TOOLKIT_DIGITIZE_ALL)\
 $(TOOLKIT_DLL_ALL)\
 $(TOOLKIT_DLL_DEMO_ALL)\
 $(TOOLKIT_DT_SPECS_ALL)\
 $(TOOLKIT_MULTBORD_ALL)\
 $(TOOLKIT_MULTBORD_DEMO_ALL)\
 $(TOOLKIT_PHONE_ALL)\
 $(TOOLKIT_PHONE_MULT_BRD_ALL)\
 $(TOOLKIT_PHONE_MULT_BRD_DEMO_ALL)\
 $(TOOLKIT_PLUGPLAY_ALL)\
 $(TOOLKIT_REF_MAN_ALL)\
 $(TOOLKIT_REF_MAN_REF_CHAP_ALL)\
 $(TOOLKIT_SHRT_CMD_ALL)\
 $(TOOLKIT_SONGS_ALL)\
 $(TOOLKIT_TAPE_REC_ALL)\
 $(TOOLKIT_GEN_MAN_ALL)

TOOLKIT_TOP_ALL = $(TOOLKIT_TOP_TXT)

TOOLKIT_TOP_TXT = progrmng.txt\
 toolkit.txt\
 v41_read.me\
 v42_read.me\
 develop.txt\
 unzip.txt\
 readme.txt

TOOLKIT_BBS_ALL = $(TOOLKIT_BBS_TXT)

TOOLKIT_BBS_TXT = bbs.txt

TOOLKIT_CDROM_ALL = $(TOOLKIT_CDROM_TXT)\
 $(TOOLKIT_CDROM_EXE)
 
TOOLKIT_CDROM_TXT = cd_rom.txt

TOOLKIT_CDROM_EXE = dt_driv.exe\
 dt_conf.exe

TOOLKIT_DEMO_ALL = $(TOOLKIT_DEMO_EXE)\
 $(TOOLKIT_DEMO_SRC)
                                        
TOOLKIT_DEMO_EXE = demo_us.exe

TOOLKIT_DEMO_SRC = $(TOOLKIT_DEMO_SRC2)\
 dtcommon.c\
 dtdemp.h\
 dttsr.h

TOOLKIT_DEMO_SRC2 = demo_us.c

TOOLKIT_DICTION_ALL = $(TOOLKIT_DICTION_TXT)\
 $(TOOLKIT_DICTION_EXE)

TOOLKIT_DICTION_TXT = personal.txt\
 dict_utl.txt\
 user_dic.bat\
 personal.tab
 
TOOLKIT_DICTION_EXE = udic_us.exe\
 personal.dtu\
 udic_sp.exe\
 udic_la.exe\
 udic_gr.exe\
 udic_uk.exe
             
TOOLKIT_DIGITIZE_ALL = $(TOOLKIT_DIGITIZE_TXT)\
 $(TOOLKIT_DIGITIZE_SRC)\
 $(TOOLKIT_DIGITIZE_EXE)

TOOLKIT_DIGITIZE_TXT = digitize.txt

TOOLKIT_DIGITIZE_SRC = voc_main.c\
 voc_prot.h\
 dec.voc\
 tsr.h\
 wav_voc.c
 
TOOLKIT_DIGITIZE_EXE = dtvoc.exe

TOOLKIT_DLL_ALL = $(TOOLKIT_DLL_TXT)\
 $(TOOLKIT_DLL_WRI)\
 $(TOOLKIT_DLL_SRC)\
 $(TOOLKIT_DLL_EXE)\
 $(TOOLKIT_DTPCW_LIB)

TOOLKIT_DLL_TXT = dll.txt\
 dll_inst.txt

TOOLKIT_DLL_WRI = dll.wri

TOOLKIT_DLL_SRC = $(SRCS_DTPC_DLL)\
 $(SRCS_DTPC_RC)

TOOLKIT_DLL_EXE = dtpc.dll

TOOLKIT_DTPCW_LIB = dtpcw.lib

TOOLKIT_DLL_DEMO_ALL = $(TOOLKIT_DLL_DEMO_TXT)\
 $(TOOLKIT_DECTALK_INI)\
 $(TOOLKIT_DLL_DEMO_SRC)\
 $(TOOLKIT_DLL_DEMO_EXE)

TOOLKIT_DLL_DEMO_TXT = dll_demo.txt

TOOLKIT_DECTALK_INI= dectalk.ini

TOOLKIT_DLL_DEMO_SRC = $(SRCS_WSR_EXE)\
 $(SRCS_WSR_RC)\
 $(SRCS_WSR_ICO)\
 $(SRCS_WSR_DEF)

TOOLOKIT_DLL_DEMO_EXE = wsr.exe
 
TOOLKIT_DT_SPECS_ALL = $(TOOLKIT_DT_SPECS_TXT)

TOOLKIT_DT_SPECS_TXT = dt_specs.txt\
 dtx_spec.txt

TOOLKIT_MULTBORD_ALL = $(TOOLKIT_MULTBORD_TXT)\
 $(TOOLKIT_MULTBORD_EXE)

TOOLKIT_MULTBORD_TXT = $(TOOLKIT_PHONE_MULT_BRD_DEMO_TXT)\
 mt.bat\
 music.bat\
 music0.txt\
 music1.txt\
 music2.txt\
 music3.txt

TOOLKIT_MULTBORD_EXE = mul_read.exe

TOOLKIT_MULTBORD_DEMO_ALL = $(TOOLKIT_MULTBORD_DEMO_EXE)\
 $(TOOLKIT_MULTBORD_DEMO_SRC)

TOOLKIT_MULTBORD_DEMO_EXE = mdemo.exe

TOOLKIT_MULTBORD_DEMO_SRC = mdemo.c\
 mdemop.h

TOOLKIT_PHONE_ALL = $(TOOLKIT_PHONE_TXT)

TOOLKIT_PHONE_TXT = dialogic.doc\
 dialogic.txt\
 names.txt

TOOLKIT_PHONE_MULT_BRD_ALL = $(TOOLKIT_PHONE_MULT_BRD_TXT)\
 $(TOOLKIT_PHONE_MULT_BRD_EXE)

TOOLKIT_PHONE_MULT_BRD_TXT = mt.bat\
 $(TOOLKIT_PHONE_MULT_BRD_DEMO_TXT)

TOOLKIT_PHONE_MULT_BRD_EXE = mul_read.exe

TOOLKIT_PHONE_MULT_BRD_DEMO_ALL = $(TOOLKIT_PHONE_MULT_BRD_DEMO_TXT)\
 $(TOOLKIT_PHONE_MULT_BRD_DEMO_EXE)\
 $(TOOLKIT_PHONE_MULT_BRD_DEMO_SRC)

TOOLKIT_PHONE_MULT_BRD_DEMO_TXT = multibrd.txt

TOOLKIT_PHONE_MULT_BRD_DEMO_EXE = mdemo.exe

TOOLKIT_PHONE_MULT_BRD_DEMO_SRC = mdemo.c\
 mdemop.h

TOOLKIT_PLUGPLAY_ALL = $(TOOLKIT_PLUGPLAY_TXT)\
 $(TOOLKIT_PLUGPLAY_EXE)

TOOLKIT_PLUGPLAY_TXT = plugplay.txt

TOOLKIT_PLUGPLAY_EXE = !dtc07aa.cfg

TOOLKIT_REF_MAN_ALL = $(TOOLKIT_REF_MAN_TXT)

TOOLKIT_REF_MAN_TXT = ref_man.txt

TOOLKIT_REF_MAN_REF_CHAP_ALL = $(TOOLKIT_REF_MAN_REF_CHAP_TXT)

TOOLKIT_REF_MAN_REF_CHAP_TXT = chap_1.txt\
 chap_2.txt\
 chap_3.txt\
 chap_4.txt\
 chap_5.txt\
 chap_6.txt\
 chap_7.txt\
 contents.txt\
 intro.txt\
 title.txt\
 apndx_a.txt\
 apndx_b.txt\
 apndx_c.txt\
 apndx_d.txt\
 apndx_e.txt\
 apndx_f.txt

TOOLKIT_SHRT_CMD_ALL = $(TOOLKIT_SHRT_CMD_TXT)

TOOLKIT_SHRT_CMD_TXT = shrt_cmd.txt

TOOLKIT_SONGS_ALL = $(TOOLKIT_SONGS_TXT)

TOOLKIT_SONGS_TXT = phonemes.txt\
 scale.txt\
 singing.txt\
 vermont.txt\
 voc_ctrl.txt

TOOLKIT_TAPE_REC_ALL = $(TOOLKIT_TAPE_REC_TXT)

TOOLKIT_TAPE_REC_TXT = tape_lvl.txt

TOOLKIT_GEN_MAN_ALL = $(TOOLKIT_GEN_MAN_TXT)

TOOLKIT_GEN_MAN_TXT = command.txt\
 uguide.txt\
 kern.txt\
 lib.txt\
 cmd.txt\
 opersys.txt\
 globals.txt\
 baseforg.txt\
 basevorg.txt

# -----------------------------------------------------------
# This section defines macros for KIT building using DTPCKITS.MAK
# -----------------------------------------------------------
# LICKIT_BASIC_ENGLISH is a macro for all LICKITx files.
# LICKITRM.TXT is the macro for the README.TXT file.
# -----------------------------------------------------------
LICKIT_BASIC_ENGLISH = $(SRCS_DTPC_LIB)\
 $(SRCS_DTPC_LIB2)\
 $(SRCS_KERNEL_SYS)\
 $(SRCS_CMD_EXE)\
 $(SRCS_CMD_EXE2)\
 $(SRCS_USA_EXE)\
 $(SRCS_DT_CONF_EXE)\
 $(SRCS_DT_LOAD_EXE)\
 $(SRCS_DT_DRIV_EXE)\
 $(SRCS_DEMO_US_EXE)\
 $(SRCS_UDIC_US_EXE)\
 $(SRCS_START_US_EXE)\
 $(SRCS_DTVOC_EXE)\
 $(SRCS_MDEMO_EXE)\
 $(SRCS_MUL_READ_EXE)\
 $(SRCS_KERNEL_ASM)\
 $(SRCS_CMD_ASM)\
 $(SRCS_USA_ASM)\
 $(SRCS_PH_US_ASM_OK)\
 $(SRCS_PH_US_EXE_OK)\
 $(SRCS_LTS_US_ASM_OK)\
 $(SRCS_LTS_US_EXE_OK)\
 $(SRCS_MAK)\
 $(SRCS_DIC_US_DIC:.zip=.dic)\
 $(SRCS_PERSONAL_DTU:.tab=.dtu)

LICKIT_LICKITRM_TXT = lickitrm.txt

TARGET_FILEORGN_TXT = fileorgn.txt
# -----------------------------------------------------------
#	DDB (Make A Product Install Disk Files)
#	At present, the install still is run manually.
# -----------------------------------------------------------
INSTALL_DDB_CFG = ddb.cfg

INSTALL_INSTALL_DAT = install.dat

# WARNING: THIS IS *NOT* AN NMAKE MAKe FILE. IT IS INCLUDED!
# -----------------------------------------------------------

