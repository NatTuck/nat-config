
# bash -ci "$(wget -qO - 'https://shlink.makedeb.org/install')"

mkdir -p /tmp/mpr
cd /tmp/mpr

git clone https://mpr.makedeb.org/neovim
cd neovim/
makedeb -si
