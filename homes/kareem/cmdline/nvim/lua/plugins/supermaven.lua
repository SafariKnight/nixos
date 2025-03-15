return {
  "supermaven-inc/supermaven-nvim",
  opts = {
    keymaps = {
      accept_suggestion = nil, -- handled by nvim-cmp / blink.cmp
    },
    disable_inline_completion = true,
    ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
  },
  keys = {
    { "<leader>ase", "<CMD>SupermavenStop<CR>", desc = "End" },
    { "<leader>asr", "<CMD>SupermavenRestart<CR>", desc = "Restart" },
    { "<leader>ass", "<CMD>SupermavenStart<CR>", desc = "Start" },
  },
}
