# Generated automatically from Makefile.in by configure.
# Top Level Makefile for Dectalk software for alpha-dec-osf4.0

# 001 MGS 11/19/1997 Added UK
# 002 MGS 05/21/1998 removed extra spanish_release:: line
# 003 ETT 10/22/1998 moved to autoconf system. this file, Makefile.in,
#		is processed by configure to produce Makefile

#### Start of system configuration section. ####  
# first run autoconf in this dir the exe configure will pop out.
# run configure and it will produce all the make files for you

OS_VERSION=V4.0
BUILD_DIR=/home/dectalk/rnd/dapi/build

#### End of system configuration section. #### 

all:: release
#debug
#release

debug::	english_debug uk_debug spanish_debug german_debug latin_american_debug french_debug

release:: english_release uk_release spanish_release german_release latin_american_release french_release

english_release:
	$(MAKE) -f Makefile.sub "LANGUAGE=ENGLISH -DENGLISH_US -DACNA" \
        "OUTPUT_DIR=$(OS_VERSION)/us/release" "LANG_CODE=us" \
        "U_LANG_CODE=US" "ML_OUT=release" \
	"DIC_DIR=$(BUILD_DIR)/dic/$(OS_VERSION)/us/release" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/us/release" 

english_debug:
	$(MAKE) -f Makefile.sub "LANGUAGE=ENGLISH -DENGLISH_US -DACNA" \
        "OUTPUT_DIR=$(OS_VERSION)/us/debug" "LANG_CODE=us" \
        "U_LANG_CODE=US" "ML_OUT=debug" \
	"DIC_DIR=$(BUILD_DIR)/dic/$(OS_VERSION)/us/debug" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/us/debug" 

uk_release:
	$(MAKE) -f Makefile.sub "LANGUAGE=ENGLISH -DENGLISH_UK" \
        "OUTPUT_DIR=$(OS_VERSION)/uk/release" "LANG_CODE=uk" \
        "U_LANG_CODE=UK" "ML_OUT=release" \
	"DIC_DIR=$(BUILD_DIR)/dic/$(OS_VERSION)/uk/release" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/uk/release" 

uk_debug:
	$(MAKE) -f Makefile.sub "LANGUAGE=ENGLISH -DENGLISH_UK" \
        "OUTPUT_DIR=$(OS_VERSION)/uk/debug" "LANG_CODE=uk" \
        "U_LANG_CODE=UK" "ML_OUT=debug" \
	"DIC_DIR=$(BUILD_DIR)/dic/$(OS_VERSION)/uk/debug" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/uk/debug" 

spanish_release::
	$(MAKE) -f Makefile.sub  "LANGUAGE=SPANISH -DSPANISH_SP" \
        "OUTPUT_DIR=$(OS_VERSION)/sp/release" "LANG_CODE=sp" \
        "U_LANG_CODE=SP" "ML_OUT=release" \
	"DIC_DIR=$(BUILD_DIR)/dic/$(OS_VERSION)/sp/release" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/sp/release"

spanish_debug::
	$(MAKE) -f Makefile.sub "LANGUAGE=SPANISH -DSPANISH_SP" \
        "OUTPUT_DIR=$(OS_VERSION)/sp/debug" "LANG_CODE=sp" \
        "U_LANG_CODE=SP" "ML_OUT=debug" \
	"DIC_DIR=$(BUILD_DIR)/dic/$(OS_VERSION)/sp/debug" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/sp/debug" 

german_release::
	$(MAKE) -f Makefile.sub "LANGUAGE=GERMAN" \
        "OUTPUT_DIR=$(OS_VERSION)/gr/release" "LANG_CODE=gr" \
        "U_LANG_CODE=GR" "ML_OUT=release" \
	"DIC_DIR=$(BUILD_DIR)/dic/$(OS_VERSION)/gr/release" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/gr/release" 

german_debug::
	$(MAKE) -f Makefile.sub "LANGUAGE=GERMAN" \
        "OUTPUT_DIR=$(OS_VERSION)/gr/debug" "LANG_CODE=gr" \
        "U_LANG_CODE=GR" "ML_OUT=debug" \
	"DIC_DIR=$(BUILD_DIR)/dic/$(OS_VERSION)/gr/debug" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/gr/debug" 

latin_american_release::
	$(MAKE) -f Makefile.sub "LANGUAGE=SPANISH -DSPANISH_LA" \
        "OUTPUT_DIR=$(OS_VERSION)/la/release" "LANG_CODE=la" \
        "U_LANG_CODE=LA" "ML_OUT=release" \
	"DIC_DIR=$(BUILD_DIR)/dic/$(OS_VERSION)/la/release" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/la/release"

latin_american_debug::
	$(MAKE) -f Makefile.sub "LANGUAGE=SPANISH -DSPANISH_LA" \
        "OUTPUT_DIR=$(OS_VERSION)/la/debug" "LANG_CODE=la" \
        "U_LANG_CODE=LA" "ML_OUT=debug" \
	"DIC_DIR=$(BUILD_DIR)/dic/$(OS_VERSION)/la/debug" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/la/debug" 

