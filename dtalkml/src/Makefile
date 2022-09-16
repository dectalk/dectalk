# Generated automatically from Makefile.in by configure.
# Makefile for dtalkml/src/ for Dectalk software for i686-pc-linux-gnu 

# 001 ETT 10/22/1998 moved to autoconf system. 
# 002 ETT 12/04/1998 added osf 3.2 & 4.0
# 003 ETT 12/07/1998 added SO_LOCATIONS
#

#### Start of system configuration section. ####  

# where is the standard include dir? (cross compile critical)
STD_INCLUDE=/usr/include/
# which compiler do we use?
CC=gcc
RANLIB=ranlib
# support for symbolic links?
LN_S=ln -s
# to debug or not to debug?
DEBUG_FLAGS= -g
# how much optomization do we use?
OPTO_FLAGS= -O2
# how many silly compile warnings do we want?
WARN_FLAGS= -Wall
# what do we define?
DEFINES= -D_REENTRANT -DNOMME -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D$(LANGUAGE)
OS_VERSION=2.0.34
LD=ld
AR=ar cqls
ALL=/usr/lib/libtts.a $(SHLIB)/libtts.so
#where do we put the shared libs?
SHLIB=/lib
ML_TTS_SO=$(LD) -shared -soname libtts.so 	-o $@ ../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml.o 	../build/$(OS_VERSION)/$(ML_OUT)/link/init.o 	../build/$(OS_VERSION)/$(ML_OUT)/libtts.a  -ldl -lpthread
ML_TTS_MME_SO=
DTALK_ML=$(CC) -c $(CFLAGS) -o $@ $?
DTALK_ML_MME=
INIT_ML=$(CC) -c $(CFLAGS) $(DEFINES) -o $@ $?
SO_LOCATIONS=
#### End of system configuration section. #### 

RM=rm -f

CMD_DIR     = ../../dapi/src/cmd
DIC_DIR     = ../../dapi/src/dic
LTS_DIR     = ../../dapi/src/lts
PH_DIR      = ../../dapi/src/ph
INCLUDE_DIR = ../../dapi/src/include
API_DIR     = ../../dapi/src/api
OSF_DIR     = ../../dapi/src/osf
PROTOS_DIR  = ../../dapi/src/protos
NT_DIR      = ../../dapi/src/nt
DECTALKF_H  = ../../

INCLUDES= -I$(INCLUDE_DIR) -I$(API_DIR) -I$(CMD_DIR) -I$(LTS_DIR) \
	     -I$(OSF_DIR) -I$(PH_DIR) -I$(DECTALKF_H)\
             -I$(PROTOS_DIR) -I$(NT_DIR) -I$(STD_INCLUDE) 

CFLAGS= $(DEBUG_FLAGS) $(OPTO_FLAGS) $(INCLUDES) $(DEFINES)

DTALK_ML_SRC=dtalk_ml.c init.c

DTALK_ML_OBJ=../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml.o \
              ../build/$(OS_VERSION)/$(ML_OUT)/link/init.o \
            ../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml_mme.o

all: $(ALL)
#see ML_ALL above

$(SHLIB)/libtts.so:../build/$(OS_VERSION)/$(ML_OUT)/libtts.so
	$(LN_S)f `pwd`/$? $@

$(SHLIB)/libttsmme.so:../build/$(OS_VERSION)/$(ML_OUT)/libttsmme.so
	$(LN_S)f `pwd`/$? $@

/usr/lib/libtts.a:../build/$(OS_VERSION)/$(ML_OUT)/libtts.a
	$(LN_S)f `pwd`/$? $@

/usr/lib/libttsmme.a:../build/$(OS_VERSION)/$(ML_OUT)/libttsmme.a
	$(LN_S)f `pwd`/$? $@


../build/$(OS_VERSION)/$(ML_OUT)/libtts.so:../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml.o ../build/$(OS_VERSION)/$(ML_OUT)/link/init.o
	$(SO_LOCATIONS)
	$(ML_TTS_SO)

../build/$(OS_VERSION)/$(ML_OUT)/libttsmme.so:../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml_mme.o ../build/$(OS_VERSION)/$(ML_OUT)/link/init.o
	$(SO_LOCATIONS)
	$(ML_TTS_MME_SO)

../build/$(OS_VERSION)/$(ML_OUT)/libtts.a:../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml.o ../build/$(OS_VERSION)/$(ML_OUT)/link/init.o 
	$(RM) $@
	$(AR) $@ $?

../build/$(OS_VERSION)/$(ML_OUT)/libttsmme.a:../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml_mme.o ../build/$(OS_VERSION)/$(ML_OUT)/link/init.o 
	$(RM) $@
	$(AR) $@ $?

../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml.o:dtalk_ml.c
	$(DTALK_ML)

../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml_mme.o:dtalk_ml.c
	$(DTALK_ML_MME)

../build/$(OS_VERSION)/$(ML_OUT)/link/init.o:init.c
	$(INIT_ML)

clean:
	$(RM) ../build/$(OS_VERSION)/$(ML_OUT)/link/*.o
	$(RM) ../build/$(OS_VERSION)/$(ML_OUT)/lib*
	$(RM) *~
