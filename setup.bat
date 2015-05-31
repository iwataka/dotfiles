@echo off

set DOTFILES=%~dp0

if exist %USERPROFILE%\.vimrc del %USERPROFILE%\.vimrc
mklink %USERPROFILE%\.vimrc %DOTFILES%vimrc

if exist %USERPROFILE%\.vim del %USERPROFILE%\.vim
mklink %USERPROFILE%\.vim %DOTFILES%vim

if exist %USERPROFILE%\.atom del %USERPROFILE%\.atom
mklink %USERPROFILE%\.atom %DOTFILES%atom

@pause
