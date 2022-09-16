#!/bin/csh
#
# @DEC_COPYRIGHT@
#
# HISTORY
# MGS 02/17/1998        Fix html copy command.
#
# MGS 11/20/1997	Added code for UK
# Revision 1.1.2.34 removed decface stuff MGS 09/29/1997
#
# Revision 1.1.2.33  1996/10/03  11:54:37  Cathy_Page
# 	Added in dtk430_reference_guide.tst and .ps
# 	[1996/10/03  11:54:24  Cathy_Page]
#
# Revision 1.1.2.32  1996/10/02  11:56:36  Cathy_Page
# 	Previous log comment incorrect - Changed 420 to 430 and V4.2A to V4.3
# 	[1996/10/02  11:56:14  Cathy_Page]
# 
# Revision 1.1.2.31  1996/10/02  11:53:58  Cathy_Page
# 	Typo - Changed UNIT to UINT
# 	[1996/10/02  11:53:36  Cathy_Page]
# 
# Revision 1.1.2.30  1996/03/15  00:59:05  Krishna_Mangipudi
# 	Added cover letter
# 	[1996/03/15  00:58:50  Krishna_Mangipudi]
# 
# Revision 1.1.2.29  1996/02/27  18:47:00  Krishna_Mangipudi
# 	changed run_toc.html to DtkUsersGuide.html
# 	[1996/02/27  18:46:37  Krishna_Mangipudi]
# 
# Revision 1.1.2.28  1996/02/27  00:29:45  Krishna_Mangipudi
# 	Added all the html files
# 	[1996/02/27  00:29:25  Krishna_Mangipudi]
# 
# Revision 1.1.2.27  1996/02/26  18:03:22  Krishna_Mangipudi
# 	strip files in scps
# 	[1996/02/26  18:03:02  Krishna_Mangipudi]
# 
# Revision 1.1.2.26  1996/02/21  14:59:54  Krishna_Mangipudi
# 	Added emacspeak.1 & emacspeak.1dtk
# 	[1996/02/21  14:59:32  Krishna_Mangipudi]
# 
# Revision 1.1.2.25  1996/02/20  16:55:26  Krishna_Mangipudi
# 	look in html for html file
# 	[1996/02/20  16:55:11  Krishna_Mangipudi]
# 
# Revision 1.1.2.24  1996/02/20  14:38:25  Krishna_Mangipudi
# 	Added html docs
# 	[1996/02/20  14:37:45  Krishna_Mangipudi]
# 
# Revision 1.1.2.23  1996/02/16  21:37:23  Krishna_Mangipudi
# 	Added whatis
# 	[1996/02/16  21:37:03  Krishna_Mangipudi]
# 
# Revision 1.1.2.22  1996/02/12  23:52:39  Krishna_Mangipudi
# 	Copy emacspeak-README.txt
# 	[1996/02/12  23:52:32  Krishna_Mangipudi]
# 
# Revision 1.1.2.21  1996/02/07  20:59:14  Krishna_Mangipudi
# 	Added decface.gif icon
# 	[1996/02/07  20:59:01  Krishna_Mangipudi]
# 
# Revision 1.1.2.20  1996/02/01  21:33:01  Krishna_Mangipudi
# 	moved kit location
# 	[1996/02/01  21:31:27  Krishna_Mangipudi]
# 
# Revision 1.1.2.19  1996/01/26  17:36:26  Krishna_Mangipudi
# 	Added striphdr
# 	[1996/01/26  17:36:16  Krishna_Mangipudi]
# 
# Revision 1.1.2.18  1996/01/25  22:16:52  Krishna_Mangipudi
# 	Added call to strip header and add copyright
# 	[1996/01/25  22:16:35  Krishna_Mangipudi]
# 
# Revision 1.1.2.17  1996/01/19  19:52:18  Krishna_Mangipudi
# 	changed dir specification for some decface files
# 	[1996/01/19  19:52:08  Krishna_Mangipudi]
# 
# Revision 1.1.2.16  1996/01/19  16:57:03  Krishna_Mangipudi
# 	Changed DECFace.ini to DECface.ini
# 	[1996/01/19  16:56:47  Krishna_Mangipudi]
# 
# Revision 1.1.2.15  1996/01/18  18:13:11  Krishna_Mangipudi
# 	Changed ini file from DECface.ini to DECFace.ini
# 	[1996/01/18  18:12:56  Krishna_Mangipudi]
# 
# Revision 1.1.2.14  1996/01/18  17:42:05  Krishna_Mangipudi
# 	Changed DECFace.ad to DECface.iniDTKRT420.mi
# 	[1996/01/18  17:41:22  Krishna_Mangipudi]
# 
# Revision 1.1.2.13  1996/01/18  17:32:17  Krishna_Mangipudi
# 	Added DECface to CDE
# 	[1996/01/18  17:32:11  Krishna_Mangipudi]
# 
# Revision 1.1.2.12  1995/12/15  17:03:06  Krishna_Mangipudi
# 	changed rel notes & filelist for RT & DEV subsets
# 	[1995/12/15  17:02:46  Krishna_Mangipudi]
# 
# Revision 1.1.2.11  1995/11/29  22:09:32  Krishna_Mangipudi
# 	Do not include say, mailtalk & aclock in CDE
# 	[1995/11/29  22:09:16  Krishna_Mangipudi]
# 
# Revision 1.1.2.10  1995/11/29  20:12:10  Krishna_Mangipudi
# 	icons only for windict and speak
# 	[1995/11/29  20:12:00  Krishna_Mangipudi]
# 
# Revision 1.1.2.9  1995/11/29  16:34:18  Krishna_Mangipudi
# 	Removed icons for aclock, mailtalk and say
# 	[1995/11/29  16:34:08  Krishna_Mangipudi]
# 
# Revision 1.1.2.8  1995/11/27  21:19:07  Krishna_Mangipudi
# 	Added CDE support
# 	[1995/11/27  21:16:42  Krishna_Mangipudi]
# 
# Revision 1.1.2.7  1995/11/21  20:56:13  Krishna_Mangipudi
# 	Rolled back last change
# 	[1995/11/21  20:55:22  Krishna_Mangipudi]
# 
# Revision 1.1.2.5  1995/11/16  21:00:01  Krishna_Mangipudi
# 	Added man pages and rearranged a few files
# 	[1995/11/16  20:59:33  Krishna_Mangipudi]
# 
# Revision 1.1.2.4  1995/11/16  18:17:59  Krishna_Mangipudi
# 	Added new faces to DECface to match DECtalk Software
# 	[1995/11/16  18:16:58  Krishna_Mangipudi]
# 
# Revision 1.1.2.3  1995/11/15  23:24:48  Krishna_Mangipudi
# 	moved HELP to Macros dir
# 	[1995/11/15  23:24:36  Krishna_Mangipudi]
# 
# Revision 1.1.2.2  1995/11/15  20:45:28  Krishna_Mangipudi
# 	Initial checkin
# 	[1995/11/15  20:45:04  Krishna_Mangipudi]
# 
# $EndLog$
#
#       Define where the kit is on this local disk
#

