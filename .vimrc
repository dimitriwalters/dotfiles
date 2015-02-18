set nocompatible
set mouse=a
set nu
set cursorline
set title
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set pastetoggle=<C-F>
set laststatus=2

set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 750

colorscheme smyck

syntax on

highlight clear SignColumn

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'ctrlp.vim'

Plugin 'majutsushi/tagbar'

Plugin 'bling/vim-airline'

Plugin 'tpope/vim-fugitive'

Plugin 'airblade/vim-gitgutter'

Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'

Plugin 'jeffkreeftmeijer/vim-numbertoggle'

call vundle#end()

filetype plugin indent on

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

nmap <C-T> :TagbarToggle<CR>

nmap <C-O> :NERDTreeToggle<CR>

nmap <C-D> :shell<CR>
