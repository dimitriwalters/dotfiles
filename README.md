# dotfiles

The current .vimrc and .vim that I use to code with.

## Install

1. Copy `.vimrc` and `.vim` to root directory
2. Install [vim-plug](https://github.com/junegunn/vim-plug) to install plugins:

  ```sh
  $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

3. Install [ag](https://github.com/ggreer/the_silver_searcher), either from a package manager or from GitHub (it's okay if you don't install, only a few plugins use it):

  ```sh
  $ git clone https://github.com/ggreer/the_silver_searcher ag
  $ cd ag
  $ ./build.sh
  $ sudo make install
  ```

4. Run `:PlugInstall`
5. Optional: For Go development, run `:GoInstallBinaries` (will install binaries in `$GOBIN` or `$GOPATH/bin`)
