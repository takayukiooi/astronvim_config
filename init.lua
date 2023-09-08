return {
  plugins = {
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
  },
  lsp = {
    servers = {
      "dartls",
    },
    formatting = {
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
