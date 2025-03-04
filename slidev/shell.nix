with import <nixpkgs> { };
mkShell {
  packages = [
    pnpm_9
    (nodejs.override { enableNpm = false; })
  ];
}
