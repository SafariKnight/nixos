return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000,
  enabled = false,
  opts = {
    -- Style preset for diagnostic messages
    -- Available options:
    -- "modern", "classic", "minimal", "powerline",
    -- "ghost", "simple", "nonerdfont", "amongus"
    preset = "simple",

    transparent_bg = true, -- Set the background of the diagnostic to transparent

    hi = {
      error = "DiagnosticError", -- Highlight group for error messages
      warn = "DiagnosticWarn", -- Highlight group for warning messages
      info = "DiagnosticInfo", -- Highlight group for informational messages
      hint = "DiagnosticHint", -- Highlight group for hint or suggestion messages
      arrow = "NonText", -- Highlight group for diagnostic arrows

      -- Background color for diagnostics
      -- Can be a highlight group or a hexadecimal color (#RRGGBB)
      background = "None",

      -- Color blending option for the diagnostic background
      -- Use "None" or a hexadecimal color (#RRGGBB) to blend with another color
      mixing_color = require("catppuccin.palettes").get_palette("mocha").base,
    },

    options = {
      throttle = 0,
      multilines = {
        enabled = true,
      },
    },
    disabled_ft = {}, -- List of filetypes to disable the plugin
  },
  init = function()
    vim.diagnostic.config({ virtual_text = false })
  end,
}
