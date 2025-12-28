{pkgs, ...}: {
  hjem.users.kareem = {
    packages = with pkgs; [
      git-get
      lazygit
    ];
    rum.programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Kareem Hisham";
          email = "safariknight2@gmail.com";
        };
        init = {
          defaultBranch = "main";
        };
      };
      ignore = ''
        .jj

        .direnv
        .envrc
        *.env*
        !.env.example

        .projectile

        .DS_Store
        Thumbs.db
        mprocs.log
      '';
    };
  };
}
