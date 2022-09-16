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

STD_INCLUDE = /usr/include

MME_DIR     =/usr/include/mme

NEWINCLUDES= -I$(INCLUDE_DIR) -I$(API_DIR) -I$(LTS_DIR) -I$(OSF_DIR) \
	  -I$(PH_DIR) -I$(PROTOS_DIR) -I$(MME_DIR) -I$(NT_DIR) \
	  -I$(STD_INCLUDE) 


CC=cc

RM=rm

DEFINES = -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D$(LANGUAGE) 


DEBUGFLAGS= -G3
OTHER_FLAGS=-threads -w1

NEWCFLAGS= $(DEBUGFLAGS) $(OTHER_FLAGS) $(INCLUDES) $(NEWINCLUDES) $(DEFINES) \
           $(DEBUG_FLAGS)


CMD_SRC =       cm_char.c  cm_main.c  cm_text.c  cm_pars.c \
                cm_cmd.c   cm_util.c  cm_phon.c  cm_copt.c \
                par_pars.c par_ambi.c par_dict.c par_rule.c par_char.c \
                cmd_wav.c  cmd_init.c


CMD_OBJ =$(OUTPUT_DIR)/cm_char.o $(OUTPUT_DIR)/cm_main.o \
         $(OUTPUT_DIR)/cm_text.o $(OUTPUT_DIR)/cm_pars.o \
         $(OUTPUT_DIR)/cm_cmd.o $(OUTPUT_DIR)/cm_util.o \
         $(OUTPUT_DIR)/cm_phon.o $(OUTPUT_DIR)/cm_copt.o \
         $(OUTPUT_DIR)/par_pars.o $(OUTPUT_DIR)/par_ambi.o \
         $(OUTPUT_DIR)/par_dict.o $(OUTPUT_DIR)/par_rule.o \
         $(OUTPUT_DIR)/par_char.o $(OUTPUT_DIR)/cmd_wav.o \
         $(OUTPUT_DIR)/cmd_init.o

all::	$(CMD_OBJ)

$(OUTPUT_DIR)/cm_char.o:: cm_char.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_main.o:: cm_main.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_text.o:: cm_text.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_pars.o:: cm_pars.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_cmd.o:: cm_cmd.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_util.o:: cm_util.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_phon.o:: cm_phon.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_copt.o:: cm_copt.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/par_pars.o:: par_pars.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/par_ambi.o:: par_ambi.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/par_dict.o:: par_dict.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/par_rule.o:: par_rule.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/par_char.o:: par_char.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/cmd_wav.o:: cmd_wav.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/cmd_init.o:: cmd_init.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?





clean::
	rm $(OUTPUT_DIR)/*.o
