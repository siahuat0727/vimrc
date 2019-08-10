set nocompatible
filetype off

" set the runtime path to include Vundle and initialize "
" :PlugInstall to install
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentline'
Plug 'siahuat0727/vimrc'
Plug 'tomasr/molokai'
call plug#end()

filetype plugin indent on
