{ pkgs, lib, ... }:
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
    # use the virtual environment created by uv
    # /opt/homebrew/bin/mise settings set python.uv_venv_auto true

    # enable corepack (pnpm, yarn, etc.)
    /opt/homebrew/bin/mise set MISE_NODE_COREPACK=true

    # disable warning about */.node-version files
    /opt/homebrew/bin/mise settings add idiomatic_version_file_enable_tools "[]"

    # set global tool versions (auto_install will handle installation)
    /opt/homebrew/bin/mise use --global node@lts
    /opt/homebrew/bin/mise use --global bun@latest
    /opt/homebrew/bin/mise use --global deno@latest
    /opt/homebrew/bin/mise use --global uv@latest
    /opt/homebrew/bin/mise use --global rust@stable
  '';
}
