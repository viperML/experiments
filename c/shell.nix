with import <nixpkgs> {};
  mkShell {
    packages = [
      clang-tools
      cmake
      ninja
      neocmakelsp
      gdb
      patchelf
    ];
    hardeningDisable = ["all"];
  }
