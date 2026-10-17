{ config, pkgs, inputs, ... }:
{
  imports = [
    ../../modules/desktop/serpantinum.nix
    ../../modules/desktop/niri
    ../../modules/services/git.nix
    ../../modules/services/fastfetch
  ];

  home.username = "stender11";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
  programs.firefox.enable = true;

  programs.kitty = {
    enable = true;
    settings = {
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = 2;
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
  };

  home.packages = with pkgs; [
    nautilus
    python3
    swayidle
    swaylock
    zed-editor
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    fuzzel
    xwayland-satellite
    kdePackages.dolphin
    mpvpaper
    unzip
    nodejs
    bun
    opencode
    opencode-desktop
  ];
}
