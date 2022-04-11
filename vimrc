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
"set mouse=a
set ttyfast
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
Plug 'preservim/nerdcommenter'
Plug 'sickill/vim-monokai'
Plug 'srcery-colors/srcery-vim'
call plug#end()

" Color Scheme
set background=dark
"colorscheme dracula
"colorscheme gruvbox
"colorscheme monokai
colorscheme srcery
"colorscheme deus
if (has("termguicolors"))
    set termguicolors
endif
hi Normal guibg=NONE ctermbg=NONE

" Nerd Commenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" Indent for Special file
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 cindent
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent

" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd vimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let NerdTreeQuitOnOpen=1
map <silent> <F2> : NERDTreeToggle<CR>

" Airline Config
let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline_statusline_ontop=1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme= 'deus'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-w> :bd<CR>

" Setup for indent line
let g:indentLine_char = '|'
set tags=./tags,tags;$HOME

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Source python and c/cpp code
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType c map <buffer> <F9> :w<CR> :!gcc % -o %< && ./%< <CR>
autocmd FileType cpp map <buffer> <F9> :w<CR> :!g++ % -o %< && ./%< <CR>
