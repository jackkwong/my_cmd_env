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
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

call plug#end()


" ****neovim/nvim-lspconfig****
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-h> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-l> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <F1> <cmd>lua vim.lsp.buf.code_action()<CR>

" ****hrsh7th/nvim-compe****
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

"let g:compe.source.spell = v:true
"let g:compe.source.tags = v:true
"let g:compe.source.snippets_nvim = v:true
"let g:compe.source.treesitter = v:true

" ****habamax/vim-godot****
"let g:godot_executable = '/opt/user_software/Godot_v3.3-stable_mono_x11_64/Godot_v3.3-stable_mono_x11.64'


lua << EOF
require'lspconfig'.gdscript.setup{
on_attach = function (client)
local _notify = client.notify
client.notify = function (method, params)
    if method == 'textDocument/didClose' then
	return
    end
    _notify(method, params)
end
end
}
EOF

func! GodotSettings() abort
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
nnoremap <C-j><C-j> :NERDTreeFind<CR>

" Jump to documentation (by :h)
nnoremap <C-j>h "jyiw:h <C-r>j<CR>
vnoremap <C-j>h "jy:h <C-r>j<CR>

" Reload .vimrc
nnoremap <C-j>R :mapclear<CR>:so ~/.vimrc<CR>:echo "Reloaded ~/.vimrc"<CR>

" Vim Setting
nnoremap <C-j>S :tabnew ~/.vimrc<CR>

let g:zipPlugin_ext= '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.xlam,*.xlsx,*.xlsm,*.xlsb,*.xltx,*.xltm,*.xlam,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx,*.epub,*.apk,*.ipa,*.love'



