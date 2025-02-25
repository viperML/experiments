with import <nixpkgs> {};
mkShell {
  packages = [
    lua-language-server
  ];
}
