#!/bin/bash
sudo apt update -y
#sudo apt upgrade -y
sudo apt install -y git build-essential fonts-firacode \
	neovim perl-doc libjson-perl i3 wget curl jq \
	sway sfwbar swaylock wdisplays bemenu \
	sway-notification-center swayidle swaybg \
	wl-mirror wmenu j4-dmenu-desktop \
	g++-14 konsole clang clangd rubocop ruby-dev

HUGO=https://github.com/gohugoio/hugo/releases/download/v0.145.0/hugo_extended_0.145.0_linux-amd64.deb

echo "Latest Hugo:"
deps/latest-hugo.sh
echo "Getting Hugo:"
echo $HUGO

if ! command -v hugo; then
	echo wget -O /tmp/hugo.deb $HUGO
	sudo dpkg -i /tmp/hugo.deb
	sudo apt-get -f install
fi

if [ ! -d /usr/local/go ]; then
	wget -O /tmp/go.tar.gz https://go.dev/dl/go1.22.3.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf /tmp/go.tar.gz
	echo "export PATH=\$PATH:/usr/local/go/bin"
fi

if ! command -v rustup; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

rustup update
cargo install toml-bombadil

cargo install --git https://github.com/neovide/neovide

npm install -g @vtsls/language-server
npm install -g eslint
