@echo off

set dir=%~dp0

call:mklinkDir atom
call:mklinkDir aws
call:mklinkDir elvish
call:mklinkDir emacs.d
call:mklinkDir gnupg
call:mklinkDir peco
call:mklinkDir sbt
call:mklinkDir sh
call:mklinkDir vim

call:mklinkFile agignore
call:mklinkFile bashrc
call:mklinkFile ctags
call:mklinkFile curlrc
call:mklinkFile ghci
call:mklinkFile gitconfig
call:mklinkFile hyper.js
call:mklinkFile ideavimrc
call:mklinkFile sbtrc
call:mklinkFile shrc
call:mklinkFile spacemacs
call:mklinkFile tigrc
call:mklinkFile tmux.conf
call:mklinkFile vimperatorrc
call:mklinkFile vimrc
call:mklinkFile wgetrc

if exist "%APPDATA%\alacritty\" rmdir "%APPDATA%\alacritty\"
mklink /D "%APPDATA%\alacritty\" %dir%\alacritty

if not exist "%APPDATA%\Sublime Text 3\Packages" mkdir "%APPDATA%\Sublime Text 3\Packages"
if exist "%APPDATA%\Sublime Text 3\Packages\User" rmdir "%APPDATA%\Sublime Text 3\Packages\User"
mklink /D "%APPDATA%\Sublime Text 3\Packages\User" %dir%\sublime

if exist "%LOCALAPPDATA%\nvim" rmdir "%LOCALAPPDATA%\nvim"
mklink /D "%LOCALAPPDATA%\nvim" "%dir%\vim"

if not exist "%USERPROFILE%\bin" mkdir "%USERPROFILE%\bin"
for %%f in ("%dir%\bin\*") do (
        if exist "%USERPROFILE%\bin\%%~nxf" del "%USERPROFILE%\bin\%%~nxf"
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
