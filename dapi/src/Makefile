# Makefile for CMD for Dectalk software for Digital unix 
# 
# 001 MGS 05/22/1998 changed code for vtm_fa.c (FVTM C)
#


LD=ld
CP=cp
RM=rm -f
AR=ar cqls

OUTPUT_DIR_2= $(OUTPUT_DIR)/link

API_SRC = api/ttsapi_u.c api/decstd97.c api/init.c

CMD_SRC =cmd/cm_char.c  cmd/cm_main.c  cmd/cm_text.c  cmd/cm_pars.c \
         cmd/cm_cmd.c   cmd/cm_util.c  cmd/cm_phon.c  cmd/cm_copt.c \
         cmd/par_pars.c cmd/par_ambi.c cmd/par_dict.c cmd/par_rule.c \
         cmd/par_char.c cmd/cmd_wav.c  cmd/cmd_init.c

LTS_SRC=lts/lsa_adju.c lts/lsa_coni.c lts/lsa_fr.c lts/lsa_gr.c \
        lts/lsa_ir.c lts/lsa_it.c lts/lsa_ja.c lts/lsa_rtbi.c lts/lsa_rule.c \
        lts/lsa_sl.c lts/lsa_sp.c lts/lsa_task.c lts/lsa_us.c lts/lsa_util.c \
        lts/lsw_main.c lts/ls_chari.c lts/ls_dict.c lts/ls_homo.c \
        lts/ls_math.c lts/ls_proc.c lts/ls_spel.c lts/ls_speli.c 
        lts/ls_suff.c lts/ls_suffi.c lts/loaddict.c \

PH_SRC= ph/ph_aloph.c ph/ph_claus.c ph/ph_draw.c ph/ph_drwt0.c \
        ph/ph_inton.c ph/ph_main.c ph/ph_romi.c ph/ph_setar.c ph/ph_sort.c \
        ph/ph_syl.c ph/ph_syntx.c ph/ph_task.c ph/ph_timng.c ph/ph_vdefi.c \
        ph/ph_vset.c ph/phinit.c ph/phlog.c \


KERNEL_SRC = kernel/services.c kernel/usa_init.c

NT_SRC= nt/playaud_u.c nt/mmalloc.c nt/opthread.c nt/spc.c nt/pipe.c

OSF_SRC= osf/playstub.c osf/loadable.c osf/dtmmio.c
 
VTMA_SRC=vtm/vtm.c vtma/vtmio.c vtm/sync.c vtm/playtone.c

ALL_SRC = $(API_SRC) $(CMD_SRC) $(LTS_SRC) $(PH_SRC) $(KERNEL_SRC) \
          $(NT_SRC) $(OSF_SRC) $(VTMA_SRC) 

API_OBJ = $(OUTPUT_DIR_2)/ttsapi_u.o  $(OUTPUT_DIR_2)/decstd97.o 

API_MME_OBJ = $(OUTPUT_DIR_2)/ttsapi_u_mme.o $(OUTPUT_DIR_2)/decstd97.o \
              $(OUTPUT_DIR_2)/init.o

CMD_OBJ =$(OUTPUT_DIR_2)/cm_char.o $(OUTPUT_DIR_2)/cm_main.o \
         $(OUTPUT_DIR_2)/cm_text.o $(OUTPUT_DIR_2)/cm_pars.o \
         $(OUTPUT_DIR_2)/cm_cmd.o $(OUTPUT_DIR_2)/cm_util.o \
         $(OUTPUT_DIR_2)/cm_phon.o $(OUTPUT_DIR_2)/cm_copt.o \
         $(OUTPUT_DIR_2)/par_pars.o $(OUTPUT_DIR_2)/par_ambi.o \
         $(OUTPUT_DIR_2)/par_dict.o $(OUTPUT_DIR_2)/par_rule.o \
         $(OUTPUT_DIR_2)/par_char.o $(OUTPUT_DIR_2)/cmd_wav.o \
         $(OUTPUT_DIR_2)/cmd_init.o

