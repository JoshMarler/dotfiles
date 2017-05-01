"Auto install vim-plug if not already there.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd vimenter * PlugInstall
endif



"Plugins List
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'critiqjo/lldb.nvim'

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

"Nvim terminal settings

"Set escape key mapping to exit terminal
:tnoremap <Esc> <C-\><C-n>

"Appearance/Display
set bg=dark
colorscheme solarized

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

"YCM Settings
let g:ycm_autoclose_preview_window_after_insertion = 1

