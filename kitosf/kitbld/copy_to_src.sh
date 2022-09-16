#!/bin/csh
#
# @DEC_COPYRIGHT@
#
# HISTORY
# MGS 11/20/1997	Added code for UK
# Revision 1.1.2.33  1996/10/02  11:56:35  Cathy_Page
# 	Previous log comment incorrect - Changed 420 to 430 and V4.2A to V4.3
# 	[1996/10/02  11:56:12  Cathy_Page]
#
# Revision 1.1.2.32  1996/10/02  11:53:57  Cathy_Page
# 	Typo - Changed UNIT to UINT
# 	[1996/10/02  11:53:33  Cathy_Page]
# 
# Revision 1.1.2.31  1996/03/18  18:17:47  Krishna_Mangipudi
# 	Added yellowball & deleted bookreader stuff
# 	[1996/03/18  18:16:59  Krishna_Mangipudi]
# 
# Revision 1.1.2.30  1996/03/18  15:50:05  Krishna_Mangipudi
# 	Added DEV subdir into html files
# 	[1996/03/18  15:49:59  Krishna_Mangipudi]
# 
# Revision 1.1.2.29  1996/03/18  15:40:01  Krishna_Mangipudi
# 	Added html files
# 	[1996/03/18  15:39:44  Krishna_Mangipudi]
# 
# Revision 1.1.2.28  1996/03/15  00:59:06  Krishna_Mangipudi
# 	Added cover letter
# 	[1996/03/15  00:58:47  Krishna_Mangipudi]
# 
# Revision 1.1.2.27  1996/02/26  18:03:21  Krishna_Mangipudi
# 	strip files in scps
# 	[1996/02/26  18:02:59  Krishna_Mangipudi]
# 
# Revision 1.1.2.26  1996/02/20  16:55:25  Krishna_Mangipudi
# 	look in html for html file
# 	[1996/02/20  16:55:07  Krishna_Mangipudi]
# 
# Revision 1.1.2.25  1996/02/20  14:38:24  Krishna_Mangipudi
# 	Added html docs
# 	[1996/02/20  14:37:43  Krishna_Mangipudi]
# 
# Revision 1.1.2.24  1996/02/16  21:21:41  Krishna_Mangipudi
# 	Added whatis
# 	[1996/02/16  21:21:14  Krishna_Mangipudi]
# 
# Revision 1.1.2.23  1996/02/05  12:21:32  Krishna_Mangipudi
# 	Install into one dir in /usr/opt
# 	[1996/02/05  12:21:21  Krishna_Mangipudi]
# 
# Revision 1.1.2.22  1996/01/25  22:16:53  Krishna_Mangipudi
# 	Added call to strip header and add copyright
# 	[1996/01/25  22:16:32  Krishna_Mangipudi]
# 
# Revision 1.1.2.21  1996/01/19  16:57:01  Krishna_Mangipudi
# 	Changed DECFace.ini to DECface.ini
# 	[1996/01/19  16:56:44  Krishna_Mangipudi]
# 
# Revision 1.1.2.20  1996/01/18  18:13:10  Krishna_Mangipudi
# 	Changed ini file from DECface.ini to DECFace.ini
# 	[1996/01/18  18:12:53  Krishna_Mangipudi]
# 
# Revision 1.1.2.19  1996/01/18  17:42:03  Krishna_Mangipudi
# 	Changed DECFace.ad to DECface.iniDTKRT420.mi
# 	[1996/01/18  17:41:19  Krishna_Mangipudi]
# 
# Revision 1.1.2.18  1995/12/15  17:03:07  Krishna_Mangipudi
# 	changed rel notes & filelist for RT & DEV subsets
# 	[1995/12/15  17:02:44  Krishna_Mangipudi]
# 
# Revision 1.1.2.17  1995/12/04  18:46:02  Krishna_Mangipudi
# 	Added CDE support
# 	[1995/12/04  18:39:23  Krishna_Mangipudi]
# 
# Revision 1.1.2.16  1995/11/21  21:05:46  Krishna_Mangipudi
# 	build in ../DEV now
# 	[1995/11/21  21:05:06  Krishna_Mangipudi]
# 
# Revision 1.1.2.15  1995/11/21  17:44:34  Krishna_Mangipudi
# 	Merged DOCs and REL NOT subsets
# 	[1995/11/21  17:43:24  Krishna_Mangipudi]
# 
# Revision 1.1.2.14  1995/11/20  21:18:01  Krishna_Mangipudi
# 	Now create DEV & RT kit
# 	[1995/11/20  21:17:24  Krishna_Mangipudi]
# 
# Revision 1.1.2.13  1995/07/06  17:42:07  Krishna_Mangipudi
# 	Updated with new osf directory
# 	[1995/07/06  17:41:54  Krishna_Mangipudi]
# 
# Revision 1.1.2.12  1995/06/12  20:41:23  Krishna_Mangipudi
# 	Changed cp to cp -r
# 	[1995/06/12  20:41:12  Krishna_Mangipudi]
# 
# Revision 1.1.2.11  1995/04/20  16:31:45  Krishna_Mangipudi
# 	added applet man pages
# 	[1995/04/20  16:31:34  Krishna_Mangipudi]
# 
# Revision 1.1.2.10  1995/04/18  19:15:16  Krishna_Mangipudi
# 	Removed dtmemory and xmsay from SAMP
# 	[1995/04/18  19:15:06  Krishna_Mangipudi]
# 
# Revision 1.1.2.9  1995/04/18  19:02:17  Krishna_Mangipudi
# 	Moved xmsay and dtmemory from RT kit into sample kit
# 	[1995/04/18  18:59:42  Krishna_Mangipudi]
# 
# Revision 1.1.2.8  1995/04/18  15:23:54  Krishna_Mangipudi
# 	make spelling conisitent for rel note subset
# 	[1995/04/18  15:23:30  Krishna_Mangipudi]
# 
# Revision 1.1.2.7  1995/04/18  15:15:49  Krishna_Mangipudi
# 	Change rel notes subset names
# 	[1995/04/18  15:15:12  Krishna_Mangipudi]
# 
# Revision 1.1.2.6  1995/04/17  21:06:18  Krishna_Mangipudi
# 	Fixed many problems, now works and creates two kits - RT & DEV
# 	[1995/04/17  21:03:45  Krishna_Mangipudi]
# 
# Revision 1.1.2.5  1995/04/14  16:04:29  Krishna_Mangipudi
# 	Brokeup kit build into copy_to_src.sh and create_kit.sh
# 	Run copy_to_src.sh in your user account
# 	Then run create_kit.sh as a su.
# 	[1995/04/14  16:04:19  Krishna_Mangipudi]
# 
# Revision 1.1.2.4  1995/04/13  20:54:48  Krishna_Mangipudi
# 	Edited wrong directory specification for DTKDOC420
# 	[1995/04/13  20:47:35  Krishna_Mangipudi]
# 
# Revision 1.1.2.3  1995/04/13  19:48:35  Krishna_Mangipudi
# 	Removed references to DTKLIBA420 and DTKAF420
# 	[1995/04/13  19:48:12  Krishna_Mangipudi]
# 
# Revision 1.1.2.2  1995/04/12  14:49:34  Krishna_Mangipudi
# 	Initial creation & checkin into ODE tree
# 	[1995/04/12  14:48:54  Krishna_Mangipudi]
# 
# $EndLog$
#
#       Define where the kit is on this local disk
#

