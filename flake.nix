{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # qylock = {
    #   url = "github:Darkkal44/qylock";
    #   inputs.nixpkgs.follows = "nixpkgs-unstable";
    # };

    niri = {
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    serpantinum = {
      url = "github:ilyamiro/serpantinum";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    serpantinum,
    ...
  }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
    in
  {
    nixosConfigurations.main-laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        inherit serpantinum;
        # inherit qylock;
      };
      modules = [
        ./hosts/main-laptop/configuration.nix
        serpantinum.nixosModules.default
        home-manager.nixosModules.home-manager
        # qylock.nixosModules.default
      ];
    };
  };
}