set OS_VER     = `uname -r`
set KIT        = $SOURCEBASE/kitosf/$OS_VER
set DOCS       = $SOURCEBASE/docsosf
set EMS        = $SOURCEBASE/samplosf/src/emacspeak
set KITRT      = $SOURCEBASE/kitosf/$OS_VER/RT/src/usr/opt/DTKRT461

set COPY       = "cp -r"

#
# clean up the kit src area
#
echo "Cleaning up $KIT/RT..."

cd $KIT/RT
find . -type f -exec rm -f {} \;
#
# clean up the kit output/RT area
#
echo "Cleaning up $KIT/output/RT..."
cd ../output/RT
find . -type f -exec rm {} \;
touch space
tar cf SPACE space
#
# populate the kit src area
#
echo "Moving data into $KIT/RT..."
cd ../../../kitbld
#
#       Copy the libraries
#
$COPY $SOURCEBASE/dapi/build/dectalk/$OS_VER/us/release/libtts_us.so                   $KITRT/shlib/
$COPY $SOURCEBASE/dapi/build/dectalk/$OS_VER/us/release/libttsmme_us.so                $KITRT/shlib/
$COPY $SOURCEBASE/dapi/build/dectalk/$OS_VER/uk/release/libtts_uk.so                   $KITRT/shlib/
$COPY $SOURCEBASE/dapi/build/dectalk/$OS_VER/uk/release/libttsmme_uk.so                $KITRT/shlib/
$COPY $SOURCEBASE/dapi/build/dectalk/$OS_VER/sp/release/libtts_sp.so                   $KITRT/shlib/
$COPY $SOURCEBASE/dapi/build/dectalk/$OS_VER/sp/release/libttsmme_sp.so                $KITRT/shlib/
$COPY $SOURCEBASE/dapi/build/dectalk/$OS_VER/gr/release/libtts_gr.so                   $KITRT/shlib/
$COPY $SOURCEBASE/dapi/build/dectalk/$OS_VER/gr/release/libttsmme_gr.so                $KITRT/shlib/
$COPY $SOURCEBASE/dapi/build/dectalk/$OS_VER/la/release/libtts_la.so                   $KITRT/shlib/
$COPY $SOURCEBASE/dapi/build/dectalk/$OS_VER/la/release/libttsmme_la.so                $KITRT/shlib/
$COPY $SOURCEBASE/dapi/build/dectalk/$OS_VER/fr/release/libtts_fr.so                   $KITRT/shlib/
$COPY $SOURCEBASE/dapi/build/dectalk/$OS_VER/fr/release/libttsmme_fr.so                $KITRT/shlib/
#
#	Copy The ML library
#
$COPY $SOURCEBASE/dtalkml/build/$OS_VER/release/libtts.so                   $KITRT/shlib/
$COPY $SOURCEBASE/dtalkml/build/$OS_VER/release/libttsmme.so                $KITRT/shlib/
#
#       Copy only the executables for speak sample applet
#
set BMP = $KITRT/examples/dtk/speak/bitmaps
#
$COPY $SOURCEBASE/samplosf/build/speak/$OS_VER/release/speak       $KITRT/examples/dtk/speak/
$COPY $SOURCEBASE/samplosf/build/speak/$OS_VER/release/speak.uid   $KITRT/examples/dtk/speak/
$COPY $SOURCEBASE/samplosf/src/windict/windict.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/dtk.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/bet16a.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/bet16b.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/den16a.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/den16b.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/fra16a.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/fra16b.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/har16a.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/har16b.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/kid16a.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/kid16b.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/pau16a.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/pau16b.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/rit16a.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/rit16b.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/urs16a.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/urs16b.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/wen16a.gif $BMP/
$COPY $SOURCEBASE/samplosf/src/speak/bitmaps/wen16b.gif $BMP/
#
#       Copy CDE icons 
#
set CDEPM = $KITRT/etc/dt/appconfig/icons/C
#
$COPY $SOURCEBASE/samplosf/src/windict/cde/dtk_windict.l.pm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/windict/cde/dtk_windict.l.bm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/windict/cde/dtk_windict.m.pm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/windict/cde/dtk_windict.m.bm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/windict/cde/dtk_windict.s.pm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/windict/cde/dtk_windict.s.bm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/windict/cde/dtk_windict.t.pm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/windict/cde/dtk_windict.t.bm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/speak/cde/dtk_speak.l.pm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/speak/cde/dtk_speak.l.bm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/speak/cde/dtk_speak.m.pm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/speak/cde/dtk_speak.m.bm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/speak/cde/dtk_speak.s.pm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/speak/cde/dtk_speak.s.bm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/speak/cde/dtk_speak.t.pm $CDEPM/
$COPY $SOURCEBASE/samplosf/src/speak/cde/dtk_speak.t.bm $CDEPM/

#
# Implement these in future.
#
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_aclock.l.pm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_aclock.l.bm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_aclock.m.pm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_aclock.m.bm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_aclock.s.pm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_aclock.s.bm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_aclock.t.pm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_aclock.t.bm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_say.l.pm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_say.l.bm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_say.m.pm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_say.m.bm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_say.s.pm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_say.s.bm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_say.t.pm $CDEPM/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_say.t.bm $CDEPM/
#
#       Copy rest of the CDE files 
#
set CDETYPE = $KITRT/etc/dt/appconfig/types/C
set CDEAMGR = $KITRT/etc/dt/appconfig/appmanager/C/Multimedia
#
$COPY $SOURCEBASE/samplosf/src/windict/cde/dtk_windict.dt $CDETYPE/
$COPY $SOURCEBASE/samplosf/src/speak/cde/dtk_speak.dt $CDETYPE/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_aclock.dt $CDETYPE/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_say.dt $CDETYPE/

