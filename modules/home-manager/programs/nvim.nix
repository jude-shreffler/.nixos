# nvim.nix

{ config, pkgs, ... }: 

{
  config = {
    # dependencies
    home.packages = [
      pkgs.lua-language-server 
    ];

    programs.neovim ={
      enable = true;
      plugins = with pkgs.vimPlugins;[
        telescope-fzf-native-nvim
        telescope-nvim
      ];
    };

    # nvim
    home.file = {
      nvim-init = {
        enable = true;
        executable = true;
        source = ./nvim/init.lua;
        target = "/home/js/.config/nvim/init.lua";
      };

      nvim-options = {
        enable = true;
        executable = true;
        source = ./nvim/lua/options.lua;
        target = "/home/js/.config/nvim/lua/options.lua";
      };

      nvim-plugins = {
        enable = true;
        executable = true;
        source = ./nvim/lua/plugins.lua;
        target = "/home/js/.config/nvim/lua/plugins.lua";
      };

      nvim-pluginlist = {
        enable = true;
        executable = true;
        source = ./nvim/lua/pluginlist.lua;
        target = "/home/js/.config/nvim/lua/pluginlist.lua";
      };

      nvim-lsp = {
        enable = true;
        executable = true;
        source = ./nvim/after/plugin/lsp.lua;
        target = "/home/js/.config/nvim/after/plugin/lsp.lua";
      };

      nvim-cmp = {
        enable = true;
        executable = true;
        source = ./nvim/after/plugin/cmp.lua;
        target = "/home/js/.config/nvim/after/plugin/cmp.lua";
      };

      nvim-telescope = {
        enable = true;
        executable = true;
        source = ./nvim/after/plugin/telescope.lua;
        target = "/home/js/.config/nvim/after/plugin/telescope.lua";
      };
    };
  };
}