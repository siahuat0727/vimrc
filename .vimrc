syntax on
set ruler
set showmode
set showcmd
set cuc
set cul
set nu rnu
set scrolloff=10

:imap jj <Esc>

filetype indent plugin on

:colorscheme molokai

if has("autocmd")
	au BufReadPost * exe "normal! g`\""
endif
