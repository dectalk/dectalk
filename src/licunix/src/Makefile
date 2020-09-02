# Makefile for dapi/src/dic for Dectalk software for x86_64-unknown-linux-gnu 

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
DEFINES=

#### End of system configuration section. #### 

RM=rm -f

API_DIR	    = ../../dapi/src/api
INCLUDE_DIR = ../../dapi/src/include
NT_DIR      = ../../dapi/src/nt
OSF_DIR     = ../../dapi/src/osf
DECTALKF_H  = ../../

INCLUDES= -I$(INCLUDE_DIR) -I$(API_DIR) \
	  -I$(NT_DIR) -I$(OSF_DIR) -I$(DECTALKF_H)\
          -I$(STD_INCLUDE) 

CFLAGS= $(DEBUG_FLAGS) $(OPTO_FLAGS) $(WARN_FLAGS) $(INCLUDES) $(DEFINES)

all::$(OUTPUT_DIR)/licenin1 $(OUTPUT_DIR)/licenin3             $(OUTPUT_DIR)/licenin7 $(OUTPUT_DIR)/installer	

LICENSE_SRC: liceninc.c license.c csn.c ../../dapi/src/api/crypt2.c

LICENSE_OBJ: $(OUTPUT_DIR)/link/licenin1.o $(OUTPUT_DIR)/link/licenin3.o \
             $(OUTPUT_DIR)/link/licenin7.o $(OUTPUT_DIR)/link/crypt2.o \
             $(OUTPUT_DIR)/link/license.o  $(OUTPUT_DIR)/link/csn.o

$(OUTPUT_DIR)/licenin1: $(OUTPUT_DIR)/link/licenin1.o $(OUTPUT_DIR)/link/crypt2.o
	$(CC) -o $@ $?

$(OUTPUT_DIR)/licenin3: $(OUTPUT_DIR)/link/licenin3.o $(OUTPUT_DIR)/link/crypt2.o
	$(CC) -o $@ $?

$(OUTPUT_DIR)/licenin7: $(OUTPUT_DIR)/link/licenin7.o $(OUTPUT_DIR)/link/crypt2.o
	$(CC) -o $@ $?

$(OUTPUT_DIR)/installer: $(OUTPUT_DIR)/link/license.o $(OUTPUT_DIR)/link/crypt2.o $(OUTPUT_DIR)/link/csn.o
	$(CC) -o $@ $?

$(OUTPUT_DIR)/arminstaller: $(OUTPUT_DIR)/link/license.o $(OUTPUT_DIR)/link/crypt2.o $(OUTPUT_DIR)/link/csn.o
	$(CC) -o $@ $?

$(OUTPUT_DIR)/link/crypt2.o:../../dapi/src/api/crypt2.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/link/licenin1.o:liceninc.c
	$(CC) -c $(CFLAGS) -DLICENSE_INCREMENT=1 -o $@ $?

$(OUTPUT_DIR)/link/licenin3.o:liceninc.c
	$(CC) -c $(CFLAGS) -DLICENSE_INCREMENT=3 -o $@ $?

$(OUTPUT_DIR)/link/licenin7.o:liceninc.c
	$(CC) -c $(CFLAGS) -DLICENSE_INCREMENT=7 -o $@ $?


$(OUTPUT_DIR)/link/license.o:license.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/link/csn.o:csn.c
	$(CC) -c $(CFLAGS) -o $@ $?


clean::
	$(RM) $(OUTPUT_DIR)/link/*.o
	$(RM) $(OUTPUT_DIR)/licenin*
	$(RM) *~ core
	$(RM) $(OUTPUT_DIR)/core
