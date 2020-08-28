REM This file is for zipping up the source trees for moving to unix
REM 001 MGS 10/28/1997
REM 002 MGS 03/31/1998	Added dectalkf.h to zip file
REM 003 ETT 11/24/1998  Added install.sh configure.in config.sub config.guess
REM			and Makefile.in Makefile.sub.in replaced Makefile and Makefile.sub
REM 004 ETT 12/04/1998  oops, should have been install-sh
REM 005 MGS 01/29/1999  added configure to zip file
REM 006 MGS 04/07/2000  Adjusted dir names
REM 007 NAL 05/30/2000  Added textfiles for speak demos

copy docs\DTK_RG_5_0.pdf docsosf\pdf\dtk_reference_guide_500.pdf
copy docs\DTK_RG_4_6_2.pdf docsosf\pdf\dtk_reference_guide_462.pdf
copy docs\DTK_IG_5_0.pdf docsosf\pdf\dtk_install_guide_500.pdf
copy docs\DTK_IG_4_6_2.pdf docsosf\pdf\dtk_install_guide_462.pdf
copy docs\DTK_PG_5_0.pdf docsosf\pdf\dtk_prog_guide_500.pdf
copy docs\DTK_PG_4_6_2.pdf docsosf\pdf\dtk_prog_guide_462.pdf

mkdir samplosf\src\speak\text
copy samples\speak\text\demo.en samplosf\src\speak\text\demo.en
copy samples\speak\text\demo.sp samplosf\src\speak\text\demo.sp
copy samples\speak\text\demo.gr samplosf\src\speak\text\demo.gr
copy samples\speak\text\demo.uk samplosf\src\speak\text\demo.uk
copy samples\speak\text\demo.la samplosf\src\speak\text\demo.la
copy samples\speak\text\demo.fr samplosf\src\speak\text\demo.fr
copy samples\speak\text\command.txt samplosf\src\speak\text
copy samples\speak\text\email.txt samplosf\src\speak\text
copy samples\speak\text\order.txt samplosf\src\speak\text


zip -r dapi.zip dapi\src

zip -r other.zip samplosf kitosf udicunix\src licunix\src dtalkml\src Makefile.in Makefile.sub.in docsosf dectalkf.h install-sh configure.in config.sub config.guess configure

