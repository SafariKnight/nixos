return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",

      styles = { -- `:help attr-list`
        comments = { "italic" },
        conditionals = { "italic" },
      },
      custom_highlights = function(c)
        return {
          BlinkCmpGhostText = {
            fg = c.subtext0,
          },
          SignColumn = {
            fg = c.mauve,
          },
        }
      end,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
