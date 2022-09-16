#!/bin/csh
#
# @DEC_COPYRIGHT@
#
# HISTORY
# Revision 1.1.2.6  1996/10/02  11:56:39  Cathy_Page
# 	Previous log comment incorrect - Changed 420 to 430 and V4.2A to V4.3
# 	[1996/10/02  11:56:18  Cathy_Page]
#
# Revision 1.1.2.5  1996/10/02  11:54:01  Cathy_Page
# 	Typo - Changed UNIT to UINT
# 	[1996/10/02  11:53:39  Cathy_Page]
# 
# Revision 1.1.2.4  1995/11/21  20:56:08  Krishna_Mangipudi
# 	Rolled back last change
# 	[1995/11/21  20:55:25  Krishna_Mangipudi]
# 
# Revision 1.1.2.2  1995/11/15  20:45:30  Krishna_Mangipudi
# 	Initial checkin
# 	[1995/11/15  20:45:06  Krishna_Mangipudi]
# 
# $EndLog$
#
#
set OS_VER=`uname -r`
set  SOURCEBASE=/home/users/dectalk/rnd
set  KIT=$SOURCEBASE/kitosf/$OS_VER

#
# generate the kit
#
echo "Generating the Runtime kit..."
newinv DTKRT461.mi ../$OS_VER/RT/src

find ../$OS_VER/RT/src/ -print | xargs chown bin
find ../$OS_VER/RT/src/ -print | xargs chgrp bin

kits DTKRT461.k ../$OS_VER/RT/src/ ../$OS_VER/output/RT
#
# all done
#

find ../RT/src -print | xargs chown krishna 
find ../RT/src -print | xargs chgrp system 

echo "Done building the Runtime kit."

#
# all done
#

echo "Done building kits."
