@echo off

set THIS_DIRECTORY=%~dp0

if exist %USERPROFILE%\_vimrc del %USERPROFILE%\_vimrc
mklink %USERPROFILE%\_vimrc %THIS_DIRECTORY%vimrc
