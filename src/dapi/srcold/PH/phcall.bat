@echo off

set lang=us

:top

phc %lang%_mal.phd %lang%_fem.phd p_%lang%_rom.c %lang%


if "%lang%"=="gr" set lang=done
if "%lang%"=="la" set lang=gr
if "%lang%"=="sp" set lang=la
if "%lang%"=="uk" set lang=sp
if "%lang%"=="us" set lang=uk
if "%lang%"=="done" goto end

goto top

:end
