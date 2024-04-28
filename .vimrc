set scrolloff=8
set number
set relativenumber
set laststatus=2
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hlsearch

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'wakatime/vim-wakatime'
Plug 'prabirshrestha/vim-lsp'
Plug 'williamboman/mason.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

let mapleader = " "
nnoremap <leader>pv :Vex<Cr>
nnoremap <leader><CR> :so ~/.vimrc<Cr>
nnoremap <leader>pf :Files<Cr>
nnoremap <C-j> :cnext<Cr>
nnoremap <C-k> :cprev<Cr>
" Map <Tab> to select the current completion item
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

