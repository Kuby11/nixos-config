{ pkgs, ...}:
{
  imports = [
    ./fish.nix
  ];

  users.users."stender11" = {
    isNormalUser = true;
    description = "stender11";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
