" big thanks
"   https://github.com/skwp/dotfiles/blob/master/vimrc
"   http://items.sjbach.com/319/configuring-vim-right
"   http://vimdoc.sourceforge.net/htmldoc/options.html
"     - vim's documentation, in a browser :D
"   https://github.com/github/gitignore
"     - helped with the 'wildignore' option
"   http://vimbits.com/

set nocompatible " use vim settings, don't worry about vi compatibility

" plugin manager plugin (https://github.com/sunaku/vim-unbundle)
runtime bundle/unbundle/unbundle.vim
runtime macros/matchit.vim " enable matchit, a plugin included with vim

" {{{ general

filetype plugin indent on                                   " load plugin/indent files for the detected filetype (see `:help filetype` for more info)
syntax on                                                   " turn on syntax highlighting
set number
set autoread                                                " automatically read files that have been changed outside the editor
set backspace=indent,eol,start                              " allow deleting any characters in insert mode (see `:help 'backspace'`)
set completeopt+=longest                                    " complete the longest common match (instead of the first one) before showing all matches
set encoding=utf-8                                          " use utf-8 encoding by defualt (see `:help encoding` for more info)
set smarttab tabstop=4 softtabstop=4 shiftwidth=4			" indent with two spaces when the tab key is pressed
set fillchars="stl:c ,stlnc:c ,vert:c ,fold:c ,diff:c "     " don't use extra characters in various places in the ui (see `:help fillchars`)

set formatoptions="acjnoqr"                                 " format text as it's typed (see `:help fo-table` for an explanation of the options
set helpheight=999                                          " when viewing the help documentation use a full-sized window (instead of 1/2 the size)
set hidden                                                  " allow hidden buffers (buffers not attached to a window) without warnings
set hlsearch incsearch                                      " highlight search terms dynamically as they are typed and highlight matches
set ignorecase smartcase                                    " case sensitive searches only when capitals are present
set mouse=a                                                 " enable the mouse in all modes
set noruler statusline="%F %m"                              " show just the filename and its modification state in the status line
set nowrap                                                    " don't wrap text
"set scrolloff=999                                           " keep the cursor in the middle of the text (except when on the top and bottom)
set spellcapcheck=                                          " don't tell me words that aren't capitalized are misspelled
set ttimeoutlen=0                                           " don't wait for extra keys to be pressed before redrawing the screen
"set virtualedit=all                                         " let the cursor move anywhere
" tab complete like zsh and ignore compiled/temporary files when completing
set wildmenu wildmode=list:full wildignore=*.swp,*.o,*.obj,*.so,*.a,*.py[co],*~,*.hi

if has('clipboard')
  set clipboard=unnamed,unnamedplus " make copied text available to the OS' clipboard
endif

augroup vimrc_autocmds
	autocmd BufEnter * highlight OverLength ctermbg=darkred ctermfg=white
	autocmd BufEnter * match OverLength /\%81v.\+/
augroup END

"folding settinvgs
set foldmethod=indent                                       " fold text based on the default marker (see `:help foldmarker`)
set foldnestmax=10
set foldlevel=1
set nofoldenable

" general }}}

" {{{ filetype specific

" strip trailing whitespace before saving any file
autocmd BufWritePre * :%substitute/\s\+$//e
" regenerate the 'tags' file when saving (if it exists in the current directory)
autocmd BufWritePost * if filereadable('tags') | :execute ':silent !ctags --recurse &> /dev/null &' | :redraw! | endif
" auto-resize split windows when vim is resized (see `:help CTRL-W_=` for more info)
autocmd VimResized * normal =
" highlight these filetypes as json
autocmd BufRead *.webapp,.jshintrc setf json

autocmd FileType diff,gitcommit                   setlocal foldmethod=expr foldexpr="0" " don't fold text in diff files (this doesn't affect fugitive diffs)
autocmd FileType help,qf                          nnoremap q :quit<cr>
autocmd FileType markdown,gitcommit,cucumber,mail setlocal spell                        " spellcheck these files by default
autocmd FileType markdown                         setlocal textwidth=72                 " wrap markdown files at 72 characters
autocmd FileType qf,tagbar,gitcommit              setlocal cursorline                   " highlight the current line in these filetypes
autocmd FileType vim,help                         setlocal keywordprg=:help             " use the `:help` command to show help in these files
autocmd Filetype vim                              set foldmethod=marker foldenable

" filetype specific }}}

" {{{ plugin specific

