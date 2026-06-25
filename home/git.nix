{ primaryUser, ... }:
{
  programs.git = {
    enable = true;
    userName = "Cristea Florian Victor";
    userEmail = "florianvictorcristea@gmail.com";

    lfs.enable = true;

    ignores = [ "**/.DS_STORE" ];

    extraConfig = {
      github = {
        user = primaryUser;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
