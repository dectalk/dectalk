# Generated automatically from Makefile.in by configure.
# Makefile for dapi/src/kernel/ for Dectalk software for i686-pc-linux-gnu 
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
          -I$(PROTOS_DIR) -I$(VTM_DIR) -I$(STD_INCLUDE) 

CFLAGS= $(DEBUG_FLAGS) $(OPTO_FLAGS) $(WARN_FLAGS) $(INCLUDES) $(DEFINES)

KERNEL_SRC = services.c usa_init.c

KERNEL_OBJ = $(OUTPUT_DIR)/services.o $(OUTPUT_DIR)/usa_init.o

all:: $(KERNEL_OBJ)

$(OUTPUT_DIR)/services.o:services.c 
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/usa_init.o:usa_init.c
	$(CC) -c -DDEC $(CFLAGS) -o $@ $?

clean::
	rm $(OUTPUT_DIR)/*.o
