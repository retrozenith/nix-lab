{
  pkgs,
  inputs,
  self,
  primaryUser,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  # nix config
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  # common system packages
  environment.systemPackages = with pkgs; [
    git
  ];

  # enable zsh system-wide (required for user default shell)
  programs.zsh.enable = true;

  # home-manager config
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${primaryUser} = {
      imports = [
        ../home
      ];
    };
    extraSpecialArgs = {
      inherit inputs self primaryUser;
    };
  };

  # common user setup
  users.users.${primaryUser} = {
    isNormalUser = true;
    description = "Cristea Florian Victor";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  # common services
  services.openssh.enable = true;

  # timezone & locale
  time.timeZone = "Europe/Bucharest";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ro_RO.UTF-8";
    LC_IDENTIFICATION = "ro_RO.UTF-8";
    LC_MEASUREMENT = "ro_RO.UTF-8";
    LC_MONETARY = "ro_RO.UTF-8";
    LC_NAME = "ro_RO.UTF-8";
    LC_NUMERIC = "ro_RO.UTF-8";
    LC_PAPER = "ro_RO.UTF-8";
    LC_TELEPHONE = "ro_RO.UTF-8";
    LC_TIME = "ro_RO.UTF-8";
  };

  # enable networking
  networking.networkmanager.enable = true;
}
