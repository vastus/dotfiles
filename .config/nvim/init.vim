call plug#begin('~/.local/share/nvim/plugged')

" lsp
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" surround
Plug 'tpope/vim-surround'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" comments
Plug 'tpope/vim-commentary'

" git
Plug 'tpope/vim-fugitive'

call plug#end()


"
" settings
"

" line numbers
set number
set relativenumber

" enable mouse
set mouse=a

" case insensitive search
set ignorecase

" smart case sensitivity when searching
set smartcase

" allow leaving buffer when unsaved
set hidden


"
" mappings
"

let mapleader = ','

" source nvim config
nmap <leader>ev :e ~/.config/nvim/init.vim<CR>
nmap <leader>sv :w ~/.config/nvim/init.vim \| :source ~/.config/nvim/init.vim<CR>

" next/prev buffer
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>

" moving b/w windows
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l

" window scrolling
noremap <C-j> <C-e>
noremap <C-k> <C-y>

" hl search
nnoremap <silent> <space> :set hlsearch! hlsearch?<CR>

" project specific config
set exrc

" enable secure b/c of enabling exrc
set secure


"
" ui
"

colorscheme pablo


"
" plugin settings
"

" commentary
autocmd FileType cpp setlocal commentstring=//%s
