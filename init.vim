"Auto install vim-plug if not already there.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd vimenter * PlugInstall
endif



"Plugins List
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'

call plug#end()



"Start Nerd Tree Config

autocmd vimenter * NERDTree

"End Nerd Tree Configs

"Start Nerd Tree Key Maps

map <C-n> :NerdTreeToggle<CR>

"End Nerd Tree Key Maps
