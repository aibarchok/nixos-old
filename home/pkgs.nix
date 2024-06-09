{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-utils

    git-cliff
    slurp
    
    eza
    zoxide
    ripgrep
    grim
    
    bat
    just
    stylua
    pass
    skim
    nil
    mdbook

    wayshot
    wofi
    waybar
    wl-clipboard
    wf-recorder
    swaylock
    hyprpaper

    dunst
    alacritty
    nsxiv
    
    firefox-wayland
    librewolf-wayland
    tor-browser

    dino
    discord
    pkgs.vesktop
    telegram-desktop

    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.ru_RU
    #hunspellDicts.kk_KZ

    obs-studio
    gimp
    keepassxc
    thunderbird

    gogdl
    heroic
    prismlauncher

    samrewritten
    steamtinkerlaunch
    protontricks
  
    nicotine-plus
    soulseekqt
    transmission_4-gtk
    
    hugo
    #rustup
    #cargo-watch

  ];
}

