#!/bin/sh
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
KITSRC=$KITPATH"/$OS_VER/src/DECtalk_4.60"
LIBS="$SOURCEBASE/dapi/build/dectalk/$OS_VER"
COPY="cp -r"
LICENSE="$SOURCEBASE/licunix/build/$OS_VER/release"
UDICT="$SOURCEBASE/udicunix/build/$OS_VER"
#

echo "Cleaning $KIT"
rm -rf $KIT

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
$COPY install.sh $KITSRC
$COPY locations.sh $KITSRC
$COPY README $KITSRC
$COPY INSTALL $KITSRC

chmod +x $KITSRC/*.sh



echo "Copying sample program source to $KITSRC/src/DECtalk"

$COPY $SOURCEBASE/samplosf/src/dtsamples/aclock.c $KITSRC/src/DECtalk/dtsamples
$COPY $SOURCEBASE/samplosf/src/dtsamples/say.c $KITSRC/src/DECtalk/dtsamples
$COPY $SOURCEBASE/samplosf/src/dtsamples/dtmemory.c $KITSRC/src/DECtalk/dtsamples
$COPY $SOURCEBASE/samplosf/src/speak/gspeak.c $KITSRC/src/DECtalk/gspeak

echo "Copying sample programs to $KITSRC/X11/bin"

$COPY $SOURCEBASE/samplosf/build/speak/$OS_VER/release/gspeak*  $KITSRC/X11/bin/
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
$COPY $UDICT/la/release/udic_la  $KITSRC/bin/userdic_la


echo "Copying the license program to $LICENSE"
$COPY $LICENSE/licenin3 $KITSRC/bin


echo "Copy the html help files to $KITSRC/doc/DECtalk/html"


cp $DOCS/html/DECtalk.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk.html $KITSRC/doc/DECtalk/html/index.html
cp $DOCS/html/DECtalk00000000.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000001.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000002.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000003.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000004.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000005.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000006.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000007.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000008.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000009.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000010.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000011.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000012.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000013.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000014.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000015.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000016.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000017.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000018.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000019.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000020.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000021.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000022.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000023.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00000024.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00090000.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00090001.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00090002.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00090003.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00090004.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00090005.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00090006.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00090007.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalk00090008.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkAbout_the_Sample_Applet.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkAdditional_Syntax_Rules_for_DECt.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkAdjusting_Period_and_Comma_Pause.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkApplication_Programmer.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkAssertiveness_as.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkAssociating_a_macro_with_a_toolb.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkAssociating_the_Macro_with_aTool.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkAudio_Output_Control_Cal00000108.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkAudio_Output_Control_Cal00000124.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkAudio_Output_Control_Cal00000125.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkAverage_Pitch_ap_and_Pitch_Range.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkAvoiding_Common_Errors.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkBETTY_1_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkBaseline_Fall_bf.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkBlocking_Synchronization00000109.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkBlocking_Synchronization00000125.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkBlocking_Synchronization00000126.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkBreathiness_br.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkBuffer_Messages.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkBuilding_Sample_Programs.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkBuilding_a_User_Dictiona00000033.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkBuilding_a_User_Dictiona00000034.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkCallback_Routine_Example.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkCallback_Routines_and_Window_Pro.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkCascade_Vocal_Tract_Gains_g1_g2_.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkChanging_DECtalk_Software_Voices.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkChanging_Gender_and_Head_Size.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkChanging_Pitch_and_Intonation.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkChanging_Relative_Gains_and_Avoi.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkChanging_Rhythm_Stress_and_Inton.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkChanging_Voice_Quality.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkChanging_Voice_Selections.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkChanging_the_speaking_ra00000030.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkChanging_the_speaking_ra00000040.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkChanging_voices_using_DECtalk_So.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkChanging_voices_using_the_Voice_.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkClauseBased_Synthesis.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkClosing_a_Language.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkComma_Pause_comma.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkComponents.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkComponents_of_the_User_Dictionar.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkControl_and_Status_Calls00000110.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkControl_and_Status_Calls00000126.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkControl_and_Status_Calls00000127.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkControlling_Queuing_with_Flags.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkCore_API_Calls.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkCreating_a_User_Dictionary_UNIX.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkCreating_a_User_Dictionary_Windo.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkCreating_a_Word_Macro__illustrat.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkCreating_a_Word_Macro_and_associ.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkCustomizing_a_DECtalk_Software_V.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDECtalk.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDECtalk_Applet_Contents.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDECtalk_Software_API_Calls.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDECtalk_Software_APIs.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDECtalk_Software_Dictionaries.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDECtalk_Software_InLine_00000008.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDECtalk_Software_InLine_00000252.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDECtalk_Software_InLine_00000253.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDECtalk_Software_InLine_00000254.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDECtalk_Software_Reference_Table.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDECtalk_Software_Singing_Happy_B.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDECtalk_Voices_and_Their_Associa.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDENNIS_4_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDIC_file.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDONOTUSEAUDIODEVICE_0x80000000_t.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDefault_Locations_for_Dictionari.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDefinitions_of_DECtalk_Software_.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDesign_Voice_dv_Command.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDeveloping_an_Electronic_MailRea.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDial_Tones_dial.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDial_Tones_dial00000256.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDial_Tones_dial00000257.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDictionary_Calls_UNIX_only.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDictionary_Calls_Windows_only.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkDictionary_Options.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkEditing_a_Text_File_and_Changing.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkEditing_a_text_file_and_playing_.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkEditing_a_text_file_from_the_Sam.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkEmail.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkEmail_Mode_Example.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkEnglish_UK.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkEnglish_US_UK.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkError_Messages.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkError_error.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkEurope_Mode_Example.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkExample_of_the_use_of_pauses_in_.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkFALSE_0.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkFRANK_3_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkFeatures_and_Functions.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkGeneral_Parsing_Rules.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkGeneral_User.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkGerman.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHARRY_2_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHat_Rise_hr.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHead_Size_hs.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHeader_Files.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHelp_Options.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHigher_Formants_f4_f5_b4_and_b5.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHighlighting_Text_as_it_00000043.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHighlighting_Text_as_it_00000044.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__A.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__BC.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__DG.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__IL.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__MP.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__R.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHomograph_Phonetics__SW.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHomographs.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHow_It_Works.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkHow_to_do_MultiLanguage_Programm.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkINPUTCHARACTERCOUNT_0_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkImportant_TextQueuing_Informatio.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkIndex_Mark_Messages.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkIndex_Mark_index_mark.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkIndex_Marks_for_Speech_Status.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkInitialization_of_Memory_Buffers.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkInput_Options.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkInserting_DECtalk_Software_InLin.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkInterpreting_Punctuation00000321.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkInterpreting_Punctuation00000322.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkInterpreting_Punctuation00000323.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkInterpreting_Punctuation00000324.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkInterpreting_Punctuation00000325.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkIntroduction_to_DECtalk_Software.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkIntroduction_to_the_DECtalk_Soft.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkKIT_5_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLANGUAGEPARAMST_Structure_ttsapi.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLOGPHONEMES_0X00000002_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLOGSYLLABLES_0X00000010_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLOGTEXT_0X00000001_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLaryngealization_la.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLaunching_and_Configuring_the_DE.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLax_Breathiness_lx.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLoading_a_User_Dictionary_from_t.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLoading_and_Unloading_a_User_Dic.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLoading_the_Main_Dictionary_Dyna.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLoading_the_Main_Dictionary_Stat.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLoading_the_Main_Dictionary_UNIX.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLoading_the_User_Dictionary_UNIX.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLoading_the_User_Dictionary_Wind.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLogFile_Mode00000129.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLogFile_Mode00000130.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLog_log.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkLoudness_g5.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkMath_Mode_Example.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkMode_mode.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkMonaural_Volume_Control.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkMultiLanguage_Programming_Exampl.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkName_Mode_Example.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkName_name.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkNopen_Fixed_nf.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkOWNAUDIODEVICE_0x00000001_ttsapi.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkOptimizing_the_Quality_of_Spoken.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkOutput_Options.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkOverview_of_the_User_Dictionary_.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPROPERNAMEPRONUNCIATION_0x000000.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkParsing_Email.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkParsing_Punctuation.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPaul_0_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPeriod_Pause_period.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPhoneme_Identifiers_and_Phonemic.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPhoneme_Interpretation_phoneme.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPhoneme_Notifications.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPhonemes_in_Unicode_Sequence.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPhonemic_Symbols.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPhonemic_Symbols_Table.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPhonemic_Syntax_for_Singing.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPitch_pitch.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPlay_Wave_Files_play.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPlaying_selected_text_from_the_S.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPreprocessor_Rules_for_Parsing.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkProgramming_Aids.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPronounce_pronounce.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPunctuation.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkPunctuation_punct.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkQuickness_qu.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkREPORTOPENERROR_0x00000002_ttsap.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkRITA_7_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkRate_Selection_rate.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkRegistry_Entry_Information.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkReturn_of_Memory_Buffers.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkRichness_ri.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkRules.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkRunning_DECtalk_Software_from_Ot.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSTATUSSPEAKING_1_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSample_Program_Applet.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSample_Programs_UNIX_only.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSample_Programs_Windows_only.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSave_save.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSaving_Changes_as_Vals_Voice.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSaving_and_Compiling_the_Diction.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSaving_and_Compiling_the_User_Di.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSaving_text_as_a_WAV_file_from_t.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSay_say.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSelecting_a_Language.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSex_sx.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkShareable_Libraries.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSinging_and_Musical_Tones.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSkip_skip.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSmoothness_sm.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSound_Source_Gains_gv_gh_gf_and_.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpanish_Castilian_and_Latin_Amer.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpeak_Program_Applet.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpeaking_Rate.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpeaking_Text_with_the_DECtalk_S.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpeaking_a_file_using_th00000017.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpeaking_a_file_using_Drag_and_D.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpeaking_a_file_using_th00000018.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpeaking_text_with_the_DECtalk_T.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpecial_TextToSpeech_Mod00000111.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpecial_TextToSpeech_Mod00000127.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpecial_TextToSpeech_Mod00000128.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpeechToMemory_Mode00000130.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSpeechToMemory_Mode00000131.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkStarting_a_Language.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkStereo_Volume_Control.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkStress_Rise_sr.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkStress_Symbols.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkStress_and_Syntactic_Symbols.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSupported_SAPI_functions.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSync_sync.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkSyntactic_Symbols.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTAB_file.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTRUE_1.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTTSAMERICANENGLISH__1_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTTSBUFFERT_Structure_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTTSCAPST_Structure_ttsap00000136.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTTSCAPST_Structure_ttsap00000220.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTTSCAPST_Structure_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTTSFORCE_0x00000001_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTTSFORCE__0x00000001_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTTSINDEXT_Structure_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTTSNORMAL_0x00000000_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTTSPHONEMET_Structure_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechAddBuffer.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechCloseInMemory.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechCloseLang.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechCloseLogFile.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechCloseWaveOutFile.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechEnumLangs.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechGetCaps.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechGetFeatures.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechGetLanguage.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechGetRate.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechGetSpeaker.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechGetStatus.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechLoadUserDictionary.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechOpenInMemory.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechOpenLogFile.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechOpenWaveOutFile.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechPause.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechReset.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechResume.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechReturnBuffer.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechSelectLang.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechSetLanguage.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechSetRate.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechSetSpeaker.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechShutdown.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechSpeak.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechStartLang.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechStartupEx.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechStartup_UNIX_only.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechStartup_Windows_only.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechSync.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechTyping.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechUnloadUserDictionary.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechVersion.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeechVersionEx.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextToSpeech_DDE_Server.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTextTuning_Example.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkThe_Core_API_Calls.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTo_launch_and_configure_the_DECt.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTone_Table.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkTone_tone.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkURSULA_6_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkUsing_InLine_Commands.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkUsing_the_Components.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkUsing_the_DECtalk_Softwa00000037.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkUsing_the_DECtalk_Softwa00000038.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkUsing_the_Program_Applets_to_Lea.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkUsing_the_Say_CommandLine_Applet.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkVolume_volume.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWAVEFORMAT08M08_0x00001000_ttsap.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWAVEFORMAT1M08_0X00000001_mmsyst.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWAVEFORMAT1M16_0X00000004_mmsyst.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWAVEOUTDEVICEID_2_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWAVE_file.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWENDY_8_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWaveFile_Mode00000128.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWaveFile_Mode00000129.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000309.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000310.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000311.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000313.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000314.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000315.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000316.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Sof00000317.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_Software_V4.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWhats_New_in_DECtalk_V44_Program.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkWindow_Procedure_Example.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkallophone.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkapplet.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkarpabet.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkclause_boundary.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkclause_mode.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkclause_terminator.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkcomma_pause.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkdynamic_engine.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkemphatic_stress.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkfalling_intonation.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkflush.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkheuristic.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkhomograph.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkindex.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkindex_marker_flag.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkintonation.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkletter_mode.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalklog_file.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalklogfile_mode00000077.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkmorpheme.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkperiod_pause.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkphoneme.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkphoneme_arpabet_command.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkphoneme_string.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkphonemic_mode.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkphonemic_transcription.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkphonemicize.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkphrase_boundary.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkpitch_control_symbols.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkprimary_stress.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkproper_name.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalksecondary_stress.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalksilence_phonemes.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkspeechtomemory_mode00000092.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkstartup_function.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkstartup_state.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkstatic_engine.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalksyntactic_function_words.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalktypedef_DWORD_LANGUAGET_00000213.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalktypedef_DWORD_LANGUAGET_00000214.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalktypedef_DWORD_LANGUAGET_00000215.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalktypedef_DWORD_LANGUAGET_00000223.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalktypedef_DWORD_LANGUAGET_00000224.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalktypedef_DWORD_LANGUAGET_00000225.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalktypedef_DWORD_SPEAKERT_ttsapih.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkuntitled.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkuser_dictionary.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkuser_dictionary_builder.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkvoicecontrol_command.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkwave_form_output.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkwavefile_mode00000102.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkword_boundary.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/DECtalkword_mode.html $KITSRC/doc/DECtalk/html/
cp $DOCS/html/cnt0.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/cnt1.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/contents.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_a.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_b.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_c.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_d.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_e.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_f.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_g.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_h.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_i.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_j.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_k.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_l.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_m.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_n.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_o.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_p.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_q.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_r.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_s.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_t.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_u.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_v.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_w.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_x.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_y.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/index_z.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/next0.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/next1.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/prev0.gif $KITSRC/doc/DECtalk/html/
cp $DOCS/html/prev1.gif $KITSRC/doc/DECtalk/html/


echo " Copied all DTK kit files into the proper directories."
echo " Login as su and run create_kit.sh to complete building "
echo " the kit."
