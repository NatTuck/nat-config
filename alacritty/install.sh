#!/bin/bash

rustup self update
rustup update stable

echo "deb deps:"
sudo apt install cmake pkg-config libfreetype6-dev scdoc \
     libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

mkdir -p ~/Apps/src

cd ~/Apps/src
if [[ ! -e alacritty ]]; then
    git clone https://github.com/alacritty/alacritty
    cd alacritty
else
    cd alacritty
    git pull
fi

cargo build --release


if [[ -e target/release/alacritty ]]; then
    sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
    sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

    sudo mkdir -p /usr/local/share/man/man1
    sudo mkdir -p /usr/local/share/man/man5
    scdoc < extra/man/alacritty.1.scd | gzip -c \
        | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
    scdoc < extra/man/alacritty-msg.1.scd | gzip -c \
        | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
    scdoc < extra/man/alacritty.5.scd | gzip -c \
        | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
    scdoc < extra/man/alacritty-bindings.5.scd | gzip -c \
        | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null

    cp "$(pwd)/extra/completions/alacritty.bash" ~/.config/alacritty/completions.bash
    echo "To install source completions"
    echo 'echo "source ~/.config/alacritty/completions.bash" >> ~/.bashrc'
fi

if [[ ! -e ~/.config/alacritty ]]; then
    cd ~/.config
    ln -s ~/.config/nat-config/alacritty .
fi
