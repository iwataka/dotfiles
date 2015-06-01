@echo off

set DOTFILES=%~dp0

if exist %USERPROFILE%\.vimrc del %USERPROFILE%\.vimrc
mklink /H %USERPROFILE%\.vimrc %DOTFILES%vimrc

if exist %USERPROFILE%\.vim rmdir %USERPROFILE%\.vim
mklink /J /D %USERPROFILE%\.vim %DOTFILES%vim

if exist %USERPROFILE%\.gitconfig del %USERPROFILE%\.gitconfig
mklink /H %USERPROFILE%\.gitconfig %DOTFILES%gitconfig