french_release::
	$(MAKE) -f Makefile.sub "LANGUAGE=FRENCH" \
	"OUTPUT_DIR=$(OS_VERSION)/fr/release" "LANG_CODE=fr" \
	"U_LANG_CODE=FR" "ML_OUT=release" \
	"DIC_DIR=$(BUILD_DIR)/dic/$(OS_VERSION)/fr/release" \
	"DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/fr/release"

french_debug::
	$(MAKE) -f Makefile.sub "LANGUAGE=FRENCH" \
	"OUTPUT_DIR=$(OS_VERSION)/fr/debug" "LANG_CODE=fr" \
	"U_LANG_CODE=FR" "ML_OUT=debug" \
	"DIC_DIR=$(BUILD_DIR)/dic/$(OS_VERSION)/fr/debug" \
	"DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/fr/debug"

clean_english_release:
	$(MAKE) -f Makefile.sub clean "LANGUAGE=ENGLISH -DENGLISH_US" \
        "OUTPUT_DIR=$(OS_VERSION)/us/release" "LANG_CODE=us" \
        "U_LANG_CODE=US" "ML_OUT=release" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/us/release" 

clean_english_debug:
	$(MAKE) -f Makefile.sub clean "LANGUAGE=ENGLISH -DENGLISH_US" \
        "OUTPUT_DIR=$(OS_VERSION)/us/debug" "LANG_CODE=us" \
        "U_LANG_CODE=US" "ML_OUT=debug" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/us/debug" 

clean_uk_release:
	$(MAKE) -f Makefile.sub clean "LANGUAGE=ENGLISH -DENGLISH_UK" \
        "OUTPUT_DIR=$(OS_VERSION)/uk/release" "LANG_CODE=uk" \
        "U_LANG_CODE=UK" "ML_OUT=release" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/uk/release" 

clean_uk_debug:
	$(MAKE) -f Makefile.sub clean "LANGUAGE=ENGLISH -DENGLISH_UK" \
        "OUTPUT_DIR=$(OS_VERSION)/uk/debug" "LANG_CODE=uk" \
        "U_LANG_CODE=UK" "ML_OUT=debug" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/uk/debug"

clean_spanish_release::
	$(MAKE) -f Makefile.sub clean "LANGUAGE=SPANISH -DSPANISH_SP" \
        "OUTPUT_DIR=$(OS_VERSION)/sp/release" "LANG_CODE=sp" \
        "U_LANG_CODE=SP" "ML_OUT=release" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/sp/release"

clean_spanish_debug::
	$(MAKE) -f Makefile.sub clean "LANGUAGE=SPANISH -DSPANISH_SP" \
        "OUTPUT_DIR=$(OS_VERSION)/sp/debug" "LANG_CODE=sp" \
        "U_LANG_CODE=SP" "ML_OUT=debug" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/sp/debug" 

clean_german_release::
	$(MAKE) -f Makefile.sub clean "LANGUAGE=GERMAN" \
        "OUTPUT_DIR=$(OS_VERSION)/gr/release" "LANG_CODE=gr" \
        "U_LANG_CODE=GR" "ML_OUT=release" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/gr/release" 

clean_german_debug::
	$(MAKE) -f Makefile.sub clean "LANGUAGE=GERMAN" \
        "OUTPUT_DIR=$(OS_VERSION)/gr/debug" "LANG_CODE=gr" \
        "U_LANG_CODE=GR" "ML_OUT=debug" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/gr/debug" 

clean_latin_american_release::
	$(MAKE) -f Makefile.sub clean "LANGUAGE=SPANISH -DSPANISH_SP" \
        "OUTPUT_DIR=$(OS_VERSION)/la/release" "LANG_CODE=la" \
        "U_LANG_CODE=LA" "ML_OUT=release" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/la/release"

clean_latin_american_debug::
	$(MAKE) -f Makefile.sub clean "LANGUAGE=SPANISH -DSPANISH_SP" \
        "OUTPUT_DIR=$(OS_VERSION)/la/debug" "LANG_CODE=la" \
        "U_LANG_CODE=LA" "ML_OUT=debug" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/la/debug" 

clean_french_release::
        $(MAKE) -f Makefile.sub clean "LANGUAGE=FRENCH" \
        "OUTPUT_DIR=$(OS_VERSION)/fr/release" "LANG_CODE=fr" \
        "U_LANG_CODE=FR" "ML_OUT=release" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/fr/release"

clean_french_debug::
        $(MAKE) -f Makefile.sub clean "LANGUAGE=FRENCH" \
        "OUTPUT_DIR=$(OS_VERSION)/fr/debug" "LANG_CODE=fr" \
        "U_LANG_CODE=FR" "ML_OUT=debug" \
        "DT_LIB_DIR=$(BUILD_DIR)/dectalk/$(OS_VERSION)/fr/debug"

clean:: clean_debug 
#clean_release

clean_debug:: clean_english_debug clean_uk_debug \
	clean_spanish_debug clean_german_debug \
	clean_latin_american_debug clean_french_release

clean_release:: clean_english_release clean_uk_release \
	clean_spanish_release clean_german_release \
	clean_latin_american_release clean_french_release
