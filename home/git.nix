{ primaryUser, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Cristea Florian Victor";
        email = "florianvictorcristea@gmail.com";
      };
      github = {
        user = primaryUser;
      };
      init = {
        defaultBranch = "main";
      };
    };
    lfs.enable = true;
    ignores = [ "**/.DS_STORE" ];
  };
}