LTS_OBJ = $(OUTPUT_DIR_2)/lsa_adju.o $(OUTPUT_DIR_2)/lsa_coni.o \
	  $(OUTPUT_DIR_2)/lsa_fr.o   $(OUTPUT_DIR_2)/lsa_gr.o   \
	  $(OUTPUT_DIR_2)/lsa_ir.o   $(OUTPUT_DIR_2)/lsa_it.o \
          $(OUTPUT_DIR_2)/lsa_ja.o   $(OUTPUT_DIR_2)/lsa_rtbi.o \
	  $(OUTPUT_DIR_2)/lsa_rule.o $(OUTPUT_DIR_2)/lsa_sl.o   \
	  $(OUTPUT_DIR_2)/lsa_sp.o   $(OUTPUT_DIR_2)/lsa_task.o \
          $(OUTPUT_DIR_2)/lsa_us.o   $(OUTPUT_DIR_2)/lsa_util.o \
	  $(OUTPUT_DIR_2)/lsw_main.o $(OUTPUT_DIR_2)/ls_chari.o \
	  $(OUTPUT_DIR_2)/ls_dict.o  $(OUTPUT_DIR_2)/ls_homo.o \
          $(OUTPUT_DIR_2)/ls_math.o  $(OUTPUT_DIR_2)/ls_proc.o  \
	  $(OUTPUT_DIR_2)/ls_spel.o  $(OUTPUT_DIR_2)/ls_speli.o \
	  $(OUTPUT_DIR_2)/ls_suff.o  $(OUTPUT_DIR_2)/ls_suffi.o \
          $(OUTPUT_DIR_2)/loaddict.o

PH_OBJ=	$(OUTPUT_DIR_2)/ph_aloph.o $(OUTPUT_DIR_2)/ph_claus.o \
	$(OUTPUT_DIR_2)/ph_draw.o $(OUTPUT_DIR_2)/ph_drwt0.o \
	$(OUTPUT_DIR_2)/ph_inton.o $(OUTPUT_DIR_2)/ph_main.o \
	$(OUTPUT_DIR_2)/ph_romi.o $(OUTPUT_DIR_2)/ph_setar.o \
	$(OUTPUT_DIR_2)/ph_sort.o $(OUTPUT_DIR_2)/ph_syl.o \
	$(OUTPUT_DIR_2)/ph_syntx.o $(OUTPUT_DIR_2)/ph_task.o \
	$(OUTPUT_DIR_2)/ph_timng.o $(OUTPUT_DIR_2)/ph_vdefi.o \
	$(OUTPUT_DIR_2)/ph_vset.o $(OUTPUT_DIR_2)/phinit.o \
	$(OUTPUT_DIR_2)/phlog.o

KERNEL_OBJ = $(OUTPUT_DIR_2)/services.o $(OUTPUT_DIR_2)/usa_init.o

NT_MME_OBJ= $(OUTPUT_DIR_2)/playaud_u.o $(OUTPUT_DIR_2)/mmalloc.o

NT_OBJ=	$(OUTPUT_DIR_2)/opthread.o $(OUTPUT_DIR_2)/spc.o $(OUTPUT_DIR_2)/pipe.o

OSF_OBJ= $(OUTPUT_DIR_2)/loadable.o $(OUTPUT_DIR_2)/dtmmio.o 

OSF_TTS_OBJ= $(OUTPUT_DIR_2)/playstub.o 

VTMA_OBJ=$(OUTPUT_DIR_2)/vtm.o $(OUTPUT_DIR_2)/vtmio.o \
	 $(OUTPUT_DIR_2)/sync.o $(OUTPUT_DIR_2)/playtone.o

DECTALK_OBJS= $(API_OBJ) $(CMD_OBJ) $(LTS_OBJ) $(PH_OBJ) \
              $(KERNEL_OBJ) $(NT_OBJ) $(OSF_OBJ) $(OSF_TTS_OBJ) \
              $(VTMA_OBJ)

