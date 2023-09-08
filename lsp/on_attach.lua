return function(client, bufnr)
  vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
  vim.lsp.handlers["textDocument/definition"] = require("telescope.builtin").lsp_definitions

  local map = vim.keymap
  map.set('n', '<space>l.', '<cmd>Lspsaga finder<cr>')
  map.set('n', '<space>r', '<cmd>Lspsaga rename<cr>')
  map.set('n', 'K', '<cmd>Lspsaga show_line_diagnostics<cr>')
  map.set('n', 'J', '<cmd>Lspsaga signature_help<cr>')
  map.set('n', 'H', '<cmd>Lspsaga preview_definition<cr>')
  map.set('n', '<space>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  map.set('n', '<space>lr', '<cmd>lua vim.lsp.buf.references()<cr>')
  map.set('n', '<space>lm', '<cmd>lua vim.lsp.buf.definition()<cr>')
end
