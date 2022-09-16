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

MME_DIR     =/usr/include/mme

NEWINCLUDES= -I$(INCLUDE_DIR) -I$(API_DIR) -I$(CMD_DIR) -I$(LTS_DIR) \
	     -I$(OSF_DIR) -I$(PH_DIR) -I$(DECTALKF_H) \
             -I$(PROTOS_DIR) -I$(MME_DIR) -I$(NT_DIR) -I$(STD_INCLUDE) 


CC=cc
RM=rm

DEFINES = -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D$(LANGUAGE) 
DEBUGFLAGS= -G3
OTHER_FLAGS=-threads -w1

NEWCFLAGS= $(DEBUGFLAGS) $(OTHER_FLAGS) $(INCLUDES) $(NEWINCLUDES) $(DEFINES) \
           $(DEBUG_FLAGS)

OSF_SRC= playstub.c loadable.c dtmmio.c 

OSF_OBJ= $(OUTPUT_DIR)/playstub.o \
         $(OUTPUT_DIR)/loadable.o $(OUTPUT_DIR)/dtmmio.o

all:: $(OSF_OBJ)

$(OUTPUT_DIR)/playstub.o : playstub.c
	$(CC) -c -DDEC $(CFLAGS) $(NEWCFLAGS) -DMME_SERVER -DUSE_MME_SERVER -o $@ $? 

$(OUTPUT_DIR)/dtmmio.o:dtmmio.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/loadable.o : loadable.c
	$(CC) -c -DDEC $(NEWCFLAGS) -o $@ $?

clean::
	rm $(OUTPUT_DIR)/*.o
