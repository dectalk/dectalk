#!/bin/sh
# Matthew Schnee
# 04/15/1998
# this file is for making the necessary changes to the files for them to work in the build
#
# 001 MGS 04/15/1998  added code for the new html files
# 002 MGS 05/21/1998  added code for new ph files
# 003 ETT 11/24/1998  added chmod for autoconf build process.
# 004 MGS 02/01/1999  Added chmod for configure  
#

unzip -L -a dapi.zip
unzip -a other.zip

DAPI_DIR=dapi/src
API_DIR=$DAPI_DIR/api
CMD_DIR=$DAPI_DIR/cmd
DIC_DIR=$DAPI_DIR/dic
INC_DIR=$DAPI_DIR/include
LTS_DIR=$DAPI_DIR/lts
PH_DIR=$DAPI_DIR/ph
NT_DIR=$DAPI_DIR/nt
OSF_DIR=$DAPI_DIR/osf
VTM_DIR=$DAPI_DIR/vtm

cd $DAPI_DIR
rm -f *.dsp *.dsw *.mak *.ncb *.opt *.plg *.DSW *.NCB *.PLG *.mdp *.MAK

mv API api
mv CMD cmd
mv INCLUDE include
mv KERNEL kernel
mv LTS lts
mv NT nt
mv PH ph
mv PROTOS protos
mv VTM vtm

cd api
mv CRYPT2.C crypt2.c
mv DECSTD97.C decstd97.c
mv TTSAPI.H ttsapi.h
mv Tts.h tts.h

cd ../cmd
mv C_US_CDE.H c_us_cde.h 
mv Cmd_init.c cmd_init.c
mv PAR_AMBI.TAB par_ambi.tab
mv PAR_RULE.H par_rule.h 
mv PAR_TEST.H par_test.h 
mv Par_test.par par_test.par 

cd ../dic
mv DIC.H dic.h 
mv DIC_UK.ZIP dic_uk.zip
mv DIC_LA.ZIP dic_la.zip 
mv DIC_USS.ZIP dic_uss.zip 
mv USER.TAB user.tab 

cd ../include
mv IMPLODE.H implode.h 
mv LOADER.H loader.h 
mv PDROM.H pdrom.h 
mv VERSION.ENG version.eng 
mv VERSION.H version.h 
mv VMS_PORT.H vms_port.h 

cd ../kernel
mv DE.ASM de.asm
mv EXPRESS.C express.c    
mv LOADHELP.ASM loadhelp.asm 
mv Usa_init.c usa_init.c

cd ../lts
mv LSA_ADJU.C lsa_adju.c

cd ../ph
mv P_UK_SR1.C p_uk_sr1.c
mv P_UK_SY1.C p_uk_sy1.c
mv Ph_drwt02.c ph_drwt02.c
mv Ph_inton2.c ph_inton2.c
mv P_gr_vdf1.c p_gr_vdf1.c
mv P_us_vdf1.c p_us_vdf1.c


cd ../protos
mv DTDEMP.H dtdemp.h 
mv GDTSTARP.H gdtstarp.h
mv SDTSTARP.H sdtstarp.h
mv DTSTARP.H dtstarp.h
mv LIST.TXT list.txt
mv STAR_USP.H star_usp.h
mv GDTDEMP.H gdtdemp.h 
mv SDTDEMP.H sdtdemp.h 


cd ../../..

cd docsosf/html

mv dectalk00000000.gif DECtalk00000000.gif
mv dectalk00000001.gif DECtalk00000001.gif
mv dectalk00000002.gif DECtalk00000002.gif
mv dectalk00000003.gif DECtalk00000003.gif
mv dectalk00000004.gif DECtalk00000004.gif
mv dectalk00000005.gif DECtalk00000005.gif
mv dectalk00090000.gif DECtalk00090000.gif
mv dectalk00090001.gif DECtalk00090001.gif
mv dectalk00090002.gif DECtalk00090002.gif
mv dectalk00090003.gif DECtalk00090003.gif
mv dectalk00090004.gif DECtalk00090004.gif
mv dectalk00090005.gif DECtalk00090005.gif
mv dectalk00090006.gif DECtalk00090006.gif
mv dectalk00090007.gif DECtalk00090007.gif
mv dectalkApplication_Programmer.html DECtalkApplication_Programmer.html
mv DECtalkChanging_Voices_Using_DECtalk_So.html DECtalkChanging_voices_using_DECtalk_So.html
mv dectalkComponents.html DECtalkComponents.html
mv dectalkDECtalk_Software_APIs.html DECtalkDECtalk_Software_APIs.html
mv dectalkDECtalk_Software_Dictionaries.html DECtalkDECtalk_Software_Dictionaries.html
mv dectalkDECtalk_Software_InLine_00000008.html DECtalkDECtalk_Software_InLine_00000008.html
mv dectalkFeatures_and_Functions.html DECtalkFeatures_and_Functions.html
mv dectalkGeneral_User.html DECtalkGeneral_User.html
mv dectalkHow_It_Works.html DECtalkHow_It_Works.html
mv dectalkIntroduction_to_DECtalk_Software.html DECtalkIntroduction_to_DECtalk_Software.html
mv dectalkProgramming_Aids.html DECtalkProgramming_Aids.html
mv dectalkSample_Program_Applet.html DECtalkSample_Program_Applet.html
mv dectalkSpeak_Program_Applet.html DECtalkSpeak_Program_Applet.html
mv DECtalkSpeaking_a_File_using_Drag_and_D.html DECtalkSpeaking_a_file_using_Drag_and_D.html
mv DECtalkStress_symbols.html DECtalkStress_Symbols.html
mv dectalkTextToSpeech_DDE_Server.html DECtalkTextToSpeech_DDE_Server.html
mv dectalkUsing_the_Components.html DECtalkUsing_the_Components.html
mv dectalkUsing_the_Program_Applets_to_Lea.html DECtalkUsing_the_Program_Applets_to_Lea.html
mv defaultdectalk.html defaultDECtalk.html
rm DECtalkChanging_voices_using_the_Speaki.html
rm DECtalkCreating_a_User_Dictiona00000128.html
rm DECtalkCreating_a_User_Dictiona00000132.html
rm DECtalkDECtalk_Software_InLine_00000244.html
rm DECtalkDesign_Voice_dv.html
rm DECtalkDifferences_from_the_Standard_Li.html
rm DECtalkHow_SMIT_Works.html
rm DECtalkLoading_the_Main__Dictionary.html
rm DECtalkLoading_the_Main_Dictionary.html
rm DECtalkLoading_the_User_Diction00000130.html
rm DECtalkLoading_the_User_Diction00000134.html
rm DECtalkSaving_text_as_a_WAVE_file_from_.html
rm DECtalkShared_Memory_Initialization_Tec.html
rm DECtalkThe_LANGAUGEPARAMST_Structure_tt.html
rm DECtalkWhats_New_in_DECtalk_Sof00000300.html
rm DECtalkWhats_New_in_DECtalk_Sof00000301.html
rm dtk440_prog_guide.html
rm dtk440_ref_guide.html
rm index.html
cp DECtalkDECtalk.html index.html

cd ../..

find . -name '*.sh' -exec chmod +x {} \;
find . -name 'config.sub' -exec chmod +x {} \;
find . -name 'config.guess' -exec chmod +x {} \;
chmod +x configure


