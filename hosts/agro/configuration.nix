# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ lib, config, pkgs, inputs, ... }: 

{   
  imports =
    [ 
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ../../users/js-agro/js-agro.nix  # js user
      ../../modules/nixos/nvidia.nix # nvidia setup
      # ../../modules/nixos/desktops/gnome.nix # x server setup
      ../../modules/nixos/desktops/leftwm.nix # x server setup
      inputs.home-manager.nixosModules.default # home-manager
    ];
  
  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;

  # Dualboot setup
  boot.loader.grub = {
    enable = true;
    gfxmodeEfi = "1280x720";
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
    default = "saved";
  };
  time.hardwareClockInLocalTime = true;

  services.fstrim.enable = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "agro"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable sound with pulseaudio.
  sound.enable = true;
  sound.extraConfig = 
"defaults.pcm.!card 1
defaults.ctl.!card 1
";
  hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;

  # Gnome virtual file system
  services.gvfs.enable = true;
  
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    bottom
    transmission-qt

    kitty
    firefox

    wineWowPackages.stable
  ];

  services.transmission.enable = true;
  services.joycond.enable = true;
  
	leftwm.nvidia = true;
  programs.steam.enable = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
