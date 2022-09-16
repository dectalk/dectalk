# Generated automatically from Makefile.in by configure.
# Makefile for dapi/src/dic for Dectalk software for i686-pc-linux-gnu 

# 001 MGS 11/20/1997 added code so that when the name of the dictionary file in the zip
# 		 changes case, this will still build the dictionary.
# 002 ETT 10/22/1998 moved to autoconf system. 
#

#### Start of system configuration section. ####  

# where is the standard include dir? (cross compile critical)
STD_INCLUDE=/usr/include/
# which compiler do we use?
CC=gcc
# support for symbolic links?
LN_S=ln -s
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

all::	/usr/lib/dtk/dtalk_$(LANG_CODE).dic

/usr/lib/dtk/dtalk_$(LANG_CODE).dic:$(OUTPUT_DIR)/dtalk_$(LANG_CODE).dic
	$(LN_S)f $(DIC_DIR)/dtalk_$(LANG_CODE).dic $@

$(OUTPUT_DIR)/dtalk_$(LANG_CODE).dic: $(OUTPUT_DIR)/dic_$(LANG_CODE) \
                                    dic_$(LANG_CODE).zip
	unzip -o dic_$(LANG_CODE).zip 
	-mv DIC_$(U_LANG_CODE).TXT dic_$(LANG_CODE).txt
	-mv DIC_$(U_LANG_CODE).txt dic_$(LANG_CODE).txt
	-mv DIC_$(LANG_CODE).txt dic_$(LANG_CODE).txt
	-mv Dic_$(LANG_CODE).txt dic_$(LANG_CODE).txt
	$(OUTPUT_DIR)/dic_$(LANG_CODE) dic_$(LANG_CODE).txt \
        $(OUTPUT_DIR)/dtalk_$(LANG_CODE).dic /t:win32
	$(RM) dic_$(LANG_CODE).txt

DTALK_SRC: dic.c

DTALK_OBJ: $(OUTPUT_DIR)/link/dic.o

$(OUTPUT_DIR)/dic_$(LANG_CODE): $(OUTPUT_DIR)/link/dic.o
	$(CC) -o $@ $? 

$(OUTPUT_DIR)/link/dic.o:dic.c
	-mkdir -p $(OUTPUT_DIR)/link
	$(CC) -c $(CFLAGS) -o $@ $?

clean::
	$(RM) $(OUTPUT_DIR)/link/*.o
	$(RM) $(OUTPUT_DIR)/dic_$(LANG_CODE)
	$(RM) $(OUTPUT_DIR)/dtalk_$(LANG_CODE).dic
	$(RM) *~ core
	$(RM) $(OUTPUT_DIR)/core
