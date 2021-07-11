set nocompatible
filetype off

" set the runtime path to include Vundle and initialize "
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentline'
Plug 'siahuat0727/vimrc'
Plug 'tomasr/molokai'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'neoclide/coc.nvim'
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
call plug#end()
" :PlugInstall to install
" CocInstall coc-jedi  to install python auto-complete

let g:ale_linters = {'python': 'all'}
let g:ale_fixers = {'python': ['isort', 'yapf', 'remove_trailing_lines', 'trim_whitespace']}
let g:ale_lsp_suggestions = 1
let g:ale_fix_on_save = 1
let g:ale_go_gofmt_options = '-s'
let g:ale_go_gometalinter_options = '— enable=gosimple — enable=staticcheck'
let g:ale_completion_enabled = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'


map <leader>s :source ~/.vimrc <cr>
" "Fast editing of .vimrc
map <leader>e :tabe ~/.vimrc <cr>

map <leader>t :NERDTreeToggle<CR>



filetype plugin indent on
