# home.nix

{ config, pkgs, ... }:

{
  imports = [ 
    ../../../modules/home-manager/programs/leftwm.nix # desktop config
    ../../../modules/home-manager/programs/fish.nix
    ../../../modules/home-manager/programs/kitty.nix
    ../../../modules/home-manager/programs/git.nix
    ../../../modules/home-manager/programs/nvim.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "js";
  home.homeDirectory = "/home/js";

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
    pkgs.kitty
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {};

  # Home Manager can also manage your environment variables through 'home.sessionVariables'
  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "fish";
    XDG_CONFIG_HOME = "/home/js/.config";
  };

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = [ "nautilus.desktop" ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
