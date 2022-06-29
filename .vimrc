"Note try reinstalling YouCompleteMe for C/C++ support
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/TeTrIs.vim'
Plugin 'morhetz/gruvbox'
Plugin 'Valloric/YouCompleteMe'
Plugin 'preservim/nerdtree'
"Plugin 'neomake/neomake'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dense-analysis/ale'
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

syntax on

filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number
" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_python_binary_path='/usr/bin/python3'



if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif

"For some reason not setting a built in theme first won't load gruvbox correctly
colorscheme desert
colorscheme gruvbox

set backspace=indent,eol,start
"Autoenable NERDTree:
"au VimEnter *  NERDTree
"Enable neomake. Ale currently installed
"call neomake#configure#automake('w')

let g:airline#extensions#tabline#enabled = 1
map <leader>\ <plug>(YCMHover)
let NERDTreeShowHidden=1
