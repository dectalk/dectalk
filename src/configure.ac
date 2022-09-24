dnl
dnl Configure template for DECtalk
dnl this is a comment.  Weird huh?
dnl *********************************************************************
dnl *   File Name:      configure.in
dnl *   Author:		Eric Thompson
dnl *   Creation Date:	10/22/1998
dnl *
dnl *   Functionality:
dnl *  	Process this file with autoconf to produce a configure script. 
dnl *	The configure script produces various Makefile from various Makefile.in
dnl *
dnl *********************************************************************
dnl *    Revision History:
dnl *
dnl *  Rev  Who		Date		Description
dnl *  ---  ------	-----------	----------------------------------
dnl *  000  ETT		10/22/1998	produces Makefiles for x86 linux (elf)
dnl *  001  ETT		11/04/1998	produces Makefiles for alpha linux
dnl *  002  ETT		11/17/1998	arm linux for the itsy (aout)
dnl *  003  ET		11/23/1998	Digital Unix 4.0[d,e]
dnl *  004  ETT		11/24/1998	fix linux again
dnl *  005  ETT		12/04/1998	added stuff for speak, etc.
dnl *  006  ETT		12/07/1998	added yet another variable for osf
dnl *							SO_LOCATIONS, I tell ya...
dnl *  007  NAL         04/10/2000      Added stuff for gspeakdemos
dnl *  008  MGS         05/26/2000      Added windict stuff
dnl *  009  MGS		03/29/2001	Added stuff for french and windic and ml location
dnl *  010  MGS		06/19/2001	Solaris Port BATS#972
dnl *********************************************************************
dnl * see: http://www.sdsu.edu/doc/texi/autoconf_toc.html 
dnl * for help and documentation.

dnl AC_REVISION([configure.in 0.01])   

dnl AC_INIT always has to be first. except AC_REVISION
dnl the filename specified here is just so that autoconf
dnl is sure that this is _actually_ the src dir
AC_INIT(
	DECtalk,
	m4_esyscmd_s(echo $(git describe --always)$(git status --porcelain | awk '{if ($1 == "M") {print "-dirty";exit}}')),
	https://github.com/dectalk/dectalk/issues,
	,
	https://github.com/dectalk/dectalk)

dnl Determine the system type and set output variables to the names 
dnl of the canonical system types.
dnl build, host, target 
dnl      the canonical system names; 
dnl build_alias, host_alias, target_alias 
dnl      the names user specified, or canonical names from config.guess 
dnl build_cpu, build_vendor, build_os 
dnl host_cpu, host_vendor, host_os 
dnl target_cpu, target_vendor, target_os 
dnl      the individual parts of the canonical names (for convenience). 
AC_CANONICAL_SYSTEM
dnl AC_CANONICAL_SYSTEM requires config.guess and config.sub shell scripts

dnl Determine a C compiler to use. If CC is not already set in the environment,
dnl check for gcc, and use cc if that's not found. Set output variable CC 
dnl to the name of the compiler found.  
AC_PROG_CC
case "$target" in
	arm-ipaq-linux-*) CC="/skiff/local/bin/arm-linux-gcc" ;;
dnl use the itsy cross compiler.
esac

dnl If the C compiler does not accept the `-c' and `-o' options 
dnl simultaneously, define NO_MINUS_C_MINUS_O. 
AC_PROG_CC_C_O

dnl Set output variable CPP to a command that runs the C preprocessor. 
dnl If `$CC -E' doesn't work, it uses `/lib/cpp'. It is only portable 
dnl to run CPP on files with a `.c' extension.
dnl AC_PROG_CPP

dnl If `ln -s' works on the current filesystem, set output variable LN_S 
dnl to `ln -s', otherwise set it to `ln'.
AC_PROG_LN_S 

dnl Set output variable RANLIB to `ranlib' if ranlib is found, 
dnl otherwise to `:' (do nothing). 
AC_PROG_RANLIB 

dnl these are single backquotes!
dnl OS_VERSION=`uname -srm`
OS_VERSION=`uname -r`
AC_SUBST(OS_VERSION)dnl

dnl don't put a slash on the end of this dir.  
dnl it shouldn't matter but why chance it?
BUILD_DIR=`pwd`"/dapi/build"
case "$target" in
	arm-ipaq-linux-*) BUILD_DIR=`pwd`"/dapi/build" ;;
	arm-itsy-linux-*) BUILD_DIR=`pwd`"/dapi/build" ;;
esac
AC_SUBST(BUILD_DIR)dnl

dnl Set a configuration headers file
AC_CONFIG_HEADERS([config.h])

dnl Looks like some people need the "PREFIX" to build packages
dnl TODO: Define "/opt/dectalk" only once as a variable
AC_PREFIX_DEFAULT(["/opt/dectalk"])

