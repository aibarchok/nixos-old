{ config, pkgs, lib, input, ... }:

{
  home.username = "aibarchok";
  home.homeDirectory = "/home/aibarchok";
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";

  imports = [
    ./dedicated.nix
    ./pkgs.nix
  ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