set OS_VER     = `uname -r`
set SOURCEBASE = /home/users/dectalk/rnd
set DOCS       = $SOURCEBASE/docsosf
set KIT        = $SOURCEBASE/kitosf/$OS_VER
set COPY       = "cp -r"
set KITDEV     = $SOURCEBASE/kitosf/$OS_VER/DEV/src/usr/opt/DTKDEV461

#
# clean up the kit src area
#
echo "Cleaning up $KIT/DEV..."

cd $KIT/DEV
find . -type f -exec rm -f {} \;
#
# clean up the kit output area
#
echo "Cleaning up $KIT/output/DEV..."
cd ../output/DEV
find . -type f -exec rm {} \;
touch space
tar cf SPACE space
#
# populate the kit src area
#
echo "Moving data into $KIT/src..."
cd ../../../kitbld
#
#       Copy the libraries
#
$COPY $SOURCEBASE/samplosf/src/dtsamples/aclock.c $KITDEV/examples/dtk/dtsamples/
$COPY $SOURCEBASE/samplosf/src/dtsamples/say.c $KITDEV/examples/dtk/dtsamples/
$COPY $SOURCEBASE/samplosf/src/dtsamples/dtmemory.c $KITDEV/examples/dtk/dtsamples/
$COPY $SOURCEBASE/samplosf/src/dtsamples/xmsay.c $KITDEV/examples/dtk/dtsamples/
$COPY $SOURCEBASE/samplosf/src/dtsamples/xmsay.uil $KITDEV/examples/dtk/dtsamples/
$COPY $SOURCEBASE/samplosf/src/dtsamples/ImakeMME $KITDEV/examples/dtk/dtsamples/Imakefile
$COPY $SOURCEBASE/samplosf/src/dtsamples/README.txt.mme $KITDEV/examples/dtk/dtsamples/README.txt
#
#       Copy the header files
#
$COPY $SOURCEBASE/dapi/src/api/ttsapi.h        $KITDEV/include/dtk/
$COPY $SOURCEBASE/dapi/src/osf/dtmmedefs.h     $KITDEV/include/dtk/
$COPY $SOURCEBASE/dapi/src/osf/dtmmiodefs.h    $KITDEV/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_us_ph.h       $KITDEV/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_uk_ph.h       $KITDEV/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_sp_ph.h       $KITDEV/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_gr_ph.h       $KITDEV/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_com_ph.h       $KITDEV/include/dtk/
$COPY $SOURCEBASE/dapi/src/include/l_all_ph.h       $KITDEV/include/dtk/

