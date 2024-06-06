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
      nightfox-gtk-theme #lightdm greeter theme
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
			videoDrivers = lib.mkIf config.leftwm.nvidia [ "nvidia" ];
      displayManager.lightdm = {
        enable = true;
        background = "/usr/share/pixmaps/wallpaper.png";
        greeters.gtk = {
          enable = true;
          /*
          theme.package = pkgs.nightfox-gtk-theme;
          iconTheme.package = pkgs.nightfox-gtk-theme;
          cursorTheme.package = pkgs.nightfox-gtk-theme;
          theme.name = "Nightfox";
          iconTheme.name = "Nightfox";
          cursorTheme.name = "Nightfox";
          */
          clock-format = "%a, %b %d - %I:%M %p";
          extraConfig = "default-user-image = /home/js/.face";
        };
      };
      windowManager.leftwm.enable = true;
    };
  };
}
