{
  configurations.hjem.kareem = {
    hjem.users.kareem = {
      rum.programs.ghostty = {
        enable = true;
        settings = {
          command = "fish";
          gtk-wide-tabs = false;
          gtk-toolbar-style = "raised-border";
          window-show-tab-bar = "always";
          shell-integration-features = "no-cursor,sudo,title";
          cursor-style-blink = false;

          font-family = "Lilex";
          font-style = "Medium";
          font-style-bold = "Bold";
          font-style-italic = "Medium Italic";
          font-style-bold-italic = "Bold Italic";
          font-size = 15;

          theme = "Carbonfox";
          custom-shader = [
            (toString ./bloom.glsl)
            (toString ./cursor_warp.glsl)
            (toString ./ripple_cursor.glsl)
          ];
        };
      };
    };
  };
}
