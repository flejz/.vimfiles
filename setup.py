#!/bin/bash

git clone https://github.com/flejz/.vim.git ~/.vim
echo "source ~/.vim/vimrc" > ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
