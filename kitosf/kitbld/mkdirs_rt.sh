#!/bin/csh
#
# @DEC_COPYRIGHT@
#
# HISTORY
# Revision 1.1.2.13  1996/10/03  11:54:39  Cathy_Page
# 	Changes for V4.3 - replaced 420 to 430
# 	[1996/10/03  11:54:27  Cathy_Page]
#
# Revision 1.1.2.12  1996/10/02  11:56:41  Cathy_Page
# 	Previous log comment incorrect - Changed 420 to 430 and V4.2A to V4.3
# 	[1996/10/02  11:56:21  Cathy_Page]
# 
# Revision 1.1.2.11  1996/10/02  11:54:03  Cathy_Page
# 	Typo - Changed UNIT to UINT
# 	[1996/10/02  11:53:43  Cathy_Page]
# 
# Revision 1.1.2.10  1996/02/27  03:22:29  Krishna_Mangipudi
# 	removed directory for bookreader
# 	[1996/02/27  03:22:21  Krishna_Mangipudi]
# 
# Revision 1.1.2.9  1996/02/20  14:38:23  Krishna_Mangipudi
# 	Added html docs
# 	[1996/02/20  14:37:50  Krishna_Mangipudi]
# 
# Revision 1.1.2.8  1996/02/16  21:37:25  Krishna_Mangipudi
# 	Added whatis
# 	[1996/02/16  21:37:06  Krishna_Mangipudi]
# 
# Revision 1.1.2.7  1996/02/01  21:32:26  Krishna_Mangipudi
# 	moved kit location
# 	[1996/02/01  21:31:30  Krishna_Mangipudi]
# 
# Revision 1.1.2.6  1995/11/27  21:18:36  Krishna_Mangipudi
# 	Added CDE support
# 	[1995/11/27  21:16:46  Krishna_Mangipudi]
# 
# Revision 1.1.2.5  1995/11/21  20:56:11  Krishna_Mangipudi
# 	Rolled back last change
# 	[1995/11/21  20:55:28  Krishna_Mangipudi]
# 
# Revision 1.1.2.3  1995/11/16  21:00:03  Krishna_Mangipudi
# 	Added man pages and rearranged a few files
# 	[1995/11/16  20:59:36  Krishna_Mangipudi]
# 
# Revision 1.1.2.2  1995/11/15  20:45:32  Krishna_Mangipudi
# 	Initial checkin
# 	[1995/11/15  20:45:08  Krishna_Mangipudi]
# 
# $EndLog$
#

set OS_VER=`uname -r`
set  KIT=$SOURCEBASE/kitosf/$OS_VER
set  VERSION=461

echo "This shell script will create a kit build directory"
echo "in $KIT"
echo "Run it once in the tree that you will be using to build a Declare"
echo "kit."

mkdir -p $KIT/RT/src
mkdir -p $KIT/output/RT
mkdir $KIT/kit
#
# Contents of RT kit...
#
mkdir -p $KIT/RT/src/usr

mkdir -p $KIT/RT/src/usr/bin
mkdir -p $KIT/RT/src/usr/bin/X11
mkdir -p $KIT/RT/src/usr/examples/dtk/dtsamples
mkdir -p $KIT/RT/src/usr/include/X11/bitmaps/dtk
mkdir -p $KIT/RT/src/usr/lib/dtk
mkdir -p $KIT/RT/src/usr/man/man1
mkdir $KIT/RT/src/usr/opt/
mkdir $KIT/RT/src/usr/shlib/

mkdir -p $KIT/RT/src/usr/opt/DTKRT461/docs
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/docs/ascii
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/docs/postscript
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/docs/pdf
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/docs/man
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/docs/man/man1
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/share/man/man1
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/docs/html


mkdir -p $KIT/RT/src/usr/opt/DTKRT461/examples/dtk/dtsamples
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/examples/dtk/speak/bitmaps

mkdir -p $KIT/RT/src/usr/opt/DTKRT461/lib/dtk
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/ivp
mkdir $KIT/RT/src/usr/opt/DTKRT461/shlib
mkdir $KIT/RT/src/usr/opt/DTKRT461/tools
#
# Create CDE directories
#
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/etc/dt
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/etc/dt/appconfig
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/etc/dt/appconfig/types/C
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/etc/dt/appconfig/icons/C
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/etc/dt/appconfig/appmanager/C/Multimedia

#
# Create Emacspeak directories
#
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/emacspeak/Macros
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/emacspeak/docs
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/emacspeak/docs/postscript
mkdir -p $KIT/RT/src/usr/opt/DTKRT461/emacspeak/docs/ascii