$COPY $SOURCEBASE/samplosf/src/windict/cde/dtk_windict $CDEAMGR/
$COPY $SOURCEBASE/samplosf/src/speak/cde/dtk_speak $CDEAMGR/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_aclock $CDEAMGR/
#$COPY $SOURCEBASE/samplosf/src/dtsamples/cde/dtk_say $CDEAMGR/
#
#       Copy the dictionary
#
$COPY $SOURCEBASE/dapi/build/dic/$OS_VER/us/release/dtalk_us.dic           $KITRT/lib/dtk/
$COPY $SOURCEBASE/dapi/build/dic/$OS_VER/uk/release/dtalk_uk.dic           $KITRT/lib/dtk/
$COPY $SOURCEBASE/dapi/build/dic/$OS_VER/sp/release/dtalk_sp.dic           $KITRT/lib/dtk/
$COPY $SOURCEBASE/dapi/build/dic/$OS_VER/gr/release/dtalk_gr.dic           $KITRT/lib/dtk/
$COPY $SOURCEBASE/dapi/build/dic/$OS_VER/la/release/dtalk_la.dic           $KITRT/lib/dtk/
$COPY $SOURCEBASE/dapi/build/dic/$OS_VER/fr/release/dtalk_fr.dic           $KITRT/lib/dtk/
#
#       Copy the dectalk sample applet, and some data to play with
#
$COPY $SOURCEBASE/samplosf/build/dtsamples/$OS_VER/us/release/say 		$KITRT/examples/dtk/dtsamples/
$COPY $SOURCEBASE/dapi/src/dic/user.tab      $KITRT/examples/dtk/dtsamples/
#$COPY $SOURCEBASE/samplosf/build/dtsamples/$OS_VER/us/release/user.dic      $KITRT/examples/dtk/dtsamples/
touch $KITRT/examples/dtk/dtsamples/user.dic
$COPY $SOURCEBASE/samplosf/build/dtsamples/$OS_VER/us/release/aclock        $KITRT/examples/dtk/dtsamples/

$COPY $SOURCEBASE/samplosf/src/data/birthday.txt       $KITRT/examples/dtk/dtsamples/
$COPY $SOURCEBASE/samplosf/src/data/demo.txt           $KITRT/examples/dtk/dtsamples/
$COPY $SOURCEBASE/samplosf/src/data/startup.txt        $KITRT/examples/dtk/dtsamples/
$COPY $SOURCEBASE/samplosf/src/data/noglass.txt        $KITRT/examples/dtk/dtsamples/

#
#       Copy the tools to work with the user dictionary
#
$COPY $SOURCEBASE/udicunix/build/$OS_VER/us/release/udic_us              $KITRT/tools/userdict_us
$COPY $SOURCEBASE/udicunix/build/$OS_VER/uk/release/udic_uk              $KITRT/tools/userdict_uk
$COPY $SOURCEBASE/udicunix/build/$OS_VER/sp/release/udic_sp              $KITRT/tools/userdict_sp
$COPY $SOURCEBASE/udicunix/build/$OS_VER/gr/release/udic_gr              $KITRT/tools/userdict_gr
$COPY $SOURCEBASE/udicunix/build/$OS_VER/la/release/udic_la              $KITRT/tools/userdict_la
$COPY $SOURCEBASE/udicunix/build/$OS_VER/fr/release/udic_fr              $KITRT/tools/userdict_fr
#touch $KITRT/tools/userdict_us
#touch $KITRT/tools/userdict_uk
#touch $KITRT/tools/userdict_sp
#touch $KITRT/tools/userdict_la
#touch $KITRT/tools/userdict_gr
#touch $KITRT/tools/userdict_la
$COPY $SOURCEBASE/samplosf/build/windict/$OS_VER/us/release/windict         $KITRT/tools/windict_us
$COPY $SOURCEBASE/samplosf/build/windict/$OS_VER/uk/release/windict         $KITRT/tools/windict_uk
$COPY $SOURCEBASE/samplosf/build/windict/$OS_VER/sp/release/windict         $KITRT/tools/windict_sp
$COPY $SOURCEBASE/samplosf/build/windict/$OS_VER/gr/release/windict         $KITRT/tools/windict_gr
$COPY $SOURCEBASE/samplosf/build/windict/$OS_VER/la/release/windict         $KITRT/tools/windict_la
$COPY $SOURCEBASE/samplosf/build/windict/$OS_VER/fr/release/windict         $KITRT/tools/windict_fr
$COPY $SOURCEBASE/samplosf/build/windict/$OS_VER/us/release/windict.uid       $KITRT/tools/
#
#       Copy the inventory verification programs
#
$COPY $SOURCEBASE/kitosf/ivp/DTKRT461.ivp               $KITRT/ivp/

#
#       Copy the on-line help
#
$COPY $DOCS/txt/filelist_rt.txt          $KITRT/docs/ascii/
$COPY $DOCS/txt/dtk_release_notes_rt.txt $KITRT/docs/ascii/dtk461_release_notes_rt.txt

$COPY $DOCS/txt/dtk_install_guide.txt	$KITRT/docs/ascii/dtk461_install_guide.txt
$COPY $DOCS/ps/dtk_install_guide.ps	$KITRT/docs/postscript/dtk461_install_guide.ps
$COPY $DOCS/pdf/dtk_install_guide.pdf	$KITRT/docs/pdf/dtk461_install_guide.pdf
$COPY $DOCS/ps/dtk_reference_guide.ps  $KITRT/docs/postscript/dtk461_reference_guide.ps
$COPY $DOCS/pdf/dtk_reference_guide.pdf  $KITRT/docs/pdf/dtk461_reference_guide.pdf
$COPY $DOCS/txt/dtk_reference_guide.txt $KITRT/docs/ascii/dtk461_reference_guide.txt
#
#      No Bookreader files this time around!!! V4.2A - Feb. 1996 
#
# $COPY $DOCS/book/dtk461_start.decw_book      $KITRT/lib/X11/help/
# $COPY $DOCS/book/dtk461_start.decw_bookshelf $KITRT/lib/X11/help/
#
#       Copy the on-line help
#


