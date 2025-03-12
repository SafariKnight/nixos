{ ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Kareem Hisham";
        email = "safariknight2@gmail.com";
      };
      ui = {
        editor = "nvim";
        diff-editor = ":builtin";
        color = "always";
        # merge-editor = "nvim -d";
        default-command = "status";
        paginate = "never";
      };
    };
  };
}
