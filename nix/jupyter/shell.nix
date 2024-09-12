let 
  pkgs = import <nixpkgs> {};

in
  pkgs.mkShell {
    packages = [
      (pkgs.python3.withPackages (pp: [
        pp.numpy
      ]))
    ];
  }
