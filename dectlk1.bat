echo off
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

cd hardware\src

call hardmak
del dtpc2\us\release\ls_suff.dep
call hardmak
call hardmak DTPC2 ENGLISH_UK
del dtpc2\us\release\ls_suff.dep
call hardmak DTPC2 ENGLISH_UK
call hardmak DTPC2 SPANISH_LA
del dtpc2\la\release\ls_suff.dep
call hardmak DTPC2 SPANISH_LA
call hardmak DTPC2 SPANISH
del dtpc2\sp\release\ls_suff.dep
call hardmak DTPC2 SPANISH
call hardmak DTPC2 GERMAN
del dtpc2\gr\release\ls_suff.dep
call hardmak DTPC2 GERMAN
call hardmak DTPC2 ENGLISH_US VOCAL Y N NWSNOAA
del dtpc2\nws_us\release\ls_suff.dep
call hardmak DTPC2 ENGLISH_US VOCAL Y N NWSNOAA

call hardmak DTPC1
del dtpc1\us\release\ls_suff.dep
call hardmak DTPC1
call hardmak DTPC1 ENGLISH_UK
del dtpc1\us\release\ls_suff.dep
call hardmak DTPC1 ENGLISH_UK
call hardmak DTPC1 SPANISH_LA
del dtpc1\la\release\ls_suff.dep
call hardmak DTPC1 SPANISH_LA
call hardmak DTPC1 SPANISH
del dtpc1\sp\release\ls_suff.dep
call hardmak DTPC1 SPANISH
call hardmak DTPC1 GERMAN
del dtpc1\gr\release\ls_suff.dep
call hardmak DTPC1 GERMAN

call hardmak DTEX
del dtpex\us\release\ls_suff.dep
call hardmak DTEX
call hardmak DTEX ENGLISH_UK
del dtpex\us\release\ls_suff.dep
call hardmak DTEX ENGLISH_UK
call hardmak DTEX SPANISH_LA
del dtex\la\release\ls_suff.dep
call hardmak DTEX SPANISH_LA
call hardmak DTEX SPANISH
del dtex\sp\release\ls_suff.dep
call hardmak DTEX SPANISH
call hardmak DTEX GERMAN
del dtex\gr\release\ls_suff.dep
call hardmak DTEX GERMAN

:end
cd ..\..\

echo **** DECTALK SoftWare And HardWare BUILD IS DONE!!!! ****
