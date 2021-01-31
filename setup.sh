#!/bin/bash

clone() {
  REPO="$1"
  [[ $REPO =~ \/(.*)$ ]]
  SHORT=${BASH_REMATCH[1]}
  echo "clonning $REPO"
  git clone --depth=1 --quiet https://github.com/$REPO.git ~/.vim/pack/plugins/start/$SHORT 2>/dev/null
}

PLUGIN_LIST=(
  "kien/ctrlp.vim"
  "vim-airline/vim-airline"
  "dense-analysis/ale"
)

LANG_LIST=(
  "fatih/vim-go"
  "cakebaker/scss-syntax.vim"
  "chr4/nginx.vim"
  "chrisbra/csv.vim"
  "ekalinin/dockerfile.vim"
  "othree/html5.vim"
  "pangloss/vim-javascript"
  "stephpy/vim-yaml"
  "vim-python/python-syntax"
)

for i in ${PLUGIN_LIST[*]}; do
  clone $i
done

for i in ${LANG_LIST[*]}; do
  clone $i
done

echo "source ~/.vim/vimrc" > ~/.vimrc
