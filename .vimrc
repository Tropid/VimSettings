if has('gui_running')
  set guifont=Source\ Code\ Pro:h11"
  set guioptions-=T
  set guioptions-=m
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
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

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" Add space after comment symbol
let g:NERDSpaceDelims = 1

map <M-Left> :bprevious<CR>
map <M-Right> :bnext<CR>
map <C-N> :tabnew<CR>

set background=light
colorscheme lucius

au BufRead,BufNewFile *.adoc setfiletype asciidoc

" XML Commands
au filetype xml set shiftwidth=2
au filetype xml set tabstop=2

" Go Commands
au filetype go noremap <buffer> <M-i> :GoImport
au filetype go noremap <buffer> <M-b> :GoBuild<CR>
au filetype go noremap <buffer> <M-g> :GoRun<CR>
au filetype go noremap <buffer> <M-r> :GoRename<CR>
au filetype go noremap <buffer> <M-h> :GoDoc<CR>
au filetype go noremap <buffer> <M-d> :GoDef<CR>
au filetype go noremap <buffer> <M-t> :GoTest<CR>