DEFINES=" -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D\$(LANGUAGE) -DDECTALK_INSTALL_PREFIX=\\\"\$(DECTALK_INSTALL_PREFIX)\\\" -DACCESS32 -DTYPING_MODE" 
case "$target" in
	sparc-sun-*) DEFINES=" -DLTSSIM -D_SPARC_SOLARIS_ -D_BIGENDIAN_ -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D\$(LANGUAGE) -DDECTALK_INSTALL_PREFIX=\\\"\$(DECTALK_INSTALL_PREFIX)\\\" -DACCESS32 -DTYPING_MODE" ;;
	powerpc-apple-*) DEFINES=" -DLTSSIM -D_APPLE_MAC_ -D_BIGENDIAN_ -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D\$(LANGUAGE) -DDECTALK_INSTALL_PREFIX=\\\"\$(DECTALK_INSTALL_PREFIX)\\\" -DACCESS32 -DTYPING_MODE -dynamic" ;;
	arm-ipaq-linux-*) DEFINES=" -D_REENTRANT -D_GNU_SOURCE -DNOMME -D__ipaq__ -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D\$(LANGUAGE) -DDECTALK_INSTALL_PREFIX=\\\"\$(DECTALK_INSTALL_PREFIX)\\\" -DACCESS32 -DTYPING_MODE" ;;
	*-*-linux-*) DEFINES=" -D_REENTRANT -DNOMME -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D\$(LANGUAGE) -DDECTALK_INSTALL_PREFIX=\\\"\$(DECTALK_INSTALL_PREFIX)\\\" -DACCESS32 -DTYPING_MODE" ;;
esac
AC_SUBST(DEFINES)dnl

LICENSE_DEFINES=""
case "$target" in
	*-*-linux-*) LICENSE_DEFINES="";;
	sparc-sun-*) LICENSE_DEFINES="-D_SPARC_SOLARIS_ -D_BIGENDIAN_";;
	powerpc-apple-*) LICENSE_DEFINES="-D_SPARC_SOLARIS_ -D_BIGENDIAN_";;
esac
AC_SUBST(LICENSE_DEFINES)dnl

LICENSE_ALL="\$(OUTPUT_DIR)/licenin1 \$(OUTPUT_DIR)/licenin3 \
            \$(OUTPUT_DIR)/licenin7 \$(OUTPUT_DIR)/installer"
case "$target" in
	alpha-dec-osf*) LICENSE_ALL="";;
esac
AC_SUBST(LICENSE_ALL)dnl
	
DEBUG_FLAGS=" -G3 -migrate"
case "$target" in
	arm-ipaq-linux-*) DEBUG_FLAGS=" -g -fPIC -D__ipaq__";;
	arm-*-linux-*) DEBUG_FLAGS=" -g -fPIC";;
	x86_64-*-linux-*) DEBUG_FLAGS=" -g -fPIC" ;;
	*-*-linux-*) DEBUG_FLAGS=" -g" ;;
	sparc-sun-*) DEBUG_FLAGS=" -g" ;;
	powerpc-apple-*) DEBUG_FLAGS=" -g" ;;
esac
AC_SUBST(DEBUG_FLAGS)dnl

OPTO_FLAGS=" -O2"
case "$target" in
	sparc-sun-*) OPTO_FLAGS="-O2" ;;
esac
AC_SUBST(OPTO_FLAGS)dnl

PLATFORM_DEFS=""
case "$target" in
	sparc-sun-*) PLATFORM_DEFS="-D_SPARC_SOLARIS_ -D_BIGENDIAN_" ;;
	powerpc-apple-*) PLATFORM_DEFS="-D_SPARC_SOLARIS_ -D_BIGENDIAN_" ;;
esac
AC_SUBST(PLATFORM_DEFS)dnl

ALIGN_OPT=""
case "$target" in
	sparc-sun-*) ALIGN_OPT="" ;;
esac
AC_SUBST(ALIGN_OPT)dnl

WARN_FLAGS=" -threads -w1"
case "$target" in
	*-*-linux-*) WARN_FLAGS=" -Wall -Wno-missing-braces -Wno-pointer-sign -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-function" ;;
	powerpc-apple-*) WARN_FLAGS=" -Wall" ;;
	sparc-sun-*) WARN_FLAGS=" " ;;
esac
AC_SUBST(WARN_FLAGS)dnl

PH_VTM_OPTO_FLAGS=" -O2"
case "$target" in
	sparc-sun-*) PH_VTM_OPTO_FLAGS="-O2" ;;
	powerpc-apple-*) PH_VTM_OPTO_FLAGS="-O2" ;;
dnl for some reason the itsy ph and vtm files can't be optimized too far.
esac
AC_SUBST(PH_VTM_OPTO_FLAGS)dnl

dnl the dictionary compiler must be built for host not target
DIC_CC="gcc"
case "$target" in
	sparc-sun-*) DIC_CC="gcc" ;;
	alpha-dec-osf*) DIC_CC="cc" ;;
esac
AC_SUBST(DIC_CC)dnl

