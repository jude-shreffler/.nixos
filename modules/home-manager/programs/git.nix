# git.nix

{ config, ... }: 

{
  config = {
    # git
    programs.git = {
        enable = true;
        userName = "Jude Shreffler";
        userEmail = "js467820@ohio.edu";
    };
  };
}