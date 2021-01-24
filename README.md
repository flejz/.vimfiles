vim setup
========

## Install
 ``` bash
curl https://raw.githubusercontent.com/flejz/.vim/master/setup.sh | bash
```

 ``` bash
git clone https://github.com/flejz/.vim.git ~/.vim
echo "source ~/.vim/vimrc" > ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```
## Optional steps ahead:
```
git clone  https://github.com/powerline/fonts
sh ./fonts/install.sh
rm -rf fonts
```
After that, you might set the terminal font to a powerline font too see the special chars.

# Definitive cheatsheet
https://vim.rtorr.com/
