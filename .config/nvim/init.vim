" basics
set nocompatible            " Disable compatibility to old-time vim
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=0                  " set an 80 column border for good coding style

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required

" usability
Plugin 'VundleVim/Vundle.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'wesQ3/vim-windowswap'
Plugin 'w0rp/ale'
" code
Plugin 'Townk/vim-autoclose'
Plugin 'majutsushi/tagbar'

Plugin 'fatih/vim-go' 
Plugin 'godoctor/godoctor.vim' 

Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-go'
Plugin 'jodosha/vim-godebug' " Debugger integration via delve
Plugin 'takac/vim-hardtime'
Plugin 'Chiel92/vim-autoformat'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" html
"" HTML Bundle
Plugin 'hail2u/vim-css3-syntax'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'tpope/vim-haml'
Plugin 'mattn/emmet-vim'
Plugin 'hzchirs/vim-material'

" javascript
"" Javascript Bundle
Plugin 'jelera/vim-javascript-syntax'


" php
"" PHP Bundle
Plugin 'arnaud-lb/vim-php-namespace'


"*****************************************************************************
"*****************************************************************************

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on  " allows auto-indenting depending on file type

syntax on
colorscheme nord
set background=dark

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_skip_empty_sections = 1

" nerdtree settings
map <silent> <C-n> :NERDTreeToggle<CR>

" enable airline tabs
let g:airline#extensions#tabline#enabled = 1

" tagbar
map <silent> <C-t> :TagbarToggle<CR>

" deoplete(autocomplete module)
"let g:deoplete#enable_at_startup = 1

" deoplete maps
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" auto close preview tab
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" remap c+p cause of tags
let g:go_def_mapping_enabled=0

" lint delay
let g:ale_lint_delay = 500

" no search highligh
set nohlsearch

" vim hardmode
"let g:hardtime_default_on = 1
