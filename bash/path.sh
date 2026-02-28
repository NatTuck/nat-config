#!/bin/bash

add_to_path() {
  local dir="$1"
  if [ -d "$dir" ]; then
    export PATH="$dir:$PATH"
  fi
}

add_to_path "/usr/local/go/bin"
add_to_path "$HOME/.luarocks/bin"
add_to_path "$HOME/.fzf/bin"
add_to_path "$HOME/.local/bin"

if [ -e "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"
fi

if [ -e "$HOME/.asdf/completions/asdf.bash" ]; then
  . "$HOME/.asdf/completions/asdf.bash"
fi

if [ -e "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
