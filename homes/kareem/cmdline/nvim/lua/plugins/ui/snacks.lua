local dim = false
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = { enabled = true },
    bigfile = { enabled = true },
    dim = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd

        vim.api.nvim_create_user_command(
          "Messages",
          Snacks.notifier.show_history,
          {}
        )
        vim.api.nvim_create_user_command(
          "Mess",
          Snacks.notifier.show_history,
          {}
        )
      end,
    })
  end,
  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Files",
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Files",
    },
    {
      "<leader>fM",
      function()
        Snacks.explorer()
      end,
      desc = "File Tree",
    },
    {
      "<leader>ft",
      function()
        Snacks.picker.grep()
      end,
      desc = "Text",
    },
    {
      "<leader>fu",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo",
    },
    {
      "<leader>F",
      function()
        if dim then
          Snacks.dim.disable()
          dim = false
        else
          Snacks.dim()
          dim = true
        end
      end,
      desc = "Focus",
    },
  },
}
