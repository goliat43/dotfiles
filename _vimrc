" -------
" ------- Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" GitHubPlugins
" -------------------------------------------
" Plugin 'tpope/vim-fugitive'
Plugin 'heaths/vim-msbuild'
Plugin 'nanotech/jellybeans.vim' "Color
Plugin 'PProvost/vim-ps1'
Plugin 'nosami/Omnisharp'
" -------------------------------------------

" Plugins from http://vim-scripts.org/vim/scripts.html
" -------------------------------------------
Plugin 'L9'
" -------------------------------------------

" Git plugin not hosted on GitHub
" -------------------------------------------
Plugin 'git://git.wincent.com/command-t.git'
" -------------------------------------------

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ------- End of Vundle
" -------

source $VIMRUNTIME/mswin.vim
behave mswin

color jellybeans

set nobackup
set nowritebackup
set noswapfile
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number

nnoremap <silent> <F2> :bn<CR> 
nnoremap <silent> <S-F2> :bp<CR> 
nnoremap <silent> <F3> :cn<CR> 
nnoremap <silent> <S-F3> :cp<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

syntax on
filetype plugin indent on

au BufRead,BufNewFile *.targets set filetype=xml | set nowrap 
au BufRead,BufNewFile *.props set filetype=xml | set nowrap
