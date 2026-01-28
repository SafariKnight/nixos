return {
  "typst-preview.nvim",
  lazy = false,
  -- ft = "typst",
  after = function()
    require("typst-preview").setup {
      dependencies_bin = {
        ["tinymist"] = "tinymist",
        ["websocat"] = "websocat",
      },
    }
  end,
}
