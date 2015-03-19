" ==== Vim-Plug Setup ====

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ervandew/supertab'
Plug 'dkprice/vim-easygrep'
Plug 'terryma/vim-expand-region'
Plug 'Shougo/neocomplcache.vim'
Plug 'fatih/vim-go'

call plug#end()

" ==== General Config ====

" Don't lose features by making it compatible with Vi
set nocompatible

" Convenient key for mapping
let mapleader = "\<Space>"

" Allow syntax highlighting
syntax on

" Use custom color scheme
colorscheme smyck

" Enable mouse use
set mouse=a

" Show line number
set number

" Highlight row cursor is on
set cursorline

" Use filename for title
set title

" Always show status line
set laststatus=2

" Use same background as editor for sign column 
highlight clear SignColumn

" Use bash as shell (needed to fix bug in fish-shell)
set shell=/bin/bash

" ==== Auto Paste Mode ====

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" ==== Indentation ====

" Set existing tabs to 4 columns
set tabstop=4

" Use 4 spaces for a tab
set softtabstop=4

" Indent text 4 spaces
set shiftwidth=4 

" Use spaces for tabs
set expandtab

" ==== Mappings ====

" Move between splits easier
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

" Open Tagbar
nmap <Leader>t :TagbarToggle<CR>

" Open NERDTree
nmap <Leader>o :NERDTreeToggle<CR>

" Open command history
nmap <Leader>h q:i

" Use relative line numbers
nmap <Leader>r :set relativenumber<CR>

" Use normal line numbers
nmap <Leader>n :set relativenumber!<CR>:set number<CR>

" Quit
nmap <Leader>q :q<CR>

" Save
nmap <Leader>w :w<CR>

" Set 80 column mark
nmap <Leader>[ :set colorcolumn=80<CR>

" Unset 80 column mark
nmap <Leader>] :set colorcolumn=<CR>

" Expand region selection
vmap v <Plug>(expand_region_expand)

" Shrink region selection
vmap <C-v> <Plug>(expand_region_shrink)

" ==== NERDTree Config ====

" Open NERDTree when Vim starts (not including with a file)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ==== GitGutter Config ====

" Always show column sign
let g:gitgutter_sign_column_always = 1

" Update gutter signs 750ms after typing stops
let g:gitgutter_realtime = 750

" ==== EasyGrep Config ====

" Search subdirectories too
let g:EasyGrepRecursive=1

" ==== CtrlP Config ====

" Don't use caching
let g:ctrlp_use_caching = 0

" Use git to ignore files 
let g:ctrlp_user_command = [
    \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type'
    \ ]

" ==== Neo Compl Cache Config ====

" Use when vim starts
let g:neocomplcache_enable_at_startup = 1

" ==== Vim Go Config ====

" Add additional syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
