"" Plug plugins
" [PlugInstall] [PlugClean]
let g:plug_window = 'enew'
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'wellle/targets.vim'
Plug 'justinmk/vim-sneak'

" Language specific
Plug 'vim-python/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'rust-lang/rust.vim'
Plug 'elzr/vim-json'
Plug 'mitsuhiko/vim-jinja'
Plug 'mustache/vim-mustache-handlebars'
Plug 'chrisbra/csv.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'shmup/vim-sql-syntax'

call plug#end()

filetype plugin indent on
syntax enable
colorscheme Tomorrow-Night-Bright
" For some reason, inactive line number is barely noticable for Tomorrow-Night-Bright
highlight LineNr ctermfg=102
highlight link jsonNumber javaScriptNumber
highlight link jsonBoolean javaScriptFunction
highlight link pythonOperator pythonExClass

let mapleader=','

set number
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set cursorline
set wildmenu
set wildignore+=*.pyc
set showmatch
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase
set autoindent
set cindent
set hidden
set laststatus=2
set backspace=2
set colorcolumn=80
set nostartofline       " Don't go to start of line when moving around, like switching buffers
set nobackup
set noswapfile
set scrolloff=3
set sessionoptions=buffers,curdir,help
set mouse=
set pastetoggle=<F2>
set display+=lastline
set visualbell
set t_vb=
set lazyredraw
set list
set listchars=tab:│·,trail:·,extends:»,precedes:«,nbsp:·
let &showbreak='> '
set nojoinspaces

" Save with ,s
nnoremap <leader>s :update<CR>
" Save as sudo
nnoremap <leader>S :w !sudo tee % > /dev/null<CR>

nnoremap \[ :bprev<CR>
nnoremap \] :bnext<CR>
" Close buffer with ,c
nnoremap <expr> <leader>c len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 ? ':bd<CR>' : ':bp<CR>:bd #<CR>'

" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nnoremap Y y$

nnoremap <leader>n :NERDTreeToggle<CR>

nnoremap <silent><esc> :noh<CR>
nnoremap <esc>^[ <esc>^[

" n is always forwards, N always backwards. Search results are always center
" of screen.
noremap <expr> n (v:searchforward ? 'nzz' : 'Nzz')
noremap <expr> N (v:searchforward ? 'Nzz' : 'nzz')
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

if $TERM_PROGRAM =~ "iTerm"
    " 0 for block, 1 for pipe, 2 for underline
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=2\x7"

    " The VimEnter line causes the random stuff on the command line on enter
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
autocmd InsertLeave,FocusGained,WinEnter,BufEnter,CmdwinEnter * if &ft != 'nerdtree' && getfsize(expand("<afile>")) < 100 * 1024 * 1024 | silent! :set relativenumber | endif

" Fix escaping insert mode having a delay
" Also disables listchars in insert mode
autocmd InsertEnter * set timeoutlen=0 nolist
autocmd InsertLeave * set timeoutlen=1000 list

" Disable syntax for large files
autocmd BufWinEnter * if line2byte(line('$') + 1) > 100 * 1024 * 1024 | syntax clear | setlocal nornu nonumber | let b:airline_whitespace_disabled = 1 | endif

let g:airline_theme='raven'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

for i in range(1, 9)
    execute "nmap \<leader\>".i." \<Plug\>AirlineSelectTab".i.""
endfor

nnoremap <C-p> :FZF -m<cr>

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let $FZF_DEFAULT_COMMAND = 'ag -l --hidden -U -g "" --ignore ".git"'
endif

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_python_binary_path = 'python'

let python_highlight_all = 1

let NERDTreeIgnore=['^__pycache__$[[dir]]', '\.pyc$']

let g:sneak#label = 1

" Disable rechecking filetype for jinja on html write. This prevents changing
" htmldjango to htmljinja for Django templates.
let g:htmljinja_disable_html_upgrade = 1
autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}
