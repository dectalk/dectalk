#!/bin/csh
# 
# *******************************************************************
# Issued by Dan Daddieco - License Key and PAK Management Group
#      DTN 264-8998 *** 603-884-8998 ***  FAX 603-884-1297
# VAXMail GROOVE::DADDIECO  ***  Internet daddieco@groove.zko.dec.com
#      WWW Pages   http://groove.zko.dec.com/lkpmlogo.html
# *******************************************************************
# 
if `whoami` != "root" then
   echo "You must be superuser to run this script"
   exit 1
endif

test -r /etc/lmf
if ($status != 0) then
   set lmfcom="/usr/sbin/lmf"
else
   set lmfcom="/etc/lmf"
endif

# This PAK was issued on 22-JAN-1998 08:14
echo ""
echo "Registering DECTALK-SW97"
$lmfcom register - << =EOF=
Licensed Software Product
Product Authorization Key
Enter data on lines terminated with :
                 Issuer: DEC
   Authorization Number: AO-FP-CAPACITY-TESTPAK1
           Product Name: DECTALK-SW97
               Producer: DEC
        Number of units: 100
   Key Termination Date: 22-JUL-1998 
Availability Table Code: CONSTANT=100
            Key Options: ALPHA
               Checksum: 2-PCKL-CDJO-LIHB-DNEO
=EOF=

if $status then
   echo "Registration Failed for DECTALK-SW97 "
   exit 1
endif

echo ""
echo "Loading DECTALK-SW97"
$lmfcom load 0 DECTALK-SW97
#
#
# This PAK was issued on 22-JAN-1998 08:14
echo ""
echo "Registering DECTALK-SW97-USER"
$lmfcom register - << =EOF=
Licensed Software Product
Product Authorization Key
Enter data on lines terminated with :
                 Issuer: DEC
   Authorization Number: CONCURRENT-USE-TESTPAK2
           Product Name: DECTALK-SW97-USER
               Producer: DEC
        Number of units: 1000
   Key Termination Date: 22-JUL-1998 
    Activity Table Code: CONSTANT=100
               Checksum: 2-HODI-EEEN-NGKI-IJBE
=EOF=

if $status then
   echo "Registration Failed for DECTALK-SW97-USER "
   exit 1
endif

echo ""
echo "Loading DECTALK-SW97-USER"
$lmfcom load 0 DECTALK-SW97-USER
#

