@echo off

set DOTFILES=%~dp0

call:mklinkFile vimrc
call:mklinkFile ideavimrc
call:mklinkFile gitconfig
call:mklinkFile agignore
call:mklinkFile sbtrc
call:mklinkFile vimperatorrc
call:mklinkFile ctags
call:mklinkFile editorconfig
call:mklinkDir sbt
call:mklinkDir vim
call:mklinkDir atom

:mklinkDir
if exist %USERPROFILE%\.%~1 rmdir %USERPROFILE%\.%~1
mklink /J %USERPROFILE%\.%~1 %DOTFILES%%~1
goto:eof

:mklinkFile
if exist %USERPROFILE%\.%~1 del %USERPROFILE%\.%~1
mklink /H %USERPROFILE%\.%~1 %DOTFILES%%~1
goto:eof
