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
        source = ./fish/functions/addmovie.fish;
        target = "/home/js/.config/fish/functions/addmovie.fish";
      };

      wrapup = {
        enable = true;
        executable = true;
        source = ./fish/functions/wrapup.fish;
        target = "/home/js/.config/fish/functions/wrapup.fish";
      };

      screenshot = {
        enable = true;
        executable = true;
        source = ./fish/functions/screenshot.fish;
        target = "/home/js/.config/fish/functions/screenshot.fish";
      };

			rebuild = {
				enable = true;
				executable = true;
				source = ./fish/functions/rebuild.fish;
				target = "/home/js/.config/fish/functions/rebuild.fish";
			};
		};
  };
}
