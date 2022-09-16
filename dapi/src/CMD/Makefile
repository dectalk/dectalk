# Generated automatically from Makefile.in by configure.
# Makefile for dapi/src/cmd/ for Dectalk software for i686-pc-linux-gnu 
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

CMD_SRC =       cm_char.c  cm_main.c  cm_text.c  cm_pars.c \
                cm_cmd.c   cm_util.c  cm_phon.c  cm_copt.c \
                par_pars.c par_ambi.c par_dict.c par_rule.c par_char.c \
                cmd_wav.c  cmd_init.c par_dicf.c

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
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_main.o:: cm_main.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_text.o:: cm_text.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_pars.o:: cm_pars.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_cmd.o:: cm_cmd.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_util.o:: cm_util.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_phon.o:: cm_phon.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/cm_copt.o:: cm_copt.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/par_pars.o:: par_pars.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/par_ambi.o:: par_ambi.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/par_dict.o:: par_dict.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/par_rule.o:: par_rule.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/par_char.o:: par_char.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/cmd_wav.o:: cmd_wav.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/cmd_init.o:: cmd_init.c
	$(CC) -c $(CFLAGS) -o $@ $?

clean::
	rm $(OUTPUT_DIR)/*.o
