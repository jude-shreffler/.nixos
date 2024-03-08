# kitty.nix

{ config, options, lib, ... }: 

let
  cfg = config.kitty;
in
{
  options = {
    kitty.host = lib.mkOption { default = "agro"; };
  };

  config = {
    # kitty
    home.file.kitty-config = {
      enable = true;
      executable = true;
      source = ./kitty/kitty- + ( cfg.host + ".conf" );
      target = "/home/js/.config/kitty/kitty.conf";
    };
  };
}