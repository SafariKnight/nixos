{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Kareem Hisham";
    userEmail = "safariknight2@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      advice.addIgnoredFile = false;
    };
    aliases = {
      l = "log --oneline";
      s = "status -s";
      co = "checkout";
    };
  };
}
