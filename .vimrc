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
Plug 'dense-analysis/ale'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
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
" Configure coc.nvim for JavaScript/TypeScript
autocmd FileType javascript,javascriptreact,typescript,typescriptreact let g:coc_node_path = '/usr/bin/node'
autocmd FileType javascript,javascriptreact,typescript,typescriptreact let g:coc_javaScript_server_commands = ['/home/sarv/.local/share/nvim/mason/bin/typescript-language-server', '--stdio']

" Configure coc.nvim for PHP
autocmd FileType php let g:coc_php_executable = '/usr/bin/php'
autocmd FileType php let g:coc_php_server_args = ['--tcp=127.0.0.1:1212', '--memory-limit=2048M']
let g:ale_linters = {
\   'typescript': ['tsserver'],
\}

let g:ale_completion_enabled = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0

autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
