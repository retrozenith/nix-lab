# Mars - Home Desktop (KDE Plasma)
# Host-specific configuration only; common NixOS settings are in ../../nixos/

{ config, pkgs, primaryUser, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Hostname
  networking.hostName = "mars";

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Host-specific user packages
  users.users.${primaryUser}.packages = with pkgs; [
    brave
    zed-editor
  ];

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # KDE Plasma Desktop Environment
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Sound with Pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  system.stateVersion = "26.05";
}
