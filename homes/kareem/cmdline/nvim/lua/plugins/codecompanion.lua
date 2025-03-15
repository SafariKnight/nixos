return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "github/copilot.vim",
      init = function() -- Only here for codecompanion to work
        vim.g.copilot_enabled = false
      end,
    },
  },
  opts = {
    llm = {
      adapter = "copilot",
    },
    adapters = {},
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
    },
  },
  keys = {
    {
      "<leader>aa",
      ":CodeCompanionActions<CR>",
      desc = "Code Companion Actions",
      mode = { "n", "v" },
    },
  },
}
