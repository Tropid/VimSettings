if has('gui_running')
    set guifont=Fira_Code:h10
    set guioptions-=T
    set guioptions-=m
    set lines=45 columns=110
    set printfont=Courier:h16
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'NLKNguyen/papercolor-theme'
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'itchyny/lightline.vim'
Plug 'jceb/vim-orgmode'
Plug 'vim-scripts/utl.vim'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
call plug#end()

set encoding=utf-8
setglobal fileencoding=utf-8

set tabstop=4
set shiftwidth=4
set expandtab
set number
syntax on
set nocp
filetype plugin indent on
set wildmode=longest,list
set backspace=indent,eol,start
set laststatus=2
set hidden
set diffopt=filler,vertical
set sessionoptions=blank,buffers,curdir,folds,help,options,winsize,resize

" Disable bell sound
set vb t_vb=

let mapleader = ","
let maplocalleader = " "

let g:UltiSnipsSnippetsDir = "~/vimfiles/UltiSnips/"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" Add space after comment symbol
let g:NERDSpaceDelims = 1
let g:lightline = { 'colorscheme': 'PaperColor' }
let g:racer_experimental_completer = 1

noremap <M-h> :bprevious<CR>
noremap <M-l> :bnext<CR>

inoremap jk <ESC>
inoremap kj <ESC>

nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> <C-w>q

nnoremap <leader>ff :cd %:h<CR>

nnoremap <leader>t :TagbarOpenAutoClose<CR>
nnoremap <leader>e :NERDTreeToggle<CR>

set background=dark
colorscheme PaperColor

" Disable blinking
au GUIEnter * set vb t_vb=

" XML Commands
au filetype xml,javascript,html set shiftwidth=2
au filetype xml,javascript,html set tabstop=2
