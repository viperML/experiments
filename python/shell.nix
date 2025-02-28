with import <nixpkgs> {};
mkShell {
  packages = [
    (python3.withPackages (pp: [
      pp.matplotlib
      pp.numpy
    ]))
  ];
}
