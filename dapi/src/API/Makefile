# Generated automatically from Makefile.in by configure.
# Makefile for dapi/src/api/ for Dectalk software for i686-pc-linux-gnu 
#
# 001 ETT 10/22/1998 moved to autoconf system. 
# 002 MGS 02/09/2000 Added API modules autoconf item
# 003 NAL 04/07/2000 added gspeak demo info
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
# compile with mme flags???
MME_COMPILE_FLAGS=
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

API_SRC = ttsapi.c decstd97.c init.c

API_OBJ = $(OUTPUT_DIR)/ttsapi_mme.o 			$(OUTPUT_DIR)/decstd97.o $(OUTPUT_DIR)/ttsapi_demo.o			$(OUTPUT_DIR)/init.o $(OUTPUT_DIR)/crypt2.o

#$(OUTPUT_DIR)/ttsapi.o $(OUTPUT_DIR)/ttsapi_mme.o\
#          $(OUTPUT_DIR)/decstd97.o $(OUTPUT_DIR)/init.o $(OUTPUT_DIR)/crypt2.o

all:: $(API_OBJ)

$(OUTPUT_DIR)/ttsapi.o : ttsapi.c
	$(CC) -c -DDEC $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/ttsapi_mme.o : ttsapi.c
	$(CC) -c -DDEC $(CFLAGS) $(MME_COMPILE_FLAGS) -o $@ $? 

$(OUTPUT_DIR)/ttsapi_demo.o : ttsapi.c
	$(CC) -c -DDEC -DDEMO $(CFLAGS) $(MME_COMPILE_FLAGS) -o $@ $? 

$(OUTPUT_DIR)/decstd97.o:decstd97.c 
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/init.o:init.c
	$(CC) -c -DDEC $(CFLAGS) $(MME_COMPILE_FLAGS) -o $@ $?

$(OUTPUT_DIR)/crypt2.o:crypt2.c 
	$(CC) -c $(CFLAGS) -o $@ $?

clean::
	$(RM) $(OUTPUT_DIR)/*.o