case "$target" in
	arm-ipaq-linux-*) RANLIB="/skiff/local/bin/arm-linux-ranlib" ;;
dnl use the itsy ranlib.
esac

LD="ld"
case "$target" in
	arm-ipaq-linux-*) LD="/skiff/local/bin/arm-linux-ld" ;;
dnl use the itsy dynamic linker.
esac
AC_SUBST(LD)dnl

AR="ar cqls"
case "$target" in
	arm-ipaq-linux-*) AR="/skiff/local/bin/arm-linux-ar cqls" ;;
	powerpc-apple-*) AR="ar ruvs" ;;
dnl use the itsy archiver.
esac
AC_SUBST(AR)dnl

STD_INCLUDE="/usr/include/"
case "$target" in
	arm-ipaq-linux-*) STD_INCLUDE="/skiff/local/arm-linux/include" ;;
dnl the itsy cross compiler knows where to get the std includes.
esac
STD_INCLUDE="${PWD}/build/\$(LANG_CODE)/include/"
AC_SUBST(STD_INCLUDE)dnl

MME_DIR="."
case "$target" in
	alpha-dec-osf*) MME_DIR="/usr/include/mme" ;;
esac
AC_SUBST(MME_DIR)dnl

LINUX_AUDIO=""
case "$target" in
	sparc-sun-*) LINUX_AUDIO="\$(OUTPUT_DIR)/linux_audio.o" ;;
	powerpc-apple-*) LINUX_AUDIO="\$(OUTPUT_DIR)/linux_audio.o" ;;
	*-*-linux-*) LINUX_AUDIO="\$(OUTPUT_DIR)/linux_audio.o" ;;
esac
AC_SUBST(LINUX_AUDIO)dnl

LINK_LINUX_AUDIO=""
case "$target" in
	alpha-*-linux-*) LINK_LINUX_AUDIO="" ;;
	powerpc-apple-*) LINK_LINUX_AUDIO="" ;;
	sparc-sun-*) LINK_LINUX_AUDIO="\$(OUTPUT_DIR_2)/linux_audio.o" ;;
	*-*-linux-*) LINK_LINUX_AUDIO="\$(OUTPUT_DIR_2)/linux_audio.o" ;;
esac
AC_SUBST(LINK_LINUX_AUDIO)dnl

LINK_PORT_AUDIO=""
case "$target" in
	alpha-*-linux-*) LINK_PORT_AUDIO="" ;;
	powerpc-apple-*) LINK_PORT_AUDIO="portaudio/lib/libportaudio.a" ;;
	sparc-sun-*) LINK_PORT_AUDIO="" ;;
	*-*-linux-*) LINK_PORT_AUDIO="" ;;
esac
AC_SUBST(LINK_PORT_AUDIO)dnl

API_OBJ_IN="\$(OUTPUT_DIR)/ttsapi.o \$(OUTPUT_DIR)/ttsapi_mme.o\
          \$(OUTPUT_DIR)/decstd97.o \$(OUTPUT_DIR)/init.o \
          \$(OUTPUT_DIR)/crypt2.o"
case "$target" in
	sparc-sun-*)API_OBJ_IN="\$(OUTPUT_DIR)/ttsapi_mme.o \
			\$(OUTPUT_DIR)/decstd97.o \$(OUTPUT_DIR)/ttsapi_demo.o\
			\$(OUTPUT_DIR)/init.o \$(OUTPUT_DIR)/crypt2.o \
			\$(OUTPUT_DIR)/init_demo.o " ;;
	powerpc-apple-*)API_OBJ_IN="\$(OUTPUT_DIR)/ttsapi_mme.o \
			\$(OUTPUT_DIR)/decstd97.o \$(OUTPUT_DIR)/ttsapi_demo.o\
			\$(OUTPUT_DIR)/init.o \$(OUTPUT_DIR)/crypt2.o \
			\$(OUTPUT_DIR)/init_demo.o " ;;
	*-*-linux-*)API_OBJ_IN="\$(OUTPUT_DIR)/ttsapi_mme.o \
			\$(OUTPUT_DIR)/decstd97.o \$(OUTPUT_DIR)/ttsapi_demo.o\
			\$(OUTPUT_DIR)/init.o \$(OUTPUT_DIR)/crypt2.o \
			\$(OUTPUT_DIR)/init_demo.o " ;;
esac
AC_SUBST(API_OBJ_IN)dnl

ALL_LIB_OBJS="\$(API_ALL_OBJ) \$(API_MME_OBJ) \$(API_TTS_OBJ) \$(CMD_OBJ) \
	      \$(LTS_OBJ) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \$(NT_OBJ) \
              \$(NT_MME_OBJ) \$(OSF_OBJ) \$(OSF_TTS_OBJ) \$(VTM_OBJ) \
              \$(LTS_NORM_OBJS) \$(LTS_DEMO_OBJS)"
