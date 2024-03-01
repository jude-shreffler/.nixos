# fish.nix

{ config, ... }: 

{
  config = {
    programs.fish.enable = true;
    # fish
    home.file.config-fish = {
      enable = true;
      executable = true;
      source = ./fish/config.fish;
      target = "/home/js/.config/fish/config.fish";
    };
  };
}