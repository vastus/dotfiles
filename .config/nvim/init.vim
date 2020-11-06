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

" nerdtree
Plug 'preservim/nerdtree'

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

" lsp

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
