# fish.nix

{ config, ... }: 

{
  config = {
    # fish
    home.file.fish-config = {
      enable = true;
      executable = true;
      source = ./fish/config.fish;
      target = "/home/js/.config/fish/config.fish";
    };
  };
}