{
  configurations.hjem.kareem = {
    hjem.users.kareem = {
      rum.programs.helix = {
        enable = true;
        settings = {
          theme = "carbonfox";
          editor = {
            scrolloff = 9999;
            line-number = "relative";
            cursor-shape.insert = "bar";
            idle-timeout = 0;
            completion-trigger-len = 0;
          };
          keys.normal = {
            D = ["select_mode" "goto_line_end" "delete_selection"];
            "A-D" = ["select_mode" "goto_line_end" "delete_selection_noyank"];
          };
        };
        languages = {
          language-server = {
            emmet-lsp = {
              command = "emmet-language-server";
              args = ["--stdio"];
            };
            qmlls = {
              command = "qmlls";
              args = ["-E"];
            };
          };
          language = [
            {
              name = "html";
              roots = [".git"];
              language-servers = ["emmet-lsp"];
            }
            {
              name = "qml";
              language-servers = ["qmlls"];
            }
            {
              name = "python";
              language-servers = ["basedpyright"];
            }
          ];
        };
      };
    };
  };
}