cp $DOCS/html/DECtalk.html $KITRT/docs/html/
cp $DOCS/html/DECtalk.html $KITRT/docs/html/index.html
cp $DOCS/html/DECtalk00000000.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000001.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000002.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000003.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000004.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000005.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000006.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000007.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000008.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000009.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000010.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000011.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000012.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000013.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000014.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000015.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000016.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000017.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000018.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000019.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000020.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000021.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000022.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000023.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00000024.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00090000.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00090001.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00090002.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00090003.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00090004.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00090005.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00090006.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00090007.gif $KITRT/docs/html/
cp $DOCS/html/DECtalk00090008.gif $KITRT/docs/html/
cp $DOCS/html/DECtalkAbout_the_Sample_Applet.html $KITRT/docs/html/
cp $DOCS/html/DECtalkAdditional_Syntax_Rules_for_DECt.html $KITRT/docs/html/
cp $DOCS/html/DECtalkAdjusting_Period_and_Comma_Pause.html $KITRT/docs/html/
cp $DOCS/html/DECtalkApplication_Programmer.html $KITRT/docs/html/
cp $DOCS/html/DECtalkAssertiveness_as.html $KITRT/docs/html/
cp $DOCS/html/DECtalkAssociating_a_macro_with_a_toolb.html $KITRT/docs/html/
cp $DOCS/html/DECtalkAssociating_the_Macro_with_aTool.html $KITRT/docs/html/
cp $DOCS/html/DECtalkAudio_Output_Control_Cal00000108.html $KITRT/docs/html/
cp $DOCS/html/DECtalkAudio_Output_Control_Cal00000124.html $KITRT/docs/html/
cp $DOCS/html/DECtalkAudio_Output_Control_Cal00000125.html $KITRT/docs/html/
cp $DOCS/html/DECtalkAverage_Pitch_ap_and_Pitch_Range.html $KITRT/docs/html/
cp $DOCS/html/DECtalkAvoiding_Common_Errors.html $KITRT/docs/html/
cp $DOCS/html/DECtalkBETTY_1_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkBaseline_Fall_bf.html $KITRT/docs/html/
cp $DOCS/html/DECtalkBlocking_Synchronization00000109.html $KITRT/docs/html/
cp $DOCS/html/DECtalkBlocking_Synchronization00000125.html $KITRT/docs/html/
cp $DOCS/html/DECtalkBlocking_Synchronization00000126.html $KITRT/docs/html/
cp $DOCS/html/DECtalkBreathiness_br.html $KITRT/docs/html/
cp $DOCS/html/DECtalkBuffer_Messages.html $KITRT/docs/html/
cp $DOCS/html/DECtalkBuilding_Sample_Programs.html $KITRT/docs/html/
cp $DOCS/html/DECtalkBuilding_a_User_Dictiona00000033.html $KITRT/docs/html/
cp $DOCS/html/DECtalkBuilding_a_User_Dictiona00000034.html $KITRT/docs/html/
cp $DOCS/html/DECtalkCallback_Routine_Example.html $KITRT/docs/html/
cp $DOCS/html/DECtalkCallback_Routines_and_Window_Pro.html $KITRT/docs/html/
cp $DOCS/html/DECtalkCascade_Vocal_Tract_Gains_g1_g2_.html $KITRT/docs/html/
cp $DOCS/html/DECtalkChanging_DECtalk_Software_Voices.html $KITRT/docs/html/
cp $DOCS/html/DECtalkChanging_Gender_and_Head_Size.html $KITRT/docs/html/
cp $DOCS/html/DECtalkChanging_Pitch_and_Intonation.html $KITRT/docs/html/
cp $DOCS/html/DECtalkChanging_Relative_Gains_and_Avoi.html $KITRT/docs/html/
cp $DOCS/html/DECtalkChanging_Rhythm_Stress_and_Inton.html $KITRT/docs/html/
cp $DOCS/html/DECtalkChanging_Voice_Quality.html $KITRT/docs/html/
cp $DOCS/html/DECtalkChanging_Voice_Selections.html $KITRT/docs/html/
cp $DOCS/html/DECtalkChanging_the_speaking_ra00000030.html $KITRT/docs/html/
cp $DOCS/html/DECtalkChanging_the_speaking_ra00000040.html $KITRT/docs/html/
cp $DOCS/html/DECtalkChanging_voices_using_DECtalk_So.html $KITRT/docs/html/
cp $DOCS/html/DECtalkChanging_voices_using_the_Voice_.html $KITRT/docs/html/
cp $DOCS/html/DECtalkClauseBased_Synthesis.html $KITRT/docs/html/
cp $DOCS/html/DECtalkClosing_a_Language.html $KITRT/docs/html/
cp $DOCS/html/DECtalkComma_Pause_comma.html $KITRT/docs/html/
cp $DOCS/html/DECtalkComponents.html $KITRT/docs/html/
cp $DOCS/html/DECtalkComponents_of_the_User_Dictionar.html $KITRT/docs/html/
cp $DOCS/html/DECtalkControl_and_Status_Calls00000110.html $KITRT/docs/html/
cp $DOCS/html/DECtalkControl_and_Status_Calls00000126.html $KITRT/docs/html/
cp $DOCS/html/DECtalkControl_and_Status_Calls00000127.html $KITRT/docs/html/
cp $DOCS/html/DECtalkControlling_Queuing_with_Flags.html $KITRT/docs/html/
cp $DOCS/html/DECtalkCore_API_Calls.html $KITRT/docs/html/
cp $DOCS/html/DECtalkCreating_a_User_Dictionary_UNIX.html $KITRT/docs/html/
cp $DOCS/html/DECtalkCreating_a_User_Dictionary_Windo.html $KITRT/docs/html/
cp $DOCS/html/DECtalkCreating_a_Word_Macro__illustrat.html $KITRT/docs/html/
cp $DOCS/html/DECtalkCreating_a_Word_Macro_and_associ.html $KITRT/docs/html/
cp $DOCS/html/DECtalkCustomizing_a_DECtalk_Software_V.html $KITRT/docs/html/ 
cp $DOCS/html/DECtalkDECtalk.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDECtalk_Applet_Contents.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDECtalk_Software_API_Calls.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDECtalk_Software_APIs.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDECtalk_Software_Dictionaries.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDECtalk_Software_InLine_00000008.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDECtalk_Software_InLine_00000252.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDECtalk_Software_InLine_00000253.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDECtalk_Software_InLine_00000254.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDECtalk_Software_Reference_Table.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDECtalk_Software_Singing_Happy_B.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDECtalk_Voices_and_Their_Associa.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDENNIS_4_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDIC_file.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDONOTUSEAUDIODEVICE_0x80000000_t.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDefault_Locations_for_Dictionari.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDefinitions_of_DECtalk_Software_.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDesign_Voice_dv_Command.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDeveloping_an_Electronic_MailRea.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDial_Tones_dial.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDial_Tones_dial00000256.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDial_Tones_dial00000257.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDictionary_Calls_UNIX_only.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDictionary_Calls_Windows_only.html $KITRT/docs/html/
cp $DOCS/html/DECtalkDictionary_Options.html $KITRT/docs/html/
cp $DOCS/html/DECtalkEditing_a_Text_File_and_Changing.html $KITRT/docs/html/
cp $DOCS/html/DECtalkEditing_a_text_file_and_playing_.html $KITRT/docs/html/
cp $DOCS/html/DECtalkEditing_a_text_file_from_the_Sam.html $KITRT/docs/html/
cp $DOCS/html/DECtalkEmail.html $KITRT/docs/html/
cp $DOCS/html/DECtalkEmail_Mode_Example.html $KITRT/docs/html/
cp $DOCS/html/DECtalkEnglish_UK.html $KITRT/docs/html/
cp $DOCS/html/DECtalkEnglish_US_UK.html $KITRT/docs/html/
cp $DOCS/html/DECtalkError_Messages.html $KITRT/docs/html/
cp $DOCS/html/DECtalkError_error.html $KITRT/docs/html/
cp $DOCS/html/DECtalkEurope_Mode_Example.html $KITRT/docs/html/
cp $DOCS/html/DECtalkExample_of_the_use_of_pauses_in_.html $KITRT/docs/html/
cp $DOCS/html/DECtalkFALSE_0.html $KITRT/docs/html/
cp $DOCS/html/DECtalkFRANK_3_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkFeatures_and_Functions.html $KITRT/docs/html/
cp $DOCS/html/DECtalkGeneral_Parsing_Rules.html $KITRT/docs/html/
cp $DOCS/html/DECtalkGeneral_User.html $KITRT/docs/html/
cp $DOCS/html/DECtalkGerman.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHARRY_2_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHat_Rise_hr.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHead_Size_hs.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHeader_Files.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHelp_Options.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHigher_Formants_f4_f5_b4_and_b5.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHighlighting_Text_as_it_00000043.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHighlighting_Text_as_it_00000044.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__A.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__BC.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__DG.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__IL.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__MP.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__R.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__SW.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHomographs.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHow_It_Works.html $KITRT/docs/html/
cp $DOCS/html/DECtalkHow_to_do_MultiLanguage_Programm.html $KITRT/docs/html/
cp $DOCS/html/DECtalkINPUTCHARACTERCOUNT_0_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkImportant_TextQueuing_Informatio.html $KITRT/docs/html/
cp $DOCS/html/DECtalkIndex_Mark_Messages.html $KITRT/docs/html/
cp $DOCS/html/DECtalkIndex_Mark_index_mark.html $KITRT/docs/html/
cp $DOCS/html/DECtalkIndex_Marks_for_Speech_Status.html $KITRT/docs/html/
cp $DOCS/html/DECtalkInitialization_of_Memory_Buffers.html $KITRT/docs/html/
cp $DOCS/html/DECtalkInput_Options.html $KITRT/docs/html/
cp $DOCS/html/DECtalkInserting_DECtalk_Software_InLin.html $KITRT/docs/html/
cp $DOCS/html/DECtalkInterpreting_Punctuation00000321.html $KITRT/docs/html/
cp $DOCS/html/DECtalkInterpreting_Punctuation00000322.html $KITRT/docs/html/
cp $DOCS/html/DECtalkInterpreting_Punctuation00000323.html $KITRT/docs/html/
cp $DOCS/html/DECtalkInterpreting_Punctuation00000324.html $KITRT/docs/html/
cp $DOCS/html/DECtalkInterpreting_Punctuation00000325.html $KITRT/docs/html/
cp $DOCS/html/DECtalkIntroduction_to_DECtalk_Software.html $KITRT/docs/html/
cp $DOCS/html/DECtalkIntroduction_to_the_DECtalk_Soft.html $KITRT/docs/html/
cp $DOCS/html/DECtalkKIT_5_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLANGUAGEPARAMST_Structure_ttsapi.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLOGPHONEMES_0X00000002_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLOGSYLLABLES_0X00000010_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLOGTEXT_0X00000001_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLaryngealization_la.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLaunching_and_Configuring_the_DE.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLax_Breathiness_lx.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLoading_a_User_Dictionary_from_t.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLoading_and_Unloading_a_User_Dic.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLoading_the_Main_Dictionary_Dyna.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLoading_the_Main_Dictionary_Stat.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLoading_the_Main_Dictionary_UNIX.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLoading_the_User_Dictionary_UNIX.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLoading_the_User_Dictionary_Wind.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLogFile_Mode00000129.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLogFile_Mode00000130.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLog_log.html $KITRT/docs/html/
cp $DOCS/html/DECtalkLoudness_g5.html $KITRT/docs/html/
cp $DOCS/html/DECtalkMath_Mode_Example.html $KITRT/docs/html/
cp $DOCS/html/DECtalkMode_mode.html $KITRT/docs/html/
cp $DOCS/html/DECtalkMonaural_Volume_Control.html $KITRT/docs/html/
cp $DOCS/html/DECtalkMultiLanguage_Programming_Exampl.html $KITRT/docs/html/
cp $DOCS/html/DECtalkName_Mode_Example.html $KITRT/docs/html/
cp $DOCS/html/DECtalkName_name.html $KITRT/docs/html/
cp $DOCS/html/DECtalkNopen_Fixed_nf.html $KITRT/docs/html/
cp $DOCS/html/DECtalkOWNAUDIODEVICE_0x00000001_ttsapi.html $KITRT/docs/html/
cp $DOCS/html/DECtalkOptimizing_the_Quality_of_Spoken.html $KITRT/docs/html/
cp $DOCS/html/DECtalkOutput_Options.html $KITRT/docs/html/
cp $DOCS/html/DECtalkOverview_of_the_User_Dictionary_.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPROPERNAMEPRONUNCIATION_0x000000.html $KITRT/docs/html/
cp $DOCS/html/DECtalkParsing_Email.html $KITRT/docs/html/
cp $DOCS/html/DECtalkParsing_Punctuation.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPaul_0_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPeriod_Pause_period.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPhoneme_Identifiers_and_Phonemic.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPhoneme_Interpretation_phoneme.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPhoneme_Notifications.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPhonemes_in_Unicode_Sequence.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPhonemic_Symbols.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPhonemic_Symbols_Table.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPhonemic_Syntax_for_Singing.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPitch_pitch.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPlay_Wave_Files_play.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPlaying_selected_text_from_the_S.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPreprocessor_Rules_for_Parsing.html $KITRT/docs/html/
cp $DOCS/html/DECtalkProgramming_Aids.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPronounce_pronounce.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPunctuation.html $KITRT/docs/html/
cp $DOCS/html/DECtalkPunctuation_punct.html $KITRT/docs/html/
cp $DOCS/html/DECtalkQuickness_qu.html $KITRT/docs/html/
cp $DOCS/html/DECtalkREPORTOPENERROR_0x00000002_ttsap.html $KITRT/docs/html/
cp $DOCS/html/DECtalkRITA_7_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkRate_Selection_rate.html $KITRT/docs/html/
cp $DOCS/html/DECtalkRegistry_Entry_Information.html $KITRT/docs/html/
cp $DOCS/html/DECtalkReturn_of_Memory_Buffers.html $KITRT/docs/html/
cp $DOCS/html/DECtalkRichness_ri.html $KITRT/docs/html/
cp $DOCS/html/DECtalkRules.html $KITRT/docs/html/
cp $DOCS/html/DECtalkRunning_DECtalk_Software_from_Ot.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSTATUSSPEAKING_1_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSample_Program_Applet.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSample_Programs_UNIX_only.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSample_Programs_Windows_only.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSave_save.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSaving_Changes_as_Vals_Voice.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSaving_and_Compiling_the_Diction.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSaving_and_Compiling_the_User_Di.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSaving_text_as_a_WAV_file_from_t.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSay_say.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSelecting_a_Language.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSex_sx.html $KITRT/docs/html/
cp $DOCS/html/DECtalkShareable_Libraries.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSinging_and_Musical_Tones.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSkip_skip.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSmoothness_sm.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSound_Source_Gains_gv_gh_gf_and_.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpanish_Castilian_and_Latin_Amer.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpeak_Program_Applet.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpeaking_Rate.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpeaking_Text_with_the_DECtalk_S.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpeaking_a_file_using_th00000017.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpeaking_a_file_using_th00000017.html $KITRT/docs/html/DECtalkSpeaking_a_File_Using_th00000017.html
cp $DOCS/html/DECtalkSpeaking_a_file_using_Drag_and_D.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpeaking_a_file_using_th00000018.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpeaking_text_with_the_DECtalk_T.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpecial_TextToSpeech_Mod00000111.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpecial_TextToSpeech_Mod00000127.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpecial_TextToSpeech_Mod00000128.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpeechToMemory_Mode00000130.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSpeechToMemory_Mode00000131.html $KITRT/docs/html/
cp $DOCS/html/DECtalkStarting_a_Language.html $KITRT/docs/html/
cp $DOCS/html/DECtalkStereo_Volume_Control.html $KITRT/docs/html/
cp $DOCS/html/DECtalkStress_Rise_sr.html $KITRT/docs/html/
cp $DOCS/html/DECtalkStress_Symbols.html $KITRT/docs/html/
cp $DOCS/html/DECtalkStress_and_Syntactic_Symbols.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSupported_SAPI_functions.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSync_sync.html $KITRT/docs/html/
cp $DOCS/html/DECtalkSyntactic_Symbols.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTAB_file.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTRUE_1.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTTSAMERICANENGLISH__1_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTTSBUFFERT_Structure_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTTSCAPST_Structure_ttsap00000136.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTTSCAPST_Structure_ttsap00000220.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTTSCAPST_Structure_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTTSFORCE_0x00000001_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTTSFORCE__0x00000001_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTTSINDEXT_Structure_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTTSNORMAL_0x00000000_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTTSPHONEMET_Structure_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechAddBuffer.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechCloseInMemory.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechCloseLang.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechCloseLogFile.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechCloseWaveOutFile.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechEnumLangs.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechGetCaps.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechGetFeatures.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechGetLanguage.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechGetRate.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechGetSpeaker.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechGetStatus.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechLoadUserDictionary.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechOpenInMemory.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechOpenLogFile.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechOpenWaveOutFile.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechPause.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechReset.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechResume.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechReturnBuffer.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechSelectLang.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechSetLanguage.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechSetRate.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechSetSpeaker.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechShutdown.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechSpeak.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechStartLang.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechStartupEx.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechStartup_UNIX_only.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechStartup_Windows_only.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechSync.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechTyping.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechUnloadUserDictionary.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechVersion.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeechVersionEx.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextToSpeech_DDE_Server.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTextTuning_Example.html $KITRT/docs/html/
cp $DOCS/html/DECtalkThe_Core_API_Calls.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTo_launch_and_configure_the_DECt.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTone_Table.html $KITRT/docs/html/
cp $DOCS/html/DECtalkTone_tone.html $KITRT/docs/html/
cp $DOCS/html/DECtalkURSULA_6_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkUsing_InLine_Commands.html $KITRT/docs/html/
cp $DOCS/html/DECtalkUsing_the_Components.html $KITRT/docs/html/
cp $DOCS/html/DECtalkUsing_the_DECtalk_Softwa00000037.html $KITRT/docs/html/
cp $DOCS/html/DECtalkUsing_the_DECtalk_Softwa00000038.html $KITRT/docs/html/
cp $DOCS/html/DECtalkUsing_the_Program_Applets_to_Lea.html $KITRT/docs/html/
cp $DOCS/html/DECtalkUsing_the_Say_CommandLine_Applet.html $KITRT/docs/html/
cp $DOCS/html/DECtalkVolume_volume.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWAVEFORMAT08M08_0x00001000_ttsap.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWAVEFORMAT1M08_0X00000001_mmsyst.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWAVEFORMAT1M16_0X00000004_mmsyst.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWAVEOUTDEVICEID_2_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWAVE_file.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWENDY_8_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWaveFile_Mode00000128.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWaveFile_Mode00000129.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000309.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000310.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000311.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000313.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000314.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000315.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000316.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000317.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Software_V4.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_V44_Program.html $KITRT/docs/html/
cp $DOCS/html/DECtalkWindow_Procedure_Example.html $KITRT/docs/html/
cp $DOCS/html/DECtalkallophone.html $KITRT/docs/html/
cp $DOCS/html/DECtalkapplet.html $KITRT/docs/html/
cp $DOCS/html/DECtalkarpabet.html $KITRT/docs/html/
cp $DOCS/html/DECtalkclause_boundary.html $KITRT/docs/html/
cp $DOCS/html/DECtalkclause_mode.html $KITRT/docs/html/
cp $DOCS/html/DECtalkclause_terminator.html $KITRT/docs/html/
cp $DOCS/html/DECtalkcomma_pause.html $KITRT/docs/html/
cp $DOCS/html/DECtalkdynamic_engine.html $KITRT/docs/html/
cp $DOCS/html/DECtalkemphatic_stress.html $KITRT/docs/html/
cp $DOCS/html/DECtalkfalling_intonation.html $KITRT/docs/html/
cp $DOCS/html/DECtalkflush.html $KITRT/docs/html/
cp $DOCS/html/DECtalkheuristic.html $KITRT/docs/html/
cp $DOCS/html/DECtalkhomograph.html $KITRT/docs/html/
cp $DOCS/html/DECtalkindex.html $KITRT/docs/html/
cp $DOCS/html/DECtalkindex_marker_flag.html $KITRT/docs/html/
cp $DOCS/html/DECtalkintonation.html $KITRT/docs/html/
cp $DOCS/html/DECtalkletter_mode.html $KITRT/docs/html/
cp $DOCS/html/DECtalklog_file.html $KITRT/docs/html/
cp $DOCS/html/DECtalklogfile_mode00000077.html $KITRT/docs/html/
cp $DOCS/html/DECtalkmorpheme.html $KITRT/docs/html/
cp $DOCS/html/DECtalkperiod_pause.html $KITRT/docs/html/
cp $DOCS/html/DECtalkphoneme.html $KITRT/docs/html/
cp $DOCS/html/DECtalkphoneme_arpabet_command.html $KITRT/docs/html/
cp $DOCS/html/DECtalkphoneme_string.html $KITRT/docs/html/
cp $DOCS/html/DECtalkphonemic_mode.html $KITRT/docs/html/
cp $DOCS/html/DECtalkphonemic_transcription.html $KITRT/docs/html/
cp $DOCS/html/DECtalkphonemicize.html $KITRT/docs/html/
cp $DOCS/html/DECtalkphrase_boundary.html $KITRT/docs/html/
cp $DOCS/html/DECtalkpitch_control_symbols.html $KITRT/docs/html/
cp $DOCS/html/DECtalkprimary_stress.html $KITRT/docs/html/
cp $DOCS/html/DECtalkproper_name.html $KITRT/docs/html/
cp $DOCS/html/DECtalksecondary_stress.html $KITRT/docs/html/
cp $DOCS/html/DECtalksilence_phonemes.html $KITRT/docs/html/
cp $DOCS/html/DECtalkspeechtomemory_mode00000092.html $KITRT/docs/html/
cp $DOCS/html/DECtalkstartup_function.html $KITRT/docs/html/
cp $DOCS/html/DECtalkstartup_state.html $KITRT/docs/html/
cp $DOCS/html/DECtalkstatic_engine.html $KITRT/docs/html/
cp $DOCS/html/DECtalksyntactic_function_words.html $KITRT/docs/html/
cp $DOCS/html/DECtalktypedef_DWORD_LANGUAGET_00000213.html $KITRT/docs/html/
cp $DOCS/html/DECtalktypedef_DWORD_LANGUAGET_00000214.html $KITRT/docs/html/
cp $DOCS/html/DECtalktypedef_DWORD_LANGUAGET_00000215.html $KITRT/docs/html/
cp $DOCS/html/DECtalktypedef_DWORD_LANGUAGET_00000223.html $KITRT/docs/html/
cp $DOCS/html/DECtalktypedef_DWORD_LANGUAGET_00000224.html $KITRT/docs/html/
cp $DOCS/html/DECtalktypedef_DWORD_LANGUAGET_00000225.html $KITRT/docs/html/
cp $DOCS/html/DECtalktypedef_DWORD_SPEAKERT_ttsapih.html $KITRT/docs/html/
cp $DOCS/html/DECtalkuntitled.html $KITRT/docs/html/
cp $DOCS/html/DECtalkuser_dictionary.html $KITRT/docs/html/
cp $DOCS/html/DECtalkuser_dictionary_builder.html $KITRT/docs/html/
cp $DOCS/html/DECtalkvoicecontrol_command.html $KITRT/docs/html/
cp $DOCS/html/DECtalkwave_form_output.html $KITRT/docs/html/
cp $DOCS/html/DECtalkwavefile_mode00000102.html $KITRT/docs/html/
cp $DOCS/html/DECtalkword_boundary.html $KITRT/docs/html/
cp $DOCS/html/DECtalkword_mode.html $KITRT/docs/html/
cp $DOCS/html/cnt0.gif $KITRT/docs/html/
cp $DOCS/html/cnt1.gif $KITRT/docs/html/
cp $DOCS/html/contents.gif $KITRT/docs/html/
cp $DOCS/html/index.gif $KITRT/docs/html/
cp $DOCS/html/index_a.gif $KITRT/docs/html/
cp $DOCS/html/index_b.gif $KITRT/docs/html/
cp $DOCS/html/index_c.gif $KITRT/docs/html/
cp $DOCS/html/index_d.gif $KITRT/docs/html/
cp $DOCS/html/index_e.gif $KITRT/docs/html/
cp $DOCS/html/index_f.gif $KITRT/docs/html/
cp $DOCS/html/index_g.gif $KITRT/docs/html/
cp $DOCS/html/index_h.gif $KITRT/docs/html/
cp $DOCS/html/index_i.gif $KITRT/docs/html/
cp $DOCS/html/index_j.gif $KITRT/docs/html/
cp $DOCS/html/index_k.gif $KITRT/docs/html/
cp $DOCS/html/index_l.gif $KITRT/docs/html/
cp $DOCS/html/index_m.gif $KITRT/docs/html/
cp $DOCS/html/index_n.gif $KITRT/docs/html/
cp $DOCS/html/index_o.gif $KITRT/docs/html/
cp $DOCS/html/index_p.gif $KITRT/docs/html/
cp $DOCS/html/index_q.gif $KITRT/docs/html/
cp $DOCS/html/index_r.gif $KITRT/docs/html/
cp $DOCS/html/index_s.gif $KITRT/docs/html/
cp $DOCS/html/index_t.gif $KITRT/docs/html/
cp $DOCS/html/index_u.gif $KITRT/docs/html/
cp $DOCS/html/index_v.gif $KITRT/docs/html/
cp $DOCS/html/index_w.gif $KITRT/docs/html/
cp $DOCS/html/index_x.gif $KITRT/docs/html/
cp $DOCS/html/index_y.gif $KITRT/docs/html/
cp $DOCS/html/index_z.gif $KITRT/docs/html/
cp $DOCS/html/next0.gif $KITRT/docs/html/
cp $DOCS/html/next1.gif $KITRT/docs/html/
cp $DOCS/html/prev0.gif $KITRT/docs/html/
cp $DOCS/html/prev1.gif $KITRT/docs/html/


