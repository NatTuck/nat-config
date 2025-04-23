#!/bin/bash

if [ ! -d ~/.asdf ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
fi

. "$HOME/.asdf/asdf.sh"

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 20.13.1
asdf global nodejs 20.13.1

sudo apt-get -y install build-essential autoconf m4 libncurses5-dev \
  libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev \
  libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop \
  libxml2-utils libncurses-dev openjdk-11-jdk

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang 26.2.5
asdf global erlang 26.2.5

asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir 1.16.2-otp-26
asdf global elixir 1.16.2-otp-26

apt-get install autoconf patch build-essential rustc libssl-dev \
  libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev \
  libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev libssl-dev

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 3.4.3
asdf global ruby 3.4.3

echo "Add the following to ~/.bashrc:"
echo
echo . "\$HOME/.asdf/asdf.sh"
echo . "\$HOME/.asdf/completions/asdf.bash"
