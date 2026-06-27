{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      la = "ls -la";
      ".." = "cd ..";
      nix-switch = if pkgs.stdenv.isDarwin then
        "sudo darwin-rebuild switch --flake ~/.config/nix"
      else
        "sudo nixos-rebuild switch --flake ~/.config/nix#mars";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[λ](bold green)";
        error_symbol = "[λ](bold red)";
      };
    };
  };
}
