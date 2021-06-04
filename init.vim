" PLUGINS
call plug#begin("~/.config/nvim/plugged/start")

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" python syntax highlighting stuff (includes support for fstrings)
Plug 'vim-python/python-syntax'
let g:python_highlight_builtins = 1

Plug 'phanviet/vim-monokai-pro'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

Plug 'junegunn/fzf'

Plug 'lervag/vimtex'

Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='simple'

Plug 'nvie/vim-flake8'

Plug 'rust-lang/rust.vim'
filetype plugin indent on


call plug#end()



" COLOR SCHEME
colorscheme monokai_pro

" visual mode color
hi Visual guifg=White guibg=grey gui=none

" transparent
" hi Normal guibg=NONE ctermbg=NONE
" hi NonText guibg=None ctermbg=None

" comment color
hi Comment ctermfg=97

" show line numbers
set rnu


" MAPPINGS

" easily run python files
" :py to run.
cnoremap py<CR> w !python3<CR>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" get to normal mode without pressing ESC
inoremap jk <ESC>
vnoremap jk <ESC>
cnoremap jk <ESC>
inoremap kj <ESC>
vnoremap kj <ESC>
cnoremap kj <ESC>

" press 0 instead of ^ for first character of line
nnoremap 0 ^
nnoremap ^ 0


" edit vimrc
cnoremap rc<CR> e $MYVIMRC<CR>

" toggle nerdtree
cnoremap nt<CR> NERDTreeToggle<CR>
" make nerdtree open in current directory
set autochdir
let NERDTreeChDirMode=2
cnoremap nt<cr> NERDTree .<CR>


" COC Settings

" map TAB to autocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction



" VimTeX Settings

let g:vimtex_compiler_progname = 'nvr'

if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

" Python Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=100
    \| set expandtab
    \| set fileformat=unix

set autoindent
set smartindent

set encoding=utf-8

