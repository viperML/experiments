let
  pkgs = import <nixpkgs> {};
  inherit (pkgs) lib;

  plugins = with pkgs.vimPlugins; [
    nvim-treesitter.withAllGrammars
    telescope-nvim
  ];

  foldPlugins = builtins.foldl' (
    acc: next:
      acc
      ++ [
        next
      ]
      ++ (foldPlugins (next.dependencies or []))
  ) [];
in
  foldPlugins plugins
