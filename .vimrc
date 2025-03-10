" General settings
set scrolloff=8
set number
set relativenumber
set laststatus=2
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hlsearch
set termguicolors
set incsearch
set ignorecase
set smartcase
set path+=/usr/include,/usr/local/include
set mouse=a
set ttymouse=sgr
set balloonevalterm

" Terminal capabilities (Truecolor, underline, strikethrough, etc.)
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
let &t_ut=''  " Fix background rendering for kitty-like terminals

" Leader key
let mapleader = " "

" Plugin management with vim-plug
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ayu-theme/ayu-vim'

" Essential plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wakatime/vim-wakatime'

" Core autocompletion and LSP with coc.nvim
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using npm
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}

Plug 'shawncplus/phpcomplete.vim'

" PHP-specific plugins (Best for autocompletion)
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}  " PHP language server
Plug 'jwalton512/vim-blade'  " Laravel Blade support
Plug 'noahfrederick/vim-laravel'  " Laravel-specific features
Plug 'stephpy/vim-yaml', {'for': 'yaml'}  " YAML for Laravel configs
Plug 'beanworks/vim-phpfmt'  " PHP formatting

" Linting and fixing (complements autocompletion)
Plug 'dense-analysis/ale'

" Utility plugins
Plug 'tpope/vim-fugitive'  " Git integration
Plug 'airblade/vim-gitgutter'  " Git diff in gutter
Plug 'scrooloose/nerdtree'  " File explorer
Plug 'majutsushi/tagbar'  " Tag navigation

" C/C++ support
Plug 'neoclide/coc-clangd'  " C/C++ autocompletion

" ARM assembly support
Plug 'Shirk/vim-gas'  " GNU Assembler syntax

Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}

" Markdown preview
" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


" If you have nodejs
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

call plug#end()

" Theme settings
let ayucolor="mirage"
colorscheme material

" Coc.nvim global extensions
let g:coc_global_extensions = ['coc-clangd', 'coc-phpactor', 'coc-json', 'coc-html', 'coc-css']
let g:coc_node_path = '/usr/bin/node'  " Verify this path with :!which node

" General autocompletion settings
set completeopt=menuone,noinsert,noselect
inoremap <silent><expr> <C-Space> coc#refresh()  " Trigger completion
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"  " Select completion with Tab
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"  " Navigate up in completion menu

" PHP-specific settings
autocmd FileType php setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd FileType php let g:coc_php_server_args = ['--tcp=127.0.0.1:1212', '--memory-limit=2048M']

" C/C++ settings
autocmd FileType c,cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 expandtab smartindent

" ALE settings (Linting and Fixing for PHP)
let g:ale_linters = {
\   'php': ['phpcs'],
\   'c': ['gcc'],
\   'cpp': ['g++']
\}
let g:ale_fixers = {
\   'php': ['php_cs_fixer', 'phpcbf']
\}
let g:ale_php_php_cs_fixer_executable = 'php-cs-fixer'
let g:ale_php_php_cs_fixer_options = '--rules=@PSR12'  " Modern PSR-12 standard
let g:ale_fix_on_save = 1

" PHPactor settings (optional manual tweak)
let g:phpactorCompletion = 1
let g:phpactorPath = '~/.vim/plugged/phpactor/bin/phpactor'

" Mappings
nnoremap <leader>pv :Vex<CR>  " Vertical explorer
nnoremap <leader><CR> :so ~/.vimrc<CR>  " Reload config
nnoremap <leader>pf :Files<CR>
nnoremap <leader>ff :NERDTreeToggle<CR>  " Toggle NERDTree
nnoremap <leader>tt :TagbarToggle<CR>  " Toggle Tagbar
nnoremap <leader>gs :G<CR>  " Git status
nnoremap <leader>cc :CocCommand<CR>  " Coc commands
nnoremap <C-j> :cnext<CR>  " Next quickfix item
nnoremap <C-k> :cprev<CR>  " Previous quickfix item

" Autocommands
augroup ClearSearchHighlight
    autocmd!
    autocmd InsertEnter * :set nohlsearch
augroup END

" Assembly filetypes
autocmd BufRead,BufNewFile *.s,*.asm set filetype=asm
