#!/bin/bash
sudo apt install git build-essential fonts-firacode \
	 neovim perl-doc libjson-perl i3 wget

if ! command -v hugo
then
    wget -O /tmp/hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.125.7/hugo_extended_0.125.7_linux-amd64.deb
    sudo dpkg -i /tmp/hugo.deb
    sudo apt-get -f install
fi

if ! command -v rustup
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi


if [ ! -d /usr/local/go ]
then
    wget -O /tmp/go.tar.gz https://go.dev/dl/go1.22.3.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf /tmp/go.tar.gz
    echo "export PATH=\$PATH:/usr/local/go/bin"
fi
