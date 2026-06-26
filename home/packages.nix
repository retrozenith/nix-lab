{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      # dev tools
      curl
      vim
      tmux
      htop
      tree
      ripgrep
      gh
      zoxide

      # programming languages
      mise # node, deno, bun, rust, python, etc.

      # misc
      nil
      nixd
      biome
      nixfmt-rfc-style
      yt-dlp
      ffmpeg
      gnupg # Needed for mise

      # fonts
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
    ];
  };
}
