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
	     -I$(OSF_DIR) -I$(PH_DIR) -I$(DECTALKF_H) \
             -I$(PROTOS_DIR) -I$(NT_DIR) -I$(STD_INCLUDE) 


CC=g++
RM=rm

DEFINES = -D__osf__ -DNOMME -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D$(LANGUAGE) 
DEBUGFLAGS= -g -O2
OTHER_FLAGS=-w

NEWCFLAGS= $(DEBUGFLAGS) $(OTHER_FLAGS) $(INCLUDES) $(NEWINCLUDES) $(DEFINES) \
           $(DEBUG_FLAGS)

KERNEL_SRC = services.c usa_init.c

KERNEL_OBJ = $(OUTPUT_DIR)/services.o $(OUTPUT_DIR)/usa_init.o

all:: $(KERNEL_OBJ)

$(OUTPUT_DIR)/services.o:services.c 
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/usa_init.o:usa_init.c
	$(CC) -c -DDEC $(CFLAGS) $(NEWCFLAGS) -o $@ $?

clean::
	rm $(OUTPUT_DIR)/*.o
