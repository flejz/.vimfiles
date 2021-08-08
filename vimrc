" this config is targeted for vim 8.1+ and expects you to have plug installed.

" enable syntax highlighting.
filetype plugin indent on
syntax on

" spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" basic settings

let mapleader=" "
let maplocalleader=" "

set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamedplus
set cmdheight=2
set complete+=kspell
set completeopt=menuone,longest
set encoding=utf-8
set expandtab smarttab
set foldmethod=indent
set foldnestmax=10
set foldlevel=1
set formatoptions=tcqrn1
set guitablabel=%M%t
set hidden
set history=1000
set hlsearch
set incsearch
set ignorecase
set incsearch
set laststatus=2
set linespace=4
set mmp=5000
set modelines=2
set nobackup
set nocompatible
set noerrorbells visualbell t_vb=
set noshiftround
set nospell
set nostartofline
set number
set nowrap
set nowritebackup
set smartcase
set shiftwidth=2
set showcmd
set showmatch
set shortmess+=c
set showmode
set signcolumn=yes
set smartcase
set softtabstop=2
set spelllang=en_us
set splitbelow
set splitright
set t_Co=256
set tabstop=2
set termencoding=utf-8
set textwidth=0
set termencoding=utf-8
set ttimeout
set timeoutlen=1000
set ttimeoutlen=0
set updatetime=300
set virtualedit=block
set whichwrap=b,s,<,>
set wildmenu
set wildmode=full

if !has('nvim')
  set term=xterm-256color
endif

" set the color scheme.
colorscheme flejz
set background=dark

" basic mappings

" key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

" clear search highlights.
map #<Esc> :let @/=''<CR>

" prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" edit and source vim config file in a new tab.
map <Leader>ev :tabnew $HOME/.vim/vimrc<CR>
map <Leader>sv :source $MYVIMRC<CR>

" toggle spell check.
map <F5> :setlocal spell!<CR>

" toggle visually showing all whitespace characters.
noremap <F7> :set list!<CR>

" basic autocommands

" auto-resize splits when vim gets resized.
autocmd VimResized * wincmd =

" update a buffer's contents on focus if it changed outside of vim.
au FocusGained,BufEnter * :checktime

" unset paste on insertleave.
autocmd InsertLeave * silent! set nopaste

" make sure all types of requirements.txt files get syntax highlighting.
autocmd BufNewFile,BufRead requirements*.txt set syntax=python

" ensure tabs don't get converted to spaces in makefiles.
autocmd FileType make setlocal noexpandtab
autocmd FileType json syntax match Comment +\/\/.\+$+

" plugins

" ctrl p
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_list_type = "quickfix"

" airline
let g:airline_powerline_fonts = 1

" basic commands

" add all todo items to the quickfix list relative to where you opened vim.
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niIw -e TODO -e FIXME 2> /dev/null',
            \ 'grep -rniIw -e TODO -e FIXME . 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction

" coc
inoremap <silent><expr> <C-x><C-o> coc#refresh()

nmap <silent> <C-f> <Plug>(coc-codeaction)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> K :call <SID>show_documentation()<CR>

let g:coc_filetype_map = {
      \ 'js': 'javascript',
      \ 'ts': 'typescript'
      \ }

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

