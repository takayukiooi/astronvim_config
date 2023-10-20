return {
  "nvim-treesitter/nvim-treesitter",
  name = "nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = { "dart", "go", "php", "typescript", "lua", }
    opts.highlight = { enable = true }
  end,
}
