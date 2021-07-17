call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'crusoexia/vim-monokai'
Plug 'digitaltoad/vim-pug'
Plug 'flazz/vim-colorschemes'
Plug 'habamax/vim-godot'
Plug 'iago-lito/vim-visualMarks'
Plug 'isRuslan/vim-es6'
Plug 'jeroenbourgois/vim-actionscript'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'keith/swift.vim'
Plug 'leafgarland/typescript-vim'
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
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/matchit.zip'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'OmniSharp/omnisharp-vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-dispatch'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


" ****habamax/vim-godot****

func! GodotSettings() abort
    let g:godot_executable = '/opt/user_software/Godot_v3.3-stable_mono_x11_64/Godot_v3.3-stable_mono_x11.64'
    "setlocal foldmethod=expr
    setlocal tabstop=4
    nnoremap <buffer> <F4> :GodotRunLast<CR>
    nnoremap <buffer> <F5> :GodotRun<CR>
    nnoremap <buffer> <F6> :GodotRunCurrent<CR>
    nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end

" ****vim-airline****
" use powerline fonts if installed, refer to https://github.com/vim-airline/vim-airline#user-content-integrating-with-powerline-fonts
" install fonts on https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1
" ****vim-airline-themes****
let g:airline_theme='minimalist'

" ****fzf****
nnoremap <C-p> :FZF<CR>

" ****vim-session****
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" ****Ctrlp Config****
" ignore these directories for vim ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git'

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
set nofixeol

set nowrap
set mouse=a

" List options for tab autocompletion in command mode
set wildmenu

set history=1000

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

" Jump to documentation (by :h)
nnoremap <C-j>h "jyiw:h <C-r>j<CR>
vnoremap <C-j>h "jy:h <C-r>j<CR>

" Reload .vimrc
nnoremap <C-j>R :mapclear<CR>:so ~/.vimrc<CR>:echo "Reloaded ~/.vimrc"<CR>

" Vim Setting
nnoremap <C-j>S :tabnew ~/.vimrc<CR>

let g:zipPlugin_ext= '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.xlam,*.xlsx,*.xlsm,*.xlsb,*.xltx,*.xltm,*.xlam,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx,*.epub,*.apk,*.ipa,*.love'



