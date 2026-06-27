{ lib, ... }: # pkgs not needed for now
{
  # ─────────────────────────────────────────────────────────────────────────────
  # DISABLED: nix-built mise has HTTP bugs on x86_64-darwin (Rust 1.88 issue)
  # See: https://github.com/NixOS/nixpkgs/issues/427748
  # Using homebrew mise instead. Re-enable when nixpkgs fixes the issue.
  # ─────────────────────────────────────────────────────────────────────────────
  # programs.mise = {
  #   enable = true;
  #   enableZshIntegration = true;
  #
  #   settings = {
  #     experimental = true;
  #     verbose = false;
  #     auto_install = true;
  #   };
  # };

  # activation script to set up mise configuration
  home.activation.setupMise = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    MISE_BIN=""
    if [ -f /opt/homebrew/bin/mise ]; then
      MISE_BIN="/opt/homebrew/bin/mise"
    elif command -v mise >/dev/null 2>&1; then
      MISE_BIN="mise"
    fi

    if [ -n "$MISE_BIN" ]; then
      # enable corepack (pnpm, yarn, etc.)
      $MISE_BIN set MISE_NODE_COREPACK=true

      # disable warning about */.node-version files
      $MISE_BIN settings add idiomatic_version_file_enable_tools "[]"

      # set global tool versions (auto_install will handle installation)
      $MISE_BIN use --global node@lts
      $MISE_BIN use --global bun@latest
      $MISE_BIN use --global deno@latest
      $MISE_BIN use --global uv@latest
      $MISE_BIN use --global rust@stable
    fi
  '';
}
