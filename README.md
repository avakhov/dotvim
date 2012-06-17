# My vim settings

## Installation

```
  pushd ~
    rm -fr .vim
    git clone git://github.com/avakhov/dotvim.git
    echo "source ~/.vim/vimrc.vim" > .vimrc
    pushd .vim
      ./update_bundles
    popd
  popd
```

## Update

```
  cd ~/.vim && git pull && ./update_bundles
```

