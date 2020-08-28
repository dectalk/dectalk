#*******************************************************
# File: build_demos.sh
# Created on 04/15/00
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

VERSION=`uname -r`

mkdir ../../samplosf/demos
mkdir ../../samplosf/demos/temp
cd ../../samplosf/demos/temp

cp ../../src/speak/text/* .
cp ../../src/speak/demo.wav .
cp ../../src/speak/bitmaps/*a.xpm .

echo .
echo Making US demo...
cp ../../build/speak/$VERSION/us/release/gspeakdem_us .
cp ../../../dapi/build/dic/$VERSION/us/release/dtalk_us.dic .
tar czvf ../intel_demo_us.tar.gz ./*.txt ./*_us* ./demo.en ./demo.wav ./*.xpm

echo .
echo Making UK demo...
cp ../../build/speak/$VERSION/uk/release/gspeakdem_uk .
cp ../../../dapi/build/dic/$VERSION/uk/release/dtalk_uk.dic .
tar czvf ../intel_demo_uk.tar.gz ./*.txt ./*_uk* ./demo.uk ./demo.wav ./*.xpm

echo .
echo Making SP demo...
cp ../../build/speak/$VERSION/sp/release/gspeakdem_sp .
cp ../../../dapi/build/dic/$VERSION/sp/release/dtalk_sp.dic .
tar czvf ../intel_demo_sp.tar.gz ./*.txt ./*_sp* ./demo.sp ./demo.wav ./*.xpm

echo .
echo Making LA demo...
cp ../../build/speak/$VERSION/la/release/gspeakdem_la .
cp ../../../dapi/build/dic/$VERSION/la/release/dtalk_la.dic .
tar czvf ../intel_demo_la.tar.gz ./*.txt ./*_la* ./demo.la ./demo.wav ./*.xpm

echo .
echo Making GR demo...
cp ../../build/speak/$VERSION/gr/release/gspeakdem_gr .
cp ../../../dapi/build/dic/$VERSION/gr/release/dtalk_gr.dic .
tar czvf ../intel_demo_gr.tar.gz ./*.txt ./*_gr* ./demo.gr ./demo.wav ./*.xpm

echo .
echo Making FR demo...
cp ../../build/speak/$VERSION/fr/release/gspeakdem_fr .
cp ../../../dapi/build/dic/$VERSION/fr/release/dtalk_fr.dic .
tar czvf ../intel_demo_fr.tar.gz ./*.txt ./*_fr* ./demo.fr ./demo.wav ./*.xpm

echo .
echo Making ALL demo...
tar czvf ../intel_demo_all.tar.gz ./*

rm ./*
cd ..
rmdir ./temp


