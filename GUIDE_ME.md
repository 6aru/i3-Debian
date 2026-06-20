# GUIDE_ME.md

This guide explains every component used by i3-Debian.

If you do not want to run `install.sh`, follow this guide manually.

---

# Required Packages

Install everything:

```bash
sudo apt update

sudo apt install \
i3 sxhkd polybar rofi dunst picom feh \
network-manager-gnome lxpolkit \
pipewire-audio pavucontrol pamixer playerctl \
jq light xclip xsel xdotool \
flameshot gsimplecal qimgv \
fd-find ripgrep fzf bat tree zoxide \
mpd mpc ncmpcpp mpg123 ffmpeg \
blueman bluez \
thunar thunar-volman thunar-archive-plugin \
gvfs gvfs-backends \
zsh git curl wget unzip
```

---

# Ghostty

Ghostty is the primary terminal emulator used by this setup.

Install:

```bash
git clone https://github.com/ghostty-org/ghostty
cd ghostty

zig build -p ~/.local
```

Verify:

```bash
ghostty
```

---

# Zsh

This setup includes a custom `.zshrc`.

Copy:

```bash
cp .zshrc ~/
```

Set zsh as default shell:

```bash
chsh -s $(which zsh)
```

Logout and login again.

---

# JetBrainsMono Nerd Font

Required for:

* Polybar icons
* Rofi icons
* Ghostty
* Neovim

Install:

```bash
mkdir -p ~/.local/share/fonts

wget \
https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

unzip JetBrainsMono.zip \
-d ~/.local/share/fonts/JetBrainsMono

fc-cache -fv
```

Verify:

```bash
fc-list | grep "JetBrains"
```

---

# Colloid GTK Theme

Install:

```bash
git clone https://github.com/vinceliuice/Colloid-gtk-theme

cd Colloid-gtk-theme

./install.sh
```

Apply using:

```bash
xfce4-appearance-settings
```

or

```bash
nwg-look
```

---

# Colloid Icons

Install:

```bash
git clone https://github.com/vinceliuice/Colloid-icon-theme

cd Colloid-icon-theme

./install.sh
```

Apply:

```bash
nwg-look
```

---

# i3 Configuration

Copy:

```bash
mkdir -p ~/.config

cp -r i3 ~/.config/
```

Result:

```text
~/.config/i3/
```

---

# MPD Configuration

Copy:

```bash
mkdir -p ~/.config/mpd

cp mpd.conf ~/.config/mpd/mpd.conf
```

Create playlists directory:

```bash
mkdir -p ~/.config/mpd/playlists
```

Enable MPD:

```bash
systemctl --user enable mpd
systemctl --user start mpd
```

Verify:

```bash
mpc status
```

---

# Polybar

Location:

```text
~/.config/i3/polybar
```

Provides:

* Workspaces
* Window title
* Filesystem
* CPU
* Memory
* Temperature
* MPD
* Network
* Brightness
* Audio
* Date
* Power menu

Launch manually:

```bash
~/.config/i3/polybar/polybar-i3
```

---

# Rofi

Location:

```text
~/.config/i3/rofi
```

Provides:

* Launcher
* Power Menu
* Volume Menu
* Brightness Menu
* Battery Menu
* Screenshot Menu
* Quicklinks Menu
* Notification Menu

Theme:

```text
style-1.rasi
```

Power menu theme:

```text
power.rasi
```

---

# Dunst

Location:

```text
~/.config/i3/dunst/dunstrc
```

Reload:

```bash
pkill dunst
dunst &
```

Verify:

```bash
notify-send "Hello"
```

---

# Picom

Location:

```text
~/.config/i3/picom/picom.conf
```

Provides:

* Transparency
* Shadows
* Rounded corners

Start:

```bash
picom --config ~/.config/i3/picom/picom.conf
```

---

# Theme System

Theme state:

```text
~/.config/i3/.current_theme
```

Theme menu:

```text
~/.config/i3/scripts/thememenu
```

Changing theme updates:

* GTK
* Icons
* Polybar
* Rofi
* Neovim

Available themes:

* Gruvbox
* Nord
* Dracula
* Rose Pine
* Catppuccin
* Kanagawa
* Everforest
* GitHub Dark
* Moonfly

---

# Scripts

Location:

```text
~/.config/i3/scripts
```

Make executable:

```bash
chmod +x ~/.config/i3/scripts/*
chmod +x ~/.config/i3/scripts/music/*
```

Important scripts:

```text
power
brightness
battery
volumemenu
quicklinks
screenshot
rofi-notifications.sh
thememenu
reload-nvim-theme.sh
```

---

# Services

Enable:

```bash
sudo systemctl enable NetworkManager
sudo systemctl enable acpid
```

Enable MPD:

```bash
systemctl --user enable mpd
```

---

# Verification

Verify everything:

```bash
which i3
which polybar
which rofi
which dunst
which picom
which jq
which light
which playerctl
which flameshot
which mpc
which ncmpcpp
which ghostty
which nvim
```

All commands should return a path.

---

# Config Only

Already have Debian configured?

1. Install required packages.
2. Install JetBrainsMono Nerd Font.
3. Install Colloid GTK Theme.
4. Install Colloid Icon Theme.
5. Copy:

```bash
cp -r i3 ~/.config/
cp .zshrc ~/
cp mpd.conf ~/.config/mpd/mpd.conf
```

6. Make scripts executable:

```bash
chmod +x ~/.config/i3/scripts/*
chmod +x ~/.config/i3/scripts/music/*
```

7. Enable services:

```bash
sudo systemctl enable NetworkManager
sudo systemctl enable acpid

systemctl --user enable mpd
```

8. Login into i3.

Done.
