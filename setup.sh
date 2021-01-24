#!/bin/bash

git clone --depth=1 --quiet https://github.com/flejz/.vim.git ~/.vim >/dev/null
git clone --depth=1 --quiet https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
git clone --depth=1 --quiet https://github.com/kien/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp.vim
git clone --depth=1 --quiet https://github.com/vim-airline/vim-airline.git ~/.vim/pack/plugins/start/vim-airline
git clone --depth=1 --quiet https://github.com/dense-analysis/ale.git ~/.vim/pack/plugins/start/ale

echo "source ~/.vim/vimrc" > ~/.vimrc
