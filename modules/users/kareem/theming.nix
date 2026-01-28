{
  configurations.hjem.kareem = {pkgs, ...}: {
    hjem.users.kareem = {
      packages = with pkgs; [
        adw-gtk3
        qadwaitadecorations
        qadwaitadecorations-qt6
        adwaita-icon-theme
      ];
      environment.sessionVariables = {
        QT_QPA_PLATFORMTHEME = "gtk3";
        QT_WAYLAND_DECORATION = "adwaita";
      };
      rum.misc.gtk.settings = {
        application-prefer-dark-theme = true;
      };
    };
    programs.dconf.profiles.user.databases = [
      {
        settings = {
          "org/gnome/desktop/wm/preferences" = {
            button-layout = ":menu,close";
          };
          "org/gnome/desktop/interface" = {
            accent-color = "pink";
            gtk-theme = "Adwaita";
            color-scheme = "prefer-dark";
            font-name = "Manrope 13";
          };
        };
      }
    ];
    i18n.inputMethod.fcitx5.waylandFrontend = true;
  };
}
