# Makefile for CMD for Dectalk software for Digital unix 

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

NEWINCLUDES= -I$(INCLUDE_DIR) -I$(API_DIR) -I$(CMD_DIR) -I$(LTS_DIR) \
	     -I$(OSF_DIR) -I$(PH_DIR) -I$(VTMA_DIR) -I$(DECTALKF_H) \
             -I$(PROTOS_DIR) -I$(NT_DIR) -I$(STD_INCLUDE) 


CC=g++
RM=rm

DEFINES = -D__osf__ -DNOMME -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D$(LANGUAGE) 
DEBUGFLAGS= -g -O2
OTHER_FLAGS=-w

NEWCFLAGS= $(DEBUGFLAGS) $(OTHER_FLAGS) $(INCLUDES) $(NEWINCLUDES) $(DEFINES) \
           $(DEBUG_FLAGS)

VTMA_SRC=vtm.c sync.c vtmio.c playtone.c

VTMA_OBJ=$(OUTPUT_DIR)/vtm.o $(OUTPUT_DIR)/sync.o \
	$(OUTPUT_DIR)/playtone.o 


all:: $(VTMA_OBJ)

$(OUTPUT_DIR)/vtm.o:vtm.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/sync.o:sync.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/playtone.o:playtone.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?


clean::
	rm $(OUTPUT_DIR)/*.o
