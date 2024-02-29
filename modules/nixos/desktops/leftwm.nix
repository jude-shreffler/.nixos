# leftwm.nix

{ config, pkgs, ... }: {
  config = {
    # Dependencies
    environment.systemPackages = with pkgs; [
      leftwm
      feh
      picom
      polybar
      dmenu
      rofi
      dunst
    ];

    # x config
    services.xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = [ "nvidia" ];
      displayManager.gdm.enable = true;
      windowManager.leftwm.enable = true;
    };
  };
}