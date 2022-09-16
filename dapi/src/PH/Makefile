# Generated automatically from Makefile.in by configure.
# Makefile for dapi/src/ph/ for Dectalk software for i686-pc-linux-gnu 
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
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_claus.o:ph_claus.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_draw.o:ph_draw.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_drwt0.o:ph_drwt0.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_inton.o:ph_inton.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_main.o:ph_main.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_romi.o:ph_romi.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_setar.o:ph_setar.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_sort.o:ph_sort.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_syl.o:ph_syl.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_syntx.o:ph_syntx.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_task.o:ph_task.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_timng.o:ph_timng.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_vdefi.o:ph_vdefi.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ph_vset.o:ph_vset.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/phinit.o:phinit.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/phlog.o:phlog.c
	$(CC) -c $(CFLAGS) -o $@ $?

clean::
	rm $(OUTPUT_DIR)/*.o
