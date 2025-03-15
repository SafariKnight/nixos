{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-mauve-standard";
      package = (
        pkgs.catppuccin-gtk.override {
          accents = [ "mauve" ];
          variant = "mocha";
        }
      );
    };
    iconTheme = {
      name = "breeze-dark";
      package = pkgs.kdePackages.breeze-icons;
    };
    gtk3.extraConfig = {
      gtk-cursor-blink = false;
    };
  };
}
