
CC=cc
RM=rm -f 

SPEAK_SRCS=speak/speak.c speak/loadgif.c
SPEAK_OBJS=../build/speak/$(OUTPUT_DIR)/link/speak.o \
	   ../build/speak/$(OUTPUT_DIR)/link/loadgif.o

DT_LIB= ../../dapi/build/dectalk/V3.2/us/debug/libttsmme_$(LANG_CODE).so


all: speak 

#all:	decface dtsamples emacspeak 
#windict xmsay

decface:
	cd decface; $(MAKE) \
		"DECTALK_INSTALL_PREFIX=$(DECTALK_INSTALL_PREFIX)"

dtsamples:
	cd dtsamples; $(MAKE) \
		"DECTALK_INSTALL_PREFIX=$(DECTALK_INSTALL_PREFIX)"

emacspeak:
	cd emacspeak; $(MAKE) \
		"DECTALK_INSTALL_PREFIX=$(DECTALK_INSTALL_PREFIX)"

speak: $(SPEAK_SRCS) $(SPEAK_OBJS) $(DT_LIB)
	cd speak; $(MAKE) \
		"OUTPUT_DIR=../../build/speak/$(OUTPUT_DIR)" \
		"LANG_CODE=$(LANG_CODE)" \
		"LANGUAGE=$(LANGUAGE)" \
		"DT_LIB_DIR=../../../dapi/build/dectalk/$(OUTPUT_DIR)" \
		"DECTALK_INSTALL_PREFIX=$(DECTALK_INSTALL_PREFIX)"

windict: $(DT_LIB)
	-mkdir -p ../build/windict/$(OUTPUT_DIR)/link
	cd windict; $(MAKE) \
		"OUTPUT_DIR=../../build/windict/$(OUTPUT_DIR)" \
		"LANG_CODE=$(LANG_CODE)" \
		"LANGUAGE=$(LANGUAGE)" \
		"DECTALK_INSTALL_PREFIX=$(DECTALK_INSTALL_PREFIX)"

xmsay:
	cd xmsay; $(MAKE) \
		"DECTALK_INSTALL_PREFIX=$(DECTALK_INSTALL_PREFIX)"



clean:
	$(RM) *~
	cd decface; $(MAKE) clean
	cd dtsamples; $(MAKE) clean
	cd emacspeak; $(MAKE) clean
	cd speak; $(MAKE) clean
	cd windict; $(MAKE) clean
	cd xmsay; $(MAKE) clean