DECTALK_MME_OBJS= $(API_MME_OBJ) $(CMD_OBJ) $(LTS_OBJ) $(PH_OBJ) \
	         $(KERNEL_OBJ) $(NT_OBJ) $(NT_MME_OBJ) $(OSF_OBJ) \
		 $(VTMA_OBJ)

ALL_OBJS=$(OUTPUT_DIR_2)/ttsapi_u.o $(API_MME_OBJ) $(CMD_OBJ) \
         $(LTS_OBJ) $(PH_OBJ) \
	 $(KERNEL_OBJ) $(NT_OBJ) $(NT_MME_OBJ) $(OSF_OBJ) $(OSF_TTS_OBJ) \
         $(VTMA_OBJ)


LIBS= -llmf -lpthreads -lmach -lexc -lc -lrt -lots

MMELIBS= -lmme -llmf -lpthreads -lmach -lc -lrt -lots

all:: /usr/lib/libtts_$(LANG_CODE).a /usr/lib/libttsmme_$(LANG_CODE).a \
      /usr/shlib/libtts_$(LANG_CODE).so /usr/shlib/libttsmme_$(LANG_CODE).so

/usr/lib/libtts_$(LANG_CODE).a:$(OUTPUT_DIR)/libtts_$(LANG_CODE).a
	ln -sf $(DT_LIB_DIR)/libtts_$(LANG_CODE).a $@
	ln -sf `pwd`/api/ttsapi.h /usr/include/dtk/ttsapi.h
	ln -sf `pwd`/osf/dtmmedefs.h /usr/include/dtk/dtmmedefs.h
	

/usr/lib/libttsmme_$(LANG_CODE).a:$(OUTPUT_DIR)/libttsmme_$(LANG_CODE).a
	ln -sf $(DT_LIB_DIR)/libttsmme_$(LANG_CODE).a $@

/usr/shlib/libtts_$(LANG_CODE).so:$(OUTPUT_DIR)/libtts_$(LANG_CODE).so
	ln -sf $(DT_LIB_DIR)/libtts_$(LANG_CODE).so $@

/usr/shlib/libttsmme_$(LANG_CODE).so:$(OUTPUT_DIR)/libttsmme_$(LANG_CODE).so
	ln -sf $(DT_LIB_DIR)/libttsmme_$(LANG_CODE).so $@


$(OUTPUT_DIR)/libtts_$(LANG_CODE).a: $(ALL_OBJS)
	$(RM) $@
	$(AR) $@ $(DECTALK_OBJS)


$(OUTPUT_DIR)/libttsmme_$(LANG_CODE).a: $(ALL_OBJS)
	$(RM) $@
	$(AR) $@ $(DECTALK_MME_OBJS)


$(OUTPUT_DIR)/libtts_$(LANG_CODE).so: $(ALL_OBJS)
	$(CP) /usr/shlib/so_locations $(OUTPUT_DIR)
	$(LD) $(LD_FLAGS) -shared -update_registry \
        $(OUTPUT_DIR)/so_locations -hidden \
        -soname libtts_$(LANG_CODE).so  -o $@ $(DECTALK_OBJS) $(LIBS) 

$(OUTPUT_DIR)/libttsmme_$(LANG_CODE).so: $(ALL_OBJS)
	$(CP) /usr/shlib/so_locations $(OUTPUT_DIR)
	$(LD) $(LD_FLAGS) -shared -update_registry \
        $(OUTPUT_DIR)/so_locations -hidden \
        -soname libttsmme_$(LANG_CODE).so \
        -o $@ $(DECTALK_MME_OBJS) $(MMELIBS) 


clean:
	$(RM) $(OUTPUT_DIR)/link/*.o
	$(RM) $(OUTPUT_DIR)/*.a
	$(RM) $(OUTPUT_DIR)/*.so
	$(RM) core *~
	$(RM) api/*~ cmd/*~ include/*~ kernel/*~ lts/*~ nt/*~
	$(RM) osf/*~ ph/*~ vtm/*~ vtma/*~ 





