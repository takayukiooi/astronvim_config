return {
  plugins = {
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
    { "L3MON4D3/LuaSnip",                    enabled = false },
  },
  lsp = {
    servers = {
      "dartls",
    },
    formatting = {
      format_on_save = {
        enabled = true,
        ignore_filetypes = {
          "php",
        },
      },
      disabled = {
        "intelephense",
      }
    },
    setup_handlers = {
      -- add custom handler
      dartls = function(_, opts)
        require("flutter-tools").setup {
          lsp = opts,
          fvm = true,
          outline = {
            open_cmd = "60vnew",
            auto_open = false
          },
        }

        require("telescope").load_extension("flutter")
      end,
    },
    config = {
      dartls = {
        settings = {
          showTodos = false,
          completeFunctionCalls = true,
        },
      },
    },
  },
}
