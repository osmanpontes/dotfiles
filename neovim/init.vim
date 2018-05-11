if &shell =~# 'fish$'
    set shell=sh
endif

call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" S to surround code inside visual mode
Plug 'tpope/vim-surround'

" Search Files <C-P>
" Search Text <C-F>
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Find and Replace
Plug 'brooth/far.vim'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" Theme
Plug 'morhetz/gruvbox'

" Comment line 
" normal mode: gcc
" visual mode: gc
Plug 'tpope/vim-commentary'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Lint Engine
Plug 'w0rp/ale'

" Extend text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript'
call plug#end()

" Colorscheme
set background=dark
colorscheme gruvbox
hi Normal ctermbg=none

" Settings
set path+=**
set number
set relativenumber
set ignorecase
set mouse=a

" Tabs
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Mappings
let mapleader = "\<space>"
inoremap jk <esc>

" Tabs
nnoremap <leader>h :tabnext<cr>
nnoremap <leader>l :tabprevious<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>q :tabclose<cr>

" Buffers
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>j :bprevious<cr>
nnoremap <leader>k :bnext<cr>
nnoremap <leader>u :bp <bar> bd #<cr>

nnoremap <leader>n :NERDTreeToggle<cr>

nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

nnoremap <leader>a :execute "Ag" expand("<cword>")<cr>
nnoremap <C-P> :Files<cr>
nnoremap <C-F> :Ag<space>

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

nnoremap <C-S> :w<cr>

inoremap <C-@> <C-P>

tnoremap <esc> <c-\><c-n>
" Update vim configuration
command! SourceInstall edit ~/.config/nvim/init.vim | write | source % | PlugInstall

" Ignore these folders 
set wildignore+=*/node_modules/*

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Deoplete configuration
let g:deoplete#enable_at_startup = 1

" React Syntax in JS files
let g:jsx_ext_required = 0

" NERDTree
let NERDTreeShowHidden=1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

