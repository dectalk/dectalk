# Makefile for Dectalk software for Digital unix 

# MGS 11/19/1997 Added UK
# MGS 05/21/1998 removed extra spanish_release:: line

OS_VERSION=`uname -r`

all:: english_release uk_release spanish_release german_release latin_american_release

debug::	english_debug uk_debug spanish_debug german_debug latin_american_debug

release:: english_release spanish_release german_release latin_american_release

english_release:
	$(MAKE) -f Makefile.sub "LANGUAGE=ENGLISH -DENGLISH_US -DACNA" \
        "OUTPUT_DIR=$(OS_VERSION)/us/release" "LANG_CODE=us" \
        "U_LANG_CODE=US" "DEBUG_FLAGS=-O2 -migrate" "LD_FLAGS=-O2" \
        "ML_OUT=release" \
	"DIC_DIR=/home/users/dectalk/rnd/dapi/build/dic/$(OS_VERSION)/us/release" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/us/release" 


english_debug:
	$(MAKE) -f Makefile.sub "LANGUAGE=ENGLISH -DENGLISH_US -DACNA" \
        "OUTPUT_DIR=$(OS_VERSION)/us/debug" "LANG_CODE=us" \
        "U_LANG_CODE=US" "DEBUG_FLAGS=-g -migrate" "LD_FLAGS=-g" \
        "ML_OUT=debug" \
	"DIC_DIR=/home/users/dectalk/rnd/dapi/build/dic/$(OS_VERSION)/us/debug" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/us/debug" 

uk_release:
	$(MAKE) -f Makefile.sub "LANGUAGE=ENGLISH -DENGLISH_UK" \
        "OUTPUT_DIR=$(OS_VERSION)/uk/release" "LANG_CODE=uk" \
        "U_LANG_CODE=UK" "DEBUG_FLAGS=-O2 -migrate" "LD_FLAGS=-O2" \
        "ML_OUT=release" \
	"DIC_DIR=/home/users/dectalk/rnd/dapi/build/dic/$(OS_VERSION)/uk/release" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/uk/release" 


uk_debug:
	$(MAKE) -f Makefile.sub "LANGUAGE=ENGLISH -DENGLISH_UK" \
        "OUTPUT_DIR=$(OS_VERSION)/uk/debug" "LANG_CODE=uk" \
        "U_LANG_CODE=UK" "DEBUG_FLAGS=-g -migrate" "LD_FLAGS=-g" \
        "ML_OUT=debug" \
	"DIC_DIR=/home/users/dectalk/rnd/dapi/build/dic/$(OS_VERSION)/uk/debug" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/uk/debug" 

spanish_release::
	$(MAKE) -f Makefile.sub  "LANGUAGE=SPANISH -DSPANISH_SP" \
        "OUTPUT_DIR=$(OS_VERSION)/sp/release" "LANG_CODE=sp" \
        "U_LANG_CODE=SP" "DEBUG_FLAGS=-O2 -migrate" "LD_FLAGS=-O2" \
        "ML_OUT=release" \
	"DIC_DIR=/home/users/dectalk/rnd/dapi/build/dic/$(OS_VERSION)/sp/release" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/sp/release"

spanish_debug::
	$(MAKE) -f Makefile.sub "LANGUAGE=SPANISH -DSPANISH_SP" \
        "OUTPUT_DIR=$(OS_VERSION)/sp/debug" "LANG_CODE=sp" \
        "U_LANG_CODE=SP" "DEBUG_FLAGS=-g -migrate" "LD_FLAGS=-g" \
        "ML_OUT=debug" \
	"DIC_DIR=/home/users/dectalk/rnd/dapi/build/dic/$(OS_VERSION)/sp/debug" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/sp/debug" 

german_release::
	$(MAKE) -f Makefile.sub "LANGUAGE=GERMAN" \
        "OUTPUT_DIR=$(OS_VERSION)/gr/release" "LANG_CODE=gr" \
        "U_LANG_CODE=GR" "DEBUG_FLAGS=-O2 -migrate" "LD_FLAGS=-O2" \
        "ML_OUT=release" \
	"DIC_DIR=/home/users/dectalk/rnd/dapi/build/dic/$(OS_VERSION)/gr/release" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/gr/release" 

german_debug::
	$(MAKE) -f Makefile.sub "LANGUAGE=GERMAN" \
        "OUTPUT_DIR=$(OS_VERSION)/gr/debug" "LANG_CODE=gr" \
        "U_LANG_CODE=GR" "DEBUG_FLAGS=-g -migrate" "LD_FLAGS=-g" \
        "ML_OUT=debug" \
	"DIC_DIR=/home/users/dectalk/rnd/dapi/build/dic/$(OS_VERSION)/gr/debug" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/gr/debug" 

