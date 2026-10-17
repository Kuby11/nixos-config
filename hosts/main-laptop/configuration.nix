{ config, pkgs, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/system/audio.nix
      ../../modules/system/boot.nix
      ../../modules/desktop/home-manager.nix
      ../../modules/desktop/sddm
      # ../../modules/desktop/qylock.nix
      ../../modules/services/users.nix
      ../../modules/services/fish.nix
      ../../modules/services/portal.nix
      ../../modules/services/nvidia.nix
      ../../modules/services/obs-studio.nix
      inputs.home-manager.nixosModules.home-manager
    ];


  nix.extraOptions = ''
    !include /etc/nixos/github-token.conf
  '';

  programs.fish.enable = true;
  programs.niri.enable = true;

  networking.hostName = "main-laptop";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tbilisi";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ka_GE.UTF-8";
    LC_IDENTIFICATION = "ka_GE.UTF-8";
    LC_MEASUREMENT = "ka_GE.UTF-8";
    LC_MONETARY = "ka_GE.UTF-8";
    LC_NAME = "ka_GE.UTF-8";
    LC_NUMERIC = "ka_GE.UTF-8";
    LC_PAPER = "ka_GE.UTF-8";
    LC_TELEPHONE = "ka_GE.UTF-8";
    LC_TIME = "ka_GE.UTF-8";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
  };

  services.printing.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    kitty
    fish
    fastfetch
    bibata-cursors
    dbus
    polkit
  ];

  system.stateVersion = "26.05";
}