$COPY $DOCS/man/man1/aclock.1         $KITRT/docs/man/man1/
$COPY $DOCS/man/man1/speak.1          $KITRT/docs/man/man1/
$COPY $DOCS/man/man1/dectalk.1        $KITRT/docs/man/man1/
$COPY $DOCS/man/man1/say.1            $KITRT/docs/man/man1/
$COPY $DOCS/man/man1/windict.1        $KITRT/docs/man/man1/
#$COPY $DOCS/man/man1/DECface.1        $KITRT/docs/man/man1/
$COPY $DOCS/man/man1/emacspeak.1        $KITRT/docs/man/man1/
#
# Whatis stuff
#
$COPY $DOCS/man/DTKMANRT/man1/aclock.1dtk      $KITRT/share/man/man1/
$COPY $DOCS/man/DTKMANRT/man1/speak.1dtk	  $KITRT/share/man/man1/
$COPY $DOCS/man/DTKMANRT/man1/dectalk.1dtk	  $KITRT/share/man/man1/
$COPY $DOCS/man/DTKMANRT/man1/say.1dtk	  $KITRT/share/man/man1/
$COPY $DOCS/man/DTKMANRT/man1/windict.1dtk	  $KITRT/share/man/man1/
#$COPY $DOCS/man/DTKMANRT/man1/DECface.1dtk     $KITRT/share/man/man1/
$COPY $DOCS/man/DTKMANRT/man1/emacspeak.1dtk   $KITRT/share/man/man1/
$COPY $DOCS/man/DTKMANRT/whatis               $KITRT/share/man/.DTKMANRT461.whatis

