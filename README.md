Vimfiles
========

 ## Install

 ``` bash
 $ git clone https://github.com/jaimelopesflores/vimfiles.git ~/.vim
 $ echo "source ~/.vim/vimrc" > ~/.vimrc
 $ cd ~/.vim
 $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
 $ alias vundle='vim +BundleInstall +qall'
 $ vundle
 $ git clone  https://github.com/powerline/fonts
 $ sh ./fonts/install.sh
 $ rm -rf fonts
```

After that, you must set the terminal font to a powerline font.
(I recommend Cousine for powerline)
