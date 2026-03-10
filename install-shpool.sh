cargo install shpool
curl -fLo "${XDG_CONFIG_HOME:-$HOME/.config}/systemd/user/shpool.service" --create-dirs https://raw.githubusercontent.com/shell-pool/shpool/master/systemd/shpool.service
sed -i "s|/usr|$HOME/.cargo|" "${XDG_CONFIG_HOME:-$HOME/.config}/systemd/user/shpool.service"
curl -fLo "${XDG_CONFIG_HOME:-$HOME/.config}/systemd/user/shpool.socket" --create-dirs https://raw.githubusercontent.com/shell-pool/shpool/master/systemd/shpool.socket
systemctl --user enable shpool
systemctl --user start shpool
loginctl enable-linger
