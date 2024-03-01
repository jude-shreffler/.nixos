# example.nix

{ config, inputs, pkgs, ... }: {
    config = {
        programs.fish.enable = true;
        users.users.example-uname = {
            description = "full-name";
            shell = pkgs.fish;
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