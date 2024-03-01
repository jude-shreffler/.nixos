# fish.nix

{ config, ... }: 

{
  config = {
    programs.fish.enable = true;
    # fish
    home.file.fish-config = {
      enable = true;
      executable = true;
      source = ./fish/config.fish;
      target = "/home/js/.config/fish/config.fish";
    };
  };
}