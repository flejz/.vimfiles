" SETUP
set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

" load pathogen managed plugins
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" find - enagling native finding
set path+=**
set wildmenu

" whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" off automatic backup
set nobackup
set nowritebackup
set noswapfile
set history=1000                "store lots of :cmdline history
set showmode                    "show current mode down the bottom
set number                      "add line numbers
set showbreak=                  "set wrap linebreak nolist

" add some line space for easy reading
set linespace=4

" disable visual bell
set visualbell t_vb=

"statusline setup
"set statusline=%f       "tail of the filename
"set statusline+=%=      "left/right separator
"set statusline+=%c,     "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set laststatus=2

"turn off needless toolbar on gvim/mvim
set guioptions-=T

" use comma as <Leader> key instead of backslash
let mapleader=","

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"tell the term has 256 colors
set t_Co=256
set guifont=Meslo\ LG\ L\ Regular\ for\ Powerline:h18
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=Meslo\ LG\ L\ Regular\ for\ Powerline:h18
  endif
endif

autocmd BufNewFile,BufRead *.styl set filetype=styl
autocmd BufNewFile,BufRead *.json set filetype=json

" color scheme
syntax on
set background=dark
colorscheme flejz
set guitablabel=%M%t

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'rking/ag.vim'
Plugin 'Shougo/neocomplcache'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround.git'
Plugin 'elzr/vim-json'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'w0rp/ale'
Plugin 'jason0x43/vim-js-indent'
Plugin 'isRuslan/vim-es6'
Plugin 'jshint/jshint'
Plugin 'leafOfTree/vim-vue-plugin'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'fatih/vim-go'


" PLUGINS

" js indent
let js_indent_flat_switch=1
let js_indent_logging=1

" ctrl p
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

" ale
let b:ale_fixers = {'javascript': ['eslint']}
let g:ale_set_highlights = 0
nmap <silent> <C-k> <Plug>(ale_next_wrap)
nmap <silent> <C-j> <Plug>(ale_previous_wrap)

" ag
cnoreabbrev ag Ag
nmap <C-f> :ag<Space>

" syntastic
let g:syntastic_enable_signs=1 " mark syntax errors with :signs

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"



" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT
nmap ( ()<left>

" key mapping for clean search
nmap <silent> <leader>/ :nohlsearch<CR>

" snipmate setup
autocmd vimenter * call s:SetupSnippets()

if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC
endif

function! s:SetupSnippets()
  try
    call ExtractSnips("~/.vim/bundle/snipmate/snippets/html", "eruby")
    call ExtractSnips("~/.vim/bundle/snipmate/snippets/html", "xhtml")
    call ExtractSnips("~/.vim/bundle/snipmate/snippets/html", "handlebars")
  catch
  endtry
endfunction

autocmd FileType python set sts=4 sw=4

set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:airline_powerline_fonts = 1
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
