#!/usr/bin/env bash
set -ex

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SRC_DIR="$SCRIPT_DIR/src"

cd ~

ln -s "$SRC_DIR/zshrc" .zshrc
