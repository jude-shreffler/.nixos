# git.nix

{ config, lib, ... }: 

let 
  cfg = config.git;
in
{
  options = {
    git.userName = lib.mkOption;
    git.userEmail = lib.mkOption;
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