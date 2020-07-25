#!/bin/bash

git clone https://github.com/flejz/.vim.git ~/.vim >/dev/null
echo "source ~/.vim/vimrc" > ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle >/dev/null
vim +BundleInstall +qall

git clone  https://github.com/powerline/fonts .~/.temp-fonts >/dev/null
sh ~/.temp-fonts/install.sh
rm -rf ~/.temp-fonts
