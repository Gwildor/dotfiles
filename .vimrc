"" Plug plugins
" [PlugInstall] [PlugClean]
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }

Plug 'ntpeters/vim-better-whitespace'

Plug 'hdima/python-syntax'
Plug 'sickill/vim-monokai'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'

call plug#end()

set t_Co=256
syntax enable
set background=dark
colorscheme monokai

let mapleader=','
nmap ; :

set ruler
set number
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set cursorline
set wildmenu
set showmatch
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase
set autoindent
set smartindent
set hidden
set laststatus=2
set backspace=2
set colorcolumn=80

" Save with ,s
nnoremap <leader>s :update<CR>

nnoremap \[ :bprev<CR>
nnoremap \] :bnext<CR>
" Close buffer with ,c
nnoremap <leader>c :bp <BAR> bd #<CR>

nnoremap <leader>n :NERDTreeToggle<CR>

autocmd BufNewFile,BufRead *.json set ft=javascript   " JS highlighting is good enough for now for JSON

if $TERM_PROGRAM =~ "iTerm"
    " 0 for block, 1 for pipe, 2 for underline
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=2\x7"
    autocmd VimEnter * silent !echo -ne "\033]50;CursorShape=2\a"
    autocmd VimLeave * silent !echo -ne "\033]50;CursorShape=1\a"
else
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif

" Move lines around
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" Reselect visual block after indent/outdent.
vnoremap < <gv
vnoremap > >gv

" Relative line numbers
set rnu
nnoremap <silent><leader>l :set rnu! rnu? <cr>
autocmd InsertEnter,FocusLost,WinLeave,CmdwinLeave * silent! :set norelativenumber
autocmd InsertLeave,FocusGained,WinEnter,CmdwinEnter * silent! :set relativenumber

" Fix escaping insert mode having a delay
autocmd InsertEnter * set timeoutlen=0
autocmd InsertLeave * set timeoutlen=1000

let g:airline_theme='raven'
let g:airline#extensions#tabline#enabled = 1

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let python_highlight_all = 1
