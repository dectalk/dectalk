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

LTS_SRC = lsa_adju.c lsa_coni.c lsa_fr.c   lsa_gr.c   lsa_ir.c   lsa_it.c \
          lsa_ja.c   lsa_rtbi.c lsa_rule.c lsa_sl.c   lsa_sp.c   lsa_task.c \
          lsa_us.c   lsa_util.c lsw_main.c ls_chari.c ls_dict.c  ls_homo.c \
          ls_math.c  ls_proc.c  ls_spel.c  ls_speli.c ls_suff.c  ls_suffi.c \
          loaddict.c

LTS_OBJ = $(OUTPUT_DIR)/lsa_adju.o $(OUTPUT_DIR)/lsa_coni.o \
	  $(OUTPUT_DIR)/lsa_fr.o   $(OUTPUT_DIR)/lsa_gr.o   \
	  $(OUTPUT_DIR)/lsa_ir.o   $(OUTPUT_DIR)/lsa_it.o \
          $(OUTPUT_DIR)/lsa_ja.o   $(OUTPUT_DIR)/lsa_rtbi.o \
	  $(OUTPUT_DIR)/lsa_rule.o $(OUTPUT_DIR)/lsa_sl.o   \
	  $(OUTPUT_DIR)/lsa_sp.o   $(OUTPUT_DIR)/lsa_task.o \
          $(OUTPUT_DIR)/lsa_us.o   $(OUTPUT_DIR)/lsa_util.o \
	  $(OUTPUT_DIR)/lsw_main.o $(OUTPUT_DIR)/ls_chari.o \
	  $(OUTPUT_DIR)/ls_dict.o  $(OUTPUT_DIR)/ls_homo.o \
          $(OUTPUT_DIR)/ls_math.o  $(OUTPUT_DIR)/ls_proc.o  \
	  $(OUTPUT_DIR)/ls_spel.o  $(OUTPUT_DIR)/ls_speli.o \
	  $(OUTPUT_DIR)/ls_suff.o  $(OUTPUT_DIR)/ls_suffi.o \
          $(OUTPUT_DIR)/loaddict.o

all::	$(LTS_OBJ)

$(OUTPUT_DIR)/lsa_adju.o:lsa_adju.c $
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_coni.o:lsa_coni.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_fr.o:lsa_fr.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_gr.o:lsa_gr.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_ir.o:lsa_ir.c   
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_it.o:lsa_it.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_ja.o:lsa_ja.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_rtbi.o:lsa_rtbi.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_rule.o:lsa_rule.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_sl.o:lsa_sl.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_sp.o:lsa_sp.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_task.o:lsa_task.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_us.o:lsa_us.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsa_util.o:lsa_util.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/lsw_main.o:lsw_main.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ls_chari.o:ls_chari.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ls_dict.o:ls_dict.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ls_homo.o:ls_homo.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ls_math.o:ls_math.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ls_proc.o:ls_proc.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ls_spel.o:ls_spel.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ls_speli.o:ls_speli.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ls_suff.o:ls_suff.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/ls_suffi.o:ls_suffi.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

$(OUTPUT_DIR)/loaddict.o:loaddict.c
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?

clean::
	rm $(OUTPUT_DIR)/*.o
