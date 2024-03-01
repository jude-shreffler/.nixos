# example.nix

{ config, inputs, pkgs, ... }: {
    config = {
        users.users.js = {
            description = "full-name";
            isNormalUser = true;
            extraGroups = [ "wheel" "networkmanager" ];
        };

        home-manager = {
            # also pass inputs to home-manager modules
            backupFileExtension = "bak";
            extraSpecialArgs = { inherit inputs; };
            users = {
            "example-uname" = import ./home.nix;
            };
        };
    };
}