case "$target" in
	sparc-sun-*)ALL_LIB_OBJS="\$(API_ALL_OBJ) \$(API_MME_OBJ) \$(CMD_OBJ) \
	      \$(LTS_OBJ) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \$(NT_OBJ) \
              \$(NT_MME_OBJ) \$(OSF_OBJ) \$(OSF_TTS_OBJ) \$(VTM_OBJ) \
              \$(LTS_NORM_OBJS) \$(LTS_DEMO_OBJS)" ;;
	powerpc-apple-*)ALL_LIB_OBJS="\$(API_ALL_OBJ) \$(API_MME_OBJ) \$(CMD_OBJ) \
	      \$(LTS_OBJ) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \$(NT_OBJ) \
              \$(NT_MME_OBJ) \$(OSF_OBJ) \$(OSF_TTS_OBJ) \$(VTM_OBJ) \
              \$(LTS_NORM_OBJS) \$(LTS_DEMO_OBJS)" ;;
	*-*-linux-*)ALL_LIB_OBJS="\$(API_ALL_OBJ) \$(API_MME_OBJ) \$(CMD_OBJ) \
	      \$(LTS_OBJ) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \$(NT_OBJ) \
              \$(NT_MME_OBJ) \$(OSF_OBJ) \$(OSF_TTS_OBJ) \$(VTM_OBJ) \
              \$(LTS_NORM_OBJS) \$(LTS_DEMO_OBJS)" ;;
esac
AC_SUBST(ALL_LIB_OBJS)dnl

LIB_LN_S_A_DIR="/usr/lib"
case "$target" in
	arm-ipaq-linux-*)LIB_LN_S_A_DIR="/skiff/local/arm-linux/lib" ;;
	*-*-linux-*)LIB_LN_S_A_DIR="/usr/local/lib" ;;
esac
LIB_LN_S_A_DIR="${PWD}/build/\$(LANG_CODE)/lib"
AC_SUBST(LIB_LN_S_A_DIR)dnl

LIB_LN_S_SO_DIR="/usr/lib"
case "$target" in
	arm-ipaq-linux-*)LIB_LN_S_SO_DIR="/skiff/local/arm-linux/lib" ;;
	*-*-linux-*)LIB_LN_S_SO_DIR="/usr/local/lib" ;;
esac
LIB_LN_S_SO_DIR="${PWD}/build/\$(LANG_CODE)/lib"
AC_SUBST(LIB_LN_S_SO_DIR)dnl

INC_LN_S_DIR="/usr/include/dtk"
case "$target" in
	arm-ipaq-linux-*)INC_LN_S_DIR="/skiff/local/arm-linux/include/dtk" ;;
esac
INC_LN_S_DIR="${PWD}/build/\$(LANG_CODE)/include/dtk"
AC_SUBST(INC_LN_S_DIR)dnl

MME_COMPILE_FLAGS=""
case "$target" in
	alpha-dec-osf*) MME_COMPILE_FLAGS=" -DMME_SERVER -DUSE_MME_SERVER" ;;
	*-*-linux-*) MME_COMPILE_FLAGS="" ;;
esac
AC_SUBST(MME_COMPILE_FLAGS)dnl

dnl linux only builds mme libraries.
DAPI_SRC_ALL="/usr/lib/libtts_\$(LANG_CODE).a \
	/usr/lib/libttsmme_\$(LANG_CODE).a /usr/shlib/libtts_\$(LANG_CODE).so \
	/usr/shlib/libttsmme_\$(LANG_CODE).so"
case "$target" in
	arm-ipaq-linux-*) DAPI_SRC_ALL="\$(OUTPUT_DIR)/libtts_\$(LANG_CODE).a \
	\$(OUTPUT_DIR)/libtts_\$(LANG_CODE).so \$(LIB_LN_S_A_DIR)/libtts_\$(LANG_CODE).a\
	\$(SHLIB)/libtts_\$(LANG_CODE).so \$(LIB_LN_S_A_DIR)/libtts_demo_\$(LANG_CODE).a" ;;
	*-*-linux-*) DAPI_SRC_ALL="\$(OUTPUT_DIR)/libtts_\$(LANG_CODE).a \
	\$(OUTPUT_DIR)/libtts_\$(LANG_CODE).so \$(LIB_LN_S_A_DIR)/libtts_\$(LANG_CODE).a\
	\$(SHLIB)/libtts_\$(LANG_CODE).so \$(LIB_LN_S_A_DIR)/libtts_demo_\$(LANG_CODE).a" ;;
	sparc-sun-*) DAPI_SRC_ALL="\$(OUTPUT_DIR)/libtts_\$(LANG_CODE).a \
	\$(OUTPUT_DIR)/libtts_\$(LANG_CODE).so \$(LIB_LN_S_A_DIR)/libtts_\$(LANG_CODE).a\
	\$(SHLIB)/libtts_\$(LANG_CODE).so \$(LIB_LN_S_A_DIR)/libtts_demo_\$(LANG_CODE).a" ;;
	powerpc-apple-*) DAPI_SRC_ALL="\$(OUTPUT_DIR)/libtts_\$(LANG_CODE).a \
	\$(OUTPUT_DIR)/libtts_\$(LANG_CODE).so \$(LIB_LN_S_A_DIR)/libtts_\$(LANG_CODE).a\
	\$(SHLIB)/libtts_\$(LANG_CODE).so \$(LIB_LN_S_A_DIR)/libtts_demo_\$(LANG_CODE).a" ;;
