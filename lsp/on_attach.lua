return function(client, bufnr)
  local map = vim.keymap
  map.set('n', '<space>gh', '<cmd>Lspsaga lsp_finder<cr>')
  map.set('n', '<space>ga', '<cmd>Lspsaga code_action<cr>')
  map.set('n', '<space>gr', '<cmd>Lspsaga rename<cr>')
  map.set('n', '<space>gs', '<cmd>Lspsaga show_line_diagnostics<cr>')
  map.set('n', 'K', '<cmd>Lspsaga show_line_diagnostics<cr>')
  map.set('n', 'J', '<cmd>Lspsaga signature_help<cr>')
  map.set('n', 'H', '<cmd>Lspsaga preview_definition<cr>')
end
