# leftwm.nix

{ config, lib, ... }: 
let 
  cfg = config.leftwm;
in 
{
  options = {
    leftwm.background = lib.mkOption{ default = "grove"; };
    leftwm.host = lib.mkOption { default = "agro"; };
  };

  config = {
    home.file = {
      leftwm-config = {
        enable = true;
        executable = true;
        source = ./leftwm/config.ron;
        target = "/home/js/.config/leftwm/config.ron";
      }; 

      picom-config = {
        enable = true;
        executable = true;
        source = ./leftwm/picom.conf;
        target = "/home/js/.config/picom/picom.conf";
      };

      leftwm-up = {
        enable = true;
        executable = true;
        source = ./leftwm/themes/ascent/up;
        target = "/home/js/.config/leftwm/themes/ascent/up";
      };

      leftwm-down = {
        enable = true;
        executable = true;
        source = ./leftwm/themes/ascent/down;
        target = "/home/js/.config/leftwm/themes/ascent/down";
      };

      rofi-adi = {
        enable = true;
        executable = true;
        source = ./leftwm/themes/ascent/adi.rasi;
        target = "/home/js/.config/leftwm/themes/ascent/adi.rasi";
      };

      polybar-nord = {
        enable = true;
        executable = false;
        source = ./leftwm/themes/ascent/polybar- + ( cfg.host + ".config" );
        target = "/home/js/.config/leftwm/themes/ascent/polybar.config";
      };

      dunst-nord = {
        enable = true;
        executable = false;
        source = ./leftwm/themes/ascent/dunstrc.tmpl;
        target = "/home/js/.config/leftwm/themes/ascent/dunstrc.tmpl";
      };

      leftwm-theme-nord = {
        enable = true;
        executable = true;
        source = ./leftwm/themes/ascent/theme.toml;
        target = "/home/js/.config/leftwm/themes/ascent/theme.toml";
      };

      wallpaper-nord = {
        enable = true;
        executable = false;
        source = ./leftwm/themes/ascent + ( "/" + cfg.background + ".png" );
        target = "/home/js/.config/leftwm/themes/ascent/wallpaper.png";
      };
    };
  };
}
