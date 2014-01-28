call pathogen#infect()
set nowrap
set wildmenu
set nu
syntax on
set mouse=a
set hidden
"set cpoptions+=$
set listchars=tab:▸\ ,eol:¬

" show tabline
set showtabline=2

" tabs
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" search opts
set hlsearch
set incsearch
set ignorecase
set smartcase

" mappings
nnoremap <silent> <space> :set hlsearch! hlsearch?<CR>

" show list chars
nmap ,sl :set list!<CR>

" editing and sourcing
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

imap <C-l> <SPACE>=><SPACE>
imap <C-o> <ESC>o

" swap ^E to ^J
"      ^Y to ^K
noremap <C-j> <C-e>
noremap <C-k> <C-y>

" next/prev buffer
nmap <silent> <C-p> :bp<CR>
nmap <silent> <C-n> :bn<CR>

" windows
nmap ,h <C-W>h
nmap ,j <C-W>j
nmap ,k <C-W>k
nmap ,l <C-W>l

" toggle pasting with info
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" nerdtree
map ,n :NERDTree<CR>

" no need for .gvimrc :)
if has('gui_running')
  set encoding=utf-8
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  " set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
  " colo idleFingers
  colo railscasts
else
  " colo desertEx
end

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype plugin indent on
   
  " Gemfile as ruby
  autocmd FileType Gemfile setfiletype ruby
  autocmd BufNewFile,BufRead Gemfile setfiletype ruby
   
  " Treat .rss as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  " Set QML filetype
  autocmd BufNewFile,BufRead *.qml setfiletype qml

  " Set jst/ejs filetype
  autocmd BufNewFile,BufRead *.ejs setfiletype jst
  autocmd BufNewFile,BufRead *.jst setfiletype jst

  " Set scala filetype
  " autocmd BufNewFile,BufRead *.scala setfiletype scala

  " Set tab to 4 spaces in .py/.c/.h/.cpp/.go/.php files
  autocmd BufNewFile,BufRead *.py set ts=4 sts=4 sw=4 expandtab smarttab
  autocmd BufNewFile,BufRead *.c set ts=4 sts=4 sw=4 expandtab smarttab
  autocmd BufNewFile,BufRead *.h set ts=4 sts=4 sw=4 expandtab smarttab
  autocmd BufNewFile,BufRead *.cpp set ts=4 sts=4 sw=4 expandtab smarttab
  autocmd BufNewFile,BufRead *.go set ts=4 sts=4 sw=4 expandtab smarttab
  autocmd BufNewFile,BufRead *.php set ts=4 sts=4 sw=4 expandtab smarttab
  autocmd BufNewFile,BufRead *.js set ts=4 sts=4 sw=4 expandtab smarttab
  autocmd BufNewFile,BufRead *.jade set ts=2 sts=2 sw=2 expandtab smarttab
  autocmd BufNewFile,BufRead *.java set ts=4 sts=4 sw=4 expandtab smarttab
endif
