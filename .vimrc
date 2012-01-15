set nocompatible

colors desert
set sw=4
set ts=4
set number
set expandtab
set hlsearch
set noswapfile
set smartcase
set hidden
set nobackup
set ai
set wildmode=longest,list
set modeline
set formatoptions=tcq
set ignorecase

set fileformats=unix
set encoding=utf8
set fileencodings=ascii,utf-8,euc-jp,sjis,cp932,latin1
set tags=./tags;
set laststatus=2
"set guioptions=ac
set iskeyword=@,48-57,_,-,192-255

set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
set nowrap                      " do not wrap lines
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set smartindent                 " smart autoindenting when starting a new line
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set grepprg=grep\ -nH\ $*
let g:tex_flavor="latex"
inoremap jk <esc>
inoremap kj <esc>

set nocompatible
" disable default debian filetypes
filetype plugin on 
filetype indent on

highlight Cursor guifg=white guibg=black
" ===== Haskell mode ==================================================

" Edit gpg-encrypted ascii-armoured files
autocmd! BufReadPre,FileReadPre      *.asc  set bin
autocmd  BufReadPost,FileReadPost    *.asc  '[,']!gpg -q -d
autocmd  BufReadPost,FileReadPost    *.asc  set nobin
autocmd! BufWritePre,FileWritePre    *.asc  set bin
autocmd  BufWritePre,FileWritePre    *.asc  '[,']!gpg -e
autocmd  BufWritePost,FileWritePost  *.asc  undo
autocmd  BufWritePost,FileWritePost  *.asc  set nobin
"
"-------------------------------------------------------------------------------
" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
"
"
" Ruby auto completion

"autocmd FileType ruby,eruby set
"set omnifunc=rubycomplete#Complete
set completeopt=menu,menuone
" maps
map gn :nohlsearch
map gl :set nowrap
map gL :set wrap
map gp :set paste
map gP :set nopaste
map gi :wall:!run-install-upwards
map sp :w!<CR>:!aspell -e -c --sug-mode=ultra %<CR>:e! %<CR>
map ,m :make<CR>
" par on curent para, current para w/ params, and quote to mark a w/ params
map ** {!}par}
map *s :1,/^--This line, and those below, will be ignored--$/-1!par<CR>

" ^W - instant move to next window
map  

" Q - record
noremap Q q

" q - quit
" qq - quit
" qQ - force quit
" qa - force quit all
" qA - force quit all
" move to previous/next files
map  :next
map  :previous

map gd :set fileformats=unix,dos:e

map gt :set ts=
map gT :set sw=

map gN :cnext
map gE :cwindow

map gs :w
map gS :wall
map go {j!}sort

au Bufenter *.hs compiler ghc
let g:ghc="/usr/bin/ghc"
syntax on
let g:haddock_browser = "/usr/bin/firefox"
let g:haddock_docdir = "/usr/share/doc/ghc6-doc/html/libraries/"

noremap gw *


" ===== Abbr's ==================================================
"

abbr -! ----------------------------------------------------------------------
if has ("gui_running")
    set guifont=terminus
    colorscheme desert
    colors desert
endif
colorscheme desert

au BufNewFile,BufRead *.hs map <buffer> <C-H> :Hoogle 
au BufNewFile,BufRead *.hs map <buffer> <C-H><C-H> :HoogleClose<CR>
au BufWritePost *.hs silent !(find . -name '*.hs' -exec lushtags --ignore-parse-error {} \; | LC_ALL=C sort -o ./tags --) &
au BufNewFile,BufRead *.p2 setfiletype haskell

nmap <F8> :TagbarToggle<CR>
"noremap <silent> <C-]> :FufTagWithCursorWord!<CR>
nnoremap <silent> ,t :FufTag!<CR>
nmap <silent> ,b :FufBuffer<CR>
nmap <silent> ,e :<C-u>FufFile **/<CR>
