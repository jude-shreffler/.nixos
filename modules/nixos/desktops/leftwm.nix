# leftwm.nix

{ config, pkgs, ... }: {
  config = {
    # Dependencies
    environment.systemPackages = with pkgs; [
      leftwm
      feh
      picom
      polybarFull
      dmenu
      rofi
      dunst
      bluez
    ];

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

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