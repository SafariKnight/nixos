{pkgs, ...}: {
  hjem.users.kareem = {
    packages = with pkgs; [
      jjui
      jj-push
    ];
    ext.programs.jujutsu = {
      enable = true;
      settings = {
        user = {
          name = "Kareem Hisham";
          email = "safariknight2@gmail.com";
        };

        ui = {
          diff-editor = ":builtin";
          pager = ":builtin";
        };

        git = {
          write-change-id-header = true;
        };
      };
    };
  };
}
