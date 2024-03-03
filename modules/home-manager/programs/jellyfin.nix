# jellyfin.nix

{ config, ... }: 

{
  config = {
    # jellyfin
    home.file.jellyfin-css = {
      enable = true;
      executable = true;
      source = ./jellyfin/custom.css;
      target = "/home/js/.config/jellyfin/custom.css";
    };
  };
}