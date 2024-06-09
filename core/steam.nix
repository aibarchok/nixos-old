{ config, pkgs, lib, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
}

