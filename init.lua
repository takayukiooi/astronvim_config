return {
  lsp = {
    servers = {
      "dartls",
    },
    setup_handlers = {
      -- add custom handler
      dartls = function(_, opts)
        opts.on_attach = function(client, bufnr)
          local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
          local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

          local map_opts = { noremap = true, silent = true }

          buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', map_opts)
          buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
          buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
          buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', map_opts)
        end

        require("flutter-tools").setup {
          lsp = opts,
          fvm = true,
          widget_guides = {
            enabled = true
          },
          outline = {
            auto_open = true
          },
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
  },
}
