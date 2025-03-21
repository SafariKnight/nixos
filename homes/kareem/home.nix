{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      qbittorrent-enhanced
      fastfetch
      gparted
      xorg.xhost
      thunderbird
      just
      gimp
      krita
      inkscape
      tlrc
      zed-editor-fhs
      bibata-nord
    ];
    pointerCursor = {
      name = "Bibata-Nord";
      package = pkgs.bibata-nord;
      size = 24;
      x11.enable = true;
      gtk.enable = true;
    };
  };
}
