/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	dtdemo.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *   This is a tutorial for the DECtalk PC.
 *
 *   This program is included to provide an example                          
 * of coding to a DECtalk-PC. It uses most of the
 * TSR calls. It is not intended to be functionally
 * or architecturally complete. For example it busy
 * waits most TSR calls which is not an efficient use
 * of the CPU's compute cycles.
 *
 *
 ***********************************************************************
 *    Revision History:
 * 8-23-93   Anne D. Nelson
 * Added the different voices and song option.  I also made the speaking
 * mode more consistant.  DECtalk now speakes every word typed and every word
 * that appears on the screen.  Added comments and cleaned up the code.
 *
 * 11-11-93  Anne D. Nelson
 * Added the digitized option so that the demo will play a digitized file.
 *
 * 01-17-94 Anne D. Nelson
 * Got rid of some of the warnings during compilation for the releases of
 * V4.20.
 *
 * 01-31-94 Anne D. Nelson
 * Added case 'z' to show how to find the version number of DECtalk.
 * For version 4.20, it will print 420.
 *
 * 06-14-95 Carl Leeber
 * Add support from DTCOMMON.
 *
 * 01-12-1995 Anne  Nelson
 * Changed how you exit the typing and edit options.  Used to type an *,
 * now hit return.
 */

#include "dttsr.h"         /* header files */
#include "dtdemp.h"        /* English Prototype files */
#include "dtdemo.h" 	   /* External Declarations for xDTSTART */
#include <string.h>        /* standard string library */

void main(int argc,char **argv )
{
  /* the voice arrays are global to prevent stack overflow */
  strcpy(sil,"[:i m 1000 ][:sync]");  /* used in sendfil */
  strcpy(sync,"[:sync]");
  strcpy(paul,"    Hi, my name is Paul.  I am the default voice for DECtalk. \n");
  strcpy(harry,"    Hello, my name is Harry.  I have a deep voice. \n");
  strcpy(frank,"    Hi, I'm Frank. I am a senior citizen. \n");
  strcpy(dennis,"    Hello, my name is Dennis.  I have a hoarse voice. \n");
  strcpy(betty,"    Hi, I am Betty.  I'm a middle-aged woman. \n");
  strcpy(ursula,"    I am Ursula.  I'm an older woman. \n");
  strcpy(rita,"    Hello.  I am Rita.  I have a rough voice. \n");
  strcpy(wendy,"    Hi, my name is Wendy.  I have a whispery voice. \n");
  strcpy(kit,"    Hey!  My name is Kit.  I'm eight years old. \n");
  strcpy(song,"[:phone arpa on][:name paul  peh<400,25> niy<400,23>z ih<400,20>n ah<400,18> striy<1200,20>m, <400>fao<400,25> lih<400,23>nx] ");
  strcpy(song2,"[liy<500,20>vz, <100> ah<200,16>v sih<200,18> kah<200,20> mao<1000,12>rx, <200>]");
  strcpy(song3,"[muw<400,20>n lay<400,18>t ih<400,16>n vrr<400,13> maa<1200,16>nt.]");
  strcpy(clist,"      To run a typing demonstration, type t.  \n\
      To enter text string, type e. \n\
      To repeat text entered, type r. \n\
      For volume up, type u. \n\
      For volume down, type d. \n\
      To set volume to a value between 0 and 100, type b. \n\
      To speak a canned message, type m. \n\
      To flush speech, type f. \n\
      To hear the different voices of DECtalk, type v. \n\
      To hear DECtalk sing, type s. \n\
      To load a file to the DECtalk, type l. \n\
      To play a digitized file, type a. \n\
      To quit, type q. \n");
   strcpy(voices,"         To hear Paul's voice, type p. \n\
	 To hear Harry's voice, type h. \n\
	 To hear Frank's voice, type f. \n\
	 To hear Dennis's voice, type d. \n\
	 To hear Betty's voice, type b. \n\
	 To hear Ursula's voice, type u. \n\
	 To hear Rita's voice, type r. \n\
	 To hear Wendy's voice, type w. \n\
	 To hear Kit's voice, type k. \n\
	 To hear all the voices, type a. \n\
	 To go back to the main menu, type m. \n");
   strcpy(next,"\n     Type in the first letter of the voice you want to hear. \n\
     If you would like the list of voices, type v. \n\
     To go to the main menu, type m. \n");
   strcpy(rate,"[:ra 400]");        /* load change of speaking rate*/
   strcpy(canned1,"[:nh][:ra 200] ");
   strcpy(canned2," Hello, I'm DECtalk, the state of the art in text to speech synthesis. ");
   strcpy(setup,"If you would like the commands spoken, press enter,  \n\
   If you would like the commands not to be spoken, press the space-bar. ");
   strcpy(list,"For a list of commands, type question-mark. ");
   strcpy(warning,"Warning! The p, pause command, must be followed by a c, continue command, \n\
	 to make DECtalk speak again. ");
   strcpy(typing,"Typing demonstration, type the enter key to exit. ");
   strcpy(recieved,"I have recieved from the DECtalk,[:sync] [:sa le]\013 ");
   strcpy(incr,"   Incremented the volume by 5. ");
   strcpy(decr,"   Decremented the volume by 5. ");
   strcpy(volset,"Volume setting incorrect, ignoring request. ");
   strcpy(setting,"Setting the volume to requested input. ");
   strcpy(edit,"Type up to 500 characters of text then press enter. ");
   strcpy(name,"Input name of file to be sent to DECtalk and press enter. ");
   strcpy(valid,"Not a valid option. ");
   strcpy(nopen,"Couldn't find or open file. ");
   strcpy(nonew,"No new index has been seen. ");
   strcpy(indexnum,"The last index was number ");
   strcpy(sayl,"[:sa le][:ra 400]"); /* say letter at different rate than speech */
   strcpy(invol,"Input volume setting:");
   strcpy(backs,"backspace\013");                    /* used so DECtalk says 'space', 'delete', 'backspace' */
   strcpy(space,"space\013");
   strcpy(dels,"delete\013");
   strcpy(dexit,"Exiting DECtalk demo. ");
   strcpy(defalt,"Incorrect command, please type a question-mark for a list of commands. ");
   strcpy(reset,"[:np] [:sa c][:pu so][:ra 210]\013 ");
   strcpy(freset,"[:np][:error ignore] [:say cl][:phon arpa on][:ra 210]\013 ");
   strcpy(voicesetup,"[:n  ]");     /* send a different voice to speak the canned message */
	/* Call dtdemo function in DTCOMMON.C 06-14-1995 cjl*/
	dtdemo(argc,argv);
}