" CtrlP file finder/opener (https://github.com/kien/ctrlp.vim)
" C-x C-f to fuzzy-find files and C-x b to fuzzy-find open buffers (from emacs)
let g:ctrlp_map = '<c-x><c-f>'
nnoremap <c-x>b :CtrlPBuffer<cr>
let g:ctrlp_by_filename=1 " search by filename, instead of the full path
let g:ctrlp_custom_ignore={ 'dir': 'Music$\|Videos$\|Pictures$\|Documents$\|tmp$\|.git$\|.hg$' } " ignore content/version control directories
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25' " show more matches
let g:ctrlp_show_hidden=1 " search hidden files and directories too
let g:ctrlp_working_path_mode=0 " don't change the current working directory

" solarized colorscheme (https://github.com/altercation/vim-colors-solarized)
" set background=light
" colorscheme solarized

" syntastic syntax checker (https://github.com/scrooloose/syntastic)
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }

" the silver searcher wrapper plugin (https://github.com/rking/ag.vim)
" ignore case if there aren't any capitals in the search terms; literal (non-regular-expression search)
let g:agprg="ag --column --smart-case --literal"

" show the current file's functions (https://github.com/majutsushi/tagbar)
noremap <silent> <leader>t :TagbarOpenAutoClose<cr>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1


" plugin specific }}}

" {{{ other mappings/abbreviations

set pastetoggle=<f8>              " toggle paste mode with f8 (see `:help paste`)
autocmd InsertLeave * set nopaste " disable paste mode when leaving insert mode

" disable ex mode; I usually toggle this on accident and don't otherwise use it
nnoremap Q <nop>

" `Y` now copies text from the current spot until the end of the line, instead of the whole line
" thanks: http://vimbits.com/bits/11
noremap Y y$

" alias frequently mistyped commands
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq

" easy split navigation (thanks: http://vimbits.com/bits/10)
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

" f12 to toggle line/column highlighting
noremap <silent> <f12> :setlocal cursorline! cursorcolumn!<cr>

" blanks a line (clears it).  This works in normal and visual mode
" NOTE: the line that was cleared can be pasted (is in the " and 1 registers)
noremap <silent> <leader>b :normal cc<cr>

" browse changes in a git repository in the current directory
" see `man tig` for more info
noremap <silent> <leader>g :silent !tig<cr>:redraw!<cr>

" clear search highlights
noremap <silent> <leader>h :nohlsearch<cr>

" toggle spellcheck (see `:help spell`)
noremap <silent> <leader>l :set spell! spell?<cr>

" show all registers, useful for when looking for strings you deleted awhile ago
noremap <silent> <leader>r :registers<cr>

" horizontally split the window
" use vim-vinegar (https://github.com/tpope/vim-vinegar)
" to open the current directory
noremap <silent> <leader>s :split<cr>:normal -<cr>
" emacs equivalent
noremap <silent> <c-x>2 :split<cr>:normal -<cr>

" vertically split the window
" use vim-vinegar to open the current directory
noremap <silent> <leader>v :vsplit<cr>:normal -<cr>
" emacs equivalent
noremap <silent> <c-x>3 :vsplit<cr>:normal -<cr>

" open a new tab
" use vim-vinegar to open the current directory
noremap <silent> <leader>t :execute 'tabedit ' . expand('%')<cr>:normal -<cr>

" smash the ']' and '\' keys in normal mode to save your file
noremap <silent> \] :update<cr>
noremap <silent> ]\ :update<cr>

" save with C-x C-s (like in emacs)
nnoremap <silent> <c-x><c-s> :update<cr>
inoremap <silent> <c-x><c-s> <c-o>:update<cr>

" quit with C-x C-c (like in emacs); fails if there are pending changes
nmap <c-c> <nop>
nnoremap <silent> <c-x><c-c> :qall<cr>

" switch to the next window with C-x o (like in emacs)
nnoremap <silent> <c-x>o <c-w><c-w>

" make the current window the only window with C-x 1 (like in emacs)
nnoremap <silent> <c-x>1 <c-w><c-o>

" close the current window with C-x 0 (like in emacs)
nnoremap <silent> <c-x>0 ZQ

" press C-/ in insert or normal mode to undo (from emacs)
nnoremap  u
inoremap  <c-o>:normal u<cr>

" show the git blame view at the current line (using tig) for the current file
nnoremap <silent> gb :silent! execute ":!tig blame +" . line(".") . " -- % "<cr>:redraw!<cr>

" show git's status for the current directory (using tig)
noremap <silent> gs :silent !tig status<cr>:redraw!<cr>

" show the commit log for the current git project
noremap <silent> gl :silent !git log --patch --date=relative --decorate<cr>:redraw!<cr>

" other mappings/abbreviations }}}
