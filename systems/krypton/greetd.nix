{
  lib,
  config,
  pkgs,
  ...
}: {
  console.colors = [
    # normal
    "282828"
    "ee5396"
    "25be6a"
    "08bdba"
    "78a9ff"
    "be95ff"
    "33b1ff"
    "dfdfe0"

    # bright
    "484848"
    "f16da6"
    "46c880"
    "2dc7c4"
    "8cb6ff"
    "c8a5ff"
    "52bdff"
    "e4e4e5"
  ];
  services.greetd = {
    enable = false;
    settings = {
      default_session = let
        tuigreet = "${lib.getExe pkgs.tuigreet}";
        baseSessions = "${config.services.displayManager.sessionData.desktops}";
        xSessions = "${baseSessions}/share/xsessions";
        waylandSessions = "${baseSessions}/share/wayland-sessions";
        tuigreetOptions = [
          "--remember"
          "--remember-session"
          "--sessions ${waylandSessions}:${xSessions}"
          "--time"
          # Make sure theme is wrapped in single quotes. See https://github.com/apognu/tuigreet/issues/147
          "--theme 'border=lightmagenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red'"
          # (lib.strings.optionalString (cfg.command != "") "--cmd ${cfg.command}")
        ];
        flags = lib.concatStringsSep " " tuigreetOptions;
      in {
        command = "${tuigreet} ${flags}";
        user = "greeter";
      };
    };
  };
}
