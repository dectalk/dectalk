# Generated automatically from Makefile.in by configure.
# Makefile for /dapi/src for Dectalk software for i686-pc-linux-gnu 
#
# this file does the linking of the library and the install
#
# 001 MGS 05/22/1998 changed code for vtm_fa.c (FVTM C)
# 002 ETT 10/22/1998 moved to autoconf system. 
#		this file /dapi/src/Makefile.in
#		is processed by configure to produce Makefile
# 003 ETT 12/07/1998 added SO_LOCATIONS
# 004 NAL 04/07/2000 added gspeak demo info

CP=cp
RM=rm -f

#### Start of system configuration section. ####  

AR=ar cqls
LD=ld
LN_S=ln -s
RANLIB=ranlib
#should we link linux_audio.o ?
LINK_LINUX_AUDIO=$(OUTPUT_DIR_2)/linux_audio.o
#which DECtalk libraries should we link?
ALL=$(OUTPUT_DIR)/libtts_$(LANG_CODE).a 	$(OUTPUT_DIR)/libtts_$(LANG_CODE).so /usr/lib/libtts_$(LANG_CODE).a	$(SHLIB)/libtts_$(LANG_CODE).so /usr/lib/libtts_demo_$(LANG_CODE).a
#which objects should we link into the libs?
DECTALK_TTS_OBJS=$(API_ALL_OBJ) $(API_MME_OBJ) 	$(CMD_OBJ) $(LTS_OBJ) $(LTS_NORM_OBJS) $(PH_OBJ) $(KERNEL_OBJ) 	$(NT_OBJ) $(NT_MME_OBJ) $(OSF_OBJ) $(VTM_OBJ)
#
DECTALK_MME_OBJS=$(API_ALL_OBJ) $(API_MME_OBJ) $(CMD_OBJ) $(LTS_OBJ) 	$(LTS_NORM_OBJS) $(PH_OBJ) $(KERNEL_OBJ) $(NT_OBJ) 	$(NT_MME_OBJ) $(OSF_OBJ) $(VTM_OBJ)

DECTALK_DEMO_OBJS=$(API_ALL_OBJ) $(API_DEMO_OBJ) 	$(CMD_OBJ) $(LTS_OBJ) $(LTS_DEMO_OBJS) $(PH_OBJ) $(KERNEL_OBJ) 	$(NT_OBJ) $(NT_MME_OBJ) $(OSF_OBJ) $(VTM_OBJ)
#which system libraries get linked in?
LIBS= -lpthread
MMELIBS= -lpthread
#where do the shared libs go?
SHLIB=/lib
#osf crazy hidden shared lib symbol madness:
SO_LOCATIONS=
DAPI_LD_SHARED=$(LD) -shared -soname 		libtts_$(LANG_CODE).so -o $@ $(DECTALK_TTS_OBJS) $(LIBS)
#### End of system configuration section. #### 

OUTPUT_DIR_2= $(OUTPUT_DIR)/link

API_SRC = api/ttsapi.c api/decstd97.c api/init.c api/crypt2.c

CMD_SRC =cmd/cm_char.c  cmd/cm_main.c  cmd/cm_text.c  cmd/cm_pars.c \
         cmd/cm_cmd.c   cmd/cm_util.c  cmd/cm_phon.c  cmd/cm_copt.c \
         cmd/par_pars.c cmd/par_ambi.c cmd/par_dict.c cmd/par_rule.c \
         cmd/par_char.c cmd/cmd_wav.c  cmd/cmd_init.c

LTS_SRC=lts/lsa_adju.c lts/lsa_coni.c lts/lsa_fr.c lts/lsa_gr.c \
        lts/lsa_ir.c lts/lsa_it.c lts/lsa_ja.c lts/lsa_rtbi.c lts/lsa_rule.c \
        lts/lsa_sl.c lts/lsa_sp.c lts/lsa_task.c lts/lsa_us.c lts/lsa_util.c \
        lts/lsw_main.c lts/ls_chari.c lts/ls_dict.c lts/ls_homo.c \
        lts/ls_math.c lts/ls_proc.c lts/ls_spel.c lts/ls_speli.c \
        lts/ls_suff.c lts/ls_suffi.c lts/loaddict.c 

