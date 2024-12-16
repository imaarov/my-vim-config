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
set path+=/usr/include
set path+=/usr/local/include
" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
let g:ale_c_include_paths = ['include']

execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''
let g:coc_global_extensions = ['coc-clangd']
autocmd FileType c,cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Leader key
let mapleader = " "

" Plugin management with vim-plug
call plug#begin('~/.vim/plugged')

" Essential plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'wakatime/vim-wakatime'

" PHP and Laravel specific plugins
Plug 'phpactor/phpactor', { 'for': 'php', 'do': 'composer install --no-dev -o' }
Plug 'tpope/vim-projectionist'
Plug 'jwalton512/vim-blade'
Plug 'noahfrederick/vim-laravel'
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'prabirshrestha/vim-lsp'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'php']
\ }

Plug 'beanworks/vim-phpfmt'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }

" Syntax and autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'williamboman/mason.nvim'
Plug 'neoclide/coc-phpls'
Plug 'psf/black', { 'branch': 'stable' }

" Utility plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

" C/C++ language specific plugins
Plug 'neoclide/coc-clangd'          " C/C++ autocompletion and linting
Plug 'puremourning/vimspector'      " Debugger for C/C++

" ARM assembly specific plugins
Plug 'Shirk/vim-gas'               " Syntax highlighting for GNU Assembler (GAS)
Plug 'puremourning/vimspector'



call plug#end()

" Theme
let ayucolor="mirage"
" slate is kinda cool i like it
colorscheme ayu

" Mappings
nnoremap <leader>pv :Vex<Cr>
nnoremap <leader><CR> :so ~/.vimrc<Cr>
nnoremap <leader>pf :Files<Cr>
nnoremap <C-j> :cnext<Cr>
nnoremap <C-k> :cprev<Cr>
nnoremap <silent> <space>fm :PrettierAsync<CR>
nnoremap <leader>ff :NERDTreeToggle<CR>
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>cc :CocCommand<CR>

" CoC and LSP settings
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
autocmd FileType php let g:coc_global_extensions = ['coc-phpls', 'coc-json', 'coc-html', 'coc-css']
autocmd FileType php let g:coc_node_path = '/usr/bin/node'
autocmd FileType php let g:coc_php_server_args = ['--tcp=127.0.0.1:1212', '--memory-limit=2048M']
autocmd BufRead,BufNewFile *.s,*.asm set filetype=asm


" ALE settings
let g:ale_linters = {
\   'php': ['phpcs'],
\   'typescript': ['tsserver'],
\}
let g:ale_fixers = {
\   'php': ['php_cs_fixer', 'phpcbf'],
\}
let g:ale_linters = {
\   'asm': ['nasm', 'gcc']
\}

let g:ale_php_php_cs_fixer_executable = 'php-cs-fixer'
let g:ale_php_php_cs_fixer_options = '--rules=@PSR2'
let g:ale_fix_on_save = 1

" PHPActor settings
let g:phpactorCompletion=1
let g:phpactorPath='~/.vim/plugged/phpactor/bin/phpactor'

" Autocommands
augroup ClearSearchHighlight
    autocmd!
    autocmd InsertEnter * :set nohlsearch
augroup END

" C/C++ settings
" Enable Coc.nvim for C/C++ using clangd
autocmd FileType c,cpp,C,objc,objcpp setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Enable auto-completion with Coc.nvim
set completeopt=menuone,noinsert,noselect
let g:coc_global_extensions = ['coc-clangd']

" Formatting with clang-format


" Tabs and indentation for C
autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 expandtab smartindent

