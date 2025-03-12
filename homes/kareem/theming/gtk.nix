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
    cursorTheme = {
      name = "Bibata-Nord";
      package = pkgs.bibata-nord;
      size = 24;
    };
  };

  # home.packages = with pkgs; [
  #   gruvbox-gtk-theme
  # ];
}
