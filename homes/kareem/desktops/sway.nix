{
  pkgs,
  lib,
  config,
  osConfig,
  ...
}:
let
  cfg = osConfig.modules.desktop.sway;
in
{
  # xdg.configFile.sway.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/homes/kareem/desktops/sway";
  # xdg.configFile.sway.source = config.lib.file.mkOutOfStoreSymlink (builtins.toString ./sway);
  wayland.windowManager.sway = lib.mkIf cfg.enable {
    enable = false;
    systemd.enable = cfg.systemd.enable;
    package = if cfg.fx then pkgs.swayfx else pkgs.sway;

    checkConfig = false;
    config = {
      menu = "rofi -show drun | xargs swaymsg exec --";
      terminal = "foot";
      modifier = "Mod4"; # Super key
      colors =
        let
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          mauve = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          mantle = "#181825";
          crust = "#11111b";
        in
        {
          focused = {
            background = lavender;
            border = lavender;

            childBorder = base;
            indicator = rosewater;
            text = crust;
          };
          focusedInactive = {
            background = overlay0;
            border = overlay0;

            childBorder = base;
            indicator = rosewater;
            text = text;
          };
          unfocused = {
            background = overlay0;
            border = overlay0;

            childBorder = base;
            indicator = rosewater;
            text = text;
          };

          urgent = {
            background = peach;
            border = peach;

            childBorder = base;
            indicator = overlay0;
            text = peach;
          };

          placeholder = {
            background = overlay0;
            border = overlay0;

            childBorder = base;
            indicator = overlay0;
            text = text;
          };
          background = base;
        };

      window.titlebar = false;

      gaps = {
        outer = 3;
        inner = 2;
        smartBorders = "on";
      };
      input = {
        "*" = {
          accel_profile = "flat";
          xkb_layout = "cmk,ara,us";
          xkb_options = "grp:win_space_toggle,altwin:menu_win";
          repeat_delay = "400";
          repeat_rate = "60";
        };
      };
      output = {
        "DP-1" = {
          mode = "1920x1080@165.003Hz";
          bg = builtins.toString (./wallpaper.png + " stretch");
        };
      };
    };
  };
}
