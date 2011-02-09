#!/bin/sh

#Usage
#
# bash < <( curl  https://github.com/boundlessdreamz/dotfiles/raw/master/setup_env.sh )

cd $HOME
wget --no-check-certificate https://github.com/boundlessdreamz/dotfiles/raw/master/vim_minimal
wget --no-check-certificate  https://github.com/boundlessdreamz/dotfiles/raw/master/screenrc
mv vim_minimal .vimrc
mv screenrc .screenrc
