version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
" No clue what these do or did
" vmap gx <Plug>NetrwBrowseXVis
" nmap gx <Plug>NetrwBrowseX
" vnoremap <silent> <Plug>NetrwBrowseXVis :^V^Ucall netrw#BrowseXVis()^V^M
" nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '^V<cfile>')),netrw#CheckIfRemote())^V^M
" inoremap ^V^U ^V^Gu^V^U
nnoremap - :Explore<Cr>
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set display=truncate
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=200
" This should get the gitgutter going more often
set updatetime=100
set incsearch
set langnoremap
set nolangremap
set nrformats=bin,hex
set ruler
set runtimepath+=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set scrolloff=5
set showcmd
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set ttimeout
set ttimeoutlen=100
set wildmenu

"set t_8f=^[[38;2;%lu;%lu;%lum        " set foreground color
"set t_8b=^[[48;2;%lu;%lu;%lum        " set background color
" colorscheme Tomorrow-Night-Eighties
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor

hi HiTabs ctermbg=gray
match HiTabs /\t/
hi ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Track down and exterminate all trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" In case I swap color schemes, reapply highlight
autocmd ColorScheme * hi HiTabs ctermbg=gray
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" Tab with spaces, but less of them
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" Make things look purdy
syntax enable
set number
set relativenumber
set fdm=indent
filetype plugin indent on

" Plugins (hopefully)
call plug#begin(stdpath('data') . 'plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf/', 'do': { -> fzf#install() } }
Plug 'junegunn/vim-easy-align'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'protesilaos/prot16-vim'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'janko/vim-test'

call plug#end()

" Language Servers
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['/home/tmoss/workvenv/bin/pyls'],
    \ }

" LanguageClient keybindings
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Easy Align keybinds
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Testing tool keybindings
nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-s> :TestSuite<CR>
nnoremap <silent> t<C-l> :TestLast<CR>

" New Theme
set background=dark
colorscheme hyperion_dark

" vim: set ft=vim :
