#!/bin/sh
#
# 001 MGS 03/29/2001 Added French

source locations.sh

echo "Installing libraries"
mkdir -p $LIBS
cp lib/*.so $LIBS

echo "Installing dictionaries"
mkdir -p $DICTIONARIES
cp lib/DECtalk/*.dic $DICTIONARIES

echo "Installing bitmaps"
mkdir -p $BITMAPS
cp lib/DECtalk/bitmaps/*.xpm $BITMAPS

echo "Installing Text Sample Programs"
mkdir -p $TEXT_SAMPLE_PROGRAMS
cp bin/* $TEXT_SAMPLE_PROGRAMS

echo "Installing Graphic Sample Programs"
mkdir -p $GRAPHIC_SAMPLE_PROGRAMS
cp X11/bin/* $GRAPHIC_SAMPLE_PROGRAMS

echo "Installing HTML documentation"
mkdir -p $DOCUMENTATION/html
cp doc/DECtalk/html/* $DOCUMENTATION/html

echo "Installing pdf documentation"
mkdir -p $DOCUMENTATION/pdf
cp doc/DECtalk/pdf/* $DOCUMENTATION/pdf

echo "Installing ps documentation"
mkdir -p $DOCUMENTATION/ps
cp doc/DECtalk/html/* $DOCUMENTATION/ps

echo "Installing man1 pages"
mkdir -p $MAN1
cp man/man1/* $MAN1

echo "Installing man3 pages"
mkdir -p $MAN3
cp man/man3/* $MAN3

echo "Installing sample sources"
mkdir -p $SAMPLE_SOURCE
cp -R src/DECtalk/* $SAMPLE_SOURCE

echo "setting up DECtalk.conf"
echo "licenses:YV808w008IQ0" >> /etc/DECtalk.conf
echo "licensepassword:kw60P7Y0bGRNB1@W3L@" >> /etc/DECtalk.conf
echo "US_dict:"$DICTIONARIES"/dtalk_us.dic" >> /etc/DECtalk.conf
echo "UK_dict:"$DICTIONARIES"/dtalk_uk.dic" >> /etc/DECtalk.conf
echo "SP_dict:"$DICTIONARIES"/dtalk_sp.dic" >> /etc/DECtalk.conf
echo "GR_dict:"$DICTIONARIES"/dtalk_gr.dic" >> /etc/DECtalk.conf
echo "LA_dict:"$DICTIONARIES"/dtalk_la.dic" >> /etc/DECtalk.conf
echo "FR_dict:"$DICTIONARIES"/dtalk_fr.dic" >> /etc/DECtalk.conf
echo "US_udict:udict_us.dic" >> /etc/DECtalk.conf
echo "UK_udict:udict_uk.dic" >> /etc/DECtalk.conf
echo "SP_udict:udict_sp.dic" >> /etc/DECtalk.conf
echo "GR_udict:udict_gr.dic" >> /etc/DECtalk.conf
echo "LA_udict:udict_la.dic" >> /etc/DECtalk.conf
echo "FR:udict_fr.dic" >> /etc/DECtalk.conf
echo "Speak_xpm_dir:"$BITMAPS"/" >> /etc/DECtalk.conf
echo "Default_lang:us" >> /etc/DECtalk.conf
echo "LANG:us,US English" >> /etc/DECtalk.conf
echo "LANG:uk,UK English" >> /etc/DECtalk.conf
echo "LANG:sp,Spanish" >> /etc/DECtalk.conf
echo "LANG:gr,German" >> /etc/DECtalk.conf
echo "LANG:la,Latin American" >> /etc/DECtalk.conf
echo "LANG:fr,French" >> /etc/DECtalk.conf



say -a "DECtalk V4.61 has been successfully installed"

echo "If DECtalk just spoke, DECtalk was sucessfully installed."
echo "If DECtalk did not speak, your sound device may not be functioning or"
echo "your path may not include the directory that DECtalk was installed to."
echo "If you have installed rsynth, rsynth installs a say program of"
echo "its own.  That may be the program that just spoke."



