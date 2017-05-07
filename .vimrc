"Auto install vim-plug if not already there.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd vimenter * PlugInstall
endif



"Plugins List
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()


"General Settings
syntax on
set number
set showmatch
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

"General Key Mappings
nnoremap tl :tabnext<CR>
nnoremap th :tabprevious<CR>
nnoremap tc :tabclose<CR>

"Appearance/Display
set bg=dark
colorscheme solarized

"Cursor Appearance
if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
    au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
        \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

map <F5> :e %:p:s,.h$,.X123X, :s,.cpp$,.h:s,.X123X$,.cpp,<CR>

"Nerd Tree Settings
autocmd vimenter * NERDTree
map nt :NERDTree<CR>

"Nerd Commenter Settings
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 0
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {'cpp': {'left': '/**', 'right': '*/'}}
let g:NERDTrimTrailingWhiteSpace = 1
let g:NERDCommentEmptyLines = 0

"YCM settings
let g:ycm_autoclose_preview_window_after_insertion = 1   
let g:ycm_global_ycm_extra_conf = '~/dotfiles/.ycm_extra_conf.py'  
let g:ycm_auto_trigger = 0
let g:ycm_collect_identifiers_from_tags_files = 1




" "OmniCppComplete Settings
" map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/commontags /usr/include /usr/local/include 
" set tags+=~/.vim/commontags


" " -- optional --
" " auto close options when exiting insert mode or moving away
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" set completeopt=menu,menuone

" " -- configs --
" let OmniCpp_MayCompleteDot = 1 " autocomplete with .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
" let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
" let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e.parameters) in popup window
" let OmniCpp_LocalSearchDecl = 1 " don't require special style of function opening braces
" let OmniCpp_DisplayMode = 1 " show private and protected members in auto completion

" " Setup the tab key to do autocompletion
" function! CompleteTab()
"     let prec = strpart( getline('.'), 0, col('.')-1 )
"     if prec =~ '^\s*$' || prec =~ '\s$'
"         return "\"
"     else
"         return "\\"
"     endif
" endfunction

" map <Tab> :CompleteTab()
