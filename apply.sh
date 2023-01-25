#!/usr/bin/env bash
set -ex

function try_ln {
  # try_ln <src> <dest>
  if test -L "$2"
  then
    src="$(realpath "$1")"
    dst="$(realpath "$2")"
    if test "$src" = "$dst"
    then
      return 0
    else
      return 1
    fi
  fi
  if test -e "$2"
  then
    return 1
  fi
  mkdir -p "$(dirname "$2")"
  ln -s "$1" "$2"
  return 0
}

function force_ln_file {
  rm -f "$2"
  mkdir -p "$(dirname "$2")"
  ln -s "$1" "$2"
}

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SCRIPT_DIR="$(realpath "$SCRIPT_DIR")"

cd ~

SRC_DIR="${HOME}/.config/dotfiles"
try_ln "$SCRIPT_DIR/src" "$SRC_DIR"

if ! try_ln "$SRC_DIR/zshrc.sh" .zshrc
then
  test ! -e .zshrc_local
  mv .zshrc .zshrc_local
  ln -s "$SRC_DIR/zshrc.sh" .zshrc
fi

try_ln "$SRC_DIR/condarc.yml" .condarc
force_ln_file /dev/null .zsh_history
force_ln_file /dev/null .bash_history
force_ln_file /dev/null .python_history

set +x

echo
echo ========================================
echo Success!
