#!/usr/bin/env bash
set -ex

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SCRIPT_DIR="$(realpath "$SCRIPT_DIR")"
SRC_DIR="$SCRIPT_DIR/src"

cd ~

mkdir -p .config
test ! -e .config/dotfiles
ln -s "$SCRIPT_DIR" .config/dotfiles

ln -s "$SRC_DIR/zshrc" .zshrc
