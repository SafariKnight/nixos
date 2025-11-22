{config, ...}: {
  services.displayManager.ly = let
    baseSessions = "${config.services.displayManager.sessionData.desktops}";
    xSessions = "${baseSessions}/share/xsessions";
    waylandSessions = "${baseSessions}/share/wayland-sessions";
  in {
    enable = true;
    settings = {
      waylandsessions = waylandSessions;
      xsessions = xSessions;
      bg = "0x20000000";
      fg = "0x0000FFFF";
      border_fg = "0x00FF00FF";
      error_bg = "0x20000000";
      error_fg = "0x01FF0000";
    };
  };
}
