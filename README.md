# My vim settings

## Installation

```
cd ~ && rm -fr .vim &&
git clone git://github.com/avakhov/dotvim.git .vim &&
echo "source ~/.vim/vimrc.vim" > .vimrc &&
cd .vim && ./update_bundles
```

## Update

```
cd ~/.vim && git pull && ./update_bundles
```
