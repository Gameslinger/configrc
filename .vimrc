set nocompatible              " be iMproved, required
filetype off                  " required

"vim-plug stuff begin
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"vim-plug stuff end

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" set the runtime path to include vim-plug and initialize
call plug#begin()
    Plug 'VundleVim/Vundle.vim'
    Plug 'vim-scripts/TeTrIs.vim'
    "Plug 'morhetz/gruvbox'
    Plug 'sliminality/wild-cherry-vim'
    Plug 'Valloric/YouCompleteMe'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'
    "Plugin 'neomake/neomake' "Code linter
    "Plugin 'yegappan/taglist' "Show progam tokens
    Plug 'majutsushi/tagbar' "Better version of taglist
    Plug 'sheerun/vim-polyglot'
    Plug 'tommcdo/vim-lion'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'dense-analysis/ale'
    Plug 'tpope/vim-surround'
    Plug 'johngrib/vim-game-snake'
    "Plug 'iamcco/markdown-preview.nvim'
    "Plugin 'dpelle/vim-LanguageTool' "Grammar plugin. Requires jar install
    "Plugin 'Ron89/thesaurus_query.vim'
    "Plugin 'tpope/vim-fugitive'
    "Plugin 'vim-gitgutter'
call plug#end()            " required
filetype plugin indent on    " required

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
colorscheme wildcherry
"Add highlighting for bad spelling:
au BufRead,BufNewFile * hi SpellBad ctermfg=red cterm=underline | setlocal spell spelllang=en_us


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
"Disable YCM suggestions
let g:ycm_auto_trigger = 0
"map <leader>\ <plug>(YCMHover)
nnoremap <leader>' :YcmCompleter GoTo<CR>
nnoremap <leader>" :YcmCompleter GoToReferences<CR>
nnoremap <leader>r :YcmCompleter RefactorRename 

"let g:ycm_semantic_triggers = {
"	\   'python': [ 're!\w{2}' ],
"	\   'c': [ 're!\w{2}' ]
"	\ }
"let g:ycm_autoclose_preview_window_after_completion = 1

nnoremap <leader>o :bn<CR>
nnoremap <leader>i :bN<CR>
nnoremap <leader>p :bd<CR>

if (empty($TMUX))
    if (has("termguicolors"))
        set termguicolors
    endif
endif

let g:airline#extensions#tabline#enabled = 1

let NERDTreeShowHidden=1
map <leader>[ :NERDTreeToggle <CR>

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
let g:tagbar_position='topleft vertical'
let g:tagbar_width=30
let g:tagbar_compact=1
let g:tagbar_show_linenumbers=1
let g:tagbar_show_tag_linenumbers=1
let g:tagbar_foldlevel=0
let g:tagbar_autoclose=1
let g:tagbar_autofocus = 1



"MarkdownPreview Config
"let g:mkdp_auto_start = 0
"let g:mkdp_auto_close = 0
""Link to css file to change styling
"let g:mkdp_markdown_css = ''
"let g:mkdp_preview_options = {
"    \ 'mkit': {},
"    \ 'katex': {},
"    \ 'uml': {},
"    \ 'maid': {},
"    \ 'disable_sync_scroll': 0,
"    \ 'sync_scroll_type': 'middle',
"    \ 'hide_yaml_meta': 1,
"    \ 'sequence_diagrams': {},
"    \ 'flowchart_diagrams': {},
"    \ 'content_editable': v:false,
"    \ 'disable_filename': 1,
"    \ 'toc': {}
"    \ }

"Coc Configuration start
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"Coc Configuration end