#
# Copy Emacspeak sources into the proper directories
#
$COPY $EMS/emacsMacros/dtk-macros.el                 $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/dtk-sh.el                     $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/dtk-spatial.el                $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/dtk-speak.el                  $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/dtk-voices.el                 $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-advice.el           $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-auctex.el           $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-bbdb.el             $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-c.el                $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-calc.el             $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-calendar.el         $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-compile.el          $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-dired.el            $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-dmacro.el           $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-ediff.el            $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-eterm.el            $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-fix-interactive.el  $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-folding.el          $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-gnus.el             $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-hyperbole.el        $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-info.el             $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-ispell.el           $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-keymap.el           $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-kotl.el             $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-oo-browser.el       $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-outline.el          $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-perl.el             $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-redefine.el         $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-replace.el          $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-sounds.el           $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-speak.el            $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-tabulate.el         $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-tcl.el              $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-tempo.el            $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-vm.el               $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-w3.el               $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak-wrolo.el            $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/emacspeak.el                  $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/html-voice.el                 $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/voice-lock.el                 $KITRT/emacspeak/Macros/	
$COPY $EMS/emacsMacros/w3-util.el                    $KITRT/emacspeak/Macros/
$COPY $EMS/emacsMacros/emacspeak-load-path.def 	    $KITRT/emacspeak/Macros/
$COPY $EMS/emacsMacros/emacspeak-setup.def 	    $KITRT/emacspeak/Macros/
$COPY $EMS/emacsMacros/emacspeak.def  	            $KITRT/emacspeak/Macros/
$COPY $EMS/emacsMacros/play.def	                    $KITRT/emacspeak/Macros/
$COPY $EMS/emacsMacros/Makefile                      $KITRT/emacspeak/Macros/
$COPY $EMS/src/dtk-mme                               $KITRT/emacspeak/Macros/
$COPY $EMS/emacsMacros/HELP                          $KITRT/emacspeak/Macros/
$COPY $EMS/emacsMacros/emacspeak.ps                  $KITRT/emacspeak/docs/postscript
$COPY $EMS/emacsMacros/emacspeak-README.txt                 $KITRT/emacspeak/docs/ascii

#Delete HISTORY from file headers and adding $COPYRIGHT message

#source striphdr.sh ../RT 
#source striphdr.sh ./scps 
     
echo ""
echo " Copied all DTK kit files into the proper directories."
echo " Login as su and run create_kit.sh to complete building "
echo " the kit."
