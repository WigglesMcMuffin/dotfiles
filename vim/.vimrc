version 6.0
if &cp | set nocp | endif
map Q gq
let s:cpo_save=&cpo
set cpo&vim
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
vnoremap <silent> <Plug>NetrwBrowseXVis :^V^Ucall netrw#BrowseXVis()^V^M
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '^V<cfile>')),netrw#CheckIfRemote())^V^M
inoremap ^V^U ^V^Gu^V^U
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set display=truncate
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=200
set incsearch
set langnoremap
set nolangremap
set nrformats=bin,hex
set ruler
let &runtimepath='~/.vim,'.&runtimepath.'~/.vim/after'
set scrolloff=5
set showcmd
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set ttimeout
set ttimeoutlen=100
set wildmenu

set t_8f=^[[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=^[[48;2;%lu;%lu;%lum        " set background color
" colorscheme Tomorrow-Night-Eighties
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor

" Track down and exterminate all trailing whitespaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" File Explorer Options
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 3
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" New Theme
set background=dark
colorscheme solarized
" colo thaumaturge
hi HiTabs ctermbg=grey
match HiTabs /\t/
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWritePre * %s/\s\+$//e

" Tab with spaces, but less of them
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

"Pathogen goes here
execute pathogen#infect()
syntax on
filetype plugin indent on

" vim: set ft=vim :
