#!/bin/sh
#
# 001 MGS 03/29/2001 Added French

BASE_DIR="/usr/local"

LIBS=$BASE_DIR"/lib"
DICTIONARIES=$BASE_DIR"/lib/DECtalk/"
BINARIES=$BASE_DIR"/bin"
INCLUDE=$BASE_DIR"/include/dtk"

echo "Installing libraries"
mkdir -p $LIBS
cp libtts*.so $LIBS

echo "Installing dictionaries"
mkdir -p $DICTIONARIES
cp *.dic $DICTIONARIES

echo "Installing sample program"
mkdir -p $BINARIES
cp say $BINARIES

echo "Installing include files"
mkdir -p $INCLUDE
cp *.h $INCLUDE

echo "setting up DECtalk.conf"
echo "UK_dict:"$DICTIONARIES"dtalk_uk.dic" >> /etc/DECtalk.conf
echo "UK_udict:udict_uk.dic" >> /etc/DECtalk.conf
echo "LANG:uk,UK English" >> /etc/DECtalk.conf

grep $LIBS /etc/ld.so.conf >/dev/null || {
  echo $LIBS >>/etc/ld.so.conf; /sbin/ldconfig }

