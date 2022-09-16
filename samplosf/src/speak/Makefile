# Generated automatically from Makefile.in by configure.
# Makefile for samplosf/src/speak/ for Dectalk software for i686-pc-linux-gnu 
#
# 001 ETT 10/22/1998 moved to autoconf system. 
# 002 ETT 12/07/1998 added MMELIBS to link line 
#

#### Start of system configuration section. ####  
# where is the standard include dir? (cross compile critical)
STD_INCLUDE=/usr/include/
# which compiler do we use?
CC=gcc
RANLIB=ranlib
# support for symbolic links?
LN_S=ln -s
# to debug or not to debug?
DEBUG_FLAGS= -g
# how much optomization do we use?
OPTO_FLAGS= -O2
# how many silly compile warnings do we want?
WARN_FLAGS= -Wall
OS_VERSION=2.0.34
DT_LIB= -ltts
LIBS= -lpthread
DEFINES= -D_REENTRANT -DNOMME -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D$(LANGUAGE)
MMELIBS= -lpthread
LINKFLAGS= -ldl -Bdynamic
SPEAK_ALL=$(OUTPUT_DIR)/gspeak $(OUTPUT_DIR_2)/gspeak_$(LANG_CODE) 		$(OUTPUT_DIR_2)/gspeakdem_$(LANG_CODE)
#### End of system configuration section. #### 

RM=rm -f
LD=ld

INLCUDE_DIR=../../../dapi/src/include
API_DIR=    ../../../dapi/src/api

INCLUDES= -I$(INLCUDE_DIR) -I$(API_DIR)

CDEBUGFLAGS =
#LINKFLAGS=  $(DEBUG_FLAGS)

CFLAGS= $(DEBUG_FLAGS) $(OPTO_FLAGS) $(WARN_FLAGS) $(INCLUDES) $(DEFINES)

G_DT_LIB=-ltts
G_DT_LANG_LIB=-ltts_$(LANG_CODE)
G_DT_DEMO_LIB=-ltts_demo_$(LANG_CODE)
GLIBS=-ldl -lpthread

GTK_CFLAGS= `gtk-config --cflags`
GTK_LFLAGS= `gtk-config --libs` -Llib

GCFLAGS = $(DEBUG_FLAGS) $(GTK_CFLAGS) $(OPTO_FLAGS) $(WARN_FLAGS) $(INCLUDES) $(GDEFINES)
GLINK_FLAGS=$(GTK_LFLAGS)


#DT_LIB= -ltts

XLIBS= -lMrm -lXm -lXt -lXext -lX11 

SPEAK_SRCS = speak.c loadgif.c

SPEAK_OBJS= $(OUTPUT_DIR)/link/speak.o $(OUTPUT_DIR)/link/loadgif.o

GSPEAK_SRCS = gspeak.c

GSPEAK_OBJS = $(OUTPUT_DIR)/link/gspeak.o 

GSPEAK_DEMO_OBJS = $(OUTPUT_DIR_2)/link/gspeakdem_$(LANG_CODE).o

#all: $(OUTPUT_DIR)/speak $(OUTPUT_DIR)/speak.uid
all: $(SPEAK_ALL)

$(OUTPUT_DIR)/gspeak:$(GSPEAK_OBJS) ../../../dtalkml/build/$(OS_VERSION)/$(ML_OUT)/libtts.so 
	$(RM) $@
	$(CC) -o $@ $(GSPEAK_OBJS) $(GLINK_FLAGS) $(G_DT_LIB) $(GLIBS)

$(OUTPUT_DIR_2)/gspeak_$(LANG_CODE):$(GSPEAK_OBJS) ../../../dapi/build/dectalk/$(OS_VERSION)/$(LANG_CODE)/$(ML_OUT)/libtts_$(LANG_CODE).so  
	$(RM) $@
	$(CC) -o $@ $(GSPEAK_OBJS) $(GLINK_FLAGS) $(G_DT_LANG_LIB) $(GLIBS)

$(OUTPUT_DIR_2)/gspeakdem_$(LANG_CODE):$(GSPEAK_DEMO_OBJS) ../../../dapi/build/dectalk/$(OS_VERSION)/$(LANG_CODE)/$(ML_OUT)/libtts_demo_$(LANG_CODE).a  
	$(RM) $@
	$(CC) -o $@ $(GSPEAK_DEMO_OBJS) $(GLINK_FLAGS) $(G_DT_DEMO_LIB) $(GLIBS)

$(OUTPUT_DIR)/link/gspeak.o:gspeak.c
	$(CC) -c $(GCFLAGS) -o $@ $?

$(OUTPUT_DIR_2)/link/gspeakdem_$(LANG_CODE).o:gspeak.c
	$(CC) -c -DDEMO -D$(LANGUAGE) $(GCFLAGS) -o $@ $?

$(OUTPUT_DIR)/speak:$(SPEAK_OBJS) ../../../dtalkml/build/$(OS_VERSION)/$(ML_OUT)/libtts.so
	$(RM) $@
	$(CC) -o $@ $(SPEAK_OBJS) $(LINKFLAGS) $(XLIBS) $(DT_LIB) $(LIBS) $(MMELIBS)

$(OUTPUT_DIR)/speak.uid:speak.uil
	/usr/bin/X11/uil -o $@ $?

$(OUTPUT_DIR)/link/speak.o:speak.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/link/loadgif.o:loadgif.c
	$(CC) -c $(CFLAGS) -o $@ $?

clean:
	$(RM) $(OUTOUT_DIR)/link/*.o
	$(RM) $(OUTOUT_DIR)/speak
	$(RM) $(OUTOUT_DIR)/core
	$(RM) core *~





