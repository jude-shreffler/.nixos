# fish.nix

{ config, pkgs, ... }: 

{
  config = {
    # fish
    home.packages = [
      pkgs.pfetch
    ];

    home.file = {
      fish-config = {
        enable = true;
        executable = true;
        source = ./fish/config.fish;
        target = "/home/js/.config/fish/config.fish";
      };

      addmovie = {
        enable = true;
        executable = true;
        source = ./fish/addmovie.fish;
        target = "/home/js/.config/fish/addmovie.fish";
      };

      wrapup = {
        enable = true;
        executable = true;
        source = ./fish/wrapup.fish;
        target = "/home/js/.config/fish/wrapup.fish";
      };

			rebuild = {
				enable = true;
				executable = true;
				source = ./fish/rebuild.fish;
				target = "/home/js/.config/fish/rebuild.fish";
			};
		};
  };
}
