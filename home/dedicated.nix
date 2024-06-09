{ config, pkgs, lib, inputs, ... }:

{
  config.home.file = {
    ".config/ncmpcpp" = { source = ./configs/ncmpcpp; };
    ".config/dunst" = { source = ./configs/dunst; };
    ".config/hypr" = { source = ./configs/hypr; };
    ".config/waybar" = { source = ./configs/waybar; };
    ".config/wofi" = { source = ./configs/wofi; };
    ".config/alacritty" = { source = ./configs/alacritty; };
    ".config/bat" = { source = ./configs/bat; };
    ".config/tmux" = { source = ./configs/tmux; };
  };
  imports = [
    ./shell.nix
    ./apps.nix
  ];
}
