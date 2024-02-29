# leftwm.nix

{ config, pkgs, ... }: {
  config = {
    home.file = {
      config = {
        enable = true;
        executable = true;
        source = ./leftwm/config.ron;
        target = "/home/js/.config/leftwm/config.ron";
      };

      up = {
        enable = true;
        executable = true;
        source = ./leftwm/themes/ascent/up;
        target = "/home/js/.config/leftwm/themes/ascent/up";
      };

      down = {
        enable = true;
        executable = true;
        source = ./leftwm/themes/ascent/down;
        target = "/home/js/.config/leftwm/themes/ascent/down";
      };

      rofi = {
        enable = true;
        executable = true;
        source = ./leftwm/themes/ascent/adi.rasi;
        target = "/home/js/.config/leftwm/themes/ascent/adi.rasi";
      };

      polybar = {
        enable = true;
        executable = false;
        source = ./leftwm/themes/ascent/polybar.config;
        target = "/home/js/.config/leftwm/themes/ascent/polybar.config";
      };

      dunst = {
        enable = true;
        executable = false;
        source = ./leftwm/themes/ascent/dunstrc.tmpl;
        target = "/home/js/.config/leftwm/themes/ascent/dunstrc.tmpl";
      };

      theme = {
        enable = true;
        executable = true;
        source = ./leftwm/themes/ascent/theme.toml;
        target = "/home/js/.config/leftwm/themes/ascent/theme.toml";
      };

      screenshot = {
        enable = true;
        executable = true;
        source = ./leftwm/screenshot.sh;
        target = "/home/js/.config/leftwm/screenshot.sh";
      };

      wallpaper = {
        enable = true;
        executable = false;
        source = ./leftwm/themes/ascent/wallpaper.png;
        target = "/home/js/.config/leftwm/themes/ascent/wallpaper.png";
      };
    };
  };
}