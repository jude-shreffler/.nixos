# git.nix

{ config, lib, ... }: 

let 
  cfg = config.git;
in
{
  options = {
    git.userName = lib.mkOption{ default = ""; };
    git.userEmail = lib.mkOption{ default = ""; };
  };

  config = {
    # git
    programs.git = {
        enable = true;
        userName = cfg.userName;
        userEmail = cfg.userEmail;
    };
  };
}