#!/bin/bash

set -e

echo "Package Installer"

if [[ $EUID -ne 0 ]]; then
   echo "Rerun as sudo"
   exit 1
fi

echo "Updating Everything First"
pacman -Syu --noconfirm

PACKAGES=(
    #Fonts
    ttf-jetbrains-mono-nerd
    otf-font-awesome
    woff2-font-awesome

    #Terminal
    ghostty
    kitty

    #File Manager
    nautilus

    #System Stuff
    hyprland
    xdg-desktop-portal-hyprland
    hyprpolkitagent

    qt6-wayland
    qt5-wayland

    #Hypr Ecosystem Stuff
    hyprcursor
    hyprshot
    hyprpaper
    hyprcursor
    hyprpicker

    #Notifications
    swaync

    #Run Menu
    wofi

    #Changing Theme
    nwg-look
    waypaper #Might Remove

    #Menu Bar
    waybar
    quickshell

    #Audio
    pipewire
    wireplumber

    #Login and Locking
    hyprlock
    hypridle
    wlogout

    #Misc
    flatpak
    loupe #Image Viewer
    brightnessctl
    network-manager-applet
    pavucontrol
    pamixer
    cliphist
)

echo "Installing Packages"
pacman -S --noconfirm --needed "${PACKAGES[@]}"
echo "Done"
