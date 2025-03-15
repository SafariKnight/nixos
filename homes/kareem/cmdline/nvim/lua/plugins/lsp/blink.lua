return {
  {
    "saghen/blink.cmp",
    lazy = false,
    version = "*",
    dependencies = {
      "supermaven-inc/supermaven-nvim",
    },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-e>"] = {
          function()
            local suggestion = require("supermaven-nvim.completion_preview")
            if suggestion.has_suggestion() then
              vim.schedule(function()
                suggestion.on_accept_suggestion()
              end)
              return true
            end
          end,
          "fallback",
        },
      },
      completion = {
        keyword = { range = "prefix" },
        menu = {
          draw = {
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  if ctx.source_id == "supermaven" then
                    return "󰭹"
                  end
                  return ctx.kind_icon .. ctx.icon_gap
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = true,
        },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
      },
      signature = { enabled = true },

      sources = {
        default = {
          "lazydev",
          "lsp",
          "path",
          "snippets",
          "supermaven",
          "buffer",
        },
        providers = {
          supermaven = {
            name = "supermaven",
            module = "blink.compat.source",
            score_offset = 100,
            timeout_ms = 2000,
            async = true,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
    opts = {},
  },
}
