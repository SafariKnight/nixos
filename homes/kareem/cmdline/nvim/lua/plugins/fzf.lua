return {
  "ibhagwan/fzf-lua",
  command = { "FzfLua" },
  enabled = false,
  opts = function()
    local c = require("catppuccin.palettes").get_palette("mocha")
    return {
      lsp = {
        -- make lsp requests synchronous so they work with null-ls
        async_or_timeout = 3000,
      },
      fzf_colors = {
        ["bg+"] = c.surface0,
        ["fg+"] = c.text,
        ["pointer"] = c.mantle,
        ["gutter"] = "-1",
        ["border"] = c.base,
        ["preview-border"] = c.base,
        ["separator"] = c.base,
      },
    }
  end,
  keys = {
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "Files",
    },
    {
      "<leader><space>",
      function()
        require("fzf-lua").files()
      end,
      desc = "Find Files",
    },
  },
  config = function(_, opts)
    local fzf = require("fzf-lua")
    fzf.setup(opts)
    fzf.register_ui_select()
  end,
}
