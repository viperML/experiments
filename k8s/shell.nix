let
  pkgs = import <nixpkgs> {
    config.allowUnfree = true;
  };
in
  pkgs.mkShell {
    packages = [
      pkgs.terraform-ls
      (pkgs.terraform.withPlugins (tp: [
        tp.external
        tp.null
        tp.local
        tp.incus
      ]))
      pkgs.yaml-language-server
      pkgs.kubernetes
      pkgs.kubernetes-helm
    ];
  }
