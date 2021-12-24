@echo off

set dir=%~dp0

call:mklinkFile vimrc
call:mklinkFile ideavimrc
call:mklinkFile gitconfig
call:mklinkFile agignore
call:mklinkFile sbtrc
call:mklinkFile vimperatorrc
call:mklinkFile ctags
call:mklinkFile bashrc
call:mklinkFile shrc
call:mklinkFile curlrc
call:mklinkFile tmux.conf
call:mklinkFile wgetrc
call:mklinkFile tigrc
call:mklinkFile hyper.js
call:mklinkFile ghci
call:mklinkFile spacemacs
call:mklinkDir sbt
call:mklinkDir vim
call:mklinkDir atom
call:mklinkDir sh
call:mklinkDir gnupg
call:mklinkDir emacs.d
call:mklinkDir peco
call:mklinkDir elvish
call:mklinkDir aws

if exist "%APPDATA%\Sublime Text 3\" mklink /D "%APPDATA%\Sublime Text 3\Packages\User" %dir%\sublime
if exist "%APPDATA%\alacritty\" mklink /D "%APPDATA%\alacritty\" %dir%\alacritty

if exist "%LOCALAPPDATA%\nvim" rmdir "%LOCALAPPDATA%\nvim"
mklink /D "%LOCALAPPDATA%\nvim" "%dir%\vim"

mkdir "%USERPROFILE%\bin"
for %%f in ("%dir%\bin\*") do (
        mklink "%USERPROFILE%\bin\%%~nxf" "%dir%\bin\%%~nxf"
)

goto end

:mklinkDir
(
        if exist "%USERPROFILE%\.%~1" rmdir "%USERPROFILE%\.%~1" >nul 2>&1
        mklink /D "%USERPROFILE%\.%~1" "%dir%%~1" >nul 2>&1
) || (
        echo FAILED to make a link for %USERPROFILE%\.%~1.
)
goto:eof

:mklinkFile
(
        if exist "%USERPROFILE%\.%~1" del "%USERPROFILE%\.%~1" >nul 2>&1
        mklink "%USERPROFILE%\.%~1" "%dir%%~1" >nul 2>&1
) || (
        echo FAILED to make a link for %USERPROFILE%\.%~1.
)
goto:eof

:end
