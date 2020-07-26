#!/bin/bash

git clone --quiet https://github.com/flejz/.vim.git ~/.vim >/dev/null
echo "source ~/.vim/vimrc" > ~/.vimrc
git clone --quiet https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle >/dev/null
vim +BundleInstall +qall

git clone --quiet https://github.com/powerline/fonts .~/.temp-fonts >/dev/null
sh ~/.temp-fonts/install.sh
rm -rf ~/.temp-fonts
