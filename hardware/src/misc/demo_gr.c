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
 *    File Name:        gdtdemo.c
 *    Author:
 *    Creation Date:    
 *
 *    Functionality:
 *   This is a tutorial for the GERMAN DECtalk PC.
 *
 *   This program is included to provide an example                          
 * of coding to a DECtalk-PC. It uses most of the
 * TSR calls. It is not intended to be functionally
 * or architecturally complete. For example it busy
 * waits most TSR calls which is not an efficient use
 * of the CPU's compute cycles.
 *
 ***********************************************************************
 *    Revision History:
 *
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
 * Add DTCOMMON support.
 *
 */

#include "dttsr.h"         /* header files */
#include "gdtdemp.h"       /* German dtdemo prototypes */
#include "dtdemo.h"        /* External Declarations for xDTSTART */
#include <string.h>        /* standard string library */     


void main(int argc,char **argv )
{

  /* the voice arrays are global to prevent stack overflow */
  strcpy(sil,"[:i m 1000 ][:sync]");  /* used in sendfil */
  strcpy(sync,"[:sync]");
  strcpy(paul,"     Hallo, mein Name ist Paul. Ich bin Dectalks normale Stimme. \n");
  strcpy(harry,"     Guten Tag, ich heisse Harry. Ich habe eine tiefe Stimme. \n");
  strcpy(frank,"     Guten Tag, ich heisse Frank. Ich bin ein Rentner. \n");
  strcpy(dennis,"     Hallo, ich heisse Dennis. Ich habe eine heisere Stimme. \n");
  strcpy(betty,"     Hallo, Ich heisse Betty. Ich bin eine Frau mittleren Alters. \n");
  strcpy(ursula,"     Ich heisse Ursula. Ich bin eine Ñltere Frau. \n");
  strcpy(rita,"     Ich heisse Rita. Ich bin eine Ñltere Frau. \n");
  strcpy(wendy,"     Hallo, mein Name ist Wendy. Ich habe eine FlÅsterstimme. \n");
  strcpy(kit,"     Hallo, ich heisse Kit. Ich bin acht Jahre alt. \n");
  strcpy(song,"[:phone arpa on][:name paul  peh<400,25> niy<400,23>z ih<400,20>n ah<400,18> striy<1200,20>m, <400>fao<400,25> lih<400,23>nx] ");
  strcpy(song2,"[liy<500,20>vz, <100> ah<200,16>v sih<200,18> kah<200,20> mao<1000,12>rx, <200>]");
  strcpy(song3,"[muw<400,20>n lay<400,18>t ih<400,16>n vrr<400,13> maa<1200,16>nt.]");
  strcpy(clist,"      Um eine SchreibvorfÅhrung zu beginnen, schreiben Sie t. \n\
      Um eine Textfolge einzugeben, schreiben Sie e. \n\
      Um den eingegebenen Text zu wiederholen, schreiben Sie r. \n\
      Um den Ton lauter zu stellen, schreiben Sie u. \n\
      Um den Ton leiser zu stellen, schreiben Sie d. \n\
      Um die LautstÑrke auf einen Wert zwischen 0 und 100 einzustellen, \n\
	schreiben Sie b. \n\
      Um einen bereits einprogrammierten Text abzurufen, schreiben Sie m. \n\
      Um einen begonnenen Text abzubrechen und einen neuen zu beginnen,\n\
	schreiben Sie f. \n\
      Um Dectalks verschiedene Stimmen zu hîren, schreiben Sie v. \n\
      Um Dectalk singen zu hîren, schreiben Sie s. \n\
      Um eine Datei zum Abhîren in den Dectalk zu laden, schreiben Sie l. \n\
      Um eine digitalisierte Datei abzuspielen, schreiben Sie a. \n\
      Um das Programm zu verlassen, schreiben Sie q. \n");
   strcpy(voices,"         Um Pauls Stimme zu hîren, schreiben Sie p. \n\
	 Um Franks Stimme zu hîren, schreiben Sie f. \n\
	 Um Dennis' Stimme zu hîren, schreiben Sie d. \n\
	 Um Harrys Stimme zu hîren, schreiben Sie h. \n\
	 Um Bettys Stimme zu hîren, schreiben Sie b. \n\
	 Um Ursulas Stimme zu hîren, schreiben Sie u. \n\
	 Um Ritas Stimme zu hîren, schreiben Sie r. \n\
	 Um Wendys Stimme zu hîren, schreiben Sie w. \n\
	 Um Kits Stimme zu hîren, schreiben Sie k. \n\
	 Um alle Stimmen zu hîren, schreiben Sie a. \n\
	 Um ins HauptmenÅ zurÅckzugehen, schreiben Sie m. \n");
   strcpy(next,"\n     Schreiben Sie den ersten Buchstaben der Stimme, die Sie hîren wollen. \n\
     Wenn Sie eine Liste aller Stimmen wÅnschen, schreiben Sie v. \n\
     Um ins HauptmenÅ zu gehen, schreiben Sie m. \n");
   strcpy(rate,"[:ra 400]");        /* load change of speaking rate*/
   strcpy(canned1,"[:nh][:ra 200] ");
   strcpy(canned2," Guten Tag. Ich bin Dectalk, fÅhrend in der Umwandlung von geschriebenem \n\
in gesprochenen Text. ");
   strcpy(setup," Wenn Sie die Befehle hîren mîchten, drÅcken Sie die Enter Taste.  \n\
   Wenn Sie die Befehle nicht hîren mîchten, drÅcken Sie die Leerzeile. ");
   strcpy(list,"Wenn Sie eine öbersicht Åber die Befehle wÅnschen, \n\
tippen Sie ein Fragezeichen. ");
   strcpy(warning,"Warning! The p, pause command, must be followed by a c, continÅ command, \n\
	 to make DECtalk speak again. ");
   strcpy(typing,"Um die SchreibvorfÅhrung zu beenden, tippen Sie ein Sternchen. ");
   strcpy(recieved,"I have recieved from the DECtalk,[:sync] [:sa le]\013 ");
   strcpy(incr,"   Die LautstÑrke wurde um 5 erhîht. ");
   strcpy(decr,"   Die LautstÑrke wurde um 5 verringert. ");
   strcpy(volset,"Falsche Einstellung der LautstÑrke, der Befehl wird ignoriert. ");
   strcpy(setting,"Die LautstÑrke wird auf den gewÅnschten Wert eingestellt. ");
   strcpy(edit,"Tippen Sie ein Sternchen, um die Eingabe zu beenden, schreiben Sie bis zu \n\
500 Zeichen eines Textes. ");
   strcpy(name,"Geben Sie den Namen der Datei ein, die Sie an den Dectalk schicken wollen und \n\
		drÅcken Sie die Return oder Enter Taste. ");
   strcpy(valid,"Keine gÅltige Option.");
   strcpy(nopen,"Datei konnte nicht gefunden oder geîffnet werden. ");
   strcpy(nopen2,"Datei konnte nicht gefunden oder geîffnet werden. ");
   strcpy(nonew,"No new index has been seen. ");
   strcpy(indexnum,"The last index was number ");
   strcpy(sayl,"[:sa le][:ra 400]"); /* say letter at different rate than speech */
   strcpy(invol,"Geben Sie die gewÅnschte LautstÑrke ein.");
   strcpy(backs,"RÅcktaste\013");                    /* used so DECtalk says 'space', 'delete', 'backspace' */
   strcpy(space,"Leertaste\013");
   strcpy(dels,"Lîschen\013");
   strcpy(dexit,"Die Dectalk VorfÅhrung ist zu Ende. ");
   strcpy(defalt,"UngÅltiger Befehl, bitte tippen Sie ein Fragezeichen, um eine öbersicht \n\
Åber die Befehle zu erhalten. ");

#ifdef FIELD_TEST /* Don't use punct cmds if FIELD_TEST is on! JDB 10/22/95 */
   strcpy(reset,"[:np][:sa c][:ra 210]\013 ");
#else
   strcpy (reset,   "[:np] [:sa c][:pu so][:ra 210]\013 ");
#endif

   strcpy(freset,"[:np][:error ignore] [:say cl][:phon arpa on][:ra 210]\013 ");
   strcpy(voicesetup,"[:n  ]");     /* send a different voice to speak the canned message */

	/* Call dtdemo function in DTCOMMON.C 06-14-1995 cjl*/
	dtdemo(argc,argv);
}
