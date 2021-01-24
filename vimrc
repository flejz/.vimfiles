" setup
set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

" whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching

" syntax goods
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set autoindent                  " activates the auto indent
set cindent                     " also idents c files when available

" off automatic backup
set nobackup
set nowritebackup
set noswapfile
set history=1000                "store lots of :cmdline history
set showmode                    "show current mode down the bottom
set number                      "add line numbers
set showbreak=                  "set wrap linebreak nolist

"folding settings
set foldmethod=indent           "fold based on indent
set foldnestmax=10              "deepest fold is 10 levels
set nofoldenable                "dont fold by default
set foldlevel=1                 "this is just what i use

" vim diff
set scrollbind                  "bind the scroll of both files

" key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT
nmap ( ()<left>

"tell the term has 256 colors
set t_Co=256
set term=xterm-256color
set termencoding=utf-8

" color scheme
syntax on
set background=dark
colorscheme flejz
set guitablabel=%M%t

" plugins

set omnifunc=syntaxcomplete#Complete

" ctrl p
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

" go-vim
let g:go_fmt_command = "goimports"
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_list_type = "quickfix"

" ale
let b:ale_fixers = {'javascript': ['eslint']}
let g:ale_set_highlights = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_completion_enabled = 1

nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)

" airline
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
