# Makefile for CMD for Dectalk software for Digital unix 

# MGS 11/20/1997 added code so that when the name of the dictionary file in the zip
# 		 changes case, this will still build the dictionary.

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

NEWINCLUDES= -I$(INCLUDE_DIR) -I$(API_DIR) -I$(LTS_DIR) -I$(OSF_DIR) \
	  -I$(PH_DIR) -I$(PROTOS_DIR) -I$(MME_DIR) -I$(NT_DIR) \
	  -I$(STD_INCLUDE) -I$(DECTALKF_H)


CC=cc

RM=rm -f
LN=ln

DEFINES = -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D$(LANGUAGE) 


DEBUGFLAGS= -G3
OTHER_FLAGS=-threads -w1 -migrate -assume noaligned_objects

NEWCFLAGS= $(DEBUGFLAGS) $(OTHER_FLAGS) $(INCLUDES) $(NEWINCLUDES) $(DEFINES) \
           $(DEBUG_FLAGS)

all::	/usr/lib/dtk/dtalk_$(LANG_CODE).dic

/usr/lib/dtk/dtalk_$(LANG_CODE).dic:$(OUTPUT_DIR)/dtalk_$(LANG_CODE).dic
	$(LN) -fs $(DIC_DIR)/dtalk_$(LANG_CODE).dic $@

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
	$(CC) -o $@ $? -lots

$(OUTPUT_DIR)/link/dic.o:dic.c
	-mkdir -p $(OUTPUT_DIR)/link
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

clean::
	$(RM) $(OUTPUT_DIR)/link/*.o
	$(RM) $(OUTPUT_DIR)/dic_$(LANG_CODE)
	$(RM) $(OUTPUT_DIR)/dtalk_$(LANG_CODE).dic
	$(RM) *~ core
	$(RM) $(OUTPUT_DIR)/core


