""" Optixal's Neovim Init.vim

""" Vim-Plug
call plug#begin()

" Colors
Plug 'morhetz/gruvbox' 

" Functionalities
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" git 
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" multi cursor
Plug 'mg979/vim-visual-multi'

Plug 'preservim/nerdtree'

call plug#end()



" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c


""" Main Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,full wildmenu
set ruler laststatus=2 showcmd showmode
set listchars=tab:»·,trail:·,extends:»
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set number
set title

""" Keybindings
nnoremap <C-p> :Files<cr>
nnoremap <C-S-p> :Commands<cr>
nnoremap <M-p> :Commands<cr>
nnoremap <C-e> :NERDTreeToggle %<CR>

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
set termguicolors

" Main Coloring Configurations
colorscheme gruvbox
syntax on

