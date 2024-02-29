# nvim.nix

{ config, pkgs, ... }: 

{
  config = {
    # nvim
    home.packages = [
      pkgs.luajitPackages.lua-lsp
    ];

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
    };
  };
}