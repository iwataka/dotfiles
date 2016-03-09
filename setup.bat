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
call:mklinkFile bashrc
call:mklinkFile shrc
call:mklinkFile curlrc
call:mklinkFile tmux.conf
call:mklinkFile wgetrc
call:mklinkFile tigrc
call:mklinkDir sbt
call:mklinkDir vim
call:mklinkDir atom
call:mklinkDir sh
call:mklinkDir gnupg
call:mklinkDir emacs.d
call:mklinkDir git_template
call:mklinkSublime
call:mklinkNvim
call:mklinkSpacemacs
goto end

:mklinkDir
if exist %USERPROFILE%\.%~1 rmdir %USERPROFILE%\.%~1
mklink /D %USERPROFILE%\.%~1 %DOTFILES%%~1
goto:eof

:mklinkFile
if exist %USERPROFILE%\.%~1 del %USERPROFILE%\.%~1
mklink %USERPROFILE%\.%~1 %DOTFILES%%~1
goto:eof

:mklinkSublime
if exist "%APPDATA%\Sublime Text 3\" mklink /D "%APPDATA%\Sublime Text 3\Packages\User" %DOTFILES%sublime
goto:eof

:mklinkNvim
if exist "%LOCALAPPDATA%\nvim" rmdir "%LOCALAPPDATA%\nvim"
mklink /D "%LOCALAPPDATA%\nvim" "%DOTFILES%\vim"
goto:eof

:mklinkSpacemacs
mklink "%USERPROFILE%\.spacemacs" "%DOTFILES%\spacemacs"
goto:eof

:end
