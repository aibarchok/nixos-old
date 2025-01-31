{ config, pkgs, ... }:

let
  UserName = "aibarchok";
  HostName = "nixos";
in
{
  imports = [
    ./hardware.nix
    ./pkgs.nix
    ./mpd.nix
    ./steam.nix
    ./swaylock.nix
    ./nvidia.nix
    ./nix-ld.nix
    ./greetd.nix
    ./thunar.nix
  ];

  boot = {
    loader.systemd-boot.enable = true;
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "nvidia_drm.fbdev=1"
      "nvidia_drm.modeset=1"
    ];
    loader.efi.canTouchEfiVariables = true;
    kernelModules = [ "coretemp" "cpuid" "v4l2loopback" ];
  };

  services.xserver.libinput.enable = true;

  networking.hostName = HostName;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Qostanay";

  i18n.defaultLocale = "en_US.UTF-8";

  #   services.getty.autologinUser = "${UserName}";

  users.users.${UserName} = {
    isNormalUser = true;
    description = "User space for ${UserName}";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "storage" ];
    packages = with pkgs; [ ];
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.hyprland = {
    enable = true;
    xwayland = { enable = true; };
  };

  programs.nano.enable = false;
  programs.nano.syntaxHighlight = false;

  programs.light.enable = true;

  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [{
    users = [ UserName ];
    keepEnv = true;
    persist = true;
  }];

  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "23.11";
}
