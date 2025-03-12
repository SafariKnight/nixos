{
  pkgs,
  rofi-wayland,
}:
pkgs.writeShellApplication {
  name = "rofi-logout";
  runtimeInputs = [
    rofi-wayland
  ];
  text = ''
    #!/usr/bin/env bash

    CHOICE=$(echo -e "Shutdown\nReboot\nSleep\nHibernate" | rofi -dmenu)

    case $CHOICE in
      Shutdown)
        systemctl poweroff
        ;;
      Reboot)
        systemctl reboot
        ;;
      Sleep)
        systemctl suspend
        ;;
      Hibernate)
        systemctl hibernate
        ;;
    esac
  '';
}
