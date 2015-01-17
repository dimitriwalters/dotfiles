set nocompatible
set mouse=a
set nu
set cursorline
set title

syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'

call vundle#end()

filetype plugin indent on
