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
goto end

:mklinkDir
if exist %USERPROFILE%\.%~1 rmdir %USERPROFILE%\.%~1
mklink /D %USERPROFILE%\.%~1 %DOTFILES%%~1
goto:eof

:mklinkFile
if exist %USERPROFILE%\.%~1 del %USERPROFILE%\.%~1
mklink %USERPROFILE%\.%~1 %DOTFILES%%~1
goto:eof

:end
