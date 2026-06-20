# GUIDE.md

This document explains every component used by i3-Debian-Main.

If you do not want to run install.sh blindly, follow this guide section by section.

---

# Base System

Recommended OS:

* Debian 13

Update system:

```bash
sudo apt update
sudo apt full-upgrade -y
```

---

# i3wm

i3 is the window manager used by this setup.

Responsibilities:

* Window management
* Workspaces
* Keybindings
* Startup applications

Install:

```bash
sudo apt install i3
```

---

# Polybar

Polybar provides the desktop bars.

Used for:

* Workspaces
* Active window title
* Filesystem usage
* CPU usage
* Memory usage
* Temperature
* MPD controls
* Network status
* Brightness
* Audio
* Date & Time
* Power menu

Install:

```bash
sudo apt install polybar
```

---

# Rofi

Rofi is used for much more than an application launcher.

Used for:

* App launcher
* Power menu
* Volume menu
* Brightness menu
* Battery menu
* Screenshot menu
* Quicklinks menu
* Notification menu

Install:

```bash
sudo apt install rofi
```

---

# Dunst

Dunst is the notification daemon.

Used for:

* Notifications
* Screenshot notifications
* Music notifications
* Theme notifications

Install:

```bash
sudo apt install dunst
```

Verify:

```bash
which dunstctl
```

---

# Picom

Picom provides:

* Transparency
* Shadows
* Rounded corners

Install:

```bash
sudo apt install picom
```

---

# Network Manager

Provides:

* WiFi management
* Ethernet management
* nm-applet system tray integration

Install:

```bash
sudo apt install network-manager-gnome
```

Enable:

```bash
sudo systemctl enable NetworkManager
```

---

# Light

Used by:

* Brightness menu
* Brightness keybinds
* Polybar brightness module

Install:

```bash
sudo apt install light
```

Verify:

```bash
light -G
```

---

# Playerctl

Provides media controls.

Used by:

* MPD scripts
* Polybar music controls

Install:

```bash
sudo apt install playerctl
```

---

# MPD

Music daemon.

Used by:

* Polybar music module
* Ncmpcpp

Install:

```bash
sudo apt install mpd mpc ncmpcpp
```

Enable:

```bash
systemctl --user enable mpd
systemctl --user start mpd
```

---

# jq

JSON processor.

Used by:

* Theme switcher
* Theme scripts

Install:

```bash
sudo apt install jq
```

---

# Flameshot

Screenshot utility.

Used by:

* Screenshot menu
* Screenshot keybinds

Install:

```bash
sudo apt install flameshot
```

Launch:

```bash
flameshot gui
```

---

# Gsimplecal

Calendar popup.

Used by:

* Polybar date module

Install:

```bash
sudo apt install gsimplecal
```

---

# Ghostty

Primary terminal emulator.

Features:

* GPU acceleration
* Nerd Font support

Install manually:

```bash
git clone https://github.com/ghostty-org/ghostty
```

---

# Neovim

Editor used by this setup.

Features:

* Theme synchronization
* ThemeReload integration

Install:

```bash
sudo apt install neovim ripgrep
```

---

# Fonts

Required Font:

JetBrainsMono Nerd Font

Used by:

* Polybar icons
* Rofi icons
* Ghostty
* Neovim

Install:

```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
```

---

# GTK Theme

Theme:

Colloid GTK

Install:

```bash
git clone https://github.com/vinceliuice/Colloid-gtk-theme
```

---

# Icons

Theme:

Colloid Icons

Install:

```bash
git clone https://github.com/vinceliuice/Colloid-icon-theme
```

---

# Theme System

Theme state file:

```text
~/.config/i3/.current_theme
```

Changing themes updates:

* GTK
* Icons
* Polybar
* Rofi
* Neovim

---

# Config Only

Already have Debian configured?

Install dependencies:

```bash
sudo apt install \
i3 polybar rofi dunst picom \
network-manager-gnome \
playerctl jq light \
flameshot gsimplecal \
mpd mpc ncmpcpp \
neovim ripgrep \
thunar feh
```

Install:

* JetBrainsMono Nerd Font
* Colloid GTK Theme
* Colloid Icon Theme

Copy config:

```bash
mkdir -p ~/.config/i3

cp -r i3-Debian-main/* ~/.config/i3/
```

Make scripts executable:

```bash
chmod +x ~/.config/i3/scripts/*
```

Login into:

```text
i3
```

and enjoy.
