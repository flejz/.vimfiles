Vimfiles
========

## Install

 ``` bash
 $ git clone https://github.com/flejz/vimfiles.git ~/.vim
 $ echo "source ~/.vim/vimrc" > ~/.vimrc
 $ cd ~/.vim
 $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
 $ alias vundle='vim +BundleInstall +qall'
 $ vundle
```

## Optional steps ahead:
```
 $ git clone  https://github.com/powerline/fonts
 $ sh ./fonts/install.sh
 $ rm -rf fonts
```

After that, you might set the terminal font to a powerline font.
I'm particularly old-fashioned, so I use the old but good *Courier New*.
