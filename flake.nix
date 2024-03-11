{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";    

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { 
        system = "x86_64-linux"; 
        config.allowUnfree = true; 
      };
    in
    {
    
      nixosConfigurations.agro = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [ 
          ./hosts/agro/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      nixosConfigurations.artax = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/artax/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      nixosConfigurations.epona = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/epona/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}
