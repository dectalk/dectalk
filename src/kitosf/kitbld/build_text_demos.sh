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

echo .
echo Making US demo...
cp ../../build/dtsamples/$VERSION/us/release/say_demo_us .
cp ../../build/dtsamples/$VERSION/us/release/dtmemory_demo_us .
cp ../../../dapi/build/dic/$VERSION/us/release/dtalk_us.dic .
tar cvf ../arm_demo_us.tar ./*.txt ./*_us* ./demo.en ./demo.wav 
gzip ../arm_demo_us.tar

echo .
echo Making UK demo...
cp ../../build/dtsamples/$VERSION/uk/release/say_demo_uk .
cp ../../build/dtsamples/$VERSION/uk/release/dtmemory_demo_uk .
cp ../../../dapi/build/dic/$VERSION/uk/release/dtalk_uk.dic .
tar cvf ../arm_demo_uk.tar ./*.txt ./*_uk* ./demo.uk ./demo.wav 
gzip ../arm_demo_uk.tar

echo .
echo Making SP demo...
cp ../../build/dtsamples/$VERSION/sp/release/say_demo_sp .
cp ../../build/dtsamples/$VERSION/sp/release/dtmemory_demo_sp .
cp ../../../dapi/build/dic/$VERSION/sp/release/dtalk_sp.dic .
tar cvf ../arm_demo_sp.tar ./*.txt ./*_sp* ./demo.sp ./demo.wav 
gzip ../arm_demo_sp.tar

echo .
echo Making LA demo...
cp ../../build/dtsamples/$VERSION/la/release/say_demo_la .
cp ../../build/dtsamples/$VERSION/la/release/dtmemory_demo_la .
cp ../../../dapi/build/dic/$VERSION/la/release/dtalk_la.dic .
tar cvf ../arm_demo_la.tar ./*.txt ./*_la* ./demo.la ./demo.wav 
gzip ../arm_demo_la.tar

echo .
echo Making GR demo...
cp ../../build/dtsamples/$VERSION/gr/release/say_demo_gr .
cp ../../build/dtsamples/$VERSION/gr/release/dtmemory_demo_gr .
cp ../../../dapi/build/dic/$VERSION/gr/release/dtalk_gr.dic .
tar cvf ../arm_demo_gr.tar ./*.txt ./*_gr* ./demo.gr ./demo.wav 
gzip ../arm_demo_gr.tar

echo .
echo Making FR demo...
cp ../../build/dtsamples/$VERSION/fr/release/say_demo_fr .
cp ../../build/dtsamples/$VERSION/fr/release/dtmemory_demo_fr .
cp ../../../dapi/build/dic/$VERSION/fr/release/dtalk_fr.dic .
tar cvf ../arm_demo_fr.tar ./*.txt ./*_gr* ./demo.fr ./demo.wav 
gzip ../arm_demo_fr.tar

echo .
echo Making ALL demo...
tar cvf ../arm_demo_all.tar ./*
gzip ../arm_demo_all.tar

rm ./*
cd ..
rmdir ./temp


