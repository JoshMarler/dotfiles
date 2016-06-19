"Auto install vim-plug if not already there.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd vimenter * PlugInstall
endif



"Plugins List
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
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

"Nvim terminal settings

"Set escape key mapping to exit terminal
:tnoremap <Esc> <C-\><C-n>

"Appearance/Display
set background=dark
colorscheme solarized

map <F5> :e %:p:s,.h$,.X123X, :s,.cpp$,.h:s,.X123X$,.cpp,<CR>

"Nerd Tree Settings
autocmd vimenter * NERDTree
map <C-n> :NerdTreeToggle<CR>

"YCM Settings
let g:ycm_autoclose_preview_window_after_insertion = 1

