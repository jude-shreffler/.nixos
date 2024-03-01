# home.nix

{ config, pkgs, ... }:

{
  imports = [ 
    ../../modules/home-manager/programs/leftwm.nix # desktop config
    ../../modules/home-manager/programs/fish.nix
    ../../modules/home-manager/programs/kitty.nix
    ../../modules/home-manager/programs/git.nix
    ../../modules/home-manager/programs/nvim.nix
  ];

  home.username = "example-uname";
  home.homeDirectory = "/home/example-uname";

  git.userName = "full-name";
  git.userEmail = "user-email";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;
  home.packages = [ # Inclue packages that you configure

    # Packages I use
    /*
    pkgs.bat
    pkgs.zellij
    pkgs.fzf

    pkgs.godot_4
    pkgs.steam
    pkgs.spotify */
    pkgs.vscode
    pkgs.kitty 
  ];
  #programs.steam.enable = true;



  home.file = {};

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "fish";
    XDG_CONFIG_HOME = "/home/example-uname/.config";
  };

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = [ "nautilus.desktop" ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
