set nocompatible
set shell=/bin/sh
filetype off " required
let mapleader="," " change leader
"----------------------------------------------------------------
" Vundle
"----------------------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Other bundles
Plugin 'flazz/vim-colorschemes'
Bundle 'mattn/emmet-vim'
Bundle 'int3/vim-extradite'
Bundle 'gregsexton/MatchTag'
Bundle 'sheerun/vim-polyglot'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'godlygeek/tabular'
Bundle 'edsono/vim-matchit'
Bundle 'marijnh/tern_for_vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'Chiel92/vim-autoformat'
Bundle 'mxw/vim-jsx'
Bundle 'docunext/closetag.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'rhysd/clever-f.vim'
Bundle 'matze/vim-move'
Bundle 'majutsushi/tagbar.git'
Bundle 'Raimondi/delimitMate'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'rkulla/pydiction'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'vim-scripts/Gundo'
Bundle 'bling/vim-airline'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-fireplace'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-clojure-highlight'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'thoughtbot/vim-rspec'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"----------------------------------------------------------------
" Text format
"----------------------------------------------------------------
set autoindent
set cindent
set smartindent
set smarttab
set nowrap
set encoding=utf-8 nobomb
set tabstop=2
set shiftwidth=2
set virtualedit=all
set expandtab
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set nostartofline " Don't reset cursor to start of line when moving around.
set wrapscan " Searches wrap around end of file
"----------------------------------------------------------------
" General
"----------------------------------------------------------------
set cf
set hidden
set ffs=unix,dos,mac
set autoread
set magic
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set ttyfast " Send more characters at a given time.
set ttymouse=xterm " Set mouse type to xterm.
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set ofu=syntaxcomplete#Complete " Set omni-completion method.
syntax enable
"----------------------------------------------------------------
" UI
"----------------------------------------------------------------
set ruler
set nolazyredraw
set backspace=indent,eol,start
set number
set mouse=a
set mousehide
set laststatus=2
set report=0
set wildmenu
set wildmode=full
set cursorline "Highligh current line"
set esckeys " Allow cursor keys in insert mode.
set visualbell " Use visual bell instead of audible bell (annnnnoying)
"set showtabline=2 " Always show tab bar.
set title
hi TabLine      guifg=#333 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
hi TabLineSel   guifg=#666 guibg=#222 gui=bold ctermfg=231 ctermbg=235 cterm=bold
hi TabLineFill  guifg=#999 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
" font
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h15
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
set viminfo+=n~/.vim/info/viminfo
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp
"----------------------------------------------------------------
" command mode
"----------------------------------------------------------------
map <c-o> :NERDTreeTabsToggle<CR>
imap <c-c> <ESC>
nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>
"tab controler
nmap <space>] :tabn<CR>
nmap <space>[ :tabp<CR>
nmap <space>n :tabnew<CR>
nmap <CR> o<Esc>
"copy key binding
noremap <space>d yyp<Esc>
noremap <leader>y "+y
noremap <leader>yy "+Y
noremap <leader>p "+P
"formatting
noremap <leader>f gg=G
nnoremap < <<
nnoremap > >>
"file history
nnoremap <space>g :GundoToggle<CR>
"clear search hightlight
nnoremap <silent> <space>m :nohlsearch<CR>
"fast jumping for edit
inoremap <C-e> <C-o>$
inoremap <C-h> <C-o>x
inoremap <C-g> <C-o>dw
inoremap <C-b> <C-a>
" Speed up viewport scrolling
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>
" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" remove gap between line quickly
nnoremap <S-s> <S-j>

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif
"force to write file
noremap <leader>W :w !sudo tee %<CR>

" Toggle show tabs and trailing spaces (,c)
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>t :set nolist!<CR>

"map key for page
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

set relativenumber " Use relative line numbers. Current line is still in status bar.
au BufReadPost,BufNewFile * set relativenumber

" Auto close scratch preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"----------------------------------------------------------------
" Syntax completion
"----------------------------------------------------------------
" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript
" Jade
au BufRead,BufNewFile *.jade set ft=jade syntax=jade
" Common Ruby files
au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby
" Nu
au BufNewFile,BufRead *.nu,*.nujson,Nukefile setf nu
" Coffee Folding
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
" ZSH
au BufRead,BufNewFile .zsh_rc,.functions,.commonrc set ft=zsh
"----------------------------------------------------------------
" easymotion
"----------------------------------------------------------------
nmap <leader><leader>s <Plug>(easymotion-s2)
nmap <leader><leader>t <Plug>(easymotion-t2)
map  <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
map  <leader><leader>n <Plug>(easymotion-next)
map  <leader><leader>N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1
" easy-motion color
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Normal
"----------------------------------------------------------------
" Emmet
"----------------------------------------------------------------
let g:user_emmet_leader_key='<C-z>'
"----------------------------------------------------------------
" Ultisnips trigger
"----------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<c-l>"
"----------------------------------------------------------------
" Syntastic
"----------------------------------------------------------------
let g:syntastic_c_checkers=["make","splint"]
let g:syntastic_python_checkers=['frosted']
let g:syntastic_javascript_checkers=['jslint']
let g:syntastic_sh_checkers=['sh']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_loc_list_height=5
"----------------------------------------------------------------
" Swap line function
"----------------------------------------------------------------
let g:move_key_modifier = 'S'
"----------------------------------------------------------------
" Multicursor mode
"----------------------------------------------------------------
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"----------------------------------------------------------------
" color
"----------------------------------------------------------------
set t_Co=256
set background=dark
set term=xterm-256color
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
" javascript library completion
"----------------------------------------------------------------
let g:used_javascript_libs = 'underscore,backbone,jquery,angularjs,requirejs,jasmine,sugar,prelude'
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
autocmd BufReadPre *.js let b:javascript_lib_use_requirejs= 1
autocmd BufReadPre *.js let b:javascript_lib_use_jasmine = 1
autocmd BufReadPre *.js let b:javascript_lib_use_sugar = 1
"----------------------------------------------------------------
" Ruby code autocomplete
"----------------------------------------------------------------
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"----------------------------------------------------------------
" Beautify
"----------------------------------------------------------------
noremap <F3> :Autoformat<CR><CR>
"----------------------------------------------------------------
" Tabularize
"----------------------------------------------------------------
nnoremap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nnoremap <Leader>: :Tabularize /:\zs<CR>
vmap <Leader>: :Tabularize /:\zs<CR>
"----------------------------------------------------------------
" Extradite split size
"----------------------------------------------------------------
let g:extradite_width = 84
"----------------------------------------------------------------
" Ragtag
"----------------------------------------------------------------
let g:ragtag_global_maps = 1
"----------------------------------------------------------------
" Numbers
"----------------------------------------------------------------
nnoremap <F4> :NumbersToggle<CR>
"----------------------------------------------------------------
" Vim markdown
"----------------------------------------------------------------
let g:vim_markdown_folding_disabled=1
"----------------------------------------------------------------
" Powerline
"----------------------------------------------------------------
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"----------------------------------------------------------------
" Unite
"----------------------------------------------------------------
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_rec_max_cache_files = 0
call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate,grep',
            \ 'max_candidates', 0)
nnoremap <space>y :Unite history/yank<CR>
nnoremap <c-p> :Unite -buffer-name=files -start-insert file_rec/async:!<CR>
nnoremap <space>/ :Unite grep:.<CR>
nnoremap <space>b :Unite -quick-match buffer<CR>
"----------------------------------------------------------------
" Rspec
"----------------------------------------------------------------
map <Leader>t :Dispatch rspec %<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()%<CR>
map <leader>a :Dispatch rspec<CR>
"----------------------------------------------------------------
" Rails shortcut
"----------------------------------------------------------------
map <leader>b :Dispatch bundle install<CR>
map <leader>m :Dispatch rake db:migrate<CR>
map <leader>mb :Dispatch rake db:rollback<CR>
map <leader>r :Rserver!<CR>
map <leader>c :Rails console<CR>
"----------------------------------------------------------------
" Theme
"----------------------------------------------------------------
"colorscheme lucius
"colorscheme bubblegum
colorscheme apprentice
"colorscheme jellybeans
"----------------------------------------------------------------
" Tmux config
"----------------------------------------------------------------
" allows cursor change in tmux mode
if exists('$TMUX')
    set t_ut=
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    set clipboard+=unnamed
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
