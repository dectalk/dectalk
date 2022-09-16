/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright © 2000, 2001 Force Computers Inc. A Solectron Company. All rights reserved. */
/*  Copyright   Digital Equipment Corporation, 1993                   */
/*  All Rights reserved. Unpublished rights reserved under the        */
/*  copyright laws of the United States. Copyright is claimed in      */
/*  the computer program and user interface thereof.                  */
/*                                                                    */
/*  The software contained on this media is proprietary to and        */
/*  embodies the confidential technology of Digital Equipment         */
/*  Corporation. Possession, use, duplication or dissemination of     */
/*  the software and media is authorized only pursuant to a valid     */
/*  written license from Force Computers Incorporated.               */
/*                                                                    */
/*  The name of Force Computers Incorporated may not be used to      */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      */
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED        */
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        */
/*  FOR A PARTICULAR PURPOSE.                                         */
/*  Force assumes no responsibility AT ALL for the use or           */
/*  reliability of this software.                                     */
/*                                                                    */
/*                                                                    */
/* +----------------------------------------------------------------+ */
/* | USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT IS       | */
/* | SUBJECT TO RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH           | */
/* | DFARS 252.227-7013, OR IN FAR 52.227-14 ALT. II, AS APPLICABLE.| */
/* |                                                                | */
/* +----------------------------------------------------------------+ */
/*                                                                    */
/**********************************************************************/


This is the set of files needed to set up DECtalk[R] Access32 Software.

These files may only be used, copied, and/or redistributed pursuant to 
a written license agreement covering DECtalk Access32 Software, and only
to the extent permitted by such agreement.


Note that none of the "Applets" are included; these are the same as in
the base DECtalk Software SDK, and are subject to the redistribution
rules contained therein.

DECtalk and DECtalk Software are trademarks of Force Computers Incorporated.

For more in depth infomation about the registry please refer to appendix2.txt 
in the DECtalk SDK.

Overview:
It is expected that each Access32 licensee will be incorporating the 
install procedures into their own installation method; the files 
given here are meant to show what needs to be done to successfully 
set up that installation. In a pinch, these files can be edited and
run to install this code as well.

Code Version:
The files contained in this kit are based on DECTALK Software V4.61 R002.

COPYING FILES:
The DLL files are copied as shown in DOCOPY.BAT. This file will have to
be edited to point to the correct destination.

REGISTRY ENTRIES:
The required registry entries are in SETUP.REG, which is a REGEDIT-format
file. These will have to be edited to reflect the destinations for the 
files copied above.

Standard DECtalk Software files and utilities:
The user dictionary, help files, and applets which are part of the standard
DECtalk Software SDK are not included in this kit; the registry entries
required to use these standard files are not set up by SETUP.REG.

Using SMIT:
As part of your DECtalk Access32 Software License Agreement, you have 
agreed to all the terms and conditions of confidentiality regarding 
the SMIT licensing method and the SMIT*.c files. As part of that agreement,
you are not to divulge the contents of ANY FILES ASSOCIATED WITH THIS KIT
to ANY PARTY in other than object form.

In order to allow the synthesizer DLLs included as part of this kit to 
function, the include SMITxx.c file must be included in your license-check
code. When your copy-protection licensing software has verified that you 
are running on a properly-licensed system, the DT$OpenMem() routine in the
SMITxx.C file must be called to unlock the synthesizers. 

Note that before this function is called, TextToSpeechStartup[Ex]() will
return an error, and the SAPI engine will not enumerate.

04/24/01
