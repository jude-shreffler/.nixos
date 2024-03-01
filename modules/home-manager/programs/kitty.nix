# kitty.nix

{ config, ... }: 

{
  config = {
    # kitty
    home.file.kitty-config = {
      enable = true;
      executable = true;
      source = ./kitty/kitty.conf;
      target = "/home/js/.config/kitty/kitty.conf";
    };
  };
}