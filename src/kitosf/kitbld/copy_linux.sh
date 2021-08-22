#!/bin/sh
#
# 001 MGS Added french
# 002 MGS changes for 4.61 documentation
#
OS_VER=`uname -r`
cd ..
KITPATH=`pwd`
cd ..
SOURCEBASE=`pwd`
#CUR_PATH=`pwd`
#SOURCEBASE=$CUR_PATH"/../.."

DOCS="$SOURCEBASE/docsosf"
KIT=$KITPATH"/$OS_VER"
KITSRC=$KITPATH"/$OS_VER/src/DECtalk_5.00"
LIBS="$SOURCEBASE/dapi/build/dectalk/$OS_VER"
COPY="cp -r"
LICENSE="$SOURCEBASE/licunix/build/$OS_VER/release"
UDICT="$SOURCEBASE/udicunix/build/$OS_VER"
#

echo "Cleaning $KIT"
rm -rf $KITSRC

echo "making directories in $KIT"
mkdir -p $KIT/output
mkdir -p $KITSRC/bin
mkdir -p $KITSRC/X11/bin
mkdir -p $KITSRC/lib/DECtalk/bitmaps
mkdir -p $KITSRC/man/man1
mkdir -p $KITSRC/man/man3
mkdir -p $KITSRC/doc/DECtalk/ps
mkdir -p $KITSRC/doc/DECtalk/html
mkdir -p $KITSRC/doc/DECtalk/pdf
mkdir -p $KITSRC/include/dtk
mkdir -p $KITSRC/src/DECtalk/dtsamples
mkdir -p $KITSRC/src/DECtalk/gspeak

echo "copying install scripts and readme to $KITSRC"
$COPY $KITPATH/kitbld/install.sh $KITSRC
$COPY $KITPATH/kitbld/locations.sh $KITSRC
$COPY $KITPATH/kitbld/README $KITSRC
$COPY $KITPATH/kitbld/INSTALL $KITSRC

