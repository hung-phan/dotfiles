"----------------------------------------------------------------
" Text format 
"----------------------------------------------------------------
set autoindent
set smartindent
set smarttab
set nowrap
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set virtualedit=all
set expandtab
set tw=80
"----------------------------------------------------------------
" General 
"----------------------------------------------------------------
set cf
set ffs=unix,dos,mac
set autoread
set magic
filetype plugin indent on
"----------------------------------------------------------------
" UI 
"----------------------------------------------------------------
set ruler
set nolazyredraw
set backspace=indent,eol,start
set number
set mouse=a
set mousehide
set report=0
set wildmenu
"----------------------------------------------------------------
" Searching 
"----------------------------------------------------------------
set ignorecase
set smartcase
set hlsearch
set incsearch
"----------------------------------------------------------------
" Backup 
"----------------------------------------------------------------
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp
"----------------------------------------------------------------
" command mode
"----------------------------------------------------------------
map <c-o> :NERDTreeToggle<CR>
nmap <F5> :w!<CR>
noremap <leader>o o<Esc>
noremap <leader>d yyp<Esc>
noremap <leader>y "+y
noremap <leader>yy "+Y
noremap <leader>p "+p
nnoremap <c-u> :GundoToggle<CR>
nnoremap <silent> <leader>n :nohlsearch<CR>
"----------------------------------------------------------------
" Autocompletion setting
"----------------------------------------------------------------
"----------------------------------------------------------------
" color
"----------------------------------------------------------------
set t_Co=256
"----------------------------------------------------------------
" Theme
"----------------------------------------------------------------
syntax enable
set background=dark
set term=xterm-256color
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
"----------------------------------------------------------------
" pydiction
"----------------------------------------------------------------
let g:pydiction_location = '.vim/bundle/pydiction/complete-dict'
"----------------------------------------------------------------
" pathogen
"----------------------------------------------------------------
execute pathogen#infect()
"----------------------------------------------------------------
" Rainbow parentheses
"----------------------------------------------------------------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"----------------------------------------------------------------
" Tag bar
"----------------------------------------------------------------
set tags=./tags,tags;/
let g:tagbar_usearrows = 1
nnoremap <c-i> :TagbarToggle<cr>
"----------------------------------------------------------------
" Beautify
"----------------------------------------------------------------
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"----------------------------------------------------------------
" Vundle 
"----------------------------------------------------------------
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'vim-scripts/Gundo'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
Bundle 'majutsushi/tagbar.git'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'rkulla/pydiction'
Bundle 'kevinw/pyflakes-vim.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'gmarik/vundle'
