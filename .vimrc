set nocompatible
set mouse=a
set nu
set cursorline
set title

set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

colorscheme smyck

syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'ctrlp.vim'

Plugin 'majutsushi/tagbar'

Plugin 'bling/vim-airline'

call vundle#end()

filetype plugin indent on

autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

nmap <C-T> :TagbarToggle<CR>
