# fish.nix

{ config, pkgs, ... }: 

{
  config = {
    # fish
    home.packages = [
      pkgs.pfetch
    ];

    home.file.fish-config = {
      enable = true;
      executable = true;
      source = ./fish/config.fish;
      target = "/home/js/.config/fish/config.fish";
    };
  };
}