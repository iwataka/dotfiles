@echo off

set THIS_DIRECTORY=%~dp0

if exist %USERPROFILE%\.vimrc del %USERPROFILE%\.vimrc
mklink %USERPROFILE%\.vimrc %THIS_DIRECTORY%vimrc
