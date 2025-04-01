bash ./nerdfonts.sh

sudo apt install neovim-qt luarocks ripgrep

wget -O /tmp/neovim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
mkdir -p ~/.local
cd ~/.local
tar xzvf /tmp/neovim.tar.gz

cd ~/.local/bin
ln -s ~/.local/nvim-linux-x86_64/bin/nvim .
ln -s ~/.local/nvim-linux-x86_64/bin/nvim ./vim
