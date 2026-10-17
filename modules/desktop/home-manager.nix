{ inputs, qylock, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit qylock;
    };

    users = {
      stender11 = import ../../users/stender11/home.nix;
    };
  };
}
