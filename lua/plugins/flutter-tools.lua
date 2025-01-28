return {
  -- {
  --   "akinsho/flutter-tools.nvim",
  --   lazy = true,
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   specs = {
  --     -- Add "flutter" extension to "telescope"
  --     {
  --       "nvim-telescope/telescope.nvim",
  --       optional = true,
  --       opts = function() require("telescope").load_extension "flutter" end,
  --     },
  --   },
  -- }, -- add lsp plugin
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      table.insert(opts.servers, "dartls")

      opts = require("astrocore").extend_tbl(opts, {
        setup_handlers = {
          -- add custom handler
          dartls = function(_, dartls_opts)
            require("flutter-tools").setup {
              -- flutter_path = "/Users/s13653/fvm/versions/3.19.2",
              fvm = true,
              lsp = dartls_opts,
            }
          end,
        },
        config = {
          dartls = {
            -- any changes you want to make to the LSP setup, for example
            color = {
              enabled = true,
            },
            settings = {
              showTodos = true,
              completeFunctionCalls = true,
            },
          },
        },
      })
    end,
  },
}
