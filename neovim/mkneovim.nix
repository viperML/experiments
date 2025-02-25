let
  pkgs = import <nixpkgs> { };
in
pkgs.neovim.override {
  configure = {
    customRC =
      # vim
      ''
        :luafile ${./init.lua}
      '';
    packages.myplugin = with pkgs.vimPlugins; {
      start = [
        lz-n
        which-key-nvim
      ];
      opt = [
        neo-tree-nvim
      ];
    };
  };
}
