echo off
rem ********************************************************************
rem DECTALK.BAT
rem Created on:         21-FEB-1997
rem Created by:         Carl Leeber
rem
rem Purpose:            Build all of DECtalk from a common root.
rem
rem Dependencies:       Uses prodmak.bat, kitcopy.bat, democopy.bat and
rem                     hardmak.bat
rem
rem assumes we start at root of \work\rnd or \work\sandbox or \work\product.
rem
rem ********************************************************************
rem MODIFICATION HISTORY
rem
rem 27jan98 cjl  Build ALL versons of the demo package.
rem              Add 16 bit versus 32bit build section flags.
rem 02feb98 cjl  Change version to V4.50.03.
rem 13mar98 cjl  Change version to V4.50.04.
rem 13mar98 cjl  Change version to V4.50.05.
rem 22may98 cjl  Change version to V4.51.06.
rem 20aug98 cjl  Change version to V4.51.07.
rem 27oct98 gl   Add ENGSPAN, SPANENG dual language DTEX build
rem 29oct98 cjl Change version to V4.60.00 B001.
rem 27jan99 cjl Change version to V4.60.01 B002.
rem 18feb99 cjl Change version to V4.60.02 B002.
rem 18mar99 cjl Add NWSNOAA LatinAmerican Spanish to build.
rem 31mar99 cjl Change version to V4.60.03 R003.
rem 31mar99 cjl Change version to V4.60.04 R003.
rem 15jun99 cjl Change version to V4.60.05 R004.
rem 02jul99 cjl Change version to V4.60.06 R005.
rem 22oct99 mgs Change version to V4.60.10 R006.
rem 18feb00 mfg Change version to V4.60.11 B009.
rem 13mar00 mfg Change version to V4.60.13 B009.
rem 14apr00 mfg Change version to V4.60.14 B010
rem
rem ********************************************************************
rem create 2 flags for 16bit and 32bit builds/kitting.
rem
set all16bit=1
set all32bit=1
goto end
rem ********************************************************************
if NOT %all32bit%==1 goto demostbit
call prodmak
call prodmak ENGLISH_UK
call prodmak SPANISH
call prodmak GERMAN
call prodmak SPANISH_LA

call cebuild

rem ********************************************************************

cd kitting
call kitcopy V4.60.14 mfg
call kitcopy V4.60.14 mfg ENGLISH_UK
call kitcopy V4.60.14 mfg SPANISH
call kitcopy V4.60.14 mfg GERMAN
call kitcopy V4.60.14 mfg SPANISH_LA
call kitcopy V4.60.14 mfg ML

rem ********************************************************************
call democopy
call democopy ENGLISH_UK
call democopy SPANISH
call democopy GERMAN
call democopy SPANISH_LA
cd ..
echo **** DECTALK SoftWare BUILD IS DONE!!!! ****

rem ********************************************************************
:demostbit
if NOT %all16bit%==1 goto end
cd hardware\src
call hardmak
call hardmak DTPC2 ENGLISH_UK
call hardmak DTPC2 SPANISH_LA
call hardmak DTPC2 SPANISH
call hardmak DTPC2 GERMAN
call hardmak DTPC2 ENGLISH_US VOCAL Y N NWSNOAA
call hardmak DTPC2 SPANISH_LA VOCAL Y N NWSNOAA

rem ********************************************************************
call hardmak DTPC1
call hardmak DTPC1 ENGLISH_UK
call hardmak DTPC1 SPANISH_LA
call hardmak DTPC1 SPANISH
call hardmak DTPC1 GERMAN

rem ********************************************************************
call hardmak DTEX
call hardmak DTEX ENGLISH_UK
call hardmak DTEX SPANISH_LA
call hardmak DTEX SPANISH
call hardmak DTEX GERMAN
call hardmak DTEX ENGSPAN
call hardmak DTEX SPANENG

cd ..\..
echo **** DECTALK HardWare BUILD IS DONE!!!! ****

rem ********************************************************************
:end
echo **** DECTALK SoftWare And HardWare BUILD IS DONE!!!! ****
rem ********************************************************************