latin_american_release::
	$(MAKE) -f Makefile.sub "LANGUAGE=SPANISH -DSPANISH_LA" \
        "OUTPUT_DIR=$(OS_VERSION)/la/release" "LANG_CODE=la" \
        "U_LANG_CODE=LA" "DEBUG_FLAGS=-O2 -migrate" "LD_FLAGS=-O2" \
        "ML_OUT=release" \
	"DIC_DIR=/home/users/dectalk/rnd/dapi/build/dic/$(OS_VERSION)/la/release" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/la/release"

latin_american_debug::
	$(MAKE) -f Makefile.sub "LANGUAGE=SPANISH -DSPANISH_LA" \
        "OUTPUT_DIR=$(OS_VERSION)/la/debug" "LANG_CODE=la" \
        "U_LANG_CODE=LA" "DEBUG_FLAGS=-g -migrate" "LD_FLAGS=-g" \
        "ML_OUT=debug" \
	"DIC_DIR=/home/users/dectalk/rnd/dapi/build/dic/$(OS_VERSION)/la/debug" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/la/debug" 

clean_english_release:
	$(MAKE) -f Makefile.sub clean "LANGUAGE=ENGLISH -DENGLISH_US" \
        "OUTPUT_DIR=$(OS_VERSION)/us/release" "LANG_CODE=us" \
        "U_LANG_CODE=US" "DEBUG_FLAGS=-O2" \
        "ML_OUT=release" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/us/release" 


clean_english_debug:
	$(MAKE) -f Makefile.sub clean "LANGUAGE=ENGLISH -DENGLISH_US" \
        "OUTPUT_DIR=$(OS_VERSION)/us/debug" "LANG_CODE=us" \
        "U_LANG_CODE=US" "DEBUG_FLAGS=-g" \
        "ML_OUT=debug" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/us/debug" 

clean_spanish_release::
	$(MAKE) -f Makefile.sub clean "LANGUAGE=SPANISH -DSPANISH_SP" \
        "OUTPUT_DIR=$(OS_VERSION)/sp/release" "LANG_CODE=sp" \
        "U_LANG_CODE=SP" "DEBUG_FLAGS=-O2" \
        "ML_OUT=release" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/sp/release"

clean_spanish_debug::
	$(MAKE) -f Makefile.sub clean "LANGUAGE=SPANISH -DSPANISH_SP" \
        "OUTPUT_DIR=$(OS_VERSION)/sp/debug" "LANG_CODE=sp" \
        "U_LANG_CODE=SP" "DEBUG_FLAGS=-g" \
        "ML_OUT=debug" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/sp/debug" 

clean_german_release::
	$(MAKE) -f Makefile.sub clean "LANGUAGE=GERMAN" \
        "OUTPUT_DIR=$(OS_VERSION)/gr/release" "LANG_CODE=gr" \
        "U_LANG_CODE=GR" "DEBUG_FLAGS=-O2" \
        "ML_OUT=release" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/gr/release" 

clean_german_debug::
	$(MAKE) -f Makefile.sub clean "LANGUAGE=GERMAN" \
        "OUTPUT_DIR=$(OS_VERSION)/gr/debug" "LANG_CODE=gr" \
        "U_LANG_CODE=GR" "DEBUG_FLAGS=-g" \
        "ML_OUT=debug" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/gr/debug" 

clean_latin_american_release::
	$(MAKE) -f Makefile.sub clean "LANGUAGE=SPANISH -DSPANISH_LA" \
        "OUTPUT_DIR=$(OS_VERSION)/la/release" "LANG_CODE=la" \
        "U_LANG_CODE=LA" "DEBUG_FLAGS=-O2" \
        "ML_OUT=release" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/la/release"

clean_latin_american_debug::
	$(MAKE) -f Makefile.sub clean "LANGUAGE=SPANISH -DSPANISH_LA" \
        "OUTPUT_DIR=$(OS_VERSION)/la/debug" "LANG_CODE=la" \
        "U_LANG_CODE=LA" "DEBUG_FLAGS=-g" \
        "ML_OUT=debug" \
        "DT_LIB_DIR=/home/users/dectalk/rnd/dapi/build/dectalk/$(OS_VERSION)/la/debug" 



clean:: clean_english_release clean_english_debug \
        clean_spanish_release clean_spanish_debug \
        clean_german_release clean_german_debug \
        clean_latin_american_release clean_latin_american_debug 






