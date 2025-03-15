{ pkgs, ... }:
{
  qt = {
    enable = true;
    style.name = "kvantum";
  };
  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-mocha-mauve
    '';
    "Kvantum/catppuccin-mocha-mauve".source = "${
      pkgs.catppuccin-kvantum.override {
        accent = "mauve";
        variant = "mocha";
      }
    }/share/Kvantum/catppuccin-mocha-mauve";
  };
}
