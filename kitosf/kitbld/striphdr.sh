#!/bin/ksh
# 
# @DEC_COPYRIGHT@
#
# HISTORY
# Revision 1.1.2.5  1996/02/26  18:05:24  Krishna_Mangipudi
# 	strip files in  not ../
# 	[1996/02/26  18:05:15  Krishna_Mangipudi]
#
# Revision 1.1.2.4  1996/02/26  18:03:24  Krishna_Mangipudi
# 	strip files in scps
# 	[1996/02/26  18:03:05  Krishna_Mangipudi]
# 
# Revision 1.1.2.3  1996/01/26  14:20:32  Krishna_Mangipudi
# 	Added bin file stripping scripts
# 	[1996/01/26  14:20:24  Krishna_Mangipudi]
# 
# Revision 1.1.2.2  1996/01/25  22:16:04  Krishna_Mangipudi
# 	Initial Creation and check in
# 	[1996/01/25  22:15:48  Krishna_Mangipudi]
# 
# $EndLog$
#
#!/bin/sh5
#
STRIP_LOG=strip.log
STRIP_BIN_LOG=strip_bin.log
MACHINE=`/bin/machine`
case $MACHINE in
    alpha) ODE=alpha_OSF1 ;;
    mips)  ODE=pmax_ultrix ;;
esac
GENDATA="/usr/sde/tools/${ODE}/bin/gendatafile"

echo "Deleting HISTORY from file headers and adding COPYRIGHT message in $1"

    COPYRIGHT="DEC_COPYRIGHT"
    SAMPLECOPYRIGHT="DEC_FREE_COPYRIGHT"
    > $STRIP_LOG
#    cd $DESTDIR
    find $1 -type f -print |
    sed -e '/\.Z$/d' \
        -e '/rgb.pag/d'     \
        -e '/rdb.dir/d'     \
        -e '/\.uid/d'       \
        -e '/\.decw_book/d' \
        -e '/\.so$/d'       \
        -e '/\.a$/d' |
    while read file
    do
      type=`file $file | egrep 'ASCII|text|script|shell|program'`
      if [ "$type" != "" ]
      then
        echo "Stripping HISTORY log from " $file >> $STRIP_LOG
        echo "${GENDATA}" >> $STRIP_LOG
        chmod u+w $file
        $GENDATA -nolog $file $COPYRIGHT $SAMPLECOPYRIGHT >> $STRIP_LOG 2>&1
#      else
#        echo $file is not ASCII and not stripped >> $STRIP_LOG
      fi
    done

echo "Done Deleting HISTORY and adding COPYRIGHT message in $1..."

echo "Stripping bin files in $1 ..."

    find $1 -type f -print |
    sed -e '/\.Z$/d' \
        -e '/rgb.pag/d'     \
        -e '/rdb.dir/d'     \
        -e '/\.uid/d'       \
        -e '/\.decw_book/d' \
        -e '/\.so$/d'       \
        -e '/\.o$/d'        \
        -e '/\.o\./d'        \
        -e '/\.a$/d' |
    while read file
    do
      type=`file $file | egrep 'COFF'`
      if [ "$type" != "" ]
      then
        echo "Stripping Binaries from " $file >> $STRIP_BIN_LOG
        strip $file >> $STRIP_BIN_LOG 2>&1
      fi
    done

echo "Done stripping bin files in $1."
