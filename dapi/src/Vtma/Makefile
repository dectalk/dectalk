# Makefile for VTMA for Dectalk software for Digital unix 
#
# 001 MGS 05/22/1998 Made changes C FVTM
# 002 ETT 11/24/1998 We don't use vtma EVER anymore so I took the 
#					target out of this makefile...

CMD_DIR     = ../cmd
DIC_DIR     = ../dic
LTS_DIR     = ../lts
PH_DIR      = ../ph
INCLUDE_DIR = ../include
API_DIR	    = ../api
OSF_DIR     = ../osf
PROTOS_DIR  = ../protos
NT_DIR      = ../nt
VTMA_DIR    = ../vtm
STD_INCLUDE = /usr/include
DECTALKF_H  = ../../../

MME_DIR     =/usr/include/mme

NEWINCLUDES= -I$(INCLUDE_DIR) -I$(API_DIR) -I$(CMD_DIR) -I$(LTS_DIR) \
	     -I$(OSF_DIR) -I$(PH_DIR) -I$(VTMA_DIR) -I$(DECTALKF_H) \
             -I$(PROTOS_DIR) -I$(MME_DIR) -I$(NT_DIR) -I$(STD_INCLUDE) 


CC=cc
RM=rm

DEFINES = -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D$(LANGUAGE) 
DEBUGFLAGS= -G3
OTHER_FLAGS=-threads -w1

NEWCFLAGS= $(DEBUGFLAGS) $(OTHER_FLAGS) $(INCLUDES) $(NEWINCLUDES) $(DEFINES) \
           $(DEBUG_FLAGS)

VTMA_SRC=vtmio.c

VTMA_OBJ=$(OUTPUT_DIR)/vtmio.o 


all::
	echo "Error: We don't use vtma don't try to build me!!!!!"

$(OUTPUT_DIR)/vtmio.o:vtmio.c
	$(CC) -c $(CFLAGS) -nocurrent_include $(NEWCFLAGS) -o $@ $?


clean::
	rm $(OUTPUT_DIR)/*.o
