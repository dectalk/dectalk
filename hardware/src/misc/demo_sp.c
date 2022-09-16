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
 *    File Name:	sdtdemo.c
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
 * 04-22-94 Anne D. Nelson
 * Made modifications for the demo to accept spanish characters.
 * Changed English sentences to Spanish.
 * 04-14-95 Carl Leeber
 * Changed dtdemop.h to sdtdemop.h
 *
 * 06-14-95 Carl Leeber
 * Add support from DTCOMMON.
 *
 * 02-09-96 Ginger Lin
 * translate "to hear a message..." to Spanish
 *
 */
#include "dttsr.h"         /* header files */
#include "sdtdemp.h"
#include "dtdemo.h" 	   /* External Declarations for xDTSTART */
#include <string.h>        /* standard string library */
#include <dos.h>     
     
void main(int argc,char **argv )
{
  /* the voice arrays are global to prevent stack overflow */
  strcpy(sil,"[:i m 1000 ][:sync]");  /* used in sendfil */
  strcpy(sync,"[:sync]");

  strcpy(paul,"    Qu‚ tal? Me llamo Pablo. Soy la voz por defecto de DECtalk. \n");
  strcpy(harry,"    Hola, mi nombre es Humberto. Tengo una voz grave. \n");
  strcpy(frank,"    Qu‚ tal? Yo soy Francisco. Soy un ciudadano de la tercera edad. \n");
  strcpy(dennis,"    Hola, mi nombre es Domingo. Tengo una voz quebrada. \n");
  strcpy(betty,"    Qu‚ tal? Soy Berta. Soy una mujer de mediana edad. \n");
  strcpy(ursula,"    Hola. Soy £rsula y soy una se¤ora mayor. \n");
  strcpy(rita,"    Hola. Soy Rita. Tengo una voz un poco ruda. \n");
  strcpy(wendy,"    Qu‚ tal? Mi nombre es Wendy. Tengo una voz susurrante. \n");
  strcpy(kit,"    Hola. Soy Juanito y tengo ocho a¤os. \n");
  strcpy(song,"[:pho asky on][_<2000>][:np][fue<250,17>un<250,17>taN<1000,19>go<500,26>su<500,21>ti<1000,19>lna<500,21>da<500,17>ma<3000,19>] ");
  strcpy(song2,"[s_<500>],[de<500,19>li<1000,21>rio<500,29>i<500,26>sue<750,24>n<250,24>io<500,26>fu<500,21>ga<3000,29>z_<500>],");			   
  strcpy(song3,"[a<500,17>pren<1000,19>dea<500,17>ke<500,22>re<1000,19>r sin<500,17>me<500,26>nti<750,24>r<250,24>i<500,22>se<500,26>]");
  strcpy(clist,"      Para ejecutar una demostraci¢n mecanogr fica, teclee la letra t.  \n\
      Para introducir una cadena de texto, teclee la letra e. \n\
      Para repetir el texto introducido, teclee la letra r. \n\
      Para aumentar el volumen, teclee la letra u. \n\
      Para bajar el volumen, teclee la letra d. \n\
      Para ajustar el volumen a un valor entre 0 y 100, teclee la letra b. \n\
      Para escuchar un mensaje, teclee la m. \n\
      Para detener un discurso, teclee la letra f. \n\
      Para oir las diferentes voces de DECtalk, teclee la letra v. \n\
      Para escuchar como canta DECtalk, teclee la letra s. \n\
      Para cargar un fichero en DECtalk, teclee la letra l. \n\
      Para o¡r un fichero digitalizado, teclee la letra a. \n\
      Para salir, teclee la letra q. \n");
   strcpy(voices,"         Para o¡r la voz de Pablo, teclee p. \n\
         Para o¡r la voz de Humberto, teclee la letra h. \n\
         Para o¡r la voz de Francisco, teclee la letra f. \n\
         Para o¡r la voz de Domingo, teclee la letra d. \n\
         Para o¡r la voz de Berta, teclee la letra b. \n\
         Para o¡r la voz de £rsula, teclee la letra u. \n\
         Para o¡r la voz de Rita, teclee la letra r. \n\
         Para o¡r la voz de Wendy, teclee la letra w. \n\
         Para o¡r la voz de Juanito, teclee la letra k. \n\
         Para o¡r todas las voces, teclee la letra a. \n\
         Para volver al men£ principal, teclee la letra m. \n");
   strcpy(next,"\n     Teclee la primera letra de la voz que desea o¡r. \n\
     Para o¡r la lista de las voces disponibles, teclee la letra v. \n\
     Para pasar al men£ principal, teclee la letra m. \n");
   strcpy(rate,"[:ra 400]");        /* load change of speaking rate*/
   strcpy(canned1,"[:nh][:ra 200] ");
   strcpy(canned2,"Hola, Soy DECtalk, lo m s avanzado del mundo en s¡ntesis de voz. ");
   strcpy(setup,"Si desea que los comandos sean hablados, pulse enter, \n\
   Si no desea que los comandos sean hablados, pulse la barra espaciadora. ");
   strcpy(list,"Para obtener una lista de comandos, teclee la interrogaci¢n cerrada. ");
   strcpy(warning,"Warning! The p, pause command, must be followed by a c, continue command, \n\
	 to make DECtalk speak again. ");
   strcpy(typing,"Demostraci¢n de mecanograf¡a, Para salir, teclee un enter. ");
   strcpy(recieved,"He recibido de DECtalk,[:sync] [:sa le]\013 ");
   strcpy(incr,"   Volumen incrementado en 5. ");
   strcpy(decr,"   Volumen decrementado en 5. ");
   strcpy(volset,"Ajuste incorrecto de volumen. Petici¢n ignorada. ");
   strcpy(setting,"Ajustando el volumen al nivel indicado. ");
   strcpy(edit,"Para finalizar la entrada teclee un enter. ");
   strcpy(name,"Indique el nombre del fichero que va a enviar a DECtalk y pulse enter. ");
   strcpy(valid,"Opci¢n no v lida. ");
   strcpy(nopen,"No se puede encontrar o abrir el fichero. ");
   strcpy(nopen2,"No se puede encontrar o abrir el fichero. ");
   strcpy(nonew,"No ha aparecido ning£n ¡ndice nuevo. ");
   strcpy(indexnum,"El £ltimo ¡ndice fue el n£mero ");
   strcpy(sayl,"[:sa le][:ra 400]"); /* say letter at different rate than speech */
   strcpy(invol,"Introduzca el nivel de volumen:");
   strcpy(backs,"retroceso\013");                    /* used so DECtalk says 'space', 'delete', 'backspace' */
   strcpy(space,"espacio\013");
   strcpy(dels,"borrar\013");
   strcpy(dexit,"Saliendo de la demo de DECtalk. ");
   strcpy(defalt,"Comando incorrecto. Por favor teclee una interrogaci¢n cerrada para obtener una lista de comandos. ");

#ifdef FIELD_TEST /* Don't use punct cmds if FIELD_TEST is on! JDB 10/22/95 */
   strcpy (reset,   "[:np] [:sa c][:ra 210]\013 ");
#else
   strcpy(reset,"[:np] [:sa c][:pu so][:ra 210]\013 ");
#endif         

   strcpy(freset,"[:np][:error ignore] [:say cl][:phon arpa on][:ra 210]\013 ");
   strcpy(voicesetup,"[:n  ]");     /* send a different voice to speak the canned message */

	/* Call dtdemo function in DTCOMMON.C 06-14-1995 cjl*/
	dtdemo(argc,argv);
}
