" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'fatih/vim-go'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mattn/emmet-vim'

" vundleception
Plugin 'gmarik/Vundle.vim'

" pasting n stuff - yopo
Plugin 'tpope/vim-unimpaired'

" git
" Plugin 'tpope/vim-fugitive'

" parens/braces/apostrophes
Plugin 'tpope/vim-surround'

" all in the name
Plugin 'tpope/vim-rails'

" repeat it
Plugin 'tpope/vim-repeat'

" commenting
Plugin 'vim-scripts/tComment'

" coffee script
Plugin 'kchmck/vim-coffee-script'

" status/tabline
"Plugin 'bling/vim-airline'
" enable it from the get go
"set laststatus=2
" enable powerline fonts
"let g:airline_powerline_fonts = 1
" set theme
"let g:airline_theme='bubblegum'
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"let g:airline_section_x = ''
" /bling/vim-airline

" html5 - indent/syntax
Plugin 'othree/html5.vim'

" js - syntax/indent (req by jsx)
Plugin 'pangloss/vim-javascript'

" js - syntax
"Plugin 'drslump/vim-syntax-js'

" jsx - hilite/syntax
Plugin 'mxw/vim-jsx'

" conceal
Plugin 'calebsmith/vim-lambdify'

" slim syntax
Plugin 'slim-template/vim-slim.git'

" completion
" Plugin 'Valloric/YouCompleteMe'

" ultisnips
" Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" /ultisnips

call vundle#end()            " required, All of your Plugins must be added before the following line
filetype plugin indent on    " required, To ignore plugin indent changes, instead use: filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" /Vundle

" call pathogen#infect()

set exrc
set nowrap
set wildmenu
set nu
syntax on
set mouse=a
set hidden
"set cpoptions+=$
set listchars=tab:▸\ ,eol:¬

" text width
set tw=78

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

" leader
let mapleader = ','

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
  set guifont=Sauce\ Code\ Powerline:h15
  " Disable all blinking:
  :set guicursor+=a:blinkon0
  set showtabline=0
  colo smyck
  " colo idleFingers
  " colo railscasts

  " hilite cursor line
  set cursorline
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
  autocmd BufNewFile,BufRead *.cpp set ts=2 sts=2 sw=2 expandtab smarttab
  autocmd BufNewFile,BufRead *.go set ts=4 sts=4 sw=4 expandtab smarttab
  autocmd BufNewFile,BufRead *.php set ts=4 sts=4 sw=4 expandtab smarttab
  autocmd BufNewFile,BufRead *.js set ts=2 sts=2 sw=2 expandtab smarttab
  autocmd BufNewFile,BufRead *.jade set ts=2 sts=2 sw=2 expandtab smarttab
  autocmd BufNewFile,BufRead *.java set ts=4 sts=4 sw=4 expandtab smarttab
  autocmd BufNewFile,BufRead *.rs set ts=4 sts=4 sw=4 expandtab smarttab
  autocmd BufNewFile,BufRead *.d set ts=4 sts=4 sw=4 expandtab smarttab
endif

au FileType javascript setl conceallevel=2 concealcursor=nc
let g:syntax_js=['function']

