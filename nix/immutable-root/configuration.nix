{
  config,
  pkgs,
  lib,
  ...
}: {
  users.users.root = {
    home = lib.mkForce "/var/empty";
  };

  services.getty.autologinUser = "root";
}
