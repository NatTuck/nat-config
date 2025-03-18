#!/bin/bash
sudo apt update -y
#sudo apt upgrade -y
sudo apt install -y git build-essential fonts-firacode \
     neovim perl-doc libjson-perl i3 wget curl jq \
     sway sfwbar swaylock wdisplays \
     wl-mirror wmenu j4-dmenu-desktop

if ! command -v hugo
then
    echo wget -O /tmp/hugo.deb $(bash deps/latest-hugo.sh)
    sudo dpkg -i /tmp/hugo.deb
    sudo apt-get -f install
fi

if [ ! -d /usr/local/go ]
then
    wget -O /tmp/go.tar.gz https://go.dev/dl/go1.22.3.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf /tmp/go.tar.gz
    echo "export PATH=\$PATH:/usr/local/go/bin"
fi

if ! command -v rustup
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

rustup update
cargo install toml-bombadil