PH_SRC= ph/ph_aloph.c ph/ph_claus.c ph/ph_draw.c ph/ph_drwt0.c \
        ph/ph_inton.c ph/ph_main.c ph/ph_romi.c ph/ph_setar.c ph/ph_sort.c \
        ph/ph_syl.c ph/ph_syntx.c ph/ph_task.c ph/ph_timng.c ph/ph_vdefi.c \
        ph/ph_vset.c ph/phinit.c ph/phlog.c 

KERNEL_SRC = kernel/services.c kernel/usa_init.c

NT_SRC= nt/playaud.c nt/mmalloc.c nt/opthread.c nt/spc.c nt/pipe.c nt/linux_audio.c

OSF_SRC= osf/playaud.c osf/loadable.c osf/dtmmio.c
 
VTM_SRC=vtm/vtm.c vtm/vtmio.c vtm/sync.c vtm/playtone.c

ALL_SRC = $(API_SRC) $(CMD_SRC) $(LTS_SRC) $(PH_SRC) $(KERNEL_SRC) \
          $(NT_SRC) $(OSF_SRC) $(VTM_SRC) 

API_ALL_OBJ = $(OUTPUT_DIR_2)/decstd97.o $(OUTPUT_DIR_2)/crypt2.o

API_TTS_OBJ = $(OUTPUT_DIR_2)/ttsapi.o

API_MME_OBJ = $(OUTPUT_DIR_2)/ttsapi_mme.o $(OUTPUT_DIR_2)/init.o

API_DEMO_OBJ = $(OUTPUT_DIR_2)/ttsapi_demo.o $(OUTPUT_DIR_2)/init.o

LTS_NORM_OBJS = $(OUTPUT_DIR_2)/lsw_main.o

LTS_DEMO_OBJS = $(OUTPUT_DIR_2)/lsw_main_demo.o



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
	  $(OUTPUT_DIR_2)/ls_chari.o \
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

NT_OBJ=	$(OUTPUT_DIR_2)/opthread.o $(OUTPUT_DIR_2)/spc.o \
	$(OUTPUT_DIR_2)/pipe.o $(LINK_LINUX_AUDIO)

NT_MME_OBJ= $(OUTPUT_DIR_2)/playaud.o $(OUTPUT_DIR_2)/mmalloc.o

OSF_OBJ= $(OUTPUT_DIR_2)/loadable.o $(OUTPUT_DIR_2)/dtmmio.o 

OSF_TTS_OBJ= $(OUTPUT_DIR_2)/playstub.o 

VTM_OBJ=$(OUTPUT_DIR_2)/vtm.o $(OUTPUT_DIR_2)/vtmio.o \
	 $(OUTPUT_DIR_2)/sync.o $(OUTPUT_DIR_2)/playtone.o

#DECTALK_OBJS= see above in config section
#DECTALK_MME_OBJS= see above in config section

ALL_OBJS=$(API_ALL_OBJ) $(API_MME_OBJ) $(CMD_OBJ) 	      $(LTS_OBJ) $(PH_OBJ) $(KERNEL_OBJ) $(NT_OBJ)               $(NT_MME_OBJ) $(OSF_OBJ) $(OSF_TTS_OBJ) $(VTM_OBJ)

#$(API_ALL_OBJ) $(API_MME_OBJ) $(API_TTS_OBJ) $(CMD_OBJ) $(LTS_OBJ) $(PH_OBJ) \
#	 $(KERNEL_OBJ) $(NT_OBJ) $(NT_MME_OBJ) $(OSF_OBJ) $(OSF_TTS_OBJ)\
#	 $(VTM_OBJ)

#LIBS= see above in config section
#MMELIBS= see above in config section

all:: $(ALL)

