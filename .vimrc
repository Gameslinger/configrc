set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'vim-scripts/TeTrIs.vim'
    Plugin 'morhetz/gruvbox'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'preservim/nerdtree'
    "Plugin 'neomake/neomake' "Code linter
    "Plugin 'yegappan/taglist' "Show progam tokens
    Plugin 'majutsushi/tagbar' "Better version of taglist
    Plugin 'sheerun/vim-polyglot'
    Plugin 'tommcdo/vim-lion'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'dense-analysis/ale'
    "Plugin 'tmhedberg/SimpylFold' "Slow python folding plugin
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


"Options for tabs/ indenting
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Other vim sets
set hidden "Allow background buffers
set incsearch "Search highlighting updates as you type
set scrolloff=5 "Scroll up/ down when cursor is 8 lines away
set nohlsearch "No highlighting after search
syntax on
set bg=dark "Dark mode

set relativenumber
set number
"Allows backspace to work in edit mode
set backspace=indent,eol,start
"Set folds to syntax. Doesn't work for python
"set foldmethod=syntax


" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
"let g:ycm_python_binary_path='/usr/bin/python3'
"Disable showing docs on hover since that fuctionality is bound to <leader>\
let g:ycm_auto_hover=''
map <leader>\ <plug>(YCMHover)

if (empty($TMUX))
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif

"For some reason not setting a built in theme first won't load gruvbox correctly
"colorscheme desert
colorscheme gruvbox


let g:airline#extensions#tabline#enabled = 1

let NERDTreeShowHidden=1

"Add intent indecators for YAML files
autocmd Filetype yaml setlocal tabstop=2 ai colorcolumn=1,3,5,7,9,80
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"ENABLE IF USING TAGLIST
"Closes Tlist if it is last window
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Show_One_File = 1
"let Tlist_Auto_Open = 1
"let Tlist_Inc_Winwidth = 0
"let Tlist_Compact_Format = 1

"Tagbar Config
"autocmd VimEnter * nested :call tagbar#autoopen(1)
map <leader>] :TagbarToggle <CR>
let g:tagbar_position='topleft vertical'
let g:tagbar_width=30
let g:tagbar_compact=1
let g:tagbar_show_linenumbers=1
let g:tagbar_show_tag_linenumbers=1
let g:tagbar_foldlevel=99
