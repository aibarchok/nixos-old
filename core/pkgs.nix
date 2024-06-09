{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    nix-index
    nixpkgs-fmt

    git
    xdg-desktop-portal-hyprland
    xdg-utils
    gperftools

    cmake
    pavucontrol
    unzip
    p7zip
    pstree
    pipewire
    libcamera
    file
  
    lf
    ncmpcpp
    zathura
    newsraft
    fastfetch
    nvtop
    htop
    
    neovim-nightly

    acpi
    doas
    pulseaudio

    wireplumber
    tmux
    imagemagick
    ffmpeg
    mpd
    mpv

    protonmail-bridge
    lua-language-server

    wine
    winetricks
    wineWowPackages.waylandFull
    wineWowPackages.stable

    gnome.zenity

    tree

    lua

    gcc
  ];
}
