# leftwm.nix

{ config, pkgs, cfg, lib, ... }: 
let
  cfg = config.leftwm; 
in
{
	options = {
		leftwm.nvidia = lib.mkEnableOption {
      default = false;
			example = true;
		};
	};

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
			videoDrivers = lib.mkIf leftwm.nvidia [ "nvidia" ];
      displayManager.gdm.enable = true;
      windowManager.leftwm.enable = true;
    };
  };
}
