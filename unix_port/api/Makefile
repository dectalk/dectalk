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
DECTALKF_H  = ../../../

STD_INCLUDE = /usr/include

NEWINCLUDES= -I$(INCLUDE_DIR) -I$(API_DIR) -I$(CMD_DIR) -I$(LTS_DIR) \
	     -I$(OSF_DIR) -I$(PH_DIR) -I$(DECTALKF_H)\
             -I$(PROTOS_DIR) -I$(NT_DIR) -I$(STD_INCLUDE) 


CC=g++
RM=rm

DEFINES = -D__osf__ -DNOMME -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D$(LANGUAGE) 
DEBUGFLAGS= -g -O2
OTHER_FLAGS= -w 

NEWCFLAGS= $(DEBUGFLAGS) $(OTHER_FLAGS) $(INCLUDES) $(NEWINCLUDES) $(DEFINES) \
           $(DEBUG_FLAGS)

API_SRC = ttsapi_u.c decstd97.c init.c

API_OBJ = $(OUTPUT_DIR)/ttsapi_u.o \
          $(OUTPUT_DIR)/decstd97.o $(OUTPUT_DIR)/init.o

all:: $(API_OBJ)

$(OUTPUT_DIR)/ttsapi_u.o : ttsapi_u.c
	$(CC) -c -DDEC $(CFLAGS) $(NEWCFLAGS) -o $@ $? 

$(OUTPUT_DIR)/decstd97.o:decstd97.c 
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/init.o:init.c
	$(CC) -c -DDEC $(NEWCFLAGS) -o $@ $?

clean::
	rm $(OUTPUT_DIR)/*.o




