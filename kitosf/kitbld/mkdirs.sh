#!/bin/csh
#
# @DEC_COPYRIGHT@
#
# HISTORY
# Revision 1.1.2.18  1996/10/02  11:56:40  Cathy_Page
# 	Previous log comment incorrect - Changed 420 to 430 and V4.2A to V4.3
# 	[1996/10/02  11:56:20  Cathy_Page]
#
# Revision 1.1.2.17  1996/10/02  11:54:02  Cathy_Page
# 	Typo - Changed UNIT to UINT
# 	[1996/10/02  11:53:41  Cathy_Page]
# 
# Revision 1.1.2.16  1996/03/18  18:17:43  Krishna_Mangipudi
# 	Added yellowball & deleted bookreader stuff
# 	[1996/03/18  18:17:04  Krishna_Mangipudi]
# 
# Revision 1.1.2.15  1996/02/20  14:38:21  Krishna_Mangipudi
# 	Added html docs
# 	[1996/02/20  14:37:48  Krishna_Mangipudi]
# 
# Revision 1.1.2.14  1996/02/16  21:21:39  Krishna_Mangipudi
# 	Added whatis
# 	[1996/02/16  21:21:17  Krishna_Mangipudi]
# 
# Revision 1.1.2.13  1996/02/05  12:21:00  Krishna_Mangipudi
# 	Install into one dir in /usr/opt
# 	[1996/02/05  12:20:46  Krishna_Mangipudi]
# 
# Revision 1.1.2.12  1995/12/04  18:46:00  Krishna_Mangipudi
# 	Added CDE support
# 	[1995/12/04  18:39:26  Krishna_Mangipudi]
# 
# Revision 1.1.2.11  1995/11/21  21:10:14  Krishna_Mangipudi
# 	build in ../DEV now
# 	[1995/11/21  21:10:02  Krishna_Mangipudi]
# 
# Revision 1.1.2.10  1995/11/21  17:44:39  Krishna_Mangipudi
# 	Merged DOCs and REL NOT subsets
# 	[1995/11/21  17:43:35  Krishna_Mangipudi]
# 
# Revision 1.1.2.9  1995/11/20  21:17:59  Krishna_Mangipudi
# 	Now create DEV & RT kit
# 	[1995/11/20  21:17:29  Krishna_Mangipudi]
# 
# Revision 1.1.2.8  1995/04/18  15:23:55  Krishna_Mangipudi
# 	make spelling conisitent for rel note subset
# 	[1995/04/18  15:23:33  Krishna_Mangipudi]
# 
# Revision 1.1.2.7  1995/04/18  15:15:52  Krishna_Mangipudi
# 	Change rel notes subset names
# 	[1995/04/18  15:15:32  Krishna_Mangipudi]
# 
# Revision 1.1.2.6  1995/04/17  21:06:21  Krishna_Mangipudi
# 	Fixed many problems, now works and creates two kits - RT & DEV
# 	[1995/04/17  21:03:50  Krishna_Mangipudi]
# 
# Revision 1.1.2.5  1995/04/13  21:28:44  Krishna_Mangipudi
# 	Delete extraenous lib.
# 	[1995/04/13  21:28:35  Krishna_Mangipudi]
# 
# Revision 1.1.2.4  1995/04/13  20:54:51  Krishna_Mangipudi
# 	Deleted sub dir DTKDOC420, defined twice.
# 	[1995/04/13  20:54:19  Krishna_Mangipudi]
# 
# Revision 1.1.2.3  1995/04/13  20:10:59  Krishna_Mangipudi
# 	Do not use #!/bin/sh
# 	[1995/04/13  20:10:49  Krishna_Mangipudi]
# 
# Revision 1.1.2.2  1995/04/12  14:40:31  Krishna_Mangipudi
# 	Initial creation and checkin
# 	[1995/04/12  14:40:19  Krishna_Mangipudi]
# 
# $EndLog$
#

# Added by Trung Ly 5/16/97
set OS_VER = `uname -r`
set  SOURCEBASE=/home/users/dectalk/rnd
set  KIT=$SOURCEBASE/kitosf/$OS_VER
set  VERSION=461


echo "This shell script will create a kit build directory"
echo "in $KIT"
echo "Run it once in the tree that you will be using to build a Declare"
echo "kit."

mkdir -p $KIT/DEV/src
mkdir -p $KIT/output/DEV
mkdir $KIT/kit
#
# Contents of DEV kit...
#
mkdir -p $KIT/DEV/src/usr

mkdir -p $KIT/DEV/src/usr/examples/dtk/dtsamples
mkdir -p $KIT/DEV/src/usr/include/dtk
mkdir -p $KIT/DEV/src/usr/man/man3
mkdir $KIT/DEV/src/usr/opt/

mkdir -p $KIT/DEV/src/usr/opt/DTKDEV{$VERSION}/docs/man/man3
mkdir -p $KIT/DEV/src/usr/opt/DTKDEV{$VERSION}/docs/postscript
mkdir -p $KIT/DEV/src/usr/opt/DTKDEV{$VERSION}/docs/pdf
mkdir -p $KIT/DEV/src/usr/opt/DTKDEV{$VERSION}/docs/ascii
mkdir -p $KIT/DEV/src/usr/opt/DTKDEV{$VERSION}/docs/html

mkdir -p $KIT/DEV/src/usr/opt/DTKDEV{$VERSION}/include/dtk

mkdir -p $KIT/DEV/src/usr/opt/DTKDEV{$VERSION}/examples/dtk/dtsamples

mkdir -p $KIT/DEV/src/usr/opt/DTKDEV{$VERSION}/share/man/man3
#
# Create DECtalk Software RT directories
#

source mkdirs_rt.sh





