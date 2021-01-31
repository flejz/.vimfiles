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
  "sheerun/vim-polyglot"
)

for i in ${PLUGIN_LIST[*]}; do
  clone $i
done

for i in ${LANG_LIST[*]}; do
  clone $i
done

echo "source ~/.vim/vimrc" > ~/.vimrc
