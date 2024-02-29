# nvim.nix

{ config, pkgs, ... }: 

{
  config = {
    # dependencies
    home.packages = [
      pkgs.nodejs_21 # some language servers needed these
      pkgs.cargo
      pkgs.rustc
      pkgs.python3
    ];

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
    };
  };
}