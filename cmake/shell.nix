with import <nixpkgs> {};
mkShell {
  packages = [
    cmake
    neocmakelsp
  ];
}
