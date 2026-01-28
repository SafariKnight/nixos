{
  configurations.hjem.kareem = {
    services.keyd = {
      enable = true;
      keyboards.default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(nav, esc)";
          };
          "nav:C" = {
            d = "layer(shift)";
            f = "layer(control)";
            j = "left";
            k = "down";
            l = "up";
            semicolon = "right";
            "'" = "backspace";
            leftbrace = "delete";
          };
        };
      };
    };
  };
}
