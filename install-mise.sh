#!/bin/bash

mkdir -p ~/Apps/src
cd ~/Apps/src

# Can replace checkout with
# cargo install mise --locked

if [ ! -d mise ]; then
  git clone https://github.com/jdx/mise.git
fi

cd mise
cargo build --release
mkdir -p ~/.local/bin
cp target/release/mise ~/.local/bin/mise

# This requires bash-completion to be installed
mkdir -p ~/.local/share/bash-completion/completions/
mise completion bash --include-bash-completion-lib \
  >~/.local/share/bash-completion/completions/mise
