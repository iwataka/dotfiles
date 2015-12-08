@echo off

cd "%~dp0"
mkdir tmp_msvcr90

for /f "delims=" %%a in ('where msvcr90.dll') do (
    mkdir "tmp_msvcr90%%~pa"
    move "%%a" "tmp_msvcr90%%~pa"
)