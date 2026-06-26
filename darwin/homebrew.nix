{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };

    caskArgs.no_quarantine = false;
    global.brewfile = true;

    # homebrew is best for GUI apps
    # nixpkgs is best for CLI tools
    casks = [
      "warp"
      "brave-browser"
      "openlogi"
      "zed"
      "antigravity"
      "backdrop"
      "mos"
      "stirling-pdf"
      "altserver"
    ];
    brews = [
      "docker"
      "mise"
    ];
    taps = [
      "nikitabobko/tap"
    ];
  };
}
