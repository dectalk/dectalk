# Generated automatically from Makefile.in by configure.
# Makefile for dapi/src/nt/ for Dectalk software for i686-pc-linux-gnu 
#
# 001 ETT 10/22/1998 moved to autoconf system. 
#

#### Start of system configuration section. ####  

# where is the standard include dir? (cross compile critical)
STD_INCLUDE=/usr/include/
# which compiler do we use?
CC=gcc
# to debug or not to debug?
DEBUG_FLAGS= -g
# how much optomization do we use?
OPTO_FLAGS= -O2
# how many silly compile warnings do we want?
WARN_FLAGS= -Wall
# what do we define?
DEFINES= -D_REENTRANT -DNOMME -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D$(LANGUAGE)
# should we build linux_audio.o or not?
LINUX_AUDIO=$(OUTPUT_DIR)/linux_audio.o
# include mme stuff?
MME_DIR=.

#### End of system configuration section. #### 

RM=rm -f

API_DIR	    = ../api
CMD_DIR     = ../cmd
DIC_DIR     = ../dic
INCLUDE_DIR = ../include
KERNEL_DIR  = ../kernel
LTS_DIR     = ../lts
NT_DIR      = ../nt
OSF_DIR     = ../osf
PH_DIR      = ../ph
PROTOS_DIR  = ../protos
VTM_DIR	    = ../vtm
DECTALKF_H  = ../../../

INCLUDES= -I$(INCLUDE_DIR) -I$(API_DIR) -I$(CMD_DIR) -I$(DIC_DIR) -I$(KERNEL_DIR) \
	  -I$(LTS_DIR) -I$(NT_DIR) -I$(OSF_DIR) -I$(PH_DIR) -I$(DECTALKF_H)\
          -I$(PROTOS_DIR) -I$(VTM_DIR) -I$(MME_DIR) -I$(STD_INCLUDE) 

CFLAGS= $(DEBUG_FLAGS) $(OPTO_FLAGS) $(WARN_FLAGS) $(INCLUDES) $(DEFINES)

NT_SRC= playaud.c mmalloc.c opthread.c spc.c pipe.c linux_audio.c

NT_OBJ=	$(OUTPUT_DIR)/playaud.o $(OUTPUT_DIR)/opthread.o $(OUTPUT_DIR)/spc.o \
	$(OUTPUT_DIR)/pipe.o $(OUTPUT_DIR)/mmalloc.o $(LINUX_AUDIO)

all:: $(NT_OBJ)

$(OUTPUT_DIR)/playaud.o:playaud.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/opthread.o:opthread.c
	$(CC) -c $(CFLAGS) -o $@ $?
 
$(OUTPUT_DIR)/spc.o:spc.c 
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/pipe.o:pipe.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/mmalloc.o:mmalloc.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/linux_audio.o:linux_audio.c
	$(CC) -c $(CFLAGS) -o $@ $?

clean::
	rm $(OUTPUT_DIR)/*.o
