#!/bin/csh
#
# @DEC_COPYRIGHT@
#
# HISTORY
# Revision 1.1.2.14  1996/10/02  11:56:37  Cathy_Page
# 	Previous log comment incorrect - Changed 420 to 430 and V4.2A to V4.3
# 	[1996/10/02  11:56:16  Cathy_Page]
#
# Revision 1.1.2.13  1996/10/02  11:53:59  Cathy_Page
# 	Typo - Changed UNIT to UINT
# 	[1996/10/02  11:53:37  Cathy_Page]
# 
# Revision 1.1.2.12  1996/02/05  12:33:49  Krishna_Mangipudi
# 	Added call to create_rt_kit.sh
# 	[1996/02/05  12:33:42  Krishna_Mangipudi]
# 
# Revision 1.1.2.11  1995/11/21  21:05:47  Krishna_Mangipudi
# 	build in ../DEV now
# 	[1995/11/21  21:05:09  Krishna_Mangipudi]
# 
# Revision 1.1.2.10  1995/11/21  17:44:37  Krishna_Mangipudi
# 	Merged DOCs and REL NOT subsets
# 	[1995/11/21  17:43:29  Krishna_Mangipudi]
# 
# Revision 1.1.2.9  1995/11/20  21:17:58  Krishna_Mangipudi
# 	Now create DEV & RT kit
# 	[1995/11/20  21:17:26  Krishna_Mangipudi]
# 
# Revision 1.1.2.8  1995/04/18  15:15:50  Krishna_Mangipudi
# 	Change rel notes subset names
# 	[1995/04/18  15:15:30  Krishna_Mangipudi]
# 
# Revision 1.1.2.7  1995/04/17  21:06:20  Krishna_Mangipudi
# 	Fixed many problems, now works and creates two kits - RT & DEV
# 	[1995/04/17  21:03:47  Krishna_Mangipudi]
# 
# Revision 1.1.2.6  1995/04/17  17:36:33  Krishna_Mangipudi
# 	Build RT and DEV into separate output areas
# 	[1995/04/17  17:36:26  Krishna_Mangipudi]
# 
# Revision 1.1.2.5  1995/04/17  17:34:33  Krishna_Mangipudi
# 	Split kit build into separate RT/DEV kits.
# 	[1995/04/17  17:34:22  Krishna_Mangipudi]
# 
# Revision 1.1.2.4  1995/04/14  16:05:07  Krishna_Mangipudi
# 	Brokeup kit build into copy_to_src.sh and create_kit.sh
# 	Run copy_to_src.sh in your user account
# 	Then run create_kit.sh as a su.
# 	[1995/04/14  16:04:58  Krishna_Mangipudi]
# 
# Revision 1.1.2.3  1995/04/13  20:54:50  Krishna_Mangipudi
# 	Edited to work in the tree.
# 	[1995/04/13  20:47:58  Krishna_Mangipudi]
# 
# Revision 1.1.2.2  1995/04/12  14:49:37  Krishna_Mangipudi
# 	Initial creation & checkin into ODE tree
# 	[1995/04/12  14:48:56  Krishna_Mangipudi]
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
echo "Generating the Development kit..."
newinv DTKDEV461.mi ../$OS_VER/DEV/src/

find ../$OS_VER/DEV/src/ -print | xargs chown bin
find ../$OS_VER/DEV/src/ -print | xargs chgrp bin

kits DTKDEV461.k ../$OS_VER/DEV/src/ ../$OS_VER/output/DEV
#
# all done
#

find ../$OS_VER/DEV/src/ -print | xargs chown krishna 
find ../$OS_VER/DEV/src/ -print | xargs chgrp system 

echo "Done building the Development kit."

echo "Done building RT kit."
echo " "

source create_rt_kit.sh
echo " "
echo "Done creating kits"
