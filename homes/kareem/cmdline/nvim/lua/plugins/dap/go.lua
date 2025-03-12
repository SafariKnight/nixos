return {
  "leoluz/nvim-dap-go",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  ft = "go",
  main = "dap-go",
  opts = function()
    return {
      dap_configurations = {
        {
          type = "go",
          name = "Debug Package (Arguments)",
          request = "launch",
          program = "${workspaceFolder}",
          args = require("dap-go").get_arguments,
          -- buildFlags = require("dap-go").get_build_flags,
        },
      },
    }
  end,
}