esac
AC_SUBST(DAPI_SRC_ALL)dnl

dnl linux only links mme libs but they have to be called libtts_$(lang).*
DECTALK_TTS_OBJS="\$(API_ALL_OBJ) \$(API_TTS_OBJ) \$(CMD_OBJ) \$(LTS_OBJ) \
	\$(LTS_NORM_OBJS) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \$(NT_OBJ) \$(OSF_OBJ) \
	\$(OSF_TTS_OBJ) \$(VTM_OBJ)"

DECTALK_MME_OBJS="\$(API_ALL_OBJ) \$(API_MME_OBJ) \$(CMD_OBJ) \$(LTS_OBJ) \
	\$(LTS_NORM_OBJS) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \$(NT_OBJ) \
	\$(NT_MME_OBJ) \$(OSF_OBJ) \$(VTM_OBJ)"
dnl so build the libtts_*.? but give the linker the MME objects.
case "$target" in
	*-*-linux-*) DECTALK_TTS_OBJS="\$(API_ALL_OBJ) \$(API_MME_OBJ) \
	\$(CMD_OBJ) \$(LTS_OBJ) \$(LTS_NORM_OBJS) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \
	\$(NT_OBJ) \$(NT_MME_OBJ) \$(OSF_OBJ) \$(VTM_OBJ)" ;;
	sparc-sun-*) DECTALK_TTS_OBJS="\$(API_ALL_OBJ) \$(API_MME_OBJ) \
	\$(CMD_OBJ) \$(LTS_OBJ) \$(LTS_NORM_OBJS) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \
	\$(NT_OBJ) \$(NT_MME_OBJ) \$(OSF_OBJ) \$(VTM_OBJ)" ;;
	powerpc-apple-*) DECTALK_TTS_OBJS="\$(API_ALL_OBJ) \$(API_MME_OBJ) \
	\$(CMD_OBJ) \$(LTS_OBJ) \$(LTS_NORM_OBJS) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \
	\$(NT_OBJ) \$(NT_MME_OBJ) \$(OSF_OBJ) \$(VTM_OBJ)" ;;
esac
AC_SUBST(DECTALK_TTS_OBJS)dnl
AC_SUBST(DECTALK_MME_OBJS)dnl

DECTALK_DEMO_OBJS="\$(API_ALL_OBJ) \$(API_MME_OBJ) \
	\$(CMD_OBJ) \$(LTS_OBJ) \$(LTS_DEMO_OBJS) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \
	\$(NT_OBJ) \$(NT_MME_OBJ) \$(OSF_OBJ) \$(VTM_OBJ)"
case "$target" in
	powerpc-apple-*) DECTALK_DEMO_OBJS="\$(API_ALL_OBJ) \$(API_DEMO_OBJ) \
	\$(CMD_OBJ) \$(LTS_OBJ) \$(LTS_DEMO_OBJS) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \
	\$(NT_OBJ) \$(OSF_OBJ) \$(NT_MME_OBJ) \$(VTM_OBJ)" ;;
	sparc-sun-*) DECTALK_DEMO_OBJS="\$(API_ALL_OBJ) \$(API_DEMO_OBJ) \
	\$(CMD_OBJ) \$(LTS_OBJ) \$(LTS_DEMO_OBJS) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \
	\$(NT_OBJ) \$(OSF_OBJ) \$(NT_MME_OBJ) \$(VTM_OBJ)" ;;
	*-*-linux-*) DECTALK_DEMO_OBJS="\$(API_ALL_OBJ) \$(API_DEMO_OBJ) \
	\$(CMD_OBJ) \$(LTS_OBJ) \$(LTS_DEMO_OBJS) \$(PH_OBJ) \$(HL_OBJ) \$(KERNEL_OBJ) \
	\$(NT_OBJ) \$(NT_MME_OBJ) \$(OSF_OBJ) \$(VTM_OBJ)" ;;
esac
AC_SUBST(DECTALK_DEMO_OBJS)dnl


dnl always use the "-lpthread" NOT "-lpthreads" in linux
MMELIBS=" -lmme"
case "$target" in
	*-*-linux-*) MMELIBS=" -lpthread -lm" ;;
	powerpc-apple-*) MMELIBS=" -lpthread" ;;
	sparc-sun-*) MMELIBS=" " ;;
esac
AC_SUBST(MMELIBS)dnl

