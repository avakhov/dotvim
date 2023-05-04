# My vim settings

## Installation

```
# vim
rm -fr ~/.vim &&
git clone https://github.com/avakhov/dotvim.git ~/.vim &&
echo "source ~/.vim/vimrc.vim" > ~/.vimrc &&
~/.vim/update_vim_bundles

# neovim
rm -fr ~/.config/nvim &&
git clone https://github.com/avakhov/dotvim.git ~/.config/nvim &&
~/.config/nvim/update_nvim_bundles
```

## Update

```
# vim
pushd ~/.vim && git pull && ./update_vim_bundles && popd

# neovim
pushd ~/.config/nvim && git pull && ./update_nvim_bundles && popd
```
