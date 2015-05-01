if &compatible
  set nocompatible
end
set shell=/bin/sh
filetype off " required
let mapleader="," " change leader
"----------------------------------------------------------------
" Vim plug
"----------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'rizzatti/dash.vim'
Plug 'ngmy/vim-rubocop', { 'on': 'RuboCop' }
Plug 'esneider/YUNOcommit.vim'
Plug 'flazz/vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'edsono/vim-matchit'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'mxw/vim-jsx'
Plug 'docunext/closetag.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'rhysd/clever-f.vim'
Plug 'matze/vim-move'
Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'luochen1990/rainbow'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'kchmck/vim-coffee-script'
Plug 'bling/vim-airline'
Plug 'gregsexton/gitv'
Plug 'gregsexton/MatchTag'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'guns/vim-clojure-static' , { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'airblade/vim-gitgutter'
Plug 'Lokaltog/vim-easymotion'
Plug 'janko-m/vim-test'

call plug#end()
filetype plugin indent on    " required
"----------------------------------------------------------------
" Text format
"----------------------------------------------------------------
set autoindent
set cindent
set smartindent
set smarttab
set nowrap
scriptencoding utf-8
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
set timeoutlen=250
set history=256                " Number of things to remember in history.
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set ttyfast " Send more characters at a given time.
set ttymouse=xterm " Set mouse type to xterm.
set wildignore+=*.psd,*.o,*.obj,*.min.js
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
map <c-o> :VimFilerExplorer<CR>
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
"clear search hightlight
nnoremap <silent> <space>m :nohlsearch<CR>
"fast jumping for edit
inoremap <C-e> <C-o>$
inoremap <C-h> <C-o>x
inoremap <C-g> <C-a>
" Speed up viewport scrolling
nnoremap <C-e> 6<C-e>
nnoremap <C-y> 6<C-y>
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
" Clojure
autocmd BufNewFile,BufReadPost *.cljx setfiletype clojure
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
" Fugitive
"----------------------------------------------------------------
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :Glog<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gup :Dispatch git fetch && git rebase<CR>
"----------------------------------------------------------------
" Gitv
"----------------------------------------------------------------
nmap <space>gv :Gitv --all<cr>
nmap <space>gV :Gitv! --all<cr>
vmap <space>gV :Gitv! --all<cr>
"----------------------------------------------------------------
" Vimfiler
"----------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', {
        \ 'safe' : 0,
        \ 'auto_expand' : 1,
        \ 'parent' : 0
        \ })

function! s:vimfiler_settings()
  nunmap <buffer> <C-l>
  nunmap <buffer> <C-j>
  nnoremap <buffer> <C-r> <Plug>(vimfiler_redraw_screen)
  nnoremap <silent><buffer><expr> v
        \ vimfiler#do_switch_action('vsplit')
  nnoremap <silent><buffer><expr> s
        \ vimfiler#do_switch_action('split')
endfunction

autocmd FileType vimfiler call s:vimfiler_settings()
"----------------------------------------------------------------
" Ultisnips trigger
"----------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<c-l>"
"----------------------------------------------------------------
" Syntastic
"----------------------------------------------------------------
let g:syntastic_c_checkers=['make','splint']
let g:syntastic_python_checkers=['frosted']
let g:syntastic_javascript_checkers=['jslint']
let g:syntastic_ruby_checkers=['rubocop','mri']
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
" Y U NO commit
"----------------------------------------------------------------
let g:YUNOcommit_after = 20
"----------------------------------------------------------------
" Dash
"----------------------------------------------------------------
nmap <silent> <leader>[ <Plug>DashSearch
nmap <silent> <leader>] <Plug>DashGlobalSearch
"----------------------------------------------------------------
" color
"----------------------------------------------------------------
set t_Co=256
set background=dark
set term=xterm-256color
"----------------------------------------------------------------
" Rainbow
"----------------------------------------------------------------
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['RoyalBlue3', 'darkorange3', 'SeaGreen3', 'firebrick3'],
\   'ctermfgs': ['darkblue', 'darkyellow', 'darkcyan', 'darkmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['RoyalBlue3', 'darkorange3', 'SeaGreen3', 'firebrick3', 'DarkOrchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
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
" Extradite split size
"----------------------------------------------------------------
let g:extradite_width = 84
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
let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'
call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate,grep',
            \ 'max_candidates', 0)
nnoremap <space>y :Unite history/yank<CR>
nnoremap <c-p> :Unite -buffer-name=files -start-insert file_rec/async:!<CR>
nnoremap <space>/ :Unite grep:.<CR>
nnoremap <space>b :Unite -quick-match buffer<CR>
"----------------------------------------------------------------
" Test runner
"----------------------------------------------------------------
let test#strategy = "dispatch"
nmap <silent> <Leader>t :TestNearest<CR>
nmap <silent> <Leader>T :TestFile<CR>
nmap <silent> <Leader>a :TestSuite<CR>
nmap <silent> <Leader>l :TestLast<CR>
nmap <silent> <Leader>g :TestVisit<CR>
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
"colorscheme apprentice
colorscheme jellybeans
"colorscheme hybrid
"colorscheme atom-dark-256
"colorscheme solarized
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
