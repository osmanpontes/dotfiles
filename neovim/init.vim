if &shell =~# 'fish$'
    set shell=sh
endif

call plug#begin()

Plug 'tpope/vim-sensible'

" Syntax
Plug 'sheerun/vim-polyglot'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Show color preview in CSS file
Plug 'ap/vim-css-color'

" Lint Engine
" Plug 'dense-analysis/ale'

Plug 'scrooloose/nerdtree'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'

" Auto complete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Substitute keeping original case
Plug 'tpope/vim-abolish'

" Debugger
Plug 'puremourning/vimspector'

" S to surround code inside visual mode
Plug 'tpope/vim-surround'

" Search Files <C-P>
" Search Text <C-F>
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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

" Show git information
Plug 'airblade/vim-gitgutter'

" Emmet
Plug 'mattn/emmet-vim'

" Extend text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript'

" Icons
Plug 'ryanoasis/vim-devicons'
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
set smartcase
set mouse=a
" Neovim default is 'set autoread'
" set autoread
" set noautoread

" Tabs
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" vim-commentary
autocmd FileType sql setlocal commentstring=--\ %s

" Cursor max right is the last character
set virtualedit=none

" Mappings
let mapleader = "\<space>"
inoremap jk <esc>

" Tabs
nnoremap <leader>l :tabnext<cr>
nnoremap <leader>h :tabprevious<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>q :tabclose<cr>

" Buffers
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>j :bprevious<cr>
nnoremap <leader>k :bnext<cr>
nnoremap <leader>u :bp <bar> bd #<cr>

" CoC extensions
let g:coc_global_extensions = [
\  'coc-vimlsp',
\  'coc-highlight',
\  'coc-lists',
\  'coc-snippets',
\  'coc-json',
\  'coc-xml',
\  'coc-yaml',
\  'coc-toml',
\  'coc-html',
\  'coc-css',
\  'coc-markdownlint',
\  'coc-sh',
\  'coc-sql',
\  'coc-pyright',
\  'coc-rust-analyzer',
\  'coc-tsserver',
\  'coc-eslint',
\  'coc-prettier'
\]

" CoC config
nmap <silent> <leader>M <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>m <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ CheckBackspace() ? "\<TAB>" :
"       \ coc#refresh()
" let g:coc_snippet_next = '<tab>'

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Remap keys for applying code actions at the cursor position
nmap <leader>cac <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>cas <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>cqf <Plug>(coc-fix-current)
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
" Run the Code Lens action on the current line
" codelens not working yet
" nmap <leader>cl <Plug>(coc-codelens-action)

" NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>
" nnoremap <leader>m :ALENext<cr>

" GitGutter
nnoremap <leader>gg :GitGutter<cr>
nnoremap <leader>gn :GitGutterNextHunk<cr>

" Vim source files
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" Search
nnoremap <leader>a :execute "Ag" expand("<cword>")<cr>
nnoremap <C-P> :Files<cr>
nnoremap <C-F> :Ag<space>

" Change panes
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" Move lines
nnoremap <C-A-j> :m .+1<CR>==
nnoremap <C-A-k> :m .-2<CR>==
inoremap <C-A-j> <Esc>:m .+1<CR>==gi
inoremap <C-A-k> <Esc>:m .-2<CR>==gi
vnoremap <C-A-j> :m '>+1<CR>gv=gv
vnoremap <C-A-k> :m '<-2<CR>gv=gv

" Debugger Vimspector
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dj <Plug>VimspectorStepOver
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dr :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dB :call vimspector#ClearBreakpoints()<CR>
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
let g:vimspector_sign_priority = {
\  'vimspectorBP': 100,
\ }
let g:vimspector_install_gadgets = ['CodeLLDB', 'vscode-js-debug']

" Copy file path to clipboard
nmap <leader>f :let @+ = @%<cr>
nmap <leader>ff :let @+ = expand("%:p")<cr>

" Save file
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
" Ignored files in NERDTree
let NERDTreeIgnore=['\.pyc$']

" ALE
" let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'css': ['prettier'],
" \   'json': ['prettier'],
" \   'rust': ['rustfmt'],
" \}
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'sh': ['bashate'],
" \   'rust': ['cargo'],
" \}
" let g:ale_linters_explicit = 0
" let g:ale_fix_on_save = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

" Configure list
set listchars=tab:→\ ,trail:␣,extends:…,eol:⏎
