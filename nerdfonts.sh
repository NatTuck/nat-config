
export F1="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip"
export F2="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip"

function install_font {
    rm -f /tmp/font.zip
    wget -O /tmp/font.zip "$1"
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts
    unzip -j -n /tmp/font.zip
}

install_font "$F1"
install_font "$F2"
