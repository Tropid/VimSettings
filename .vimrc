if has('gui_running')
  set guifont=Source\ Code\ Pro\ 11"
  set guioptions-=T
  set guioptions-=m
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'jonathanfilip/vim-lucius'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
call plug#end()

set encoding=utf-8
setglobal fileencoding=utf-8

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
syntax on
set lines=30 columns=90
set nocp
filetype plugin indent on
set wildmode=longest,list
set backspace=indent,eol,start
set shellslash
set laststatus=2
set hidden

let mapleader = ","

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'wombat'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

map <M-Left> :bprevious<CR>
map <M-Right> :bnext<CR>
map <C-N> :tabnew<CR>

set background=light
colorscheme lucius

au BufRead,BufNewFile *.adoc setfiletype asciidoc

" Go Commands
au filetype go noremap <buffer> <M-i> :GoImport
au filetype go noremap <buffer> <M-b> :GoBuild<CR>
au filetype go noremap <buffer> <M-g> :GoRun<CR>
au filetype go noremap <buffer> <M-r> :GoRename<CR>
au filetype go noremap <buffer> <M-h> :GoDoc<CR>
au filetype go noremap <buffer> <M-d> :GoDef<CR>
au filetype go noremap <buffer> <M-t> :GoTest<CR>
