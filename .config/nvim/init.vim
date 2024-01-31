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

" fuzzy
Plug 'junegunn/fzf', { 'do': { -> 'fzf#install()' } }
Plug 'junegunn/fzf.vim'

" db
Plug 'tpope/vim-dadbod'

" repeat e.g. surround
Plug 'tpope/vim-repeat'

" copilot
Plug 'github/copilot.vim'

" treesitter -- better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

"
" settings
"

" line numbers
set number

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

" fuzzy
nmap <leader>t :Files<CR>

"
" ui
"

" colorscheme pablo
colorscheme default


"
" plugin settings
"

" commentary
autocmd FileType cpp setlocal commentstring=//%s

" gopls
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ensure_installed = { "c", "cpp", "lua", "vim", "help", "javascript", "python", "ruby", "typescript" },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
}
EOF

" lsp

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

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

" show doc / type of word under cursor
" function! ShowDocumentation()
"   if CocAction('hasProvider', 'hover')
"     call CocActionAsync('doHover')
"   else
"     call feedkeys('K', 'in')
"   endif
" endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>

" show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

" find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
