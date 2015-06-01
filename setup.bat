@echo off

set DOTFILES=%~dp0

if exist %USERPROFILE%\.vimrc del %USERPROFILE%\.vimrc
mklink /H %USERPROFILE%\.vimrc %DOTFILES%vimrc

if exist %USERPROFILE%\.vim rmdir %USERPROFILE%\.vim
mklink /J /D %USERPROFILE%\.vim %DOTFILES%vim

if exist %USERPROFILE%\.gitconfig del %USERPROFILE%\.gitconfig
mklink /H %USERPROFILE%\.gitconfig %DOTFILES%gitconfig

if exist %USERPROFILE%\.agignore del %USERPROFILE%\.agignore
mklink /H %USERPROFILE%\.agignore %DOTFILES%agignore

if exist %USERPROFILE%\.sbtrc del %USERPROFILE%\.sbtrc
mklink /H %USERPROFILE%\.sbtrc %DOTFILES%sbtrc

if exist %USERPROFILE%\.vimperatorrc del %USERPROFILE%\.vimperatorrc
mklink /H %USERPROFILE%\.vimperatorrc %DOTFILES%vimperatorrc

if exist %USERPROFILE%\.ctags del %USERPROFILE%\.ctags
mklink /H %USERPROFILE%\.ctags %DOTFILES%ctags
