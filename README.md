# My vim settings

## Installation

```
# vim
rm -fr ~/.vim &&
git clone https://github.com/avakhov/dotvim.git ~/.vim &&
echo "source ~/.vim/vimrc.vim" > ~/.vimrc &&
~/.vim/update_bundles

# neovim
mkdir -p ~/.config &&
git clone https://github.com/avakhov/dotvim.git ~/.config/nvim
```

## Update

```
# vim
pushd ~/.vim && git pull && ./update_bundles && popd

# neovim
pushd ~/.config/nvim && git pull && popd
```