/usr/lib/libtts_$(LANG_CODE).a:$(OUTPUT_DIR)/libtts_$(LANG_CODE).a
	-mkdir -p /usr/include/dtk
	$(LN_S)f $(DT_LIB_DIR)/libtts_$(LANG_CODE).a $@
	$(LN_S)f `pwd`/api/ttsapi.h /usr/include/dtk/ttsapi.h
	$(LN_S)f `pwd`/osf/dtmmedefs.h /usr/include/dtk/dtmmedefs.h	

/usr/lib/libtts_demo_$(LANG_CODE).a:$(OUTPUT_DIR)/libtts_demo_$(LANG_CODE).a
	-mkdir -p /usr/include/dtk
	$(LN_S)f $(DT_LIB_DIR)/libtts_demo_$(LANG_CODE).a $@
	$(LN_S)f `pwd`/api/ttsapi.h /usr/include/dtk/ttsapi.h
	$(LN_S)f `pwd`/osf/dtmmedefs.h /usr/include/dtk/dtmmedefs.h	

/usr/lib/libttsmme_$(LANG_CODE).a:$(OUTPUT_DIR)/libttsmme_$(LANG_CODE).a
	$(LN_S)f $(DT_LIB_DIR)/libttsmme_$(LANG_CODE).a $@

$(SHLIB)/libtts_$(LANG_CODE).so:$(OUTPUT_DIR)/libtts_$(LANG_CODE).so
	$(LN_S)f $(DT_LIB_DIR)/libtts_$(LANG_CODE).so $@

$(SHLIB)/libttsmme_$(LANG_CODE).so:$(OUTPUT_DIR)/libttsmme_$(LANG_CODE).so
	$(LN_S)f $(DT_LIB_DIR)/libttsmme_$(LANG_CODE).so $@

$(OUTPUT_DIR)/libtts_$(LANG_CODE).a: $(ALL_OBJS)
	$(RM) $@
	$(AR) $@ $(DECTALK_TTS_OBJS)
#	$(RANLIB) $@

$(OUTPUT_DIR)/libtts_demo_$(LANG_CODE).a: $(ALL_OBJS)
	$(RM) $@
	$(AR) $@ $(DECTALK_DEMO_OBJS)

$(OUTPUT_DIR)/libttsmme_$(LANG_CODE).a: $(ALL_OBJS)
	$(RM) $@
	$(AR) $@ $(DECTALK_MME_OBJS)

$(OUTPUT_DIR)/libtts_$(LANG_CODE).so: $(ALL_OBJS)
	$(SO_LOCATIONS)
	$(DAPI_LD_SHARED)
#	$(LD) -shared -update_registry \
#	$(OUTPUT_DIR)/so_locations -hidden \
#	-soname libtts_$(LANG_CODE).so  -o $@ $(DECTALK_TTS_OBJS) $(LIBS) 

$(OUTPUT_DIR)/libttsmme_$(LANG_CODE).so: $(ALL_OBJS)
	$(CP) /usr/shlib/so_locations $(OUTPUT_DIR)
	$(LD) -shared -update_registry \
	$(OUTPUT_DIR)/so_locations -hidden \
	-soname libttsmme_$(LANG_CODE).so \
	-o $@ $(DECTALK_MME_OBJS) $(LIBS) $(MMELIBS) 

#$(OUTPUT_DIR)/libtts_$(LANG_CODE).so: $(ALL_OBJS)
#	$(LD) -shared -soname \
#	libtts_$(LANG_CODE).so -o $@ $(DECTALK_TTS_OBJS) $(LIBS)
#
#$(OUTPUT_DIR)/libttsmme_$(LANG_CODE).so: $(ALL_OBJS)
#	$(LD) -shared -update_registry -hidden -soname \
#	libttsmme_$(LANG_CODE).so -o $@ $(DECTALK_MME_OBJS) $(LIBS) $(MMELIBS)

clean:
	$(RM) $(OUTPUT_DIR)/link/*.o
	$(RM) $(OUTPUT_DIR)/*.a
	$(RM) $(OUTPUT_DIR)/*.so
	$(RM) core *~
	$(RM) api/*~ cmd/*~ include/*~ kernel/*~ lts/*~ nt/*~
	$(RM) osf/*~ ph/*~ vtm/*~