#
#       Copy the on-line help
#
$COPY $DOCS/txt/filelist_dev.txt                 $KITDEV/docs/ascii
$COPY $DOCS/txt/dtk_release_notes_dev.txt	$KITDEV/docs/ascii/dtk461_release_notes_dev.txt

$COPY $DOCS/ps/dtk_prog_guide.ps         $KITDEV/docs/postscript/dtk461_prog_guide.ps
$COPY $DOCS/txt/dtk_prog_guide.txt       $KITDEV/docs/ascii/dtk461_prog_guide.txt
$COPY $DOCS/pdf/dtk_prog_guide.pdf       $KITDEV/docs/pdf/dtk461_prog_guide.pdf

$COPY $DOCS/man/man3/TextToSpeechAddBuffer.3            $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechCloseInMemory.3        $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechCloseLang.3            $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechCloseLogFile.3         $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechCloseWaveOutFile.3     $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechEnumLangs.3            $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechGetCaps.3              $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechGetFeatures.3          $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechGetLanguage.3          $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechGetRate.3              $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechGetSpeaker.3           $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechGetStatus.3            $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechLoadUserDictionary.3   $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechOpenInMemory.3         $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechOpenLogFile.3          $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechOpenWaveOutFile.3      $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechPause.3                $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechReset.3                $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechResume.3               $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechReturnBuffer.3         $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechSelectLang.3           $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechSetLanguage.3          $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechSetRate.3              $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechSetSpeaker.3           $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechShutdown.3             $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechSpeak.3                $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechStartLang.3            $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechStartup.3              $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechStartupEx.3            $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechSync.3                 $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechTyping.3               $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechUnloadUserDictionary.3 $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechVersion.3              $KITDEV/docs/man/man3/
$COPY $DOCS/man/man3/TextToSpeechVersionEx.3            $KITDEV/docs/man/man3/
#
# whatis stuff
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechAddBuffer.3dtk               $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechCloseInMemory.3dtk           $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechCloseLang.3dtk               $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechCloseLogFile.3dtk            $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechCloseWaveOutFile.3dtk        $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechEnumLangs.3dtk               $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechGetCaps.3dtk                 $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechGetFeatures.3dtk             $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechGetLanguage.3dtk             $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechGetRate.3dtk                 $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechGetSpeaker.3dtk              $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechGetStatus.3dtk               $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechLoadUserDictionary.3dtk      $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechOpenInMemory.3dtk            $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechOpenLogFile.3dtk             $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechOpenWaveOutFile.3dtk         $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechPause.3dtk                   $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechReset.3dtk                   $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechResume.3dtk                  $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechReturnBuffer.3dtk            $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechSelectLang.3dtk              $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechSetLanguage.3dtk             $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechSetRate.3dtk                 $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechSetSpeaker.3dtk              $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechShutdown.3dtk                $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechSpeak.3dtk                   $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechStartLang.3dtk               $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechStartup.3dtk                 $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechStartupEx.3dtk               $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechSync.3dtk                    $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechTyping.3dtk                  $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechUnloadUserDictionary.3dtk    $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechVersion.3dtk                 $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/man3/TextToSpeechVersionEx.3dtk               $KITDEV/share/man/man3/
$COPY $DOCS/man/DTKMANDEV/whatis $KITDEV/share/man/.DTKMANDEV461.whatis
     
#Delete HISTORY from file headers and adding $COPYRIGHT message
#source striphdr.sh ../DEV

echo " Done DEV subset"
echo " "
source copy_to_src_rt.sh
echo " "
echo " Copied all kit files into the proper directories."
echo " Login as su and run create_kit.sh to complete building "
echo " the kit."
