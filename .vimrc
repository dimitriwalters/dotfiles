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
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-commentary'
Plug 'dkprice/vim-easygrep'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'ciaranm/detectindent'

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

" Highlight last character when visually selecting text
set selection=exclusive

" ==== Auto Paste Mode ====

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

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

" Use easygrep replace
nnoremap <Leader>\ :Replace<SPACE>

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

" Smart selection of closest text object
map <Leader>s <Plug>(wildfire-fuel)

" Toggle folding
nmap <Leader>z :set nofoldenable<CR>

" Copy text to clipboard
nmap <Leader>c :.w !pbcopy<CR><CR>
vmap <Leader>c :w !pbcopy<CR><CR>

" Undo changes since last write
nmap <Leader>u :earlier 1f<CR>

" ==== GitGutter Config ====

" Always show column sign
let g:gitgutter_sign_column_always = 1

" Update gutter signs 750ms after typing stops
let g:gitgutter_realtime = 750

" ==== Detect Indent Config ====

autocmd BufRead * DetectIndent

" ==== NERDTree Config ====

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
