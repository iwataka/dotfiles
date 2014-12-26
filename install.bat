@echo off

set THIS_DIRECTORY=%~dp0

if exist %USERPROFILE%\.vimrc del %USERPROFILE%\.vimrc
mklink %USERPROFILE%\.vimrc %THIS_DIRECTORY%vimrc
if exist %USERPROFILE%\.vimrc.bundles del %USERPROFILE%\.vimrc.bundles
mklink %USERPROFILE%\.vimrc.bundles %THIS_DIRECTORY%vimrc.bundles
if exist %USERPROFILE%\.vim del %USERPROFILE%\.vim
mklink %USERPROFILE%\.vim %THIS_DIRECTORY%vim
