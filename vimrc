set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set number
set noerrorbells
set wrap
set incsearch
set scrolloff=10
set noswapfile
"set mouse=a         "Uncomment for mouse support
set ttyfast
set signcolumn=yes
"set colorcolumn=80  "Uncomment to draw a colorcolumn
set showtabline=2
set linebreak
syntax enable

call plug#begin("~/.vim/plugged")
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'dracula/vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'gruvbox-community/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'preservim/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sickill/vim-monokai'
Plug 'srcery-colors/srcery-vim'
Plug 'joshdick/onedark.vim'
Plug 'vimwiki/vimwiki'
call plug#end()


" Color Scheme
set background=dark
"colorscheme dracula
" colorscheme gruvbox
"colorscheme monokai
"colorscheme srcery
"colorschem deus
colorscheme onedark
if (has("termguicolors"))
    set termguicolors
endif
hi Normal guibg=NONE ctermbg=NONE


" Indent for Special file
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 cindent
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent


" Open NERDTree by pressing F2
autocmd StdinReadPre * let s:std_in=1
autocmd vimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let NerdTreeQuitOnOpen=1
map <silent> <F2> : NERDTreeToggle<CR>


"Airline Configuration
let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline_statusline_ontop=1
let g:airline#extensions#tabline#formatter = 'default'
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_theme= 'deus'
let g:airline_theme= 'onedark'
let g:airline_symbols = {}
let g:airline_symbols.linenr = ' ⭡ '
let g:airline_symbols.colnr = ' '

" previous buffer
nmap <leader>1 :bp<CR>
" next buffer
nmap <leader>2 :bn<CR>
" delet buffer
nmap <leader>q :bd<CR>
" new buffer
nmap <leader>t :enew<CR>


" Setup for indent line
let g:indentLine_char = '|'
set tags=./tags,tags;$HOME

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Tagbar Configuration
nmap <F8> :TagbarToggle<CR>


" Source python, c/cpp code and bash
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!clear;python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!clear;python3' shellescape(@%, 1)<CR>
autocmd FileType c map <buffer> <F9> :w<CR> :!clear;gcc % -o %< && ./%<<CR>
autocmd FileType cpp map <buffer> <F9> :w<CR> :!clear;g++ % -o %< && ./%<<CR>
autocmd FileType sh map <buffer> <F9> :w<CR> : !chmod +x % && source % <CR>

" Remove white space
autocmd BufWritePre * :%s/\s\+$//e

" Skeleton Code for C
:autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c


" Skeleton Code of CPP
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp


" Skeleton Code of sh
:autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
