# Generated automatically from Makefile.in by configure.
# Makefile for samplosf/src/dtsamples/ for Dectalk software for i686-pc-linux-gnu 
#
# 001 ETT 10/22/1998 moved to autoconf system. 
# 002 ETT 12/04/1998 changed dtsample_dtlib to be 
#					 used in all samples as sample_dtlib
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
OS_VERSION=2.0.34
DTSAMPLE_ALL=$(OUTPUT_DIR)/say $(OUTPUT_DIR)/dtmemory 	$(OUTPUT_DIR)/aclock
DT_LIB= -ltts
LIBS= -lpthread
DEFINES= -D_REENTRANT -DNOMME -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D$(LANGUAGE)
MMELIBS= -lpthread
LINKFLAGS= -ldl -Bdynamic
#### End of system configuration section. #### 

RM=rm -f

INCLUDES= $(STD_INCLUDE)

#DEBUGFLAGS= -G3
#OTHER_FLAGS=-threads 
#LFLAGS=-G3 $(DEBUG_FLAGS)

CFLAGS= $(DEBUG_FLAGS) $(OPTO_FLAGS) $(WARN_FLAGS) $(INCLUDES) $(DEFINES)
#LINKFLAGS= -Bdynamic

XLIBS= -lMrm -lXm -lXt -lXext -lX11
#MMELIBS= -lmme -lc_r -lmach -lrt -llmf

#DT_LIB=-lttsmme_$(LANG_CODE)

SAMPLES_SRC=say.c dtmemory.c aclock.c xmsay.c

SAMPLES_OBJ=$(SAMPLES_SRC:.c=.o)

all: $(DTSAMPLE_ALL)
#$(OUTPUT_DIR)/say $(OUTPUT_DIR)/dtmemory \
#     $(OUTPUT_DIR)/aclock $(OUTPUT_DIR)/xmsay $(OUTPUT_DIR)/xmsay.uid 

$(OUTPUT_DIR)/say:say.o
	$(CC) $(LINKFLAGS) -o $@ $? $(DT_LIB) $(LIBS) $(MMELIBS)

$(OUTPUT_DIR)/dtmemory:dtmemory.o
	$(CC) $(LINKFLAGS) -o $@ $? $(DT_LIB) $(LIBS) $(MMELIBS)

$(OUTPUT_DIR)/aclock:aclock.o
	$(CC) $(LINKFLAGS) -o $@ $? $(DT_LIB) $(LIBS) $(MMELIBS)

$(OUTPUT_DIR)/xmsay.uid:xmsay.uil 
	/usr/bin/X11/uil -o $@ $?

$(OUTPUT_DIR)/xmsay:xmsay.o
	$(CC) $(LINKFLAGS) -o $@ $? $(DT_LIB) $(LIBS) $(XLIBS) $(MMELIBS)

.c.o:
	$(CC) -c $(CFLAGS) -o $@ $?

clean:
	$(RM) $(OUTPUT_DIR)/* 
	$(RM) $(SAMPLES_OBJ) *~ core
