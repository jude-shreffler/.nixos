# js.nix

{ config, inputs, pkgs, ... }: {
    config = {
        programs.fish.enable = true;
        users.users.js = {
            description = "Jude Shreffler";
            shell = pkgs.fish;
            isNormalUser = true;
            extraGroups = [ "wheel" "networkmanager" "audio" ];
        };

        home-manager = {
            # also pass inputs to home-manager modules
            backupFileExtension = "bak";
            extraSpecialArgs = { inherit inputs; };
            users = {
            "js" = import ./home.nix;
            };
        };
    };
}