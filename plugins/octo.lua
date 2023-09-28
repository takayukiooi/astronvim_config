return {
  {
    "pwntester/octo.nvim",
    name = "octo",
    lazy = false,
    dependencies = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-telescope/telescope.nvim"},
      {"nvim-tree/nvim-web-devicons"},
    },
    config = function ()
      require("octo").setup({
        enable_builtin = true
      })
      -- vim.cmd([[hi OctEditable guibg=none]])
    end
  },
}
