# My vim settings

## Installation

```
rm -fr ~/.vim &&
git clone https://github.com/avakhov/dotvim.git ~/.vim &&
echo "source ~/.vim/vimrc.vim" > ~/.vimrc &&
~/.vim/update_bundles
```

## Update

```
pushd ~/.vim && git pull && ./update_bundles && popd
```
