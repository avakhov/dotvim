# My vim settings

## Installation

```
# ro
rm -fr ~/.vim &&
git clone https://github.com/avakhov/dotvim.git ~/.vim &&
echo "source ~/.vim/vimrc.vim" > ~/.vimrc &&
~/.vim/update_vim_bundles

# rw
rm -fr ~/.vim &&
git clone git@github.com:avakhov/dotvim.git ~/.vim &&
echo "source ~/.vim/vimrc.vim" > ~/.vimrc &&
~/.vim/update_vim_bundles
```

## Update

```
# vim
pushd ~/.vim && git pull && ./update_bundles && popd
```