LIBS=" -llmf -lpthreads -lmach -lexc -lc -lrt -lots"
case "$target" in 
	arm-ipaq-linux-*) LIBS=" -lpthread -L/skiff/local/lib/gcc-lib/arm-linux/2.95.2/ -lgcc" ;;
	*-*-linux-*) LIBS=" -lpthread -lm" ;;
	powerpc-apple-*) LIBS=" -lpthread -L../../../dapi/src/portaudio/lib -lportaudio -framework CoreAudio -framework AudioToolbox" ;;
	sparc-sun-*) LIBS=" " ;;
esac
AC_SUBST(LIBS)dnl

DT_SO_LIBS=" -llmf -lpthreads -lmach -lexc -lc -lrt -lots"
case "$target" in 
	arm-ipaq-linux-*) DT_SO_LIBS=" \$(OUTPUT_DIR)/libtts_\$(LANG_CODE).a -lpthread -lc -L/skiff/local/lib/gcc-lib/arm-linux/2.95.2/ -lgcc -lfloat -lm" ;;
	*-*-linux-*) DT_SO_LIBS=" -lpthread -lc" ;;
	powerpc-apple-*) DT_SO_LIBS="-lpthread -Lportaudio/lib -lportaudio -framework CoreAudio -framework AudioToolbox" ;;
	sparc-sun-*) DT_SO_LIBS=" \$(OUTPUT_DIR)/libtts_\$(LANG_CODE).a -lpthread -lc -lrt -lm" ;;
esac
AC_SUBST(DT_SO_LIBS)dnl

SHLIB="/usr/shlib"
case "$target" in
	arm-ipaq-linux-*) SHLIB="/skiff/local/arm-linux/lib" ;;
	*-*-linux-*) SHLIB="/usr/local/lib" ;;
	sparc-sun-*) SHLIB="/usr/lib" ;;
	powerpc-apple-*) SHLIB="/usr/lib" ;;
esac
SHLIB="${PWD}/build/\$(LANG_CODE)/lib"
AC_SUBST(SHLIB)dnl

SO_LOCATIONS=" \$(CP) /usr/shlib/so_locations ."
case "$target" in
	*-*-linux-*) SO_LOCATIONS="" ;;
	sparc-sun-*) SO_LOCATIONS="" ;;
	powerpc-apple-*) SO_LOCATIONS="" ;;
esac
AC_SUBST(SO_LOCATIONS)dnl

DAPI_LD_SHARED="\$(LD) -shared -update_registry \
	./so_locations -hidden \
	-soname libtts_\$(LANG_CODE).so -o \$@ \$(DECTALK_TTS_OBJS) \$(LIBS)"
case "$target" in
	*-*-linux-*) DAPI_LD_SHARED="\$(LD) -shared -Bsymbolic -soname \
		libtts_\$(LANG_CODE).so -o \$@ \$(DECTALK_TTS_OBJS) \$(LIBS) -lm" ;;
	powerpc-apple-*) DAPI_LD_SHARED="\$(CC) -dynamic -dynamiclib -dylib \
		-o \$@ \$(DECTALK_TTS_OBJS) \$(LIBS)" ;;
	sparc-sun-*) DAPI_LD_SHARED="\$(LD) -G -Bsymbolic \
		-o \$@ \$(DECTALK_TTS_OBJS) \$(LIBS)" ;;
esac
AC_SUBST(DAPI_LD_SHARED)dnl

dnl *  ML crap-a-roni goes below here.  what a nightmare!

ML_ALL="/usr/lib/libtts.a /usr/lib/libttsmme.a \$(SHLIB)/libtts.so \$(SHLIB)/libttsmme.so"
case "$target" in
	arm-ipaq-linux-*) ML_ALL="\$(LIB_LN_S_A_DIR)/libtts.a \$(SHLIB)/libtts.so" ;;
	*-*-linux-*) ML_ALL="\$(LIB_LN_S_A_DIR)/libtts.a \$(SHLIB)/libtts.so" ;;
	sparc-sun-*) ML_ALL="\$(LIB_LN_S_A_DIR)/libtts.a \$(SHLIB)/libtts.so" ;;
	powerpc-apple-*) ML_ALL="\$(LIB_LN_S_A_DIR)/libtts.a \$(SHLIB)/libtts.so" ;;
esac
AC_SUBST(ML_ALL)dnl

dnl: see how simple this is for linux?
ML_TTS_SO="\$(LD) -shared -Bsymbolic -soname libtts.so \
	-o \$@ ../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/dtalk_ml.o \
	../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/init.o \
	../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/libtts.a  -ldl -lpthread -lc --rpath=\\\$\$ORIGIN/ --rpath=\\\$\$ORIGIN/../lib/ -lm"
