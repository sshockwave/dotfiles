#!/usr/bin/env bash
cd ~

rm -f .config/dotfiles
rm -f .zshrc
if test -f .zshrc_local
then
  mv .zshrc_local .zshrc
fi
rm -f .condarc
rm -f .zsh_history
rm -f .bash_history
rm -f .python_history
