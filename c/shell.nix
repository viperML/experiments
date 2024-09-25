with import <nixpkgs> {};
  mkShell {
    packages = [
      clang-tools
      cmake
      ninja
      neocmakelsp
      gdb
      patchelf
      meson
      pkg-config
    mesonlsp
    asm-lsp
    ];
    hardeningDisable = ["all"];
  }