case "$target" in
	alpha-dec-osf4.0) ML_TTS_SO="\$(LD) \$(LD_FLAGS) -shared -update_registry ./so_locations \
		-soname libtts.so -o \$@ ../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/dtalk_ml.o \
		../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/init.o \
		../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/libtts.a -lc -lots -lpthread" ;;
	alpha-dec-osf3.2) ML_TTS_SO="\$(LD) \$(LD_FLAGS) -shared -update_registry ./so_locations \
		-soname libtts.so -o \$@ ../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/dtalk_ml.o \
		../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/init.o \
		../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/libtts.a -lc -lots -lpthreads" ;;
	powerpc-apple-*) ML_TTS_SO="\$(CC) -dynamic -dynamiclib -dylib \
	-o \$@ ../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/dtalk_ml.o \
	../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/init.o \
	../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/libtts.a  -ldl -lpthread -lc" ;;
	sparc-sun-*) ML_TTS_SO="\$(LD) -G -Bsymbolic \
	-o \$@ ../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/dtalk_ml.o \
	../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/init.o \
	../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/libtts.a  -ldl -lpthread -lc" ;;
esac
AC_SUBST(ML_TTS_SO)dnl

ML_TTS_MME_SO=""
case "$target" in
	alpha-dec-osf4.0) ML_TTS_MME_SO="\$(LD) \$(LD_FLAGS) -shared -update_registry ./so_locations \
		-soname libttsmme.so -o \$@ ../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/dtalk_ml_mme.o \
		../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/init.o \
		../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/libttsmme.a -lc -lots -lpthread" ;; 
	alpha-dec-osf3.2) ML_TTS_MME_SO="\$(LD) \$(LD_FLAGS) -shared -update_registry ./so_locations \
		-soname libttsmme.so -o \$@ ../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/dtalk_ml_mme.o \
		../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/link/init.o \
		../build/\$(OS_VERSION)/\$(LANG_CODE)/\$(ML_OUT)/libttsmme.a -lc -lots -lpthreads" ;;
esac

AC_SUBST(ML_TTS_MME_SO)dnl

DTALK_ML="\$(CC) -c \$(CFLAGS) -o \$@ \$?"
case "$target" in
	alpha-dec-osf4.0) DTALK_ML="\$(CC) -c \$(CFLAGS) -pthread -DBLD_ML_DLL -o \$@ \$?" ;;
	alpha-dec-osf3.2) DTALK_ML="\$(CC) -c \$(CFLAGS) -o \$@ \$?" ;;
esac
AC_SUBST(DTALK_ML)dnl

DTALK_ML_MME=""
case "$target" in
	alpha-dec-osf4.0) DTALK_ML_MME="\$(CC) -c \$(CFLAGS) -pthread -DMME_SERVER\
		-DBLD_ML_DLL -o \$@ \$?" ;;
	alpha-dec-osf3.2) DTALK_ML_MME="\$(CC) -c \$(CFLAGS) -DMME_SERVER  -o \$@ \$?" ;;
esac
AC_SUBST(DTALK_ML_MME)dnl

INIT_ML="\$(CC) -c \$(CFLAGS) \$(DEFINES) -o \$@ \$?"
case "$target" in
	alpha-dec-osf4.0) INIT_ML="\$(CC) -c \$(CFLAGS) \$(DEFINES) -DOSF_VERSION_V4.0 -DDEC\
		-DBLD_ML_DLL -G3 -pthread -w1 -DMME_SERVER -DUSE_MME_SERVER -o \$@ \$?" ;;
	alpha-dec-osf3.2) INIT_ML="\$(CC) -c \$(CFLAGS) \$(DEFINES) -DOSF_VERSION_V3.2 -DDEC\
		-G3 -threads -w1 -DMME_SERVER -DUSE_MME_SERVER -o \$@ \$?" ;;
esac
AC_SUBST(INIT_ML)dnl

dnl * sample targets go here:

SPEAK_ALL="\$(OUTPUT_DIR)/speak \$(OUTPUT_DIR)/speak.uid"
case "$target" in
	alpha-dec-osf*) SPEAK_ALL="\$(OUTPUT_DIR)/speak \$(OUTPUT_DIR)/speak.uid" ;;
	sparc-sun-*) SPEAK_ALL="" ;;
	powerpc-apple-*) SPEAK_ALL="" ;;
	*-*-linux-*) SPEAK_ALL="" ;;
esac

PKG_CHECK_MODULES(GTK, [gtk+-2.0], have_gtk2=yes, have_gtk2=no)

if test "${have_gtk2}" = "yes"; then
	SPEAK_ALL="\$(OUTPUT_DIR_2)/gspeak \$(OUTPUT_DIR_2)/gspeak_\$(LANG_CODE) \
		\$(OUTPUT_DIR_2)/gspeakdem_\$(LANG_CODE)"
	
fi
AC_SUBST(SPEAK_ALL)dnl

WINDICT_ALL="\$(OUTPUT_DIR)/windict \$(OUTPUT_DIR)/windict.uid"
case "$target" in
	alpha-dec-osf*) WINDICT_ALL="\$(OUTPUT_DIR)/windict \$(OUTPUT_DIR)/windict.uid" ;;
	sparc-sun-*) WINDICT_ALL="" ;;
	powerpc-apple-*) WINDICT_ALL="" ;;
	*-*-linux-*) WINDICT_ALL="" ;;
