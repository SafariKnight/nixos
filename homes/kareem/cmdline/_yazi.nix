{ ... }:
{
  programs.yazi = {
    enable = true;
    keymap = {
      manager.prepend_keymap = [
        {
          on = "!";
          run = "shell \"$SHELL\" --block";
          desc = "Open Shell here";
        }
      ];
    };
  };
}
