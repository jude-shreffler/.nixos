# home.nix

{ config, pkgs, ... }:

{
  imports = [ 
    ../../modules/home-manager/programs/leftwm.nix # desktop config
    ../../modules/home-manager/programs/fish.nix
    ../../modules/home-manager/programs/kitty.nix
    ../../modules/home-manager/programs/git.nix
    ../../modules/home-manager/programs/nvim.nix
    ../../modules/home-manager/programs/ssh-agro.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "js";
  home.homeDirectory = "/home/js";

  git.userName = "Jude Shreffler";
  git.userEmail = "js467820@ohio.edu";
  leftwm.background = "grove";
  kitty.host = "agro";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true;
  home.packages = [ # Inclue packages that you configure
    pkgs.git
    pkgs.fish
    pkgs.bat
    pkgs.zellij
    pkgs.fzf
    pkgs.pfetch
    pkgs.nmap
    pkgs.tremc
    pkgs.dotnet-sdk_7
    pkgs.pulsemixer
    pkgs.jre8
    pkgs.inetutils
    pkgs.toybox
    pkgs.glfw
    pkgs.cmakeWithGui
    pkgs.quickemu
    
    pkgs.godot_4
    pkgs.steam
    pkgs.protonup-qt
    pkgs.lutris
    pkgs.prismlauncher
    pkgs.openra
    pkgs.vkbasalt
    pkgs.ryujinx
    pkgs.pcsx2

    pkgs.vscode
    pkgs.spotify
    pkgs.kitty
    pkgs.vlc
    pkgs.gimp-with-plugins
    pkgs.shotcut
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {};

  # Home Manager can also manage your environment variables through 'home.sessionVariables'
  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "fish";
    XDG_CONFIG_HOME = "/home/js/.config";
    XDG_DATA_HOME = "/home/js/.local/share";
  };

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = [ "nautilus.desktop" ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
