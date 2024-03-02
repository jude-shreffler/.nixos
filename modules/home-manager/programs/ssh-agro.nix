# ssh-agro.nix

{ config, ... }: 

{
  config = {
    # ssh-agro
    home.file.ssh-agro-config = {
      enable = true;
      executable = true;
      source = ./ssh/agro-config;
      target = "/home/js/.config/ssh/config";
    };
  };
}