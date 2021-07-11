"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast quit
nmap <leader>q :q<cr>


" For c
nmap <leader>c i#include <stdio.h><cr><cr>int main()<cr>{<cr>return 0;<cr>}<esc>kO

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>




syntax on
set ruler
set showmode
set cuc
set cul
nnoremap <f2> :set norelativenumber!<cr>:set nonumber!<cr>
set nu rnu
set scrolloff=10
set ttimeoutlen=100

" search
set hlsearch
set incsearch
set ignorecase

set autoindent
set smartindent
set nowrap
set noswapfile
set clipboard=unnamedplus

:imap jj <esc>
:imap jk <esc>

vmap <TAB> >gv
vmap <S-TAB> <gv


:colorscheme molokai

set nocompatible

# let g:ale_c_gcc_options='-std=c11 -Wall'
# let g:ale_cpp_gcc_options='-Wall -lm -lcrypt -O2 -std=c++11 -pipe -DONLINE_JUDGE'
# let b:ale_linters = ['flake8']
# let b:ale_fixers = [
# \   'remove_trailing_lines',
# \   'isort',
# \   'ale#fixers#generic_python#BreakUpLongLines',
# \   'yapf',
# \]

set showcmd

if has("autocmd")
	au bufreadpost * exe "normal! g`\""
endif

" remove trailing whitespace when writing a buffer.
" From: Vigil <vim5632@rainslide.net>
function! RemoveTrailingWhitespace()
	if &ft != "diff"
		let b:curcol = col(".")
		let b:curline = line(".")
		silent! %s/\s\+$//
		silent! %s/\(\s*\n\)\+\%$//
		call cursor(b:curline, b:curcol)
	endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

"Fast reloading of the .vimrc
map <leader>s :source ~/.vim/plugged/vimrc/plugin/siahuat0727.vim <cr>
"Fast editing of .vimrc
# map <leader>e :tabe ~/.vim/plugged/vimrc/plugin/siahuat0727.vim
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
