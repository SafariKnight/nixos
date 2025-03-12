{ ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Jet Brains Mono:size=12";
        placeholder = "Firefox";
        icon-theme = "Papirus-Dark";
        anchor = "top";
        lines = 1;
        width = 1920;
      };
    };
  };
}
