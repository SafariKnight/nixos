{ pkgs, ... }:
{
  # home.packages = with pkgs; [
  #   kdePackages.qtstyleplugin-kvantum
  #   libsForQt5.qtstyleplugin-kvantum
  #   (catppuccin-kvantum.override {
  #     accent = "mauve";
  #     variant = "mocha";
  #   })
  #
  #   kdePackages.qt6ct
  #   libsForQt5.qt5ct
  # ];

  # home.sessionVariables = {
  #   XDG_CURRENT_DESKTOP = "kde"; # Fixes some apps like dolphin
  # };

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
