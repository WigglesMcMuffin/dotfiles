version 6.0

" This is some magic incantation often included
" I honestly don't know WHY, it's like set -euo pipefail

"if &cp | set nocp | endif
"let s:cpo_save=&cpo
"set cpo&vim
"let &cpo=s:cpo_save
"unlet s:cpo_save
let mapleader = ","
nnoremap - :Telescope find_files<Cr>

" Not sure what this does, toggle on if it borks
" set langnoremap
" set nolangremap

" Don't know if I need this at all
" set autowrite

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

Plug 'ThePrimeagen/harpoon'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
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
