{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.boot.greetd;
in
{
  options = {
    modules.boot.greetd.enable = lib.mkEnableOption "Enable Greetd Autologin";
    modules.boot.greetd.command = lib.mkOption {
      description = lib.mdDoc "Command to run on startup";
      default = "niri-session";
      type = lib.types.str;
    };
    modules.boot.greetd.startupUser = lib.mkOption {
      description = lib.mdDoc "User with autologin";
      type = lib.types.str;
    };
  };
  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session =
          let
            tuigreet = "${lib.getExe pkgs.greetd.tuigreet}";
            baseSessions = "${config.services.displayManager.sessionData.desktops}";
            xSessions = "${baseSessions}/share/xsessions";
            waylandSessions = "${baseSessions}/share/wayland-sessions";
            tuigreetOptions = [
              "--remember"
              "--remember-session"
              "--sessions ${waylandSessions}:${xSessions}"
              "--time"
              # Make sure theme is wrapped in single quotes. See https://github.com/apognu/tuigreet/issues/147
              "--theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red'"
              "--cmd ${cfg.command}"
            ];
            flags = lib.concatStringsSep " " tuigreetOptions;
          in
          {
            command = "${tuigreet} ${flags}";
            user = "greeter";
          };
      };
    };
  };
}
