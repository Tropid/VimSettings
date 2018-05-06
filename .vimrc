" Plugins {{{
call plug#begin('~/.vim/plugged')
" Colorschemes
"Plug 'liuchengxu/space-vim-dark'
"Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'

Plug 'itchyny/lightline.vim'

Plug 'Valloric/YouCompleteMe'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'mattesgroeger/vim-bookmarks'

Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'

Plug 'sjl/gundo.vim'
call plug#end()

" }}}

" Colors {{{
colorscheme gruvbox
set background=dark

syntax enable

" }}}

" Spaces & Tabs {{{

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" }}}

" UI Config {{{
set number
set showcmd
set nocp
set vb t_vb=

set cursorline

filetype indent on

set wildmenu

set lazyredraw

set showmatch

set list
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

let g:signify_vcs_list = ['svn', 'git']

" }}}

" Searching {{{

set incsearch
set hlsearch

nnoremap <space> :nohlsearch<cr>

" }}}

" Folding {{{

set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <tab> za
set foldmethod=indent

" }}}

" Editing & Movement & Selection {{{

inoremap jk <esc>
inoremap kj <esc>

nnoremap G Gzz

" Select last inserted text
nnoremap gV `[v`]

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <leader>c :bd<cr>

nnoremap <C-j> :cnext<cr>
nnoremap <C-k> :cprev<cr>

nmap ü [
nmap + ]
omap ü [
omap + ]
xmap ü [
xmap + ]

" }}}

" Leader Shortcuts {{{

let mapleader = ","

nnoremap <leader>u :GundoToggle<cr>

" Edit common files
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Search
nnoremap <leader>df :Files<cr>
nnoremap <leader>dl :Lines<cr>
nnoremap <leader>db :Buffers<cr>
nnoremap <leader>dh :History<cr>

" }}}

" Search {{{

" Find command with fzf search
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always"'.shellescape(<q-args>), 1, <bang>0)

if executable('rg')
  set grepprg=rg\ --vimgrep
elseif executable('ag')
  set grepprg=ag\ --vimgrep
endif

" }}}

" Lightline {{{

set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified', 'svnbranch' ] ]
  \ },
  \ 'component_function': {
  \   'svnbranch': 'SvnBranch'
  \ },
  \ }

if executable('svn')
  let g:lightline.component_function.svnbranch = 'SvnBranch'

  function! SvnBranch()
    let l:svn_call = system("svn info --show-item=relative-url")
    if v:shell_error == 0
      return substitute(l:svn_call, '\n\+$', '', '')
    endif
    return ""
  endfunction
endif

" }}}

" SVN {{{

if executable('svn')
  nnoremap <leader>ss :call SvnStatus()<cr>
  nnoremap <leader>sd :call SvnDiff()<cr>
  nnoremap <leader>sl :call SvnLog()<cr>
  nnoremap <leader>sb :call SvnBlame()<cr>

  function! SvnStatus()
    enew
    normal! ggdG
    setlocal buftype=nofile
    let status = system("svn status")
    call append(0, split(status, '\v\n'))
  endfunction

  function! SvnDiff()
    let ft = &filetype
    vnew
    normal! ggdG
    setlocal buftype=nofile
    exec "setlocal filetype=" . ft
    let diff = system("svn cat -r BASE " . expand("#"))
    call append(0, split(diff, '\v\n'))
    windo diffthis
    " TODO Remove newline at end
  endfunction

  function! SvnLog()
    bot split
    normal! :%!svn log -l 5 %<cr>
    setlocal buftype=nofile
  endfunction

  function! SvnBlame()
    let l:save = winsaveview()
    let l:ft = &filetype
    normal! gg
    vnew
    vertical resize 24
    setlocal buftype=nofile
    setlocal nowrap
    exec "setlocal filetype=" . l:ft
    let l:blame = system("svn blame " . expand("#"))
    call append(0, split(l:blame, '\v\n'))
    normal! gg
    set scrollbind
    wincmd p
    call winrestview(l:save)
    set scrollbind
  endfunction
endif

" }}}

" Autogroups {{{
augroup configgroup
  autocmd!
  autocmd FileType cpp RainbowParentheses
  autocmd BufEnter Makefile setlocal noexpandtab
augroup END

" }}}

" vim:foldmethod=marker:foldlevel=0
