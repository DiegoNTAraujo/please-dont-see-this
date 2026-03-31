#!/usr/bin/env bash

set -e

# =========================

packages=(
  # System Utils
  base-devel

  # Network
  networkmanager
  network-manager-applet
  reflector
  ufw

  # Bluetooth
  bluez
  bluez-utils
  blueman

  # Audio
  pipewire
  pipewire-audio
  pipewire-pulse
  pipewire-jack
  pipewire-alsa
  pavucontrol

  # Fonts
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  ttf-jetbrains-mono-nerd
  otf-font-awesome

  # Desktop
  hyprland
  hyprlock
  hypridle
  hyprpaper
  hyprshot
  hyprpolkitagent
  xdg-desktop-portal-hyprland
  waybar
  rofi
  kitty
  dunst
  ly
  nautilus

  # Extra
  brightnessctl
  gammastep
  tuned
)

# =========================

sudo pacman --needed --noconfirm -S ${packages[@]}

# =========================

sudo systemctl enable --now NetworkManager
sudo systemctl enable --now reflector
sudo systemctl enable --now reflector.timer
sudo systemctl enable --now ufw
sudo systemctl enable --now bluetooth
sudo systemctl enable --now tuned
sudo systemctl enable --now ly@tty1

sudo ufw enable

# =========================

rm -rf $HOME/.dotfiles
git clone https://github.com/DiegoNTAraujo/dotfiles $HOME/.dotfiles

mkdir -p $HOME/.config/{hypr,waybar,rofi,kitty,dunst}

ln -sf $HOME/.dotfiles/hypr/* $HOME/.config/hypr/
ln -sf $HOME/.dotfiles/waybar/* $HOME/.config/waybar/
ln -sf $HOME/.dotfiles/rofi/* $HOME/.config/rofi/
ln -sf $HOME/.dotfiles/kitty/* $HOME/.config/kitty/
ln -sf $HOME/.dotfiles/dunst/* $HOME/.config/dunst/