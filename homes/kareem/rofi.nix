{
  pkgs,
  config,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "Jeb Brains Mono 15";
    location = "top";
    # yoffset = -32;
    extraConfig = {
      modes = [
        "combi"
        "drun"
      ];
      modi = "window,drun,run";
      icon-theme = "Papirus-Dark";
      show-icons = true;
    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          nord0 = mkLiteral "#2E3440";
          # nord1 = mkLiteral "#3B4252";
          # nord2 = mkLiteral "#434C5E";
          # nord3 = mkLiteral "#4C566A";
          nord4 = mkLiteral "#D8DEE9";
          # nord5 = mkLiteral "#E5E9F0";
          nord6 = mkLiteral "#ECEFF4";
          # nord7 = mkLiteral "#8FBCBB";
          nord8 = mkLiteral "#88C0D0";
          # nord9 = mkLiteral "#81A1C1";
          # nord10 = mkLiteral "#5E81AC";
          # nord11 = mkLiteral "#BF616A";
          # nord12 = mkLiteral "#D08770";
          # nord13 = mkLiteral "#EBCB8B";
          # nord14 = mkLiteral "#A3BE8C";
          # nord15 = mkLiteral "#B48EAD";
          bg-col = mkLiteral "#1e1e2e";
          selected-col = mkLiteral "#f38ba8";
          fg-col = mkLiteral "#cdd6f4";

          background-color = mkLiteral "@bg-col";
          text-color = mkLiteral "@fg-col";
        };

        "selected" = {
          text-color = mkLiteral "@selected-col";
          font-weight = 900;
        };

        "window" = {
          width = mkLiteral "100%";
          # height = mkLiteral "35px";
          # text-color = mkLiteral "@nord6";
          # background-color = mkLiteral "@nord0";
          anchor = mkLiteral "north";
          padding = mkLiteral "0 4px";
          children = mkLiteral "[ horibox ]";
        };

        "horibox" = {
          orientation = mkLiteral "horizontal";
          children = mkLiteral "[ prompt, entry, listview ]";
        };

        "prompt" = {
          margin = mkLiteral "0 16px";
        };

        "listview" = {
          layout = mkLiteral "horizontal";
          # spacing = mkLiteral "5px";
          lines = 10;
        };

        "entry" = {
          expand = mkLiteral "false";
          width = mkLiteral "10em";
        };

        "element" = {
          padding = mkLiteral "0px 7px";
        };
      };
  };
}
