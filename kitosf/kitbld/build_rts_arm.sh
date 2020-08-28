#*******************************************************
# File: build_rts.sh
# Created on 12/09/03
#
# Functionality: Creates complete demos for Linux
# 
# Run from ad/kitosf/kitbld
#
#********************************************************
# Modification History
# ------------ -------
# 001   NAL  05/30/00   Changed demo filenames
#
#********************************************************

OS_VER=`uname -r`
VERSION=5.00

mkdir -p ../$OS_VER/rt
mkdir -p ../$OS_VER/rt/temp
cd ../$OS_VER/rt/

mkdir DECtalk
mkdir german
mkdir spanish
mkdir french
mkdir latinamerican
mkdir ukenglish

echo Making US $VERSION runtime
cp ../../../dapi/build/dic/$OS_VER/us/release/dtalk_us.dic DECtalk
cp ../../../dapi/build/dectalk/$OS_VER/us/release/libtts_us.so DECtalk
cp ../../../dtalkml/build/$OS_VER/release/libtts.so DECtalk
cp ../../../dapi/src/include/l_all_ph.h DECtalk
cp ../../../dapi/src/include/l_us_ph.h DECtalk
cp ../../../dapi/src/include/l_uk_ph.h DECtalk
cp ../../../dapi/src/include/l_gr_ph.h DECtalk
cp ../../../dapi/src/include/l_sp_ph.h DECtalk
cp ../../../dapi/src/include/l_la_ph.h DECtalk
cp ../../../dapi/src/include/l_com_ph.h DECtalk
cp ../../../dapi/src/include/l_fr_ph.h DECtalk
cp ../../../dapi/src/api/ttsapi.h DECtalk
cp ../../../dapi/src/osf/dtmmedefs.h DECtalk
cp ../../kitbld/read_rt.txt DECtalk/readme.txt
cp ../../kitbld/install_files_rt.sh DECtalk/files.sh
cp ../../../samplosf/build/dtsamples/$OS_VER/us/release/say DECtalk
cp ../../../licunix/build/$OS_VER/release/arminstaller DECtalk/installer
tar czvf linux_runtime_"$VERSION"_intel.tar.gz DECtalk

echo Making UK $VERSION runtime
LANG=uk
cp ../../../dapi/build/dic/$OS_VER/$LANG/release/dtalk_$LANG.dic ukenglish
cp ../../../dapi/build/dectalk/$OS_VER/$LANG/release/libtts_$LANG.so ukenglish
cp ../../kitbld/install_files_rt_$LANG.sh ukenglish/installer
tar czvf linux_runtime_"$VERSION"_intel_ukenglish.tar.gz ukenglish

echo Making GR $VERSION runtime
LANG=gr
cp ../../../dapi/build/dic/$OS_VER/$LANG/release/dtalk_$LANG.dic german
cp ../../../dapi/src/dic/dtalk_fl_$LANG.dic german
cp ../../../dapi/build/dectalk/$OS_VER/$LANG/release/libtts_$LANG.so german
cp ../../kitbld/install_files_rt_$LANG.sh german/installer
tar czvf linux_runtime_"$VERSION"_intel_german.tar.gz german

echo Making SP $VERSION runtime
LANG=sp
cp ../../../dapi/build/dic/$OS_VER/$LANG/release/dtalk_$LANG.dic spanish
cp ../../../dapi/build/dectalk/$OS_VER/$LANG/release/libtts_$LANG.so spanish
cp ../../kitbld/install_files_rt_$LANG.sh spanish/installer
tar czvf linux_runtime_"$VERSION"_intel_spanish.tar.gz spanish

echo Making LA $VERSION runtime
LANG=la
cp ../../../dapi/build/dic/$OS_VER/$LANG/release/dtalk_$LANG.dic latinamerican
cp ../../../dapi/build/dectalk/$OS_VER/$LANG/release/libtts_$LANG.so latinamerican
cp ../../kitbld/install_files_rt_$LANG.sh latinamerican/installer
tar czvf linux_runtime_"$VERSION"_intel_latinamerican.tar.gz latinamerican

echo Making FR $VERSION runtime
LANG=fr
cp ../../../dapi/build/dic/$OS_VER/$LANG/release/dtalk_$LANG.dic french
cp ../../../dapi/build/dectalk/$OS_VER/$LANG/release/libtts_$LANG.so french
cp ../../kitbld/install_files_rt_$LANG.sh french/installer
tar czvf linux_runtime_"$VERSION"_intel_french.tar.gz french

