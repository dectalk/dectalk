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

mkdir ../../samplosf/demos
mkdir ../../samplosf/demos/temp
cd ../../samplosf/demos/temp

sudo cp ../../src/speak/text/* .
sudo cp /usr/lib/dtk/bitmaps/*a.xpm .

echo .
echo Making US demo...
sudo cp ../../build/speak/2.0.34/us/release/gspeakdem_us .
sudo cp ../../../dapi/build/dic/2.0.34/us/release/dtalk_us.dic .
sudo tar czvf ../intel_demo_us.tar.gz ./*.txt ./*_us* ./demo.en ./demo.wav ./*.xpm

echo .
echo Making UK demo...
sudo cp ../../build/speak/2.0.34/uk/release/gspeakdem_uk .
sudo cp ../../../dapi/build/dic/2.0.34/uk/release/dtalk_uk.dic .
sudo tar czvf ../intel_demo_uk.tar.gz ./*.txt ./*_uk* ./demo.uk ./demo.wav ./*.xpm

echo .
echo Making SP demo...
sudo cp ../../build/speak/2.0.34/sp/release/gspeakdem_sp .
sudo cp ../../../dapi/build/dic/2.0.34/sp/release/dtalk_sp.dic .
sudo tar czvf ../intel_demo_sp.tar.gz ./*.txt ./*_sp* ./demo.sp ./demo.wav ./*.xpm

echo .
echo Making LA demo...
sudo cp ../../build/speak/2.0.34/la/release/gspeakdem_la .
sudo cp ../../../dapi/build/dic/2.0.34/la/release/dtalk_la.dic .
sudo tar czvf ../intel_demo_la.tar.gz ./*.txt ./*_la* ./demo.la ./demo.wav ./*.xpm

echo .
echo Making GR demo...
sudo cp ../../build/speak/2.0.34/gr/release/gspeakdem_gr .
sudo cp ../../../dapi/build/dic/2.0.34/gr/release/dtalk_gr.dic .
sudo tar czvf ../intel_demo_gr.tar.gz ./*.txt ./*_gr* ./demo.gr ./demo.wav ./*.xpm

echo .
echo Making ALL demo...
sudo tar czvf ../intel_demo_all.tar.gz ./*

sudo rm ./*
cd ..
sudo rmdir ./temp


