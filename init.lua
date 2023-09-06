return {
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
          fvm = true,
          lsp = {
            color = {
              enabled = false,        -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
              background = false,     -- highlight the background
              background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
              foreground = false,     -- highlight the foreground
              virtual_text = false,   -- show the highlight using virtual text
            },
            settings = {
              showTodos = false,
              completeFunctionCalls = false,
              renameFilesWithClasses = "prompt", -- "always"
              enableSnippets = true,
              updateImportsOnRename = true,      -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
            }
          }
        }
        --       require("telescope").load_extension("flutter")
      end,
    },
    config = {
      dartls = {
        -- any changes you want to make to the LSP setup, for example
        -- color = {
        --   enabled = true,
        -- },
        init_options = {
          closingLabels = true,
          flutterOutline = false,
          onlyAnalyzeProjectsWithOpenFiles = true,
          outline = false,
          suggestFromUnimportedLibraries = true
        },
        settings = {
          dart = {
            showTodos = false,
            completeFunctionCalls = false,
          }
        },
      },
    },
  },
}
