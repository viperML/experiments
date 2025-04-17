{ config, pkgs, lib, ... }:
{
  # programs.hyprland.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.windowManager.awesome.enable = true;

  environment.systemPackages = [
    pkgs.kitty
  ];

  users.users."guest" = {
    password = "guest";
    isNormalUser = true;
    extraGroups = ["audio" "video"];
  };

  # These are dummy options to allow eval
  nixpkgs.hostPlatform = "x86_64-linux";
  boot.loader.grub.enable = false;
  fileSystems."/".device = "nodev";
  system.stateVersion = lib.trivial.release;
}
