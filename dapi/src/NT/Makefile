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

NT_SRC= playaud.c mmalloc.c opthread.c spc.c pipe.c

NT_OBJ= $(OUTPUT_DIR)/playaud_u.o $(OUTPUT_DIR)/mmalloc.o \
	$(OUTPUT_DIR)/opthread.o $(OUTPUT_DIR)/spc.o $(OUTPUT_DIR)/pipe.o

all:: $(NT_OBJ)

$(OUTPUT_DIR)/playaud_u.o : playaud_u.c
	$(CC) -c -DDEC $(CFLAGS) $(NEWCFLAGS) -DMME_SERVER -DUSE_MME_SERVER -o $@ $? 

$(OUTPUT_DIR)/mmalloc.o : mmalloc.c
	$(CC) -c -DDEC $(CFLAGS) $(NEWCFLAGS) -DMME_SERVER -DUSE_MME_SERVER -o $@ $? 

$(OUTPUT_DIR)/opthread.o:opthread.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?
 
$(OUTPUT_DIR)/spc.o:spc.c 
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/pipe.o:pipe.c
	$(CC) -c -DDEC $(CFLAGS) $(NEWCFLAGS) -o $@ $?


clean::
	rm $(OUTPUT_DIR)/*.o

