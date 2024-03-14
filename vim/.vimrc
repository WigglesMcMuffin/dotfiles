version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
let mapleader = ","
set cpo&vim
" inoremap ^V^U ^V^Gu^V^U
nnoremap - :Telescope find_files<Cr>
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
set autowrite
set foldmethod=indent
set foldlevelstart=99
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
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

" Make things look purdy
syntax enable
set number
set fdm=indent
filetype plugin indent on

" Plugins (hopefully)
call plug#begin(stdpath('data') . 'plugged')

Plug 'ThePrimeagen/git-worktree.nvim'

Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf/', 'do': { -> fzf#install() } }
Plug 'junegunn/vim-easy-align'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'protesilaos/prot16-vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-test/vim-test'

Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'

call plug#end()

lua <<END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'iceberg_dark',
  }
}
END

" Language Servers
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['/home/tmoss/workvenv/bin/pyls'],
    \ }

" LanguageClient keybindings
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

nnoremap <F5> <Plug>(lcn-menu)

" Easy Align keybinds
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-go keybinds
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>f <Plug>(go-alternate)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

let g:go_fmd_command = "goimports"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

" Testing tool keybindings
nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-s> :TestSuite<CR>
nnoremap <silent> t<C-l> :TestLast<CR>

" New Theme
set background=dark
colorscheme hyperion_dark

" vim: set ft=vim :
