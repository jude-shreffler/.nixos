# leftwm.nix

{ config, pkgs, ... }: {
  config = {
    # Dependencies
    environment.systemPackages = with pkgs; [
      leftwm # leftwm and it's dependencies
      feh # background
      picom # compositor
      polybarFull # top bar
      dmenu # backup for rofi
      rofi # graphical dmenu
      dunst # notifications
      scrot # screenshot tool
      gnome.nautilus # file explorer
      blueberry # bluetooth manager
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