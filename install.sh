#!/usr/bin/env bash

set -e

echo "====================================="
echo " i3-Debian Main Installer"
echo " Debian 13"
echo "====================================="

sudo apt update
sudo apt full-upgrade -y

PACKAGES=(

# Build

build-essential
git
curl
wget
unzip
cmake
meson
ninja-build
pkg-config

# Xorg

xorg
xorg-dev
xinput
xbacklight
xdotool
dbus-x11

# WM

i3
sxhkd
polybar
rofi
dunst
picom
feh

# File Manager

thunar
thunar-volman
thunar-archive-plugin
gvfs
gvfs-backends

# Audio

pipewire-audio
pamixer
pulsemixer
pavucontrol
playerctl

# Network / Power

network-manager-gnome
lxpolkit
xfce4-power-manager
acpi
acpid

# Utilities

flameshot
xclip
xsel
jq
light
gsimplecal
qimgv
fd-find
ripgrep
fzf
bat
tree
zoxide

# Music

mpd
mpc
ncmpcpp
mpg123
ffmpeg

# Bluetooth

blueman
bluez

# Terminal / Shell

zsh
eza

# Display Manager

lightdm
lightdm-gtk-greeter

# Theme Dependencies

sassc
gtk2-engines-murrine
gtk2-engines-pixbuf

# Misc

timeshift
python3-pip
)

sudo apt install -y "${PACKAGES[@]}"

echo
echo "[+] Enabling Services"

sudo systemctl enable NetworkManager
sudo systemctl enable acpid
sudo systemctl enable lightdm
sudo systemctl enable bluetooth
sudo systemctl enable avahi-daemon

echo
echo "[+] Installing Autotiling"

pip3 install --user autotiling || true

echo
echo "[+] Installing JetBrainsMono Nerd Font"

mkdir -p ~/.local/share/fonts
cd /tmp

wget -O JetBrainsMono.zip 
https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

unzip -o JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono

fc-cache -fv

echo
echo "[+] Installing Colloid GTK Theme"

cd /tmp

rm -rf Colloid-gtk-theme
git clone https://github.com/vinceliuice/Colloid-gtk-theme.git

cd Colloid-gtk-theme

./install.sh

echo
echo "[+] Installing Colloid Icon Theme"

cd /tmp

rm -rf Colloid-icon-theme
git clone https://github.com/vinceliuice/Colloid-icon-theme.git

cd Colloid-icon-theme

./install.sh

echo
echo "[+] Installing Ghostty"

cd /tmp

sudo apt install -y 
zig 
libgtk-4-dev 
libadwaita-1-dev 
blueprint-compiler

rm -rf ghostty
git clone https://github.com/ghostty-org/ghostty

cd ghostty

zig build -p ~/.local

echo
echo "[+] Installing Brave Browser"

sudo curl -fsSLo 
/usr/share/keyrings/brave-browser-archive-keyring.gpg 
https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | 
sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update
sudo apt install -y brave-browser

echo
echo "[+] Installing Neovim"

sudo apt install -y neovim 

echo
echo " [+] Installing Baru's Nvim Config
git clone https://github.com/6aru/nvim ~/.config/nvim

echo
echo "[+] Creating User Directories"

xdg-user-dirs-update

mkdir -p ~/Pictures/Screenshots
mkdir -p ~/Music
mkdir -p ~/.config/mpd/playlists

echo
echo "[+] Enabling MPD"

systemctl --user enable mpd
systemctl --user start mpd || true

echo
echo "[+] Making i3 Scripts Executable"

if [ -d "$HOME/.config/i3/scripts" ]; then
chmod +x "$HOME"/.config/i3/scripts/*
chmod +x "$HOME"/.config/i3/scripts/music/* 2>/dev/null || true
fi

# Ensure ~/.local/bin is on PATH

if ! grep -qs '.local/bin' "$HOME/.xsessionrc" 2>/dev/null; then
cat >> "$HOME/.xsessionrc" <<'EOF'

# Added by i3-Debian-Main
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) PATH="$HOME/.local/bin:$PATH"; export PATH ;;
esac
EOF
fi

echo
echo "[+] Verification"

for cmd in 
i3 
polybar 
rofi 
dunst 
picom 
jq 
light 
playerctl 
flameshot 
mpd 
mpc 
ncmpcpp 
nvim 
ghostty
do
if command -v "$cmd" >/dev/null 2>&1; then
echo "[OK] $cmd"
else
echo "[MISSING] $cmd"
fi
done

echo
echo "====================================="
echo " Installation Complete"
echo " Copy i3-Debian-main -> ~/.config/i3"
echo " Reboot"
echo "====================================="
