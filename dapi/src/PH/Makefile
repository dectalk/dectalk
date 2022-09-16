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

PH_SRC=	ph_aloph.c ph_claus.c ph_draw.c ph_drwt0.c ph_inton.c \
	ph_main.c ph_romi.c ph_setar.c ph_sort.c ph_syl.c ph_syntx.c \
	ph_task.c ph_timng.c ph_vdefi.c ph_vset.c phinit.c phlog.c 

PH_OBJ=	$(OUTPUT_DIR)/ph_aloph.o $(OUTPUT_DIR)/ph_claus.o \
	$(OUTPUT_DIR)/ph_draw.o $(OUTPUT_DIR)/ph_drwt0.o \
	$(OUTPUT_DIR)/ph_inton.o $(OUTPUT_DIR)/ph_main.o \
	$(OUTPUT_DIR)/ph_romi.o $(OUTPUT_DIR)/ph_setar.o \
	$(OUTPUT_DIR)/ph_sort.o $(OUTPUT_DIR)/ph_syl.o \
	$(OUTPUT_DIR)/ph_syntx.o $(OUTPUT_DIR)/ph_task.o \
	$(OUTPUT_DIR)/ph_timng.o $(OUTPUT_DIR)/ph_vdefi.o \
	$(OUTPUT_DIR)/ph_vset.o $(OUTPUT_DIR)/phinit.o $(OUTPUT_DIR)/phlog.o


all:: $(PH_OBJ)

$(OUTPUT_DIR)/ph_aloph.o:ph_aloph.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_claus.o:ph_claus.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_draw.o:ph_draw.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_drwt0.o:ph_drwt0.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_inton.o:ph_inton.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_main.o:ph_main.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_romi.o:ph_romi.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_setar.o:ph_setar.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_sort.o:ph_sort.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_syl.o:ph_syl.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_syntx.o:ph_syntx.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_task.o:ph_task.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_timng.o:ph_timng.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_vdefi.o:ph_vdefi.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_vset.o:ph_vset.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/phinit.o:phinit.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/phlog.o:phlog.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?


clean::
	rm $(OUTPUT_DIR)/*.o
