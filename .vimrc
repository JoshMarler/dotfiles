"Auto install vim-plug if not already there.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd vimenter * PlugInstall
endif

"Plugins List
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Collection of usable colorschemes
Plug 'flazz/vim-colorschemes'

" Auto completion
" For C++ ensure latest clangd version is installed.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" coc extensions
let g:coc_global_extensions = [
    \'coc-webpack',
    \'coc-prettier',
    \'coc-marketplace',
    \'coc-eslint',
    \'coc-tsserver',
    \'coc-sh',
    \'coc-python',
    \'coc-omnisharp',
    \'coc-markdownlint',
    \'coc-json',
    \'coc-cmake',
    \'coc-clangd'
\]

" Cpp highlight - LSP highlight is currently a mess.
Plug 'bfrg/vim-cpp-modern'

" Search and fuzzy findings
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git support
Plug 'tpope/vim-fugitive'

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
set expandtab           " NO tabs please!
set shiftwidth=4
set softtabstop=0
set smarttab
set nowrap
set hidden
set bs=2
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Enable GDB in vim
packadd termdebug

" If he dies, he dies.
set noswapfile

" Kill trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

set splitbelow "Open splits below

" For quick escape
set timeoutlen=1000 ttimeoutlen=0

" Tab mappings
nnoremap tl :tabnext<CR>
nnoremap th :tabprevious<CR>
nnoremap tc :tabclose<CR>

" Window mappings
nnoremap <leader> h :wincmd h<cr>
nnoremap <leader> j :wincmd j<cr>
nnoremap <leader> k :wincmd k<cr>
nnoremap <leader> l :wincmd l<cr>

" Use escape to clear search highlights
nnoremap <esc> :noh<return><esc>

" needed so that vim still understands escape sequences
nnoremap <esc>^[ <esc>^[

" Quick edit and reload vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>
autocmd BufWritePost .vimrc source $MYVIMRC

" COLOUR SCHEME
set termguicolors
if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
            let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        endif
        let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark

" Cursor Appearance
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

" FZF remaps
nmap <c-b> :Buffers<cr>
nmap <c-p> :History<cr>
nmap <c-g> :GitFiles?<cr>
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" COC RECOMMENDED THINGS.

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
    else
      set signcolumn=yes
      endif

      " Use tab for trigger completion with characters ahead and navigate.
      " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
      " other plugin before putting this into your config.
      inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
                  \ <SID>check_back_space() ? "\<TAB>" :
                        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
      endfunction

      " Use <c-space> to trigger completion.
      if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
      endif

      " Use `[g` and `]g` to navigate diagnostics
      " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
      nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> gh :CocCommand clangd.switchSourceHeader <CR>
  nmap <silent> gs :CocCommand clangd.symbolInfo <CR>
  nmap <leader> e  :CocDiagnostics <CR>

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
          else
              call CocAction('doHover')
                endif
                endfunction

                " Highlight the symbol and its references when holding the cursor.
                autocmd CursorHold * silent call CocActionAsync('highlight')

                " Symbol renaming.
                nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>fo  <Plug>(coc-format-selected)
  nmap <leader>fo  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
      " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
          " Update signature help on jump placeholder.
            autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
            augroup end

            " Applying codeAction to the selected region.
            " Example: `<leader>aap` for current paragraph
            xmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

tnoremap <Esc> <C-\><C-n>