esac

if test "${have_gtk2}" = "yes"; then
	WINDICT_ALL="\$(OUTPUT_DIR)/windic"
fi
AC_SUBST(WINDICT_ALL)dnl

DTSAMPLE_ALL="\$(OUTPUT_DIR)/say \$(OUTPUT_DIR)/dtmemory \$(OUTPUT_DIR)/aclock \$(OUTPUT_DIR)/xmsay \$(OUTPUT_DIR)/xmsay.uid"
case "$target" in
	*-*-linux-*) DTSAMPLE_ALL="\$(OUTPUT_DIR)/say \$(OUTPUT_DIR)/dtmemory \
	\$(OUTPUT_DIR)/say_demo_\$(LANG_CODE) \
	\$(OUTPUT_DIR)/dtmemory_demo_\$(LANG_CODE) \$(OUTPUT_DIR)/aclock \$(OUTPUT_DIR)/tunecheck \$(OUTPUT_DIR)/dump_vdf \$(OUTPUT_DIR)/mfg_load" ;;
	sparc-sun-*) DTSAMPLE_ALL="\$(OUTPUT_DIR)/say \$(OUTPUT_DIR)/dtmemory \
	\$(OUTPUT_DIR)/say_demo_\$(LANG_CODE) \
	\$(OUTPUT_DIR)/dtmemory_demo_\$(LANG_CODE) \$(OUTPUT_DIR)/aclock" ;;
	powerpc-apple-*) DTSAMPLE_ALL="\$(OUTPUT_DIR)/say \$(OUTPUT_DIR)/dtmemory \
	\$(OUTPUT_DIR)/say_demo_\$(LANG_CODE) \
	\$(OUTPUT_DIR)/dtmemory_demo_\$(LANG_CODE) \$(OUTPUT_DIR)/aclock" ;;
esac
AC_SUBST(DTSAMPLE_ALL)dnl

SAMPLE_LINKFLAGS=" -G3"
case "$target" in
	arm-ipaq-linux-*) SAMPLE_LINKFLAGS=" -ldl -lm" ;;
	sparc-sun-*) SAMPLE_LINKFLAGS=" -lm " ;;
	*-*-linux-*) SAMPLE_LINKFLAGS=" -ldl " ;;
	powerpc-apple-*) SAMPLE_LINKFLAGS=" -ldl " ;;
esac
SAMPLE_LINKFLAGS=" -ldl -L${PWD}/build/\$(LANG_CODE)/lib -Wl,--rpath,\\\$\$ORIGIN/lib/ -Wl,--rpath,\\\$\$ORIGIN/../lib/"
AC_SUBST(SAMPLE_LINKFLAGS)dnl

SAMPLE_DTLIB=" -lttsmme"
case "$target" in
	*-*-linux-*) SAMPLE_DTLIB=" -ltts" ;;
	sparc-sun-*) SAMPLE_DTLIB=" -ltts" ;;
	powerpc-apple-*) SAMPLE_DTLIB=" -ltts" ;;
esac
AC_SUBST(SAMPLE_DTLIB)dnl

AUDIO_DEFINES=""
AUDIO_LIBS=""

AC_ARG_ENABLE(audio, [  --disable-audio	Disable system audio output (/dev/dsp or pulseaudio)],
              with_audio="${enableval}", with_audio="yes")
if test "${with_audio}" = "yes"; then
	PKG_CHECK_MODULES(PULSE, [libpulse-simple], have_libpulsesimple=yes, have_libpulsesimple=no)
	if test "${have_libpulsesimple}" = "yes"; then
		AUDIO_DEFINES="-DUSE_PULSEAUDIO"
		AUDIO_LIBS="-lpulse-simple"
	fi

else
	AUDIO_DEFINES="-DDISABLE_AUDIO"
fi
AC_SUBST(AUDIO_DEFINES)dnl
AC_SUBST(AUDIO_LIBS)dnl

AM_ICONV
ICONV_LIBS=""
if test "${am_cv_lib_iconv}" = "yes"; then
	ICONV_LIBS=-liconv
fi
AC_SUBST(ICONV_LIBS)dnl

AC_OUTPUT(Makefile Makefile.sub dapi/src/Makefile dapi/src/Makefile.sub dapi/src/api/Makefile dapi/src/cmd/Makefile dapi/src/dic/Makefile dapi/src/kernel/Makefile dapi/src/lts/Makefile dapi/src/nt/Makefile dapi/src/osf/Makefile dapi/src/ph/Makefile dapi/src/vtm/Makefile dapi/src/hlsyn/Makefile dtalkml/src/Makefile samplosf/src/speak/Makefile samplosf/src/windict/Makefile samplosf/src/dtsamples/Makefile licunix/src/Makefile udicunix/src/Makefile)
dnl AC_OUTPUT always has to be last
