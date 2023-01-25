#!/usr/bin/env bash
set -ex

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SCRIPT_DIR="$(realpath "$SCRIPT_DIR")"

cd ~

mkdir -p .config
test ! -e .config/dotfiles
ln -s "$SCRIPT_DIR/src" .config/dotfiles

SRC_DIR="${HOME}/.config/dotfiles/"

ln -s "$SRC_DIR/zshrc" .zshrc
ln -s "$SRC_DIR/condarc.yml" .condarc
