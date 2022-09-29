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
    Plugin 'tpope/vim-surround'
    Plugin 'johngrib/vim-game-snake'
    Plugin 'iamcco/markdown-preview.nvim'
    "Plugin 'dpelle/vim-LanguageTool' "Grammar plugin. Requires jar install
    "Plugin 'Ron89/thesaurus_query.vim'
    "Plugin 'tpope/vim-fugitive'
    "Plugin 'vim-gitgutter'
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
"Disable showing docs on hover since that fuctionality is bound to <leader>\
let g:ycm_auto_hover=''
map <leader>\ <plug>(YCMHover)
nnoremap <leader>' :YcmCompleter GoTo<CR>
nnoremap <leader>" :YcmCompleter GoToReferences<CR>
nnoremap <leader>r :YcmCompleter RefactorRename 

let g:ycm_semantic_triggers = {
	\   'python': [ 're!\w{2}' ],
	\   'c': [ 're!\w{2}' ]
	\ }
let g:ycm_autoclose_preview_window_after_completion = 1

nnoremap <leader>o :bn<CR>
nnoremap <leader>i :bN<CR>
nnoremap <leader>p :bd<CR>

if (empty($TMUX))
    if (has("termguicolors"))
        set termguicolors
    endif
endif

colorscheme gruvbox
"Add highlighting for bad spelling:
au BufRead,BufNewFile * hi SpellBad ctermfg=red cterm=underline | setlocal spell spelllang=en_us

let g:airline#extensions#tabline#enabled = 1

let NERDTreeShowHidden=1

"Add intent indicators for YAML files
autocmd Filetype yaml setlocal tabstop=2 ai colorcolumn=1,3,5,7,9,80
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"Set 80 character indicator
setlocal colorcolumn=80

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
map <leader>[ :NERDTreeToggle <CR>
let g:tagbar_position='topleft vertical'
let g:tagbar_width=30
let g:tagbar_compact=1
let g:tagbar_show_linenumbers=1
let g:tagbar_show_tag_linenumbers=1
let g:tagbar_foldlevel=0
let g:tagbar_autoclose=1
let g:tagbar_autofocus = 1



"MarkdownPreview Config
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
"Link to css file to change styling
let g:mkdp_markdown_css = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 1,
    \ 'toc': {}
    \ }
