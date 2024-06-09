{ config, pkgs, lib, input, ... }:

{
  services.mpd = {
    enable = true;
    user = "aibarchok";
    musicDirectory = "/home/aibarchok/music";
    extraConfig = ''
      audio_output {
          type "pipewire"
          name "pipewire"
      }
    '';
    startWhenNeeded = true;
  };

  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };
}
