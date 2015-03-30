" ==== Vim-Plug Setup ====

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ervandew/supertab'
Plug 'terryma/vim-expand-region'
Plug 'Shougo/neocomplcache.vim'
Plug 'fatih/vim-go'
Plug 'rking/ag.vim'
Plug 'briandoll/change-inside-surroundings.vim'

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

" Use ; instead of :
noremap ; :
noremap <M-;> ;

" Move between splits easier
nmap <Leader>j <C-W><C-J>
nmap <Leader>k <C-W><C-K>
nmap <Leader>l <C-W><C-L>
nmap <Leader>h <C-W><C-H>

" Open Tagbar
nmap <Leader>t :TagbarToggle<CR>

" Open NERDTree
nmap <Leader>o :NERDTreeToggle<CR>

" Open command history
nmap <Leader>g q:i

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

" Use CtrlP Plugin
nmap <Leader>p <C-P>

" Grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Use ag
nnoremap \ :Ag<SPACE>

" Jump through search results
nmap <silent> <S-Right> :cnext<CR>
nmap <silent> <S-Left> :cprev<CR>

" Bubble lines 
nnoremap <silent> <C-Up>   :move-2<CR>==
nnoremap <silent> <C-Down> :move+<CR>==
xnoremap <silent> <C-Up>   :move-2<CR>gv=gv
xnoremap <silent> <C-Down> :move'>+<CR>gv=gv

"Duplicate lines above and below
inoremap <C-S-down> <esc>Ypk
nnoremap <C-S-down> Ypk
xnoremap <C-S-down> y`>pgv
inoremap <C-S-up> <esc>YPj
nnoremap <C-S-up> YPj
xnoremap <C-S-up> y`<Pgv

" ==== GitGutter Config ====

" Always show column sign
let g:gitgutter_sign_column_always = 1

" Update gutter signs 750ms after typing stops
let g:gitgutter_realtime = 750

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

" ==== The Silver Searcher Config ====
"
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
