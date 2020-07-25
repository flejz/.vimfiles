#!/bin/bash

git clone https://github.com/flejz/.vim.git ~/.vim >/dev/null
echo "source ~/.vim/vimrc" > ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle >/dev/null
vim +BundleInstall +qall
