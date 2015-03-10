# dotfiles

The current .vimrc and .vim directory that I use to code with.

## Install

1. Copy `.vimrc` and `.vim` to root directory
2. Install `vim-plug`:

  ```sh
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

3. Run `:PlugInstall`
4. Optional: For Go development, run `:GoInstallBinaries` (will install binaries in `$GOBIN` or `$GOPATH/bin`)
