REM This file is for zipping up the source trees for moving to unix
REM 001 MGS 10/28/1997
REM 002 MGS 03/31/1998	Added dectalkf.h to zip file
REM 003 ETT 11/24/1998  Added install.sh configure.in config.sub config.guess
REM			and Makefile.in Makefile.sub.in replaced Makefile and Makefile.sub
REM 004 ETT 12/04/1998  oops, should have been install-sh
REM 005 MGS 01/29/1999  added configure to zip file
REM 006 MGS 04/07/2000  Adjusted dir names

move docs\dt_inst_46.ps docsosf\ps\dtk_install_guide.ps
move docs\dt_prog_46.ps docsosf\ps\dtk_prog_guide.ps
move docs\dt_ref_46.ps docsosf\ps\dtk_reference_guide.ps

copy hardware\src\misc\alphabet.c udicunix\src
copy hardware\src\misc\cpg_850.c  udicunix\src
copy hardware\src\misc\udic_com.c udicunix\src
copy hardware\src\misc\udic_com.h udicunix\src
copy hardware\src\misc\udic_gr.c udicunix\src
copy hardware\src\misc\udic_la.c udicunix\src
copy hardware\src\misc\udic_sp.c udicunix\src
copy hardware\src\misc\udic_uk.c udicunix\src
copy hardware\src\misc\udic_us.c udicunix\src
copy hardware\src\misc\userdic.c udicunix\src
copy hardware\src\misc\userdic.h udicunix\src

zip -r dapi.zip dapi\src

zip -r other.zip samplosf kitosf udicunix\src licunix\src dtalkml\src Makefile.in Makefile.sub.in docsosf dectalkf.h install-sh configure.in config.sub config.guess configure

