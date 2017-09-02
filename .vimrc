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
Plug 'mileszs/ack.vim'
Plug 'godlygeek/csapprox'
Plug 'nvie/vim-flake8'
Plug 'milkypostman/vim-togglelist'

call plug#end()


"General Settings
syntax on
set number
set showmatch
set encoding=utf-8
set autoindent
set si                  " smartindent
set cindent             " do c-style indenting
set tabstop=8           " tab spacing (settings below are just to unify it)
set softtabstop=8       " unify
set shiftwidth=2
set expandtab           " NO tabs please!
set nowrap              
set smarttab  
set hidden

" For quick escape
set timeoutlen=1000 ttimeoutlen=0

"General Key Mappings
nnoremap tl :tabnext<CR>
nnoremap th :tabprevious<CR>
nnoremap tc :tabclose<CR>

" Use escape to clear search highlights
nnoremap <esc> :noh<return><esc>

" needed so that vim still understands escape sequences
nnoremap <esc>^[ <esc>^[

" Quick edit and reload vimrc
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>

set t_Co=256
set background=dark
colorscheme hybrid



let g:cpp_class_scope_highlight=1
let g:cpp_class_decl_highlight=1
let g:cpp_member_variable_highlight=1

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
map nt :NERDTree<CR>

"For Airline
set laststatus=2

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
let g:ycm_auto_trigger = 1
let g:ycm_python_binary_path = '/usr/bin/python3'

nnoremap <leader>g :YcmCompleter GoTo<cr>
nnoremap <leader>gh :YcmCompleter GoToInclude<cr>
nnoremap <leader>gd :YcmCompleter GetDoc<cr>
nnoremap <leader>f :YcmCompleter FixIt<cr>
nnoremap <leader>re :YcmCompleter FixIt<cr>

" The Silver Searcher
if executable('ag')
      " Set ack.vim plugin to use ag
      let g:ackprg = 'ag --vimgrep'
      " Use ag in CtrlP for listing files. Lightning fast and respects
          " .gitignore
      let g:ctrlp_user_command = 'ag %s -l -g ""'

      " ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0
endif

" ack.vim settings for use with ag
" Search current word under cursor
nnoremap <Leader>a :Ack!<cword><cr>
nnoremap <Leader>f :Ack!

" auto close quickfix window after selecting an item
:autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
      

" CtrlP open in MRU mode by default
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRUFiles'

" CtrlP remaps
nmap <leader>. <c-p><c-\>f
nmap <c-b> :CtrlPBuffer<cr>

" Python specific settings
let python_highlight_all=1
let g:ycm_python_binary_path = '/usr/bin/python3'

"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate')
"  execfile(activate_this, dict(__file__=activate_this))
" EOF

" flak8
let g:flake8_show_in_gutter=1 
let g:flake8_error_marker='!!' 
let g:flake8_warning_marker='>>'
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
autocmd BufWritePost *.py call Flake8()
