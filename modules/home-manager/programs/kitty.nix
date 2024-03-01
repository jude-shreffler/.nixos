# kitty.nix

{ config, ... }: 

{
  config = {
    # kitty
    programs.kitty.enable = true;
    home.file.kitty = {
      enable = true;
      executable = true;
      source = ./kitty/kitty.conf;
      target = "/home/js/.config/kitty/kitty.conf";
    };
  };
}