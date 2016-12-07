call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'crusoexia/vim-monokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-pug'
Plug 'flazz/vim-colorschemes'
Plug 'iago-lito/vim-visualMarks'
Plug 'itchyny/lightline.vim'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

call plug#end()

" ****vim-session****
let g:session_autosave = 'no'
let g:session_autoload = 'no'


" ****Status Line (lightline) Config****
set laststatus=2
if !has('gui_running')
    set t_Co=256
endif

" ****Indentation Config****
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
set softtabstop=4
" On pressing tab, insert 4 spaces
set expandtab

set backspace=2

set nowrap
set mouse=a

" List options for tab autocompletion in command mode
set wildmenu

" source .vimrc in working directory if the file exists
set exrc
set secure

" set default color scheme
colorscheme monokain

"Display special characters
set list
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\

"EJS syntax highlight
au BufNewFile,BufRead *.ejs set filetype=html

set nu
set hlsearch

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Execute in bash
"nmap <C-M> :.w !bash<CR>
"vmap <C-M> :w !bash<CR>
nnoremap <C-j><CR> :.w !bash<CR>
vnoremap <C-j><CR> :w !bash<CR>

" Exact search with selected pattern
vnoremap <C-j>/ y:let @" = substitute(@", '/', '\\/', 'g')<CR>/\M<C-r>"<CR>

nnoremap <C-j><C-n> :NERDTreeToggle<CR>
nnoremap <C-j><C-S-j> :NERDTreeFind<CR>

" Reload .vimrc
nnoremap <C-j>R :mapclear<CR>:so ~/.vimrc<CR>:echo "Reloaded ~/.vimrc"<CR>

" Vim Setting
nnoremap <C-j>S :tabnew ~/.vimrc<CR>