chmod +x $KITSRC/*.sh



echo "Copying sample program source to $KITSRC/src/DECtalk"

$COPY $SOURCEBASE/samplosf/src/dtsamples/aclock.c $KITSRC/src/DECtalk/dtsamples
$COPY $SOURCEBASE/samplosf/src/dtsamples/say.c $KITSRC/src/DECtalk/dtsamples
$COPY $SOURCEBASE/samplosf/src/dtsamples/dtmemory.c $KITSRC/src/DECtalk/dtsamples
$COPY $SOURCEBASE/samplosf/src/speak/gspeak.c $KITSRC/src/DECtalk/gspeak

echo "Copying sample programs to $KITSRC/X11/bin"

$COPY $SOURCEBASE/samplosf/build/speak/$OS_VER/release/gspeak*  $KITSRC/X11/bin/

$COPY $SOURCEBASE/samplosf/build/windict/$OS_VER/us/release/windic  $KITSRC/X11/bin/

echo "Copying sample programs to $KITSRC/bin"
$COPY $SOURCEBASE/samplosf/build/dtsamples/$OS_VER/us/release/say  $KITSRC/bin/
$COPY $SOURCEBASE/samplosf/build/dtsamples/$OS_VER/us/release/aclock  $KITSRC/bin/
$COPY $SOURCEBASE/samplosf/build/dtsamples/$OS_VER/us/release/dtmemory  $KITSRC/bin/

echo "Copying the speak xpm to $KITSRC/lib/DECtalk/bitmaps"

$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/*.xpm $KITSRC/lib/DECtalk/bitmaps

#
#       Copy the header files
#
echo "Copying Header files to $KITSRC/include/dtk"
$COPY $SOURCEBASE/dapi/src/api/ttsapi.h        $KITSRC/include/dtk/
$COPY $SOURCEBASE/dapi/src/osf/dtmmedefs.h     $KITSRC/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_all_ph.h      $KITSRC/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_us_ph.h       $KITSRC/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_uk_ph.h       $KITSRC/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_sp_ph.h       $KITSRC/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_la_ph.h       $KITSRC/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_gr_ph.h       $KITSRC/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_com_ph.h      $KITSRC/include/dtk/

#
#       Copy the on-line help
#
echo "Copying the ps docs to $KITSRC/doc/DECtalk/ps"
$COPY $DOCS/ps/dtk_install_guide.ps $KITSRC/doc/DECtalk/ps
$COPY $DOCS/ps/dtk_prog_guide.ps $KITSRC/doc/DECtalk/ps
$COPY $DOCS/ps/dtk_reference_guide.ps $KITSRC/doc/DECtalk/ps

echo "Copying the pdf docs to $KITSRC/doc/DECtalk/pdf"
$COPY $DOCS/pdf/dtk_install_guide.pdf $KITSRC/doc/DECtalk/pdf
$COPY $DOCS/pdf/dtk_prog_guide.pdf $KITSRC/doc/DECtalk/pdf
$COPY $DOCS/pdf/dtk_reference_guide.pdf $KITSRC/doc/DECtalk/pdf

echo Copying the man3 pages to $KITSRC/man/man3

$COPY $DOCS/man/man3/*.3 $KITSRC/man/man3/

echo Copying the man1 pages to $KITSRC/man/man1

$COPY $DOCS/man/man1/*.1 $KITSRC/man/man1/

echo "Copying the language .so to $KITSRC/lib"
$COPY $LIBS/us/release/libtts_us.so $KITSRC/lib
$COPY $LIBS/uk/release/libtts_uk.so $KITSRC/lib
$COPY $LIBS/sp/release/libtts_sp.so $KITSRC/lib
$COPY $LIBS/gr/release/libtts_gr.so $KITSRC/lib
$COPY $LIBS/fr/release/libtts_fr.so $KITSRC/lib
$COPY $LIBS/la/release/libtts_la.so $KITSRC/lib


#
#	Copy The ML library
#
echo "Copying the ML library to $KITSRC/lib"
$COPY $SOURCEBASE/dtalkml/build/$OS_VER/release/libtts.so  $KITSRC/lib/

#
#       Copy the dictionary
#
echo "Copying the dictionaries to $KITSRC/lib/DECtalk"
$COPY $SOURCEBASE/dapi/build/dic/$OS_VER/us/release/dtalk_us.dic $KITSRC/lib/DECtalk/
$COPY $SOURCEBASE/dapi/build/dic/$OS_VER/uk/release/dtalk_uk.dic $KITSRC/lib/DECtalk/
$COPY $SOURCEBASE/dapi/build/dic/$OS_VER/sp/release/dtalk_sp.dic $KITSRC/lib/DECtalk/
$COPY $SOURCEBASE/dapi/build/dic/$OS_VER/la/release/dtalk_la.dic $KITSRC/lib/DECtalk/
$COPY $SOURCEBASE/dapi/build/dic/$OS_VER/gr/release/dtalk_gr.dic $KITSRC/lib/DECtalk/
$COPY $SOURCEBASE/dapi/build/dic/$OS_VER/fr/release/dtalk_fr.dic $KITSRC/lib/DECtalk/
$COPY $SOURCEBASE/dapi/src/dic/dtalk_fl_gr.dic $KITSRC/lib/DECtalk/


echo "Copying some sample text to $KITSRC/src/DECtalk/dtsamples"

$COPY $SOURCEBASE/dapi/src/dic/user.tab      $KITSRC/src/DECtalk/dtsamples
$COPY $SOURCEBASE/samplosf/src/data/birthday.txt $KITSRC/src/DECtalk/dtsamples/
$COPY $SOURCEBASE/samplosf/src/data/demo.txt     $KITSRC/src/DECtalk/dtsamples/
$COPY $SOURCEBASE/samplosf/src/data/startup.txt  $KITSRC/src/DECtalk/dtsamples/
$COPY $SOURCEBASE/samplosf/src/data/noglass.txt  $KITSRC/src/DECtalk/dtsamples/

#
#       Copy the tools to work with the user dictionary
#
echo "Copying the user dictionary tools to $KITSRC/bin"
$COPY $UDICT/us/release/udic_us  $KITSRC/bin/userdic_us
$COPY $UDICT/uk/release/udic_uk  $KITSRC/bin/userdic_uk
$COPY $UDICT/sp/release/udic_sp  $KITSRC/bin/userdic_sp
$COPY $UDICT/gr/release/udic_gr  $KITSRC/bin/userdic_gr
$COPY $UDICT/fr/release/udic_fr  $KITSRC/bin/userdic_fr
$COPY $UDICT/la/release/udic_la  $KITSRC/bin/userdic_la


echo "Copying the license program to $LICENSE"
$COPY $LICENSE/licenin3 $KITSRC/bin


echo "Copy the html help files to $KITSRC/doc/DECtalk/html"


cp $DOCS/html/dectalk.htm $KITSRC/doc/DECtalk/html/index.html
cp $DOCS/html/* $KITSRC/doc/DECtalk/html/


echo " Copied all DTK kit files into the proper directories."
echo " Login as su and run create_kit.sh to complete building "
echo " the kit."
