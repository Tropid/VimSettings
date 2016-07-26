if has('gui_running')
    set guifont=Source\ Code\ Pro:h10"
    set guioptions-=T
    set guioptions-=m
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jonathanfilip/vim-lucius'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'fatih/vim-go'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-scala'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'pangloss/vim-javascript'
call plug#end()

set encoding=utf-8
setglobal fileencoding=utf-8

set tabstop=4
set shiftwidth=4
set expandtab
set number
syntax on
set lines=45 columns=110
set nocp
filetype plugin indent on
set wildmode=longest,list
set backspace=indent,eol,start
set laststatus=2
set hidden
set diffopt=filler,vertical

" Disable bell sound
set vb t_vb=

let mapleader = ","

let g:UltiSnipsSnippetsDir = "~/vimfiles/UltiSnips/"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" Add space after comment symbol
let g:NERDSpaceDelims = 1
let g:ctrlp_max_files = 1000
" Disable all plugins for airline
let g:airline_extensions = ['tabline']
" Remove arrow from airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#left_set = '|'
let g:airline#extensions#tabline#left_alt_sep = '|'

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
nnoremap <leader>r :GundoToggle<CR>
nnoremap <leader>q :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>f :CtrlP<CR>

set background=dark
colorscheme lucius

" Disable blinking
au GUIEnter * set vb t_vb=

" AsciiDoc
au BufRead,BufNewFile *.adoc setfiletype asciidoc
au filetype asciidoc set tw=80

" Handlebars
au BufRead,BufNewFile *.hbs setfiletype html

" XML Commands
au filetype xml,javascript,html set shiftwidth=2
au filetype xml,javascript,html set tabstop=2

" Go Commands
au filetype go noremap <buffer> <M-i> :GoImport
au filetype go noremap <buffer> <M-b> :GoBuild<CR>
au filetype go noremap <buffer> <M-g> :GoRun<CR>
au filetype go noremap <buffer> <M-r> :GoRename<CR>
au filetype go noremap <buffer> <M-h> :GoDoc<CR>
au filetype go noremap <buffer> <M-d> :GoDef<CR>
au filetype go noremap <buffer> <M-t> :GoTest<CR>
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Haskell Commands
au filetype haskell setlocal omnifunc=necoghc#omnifunc
