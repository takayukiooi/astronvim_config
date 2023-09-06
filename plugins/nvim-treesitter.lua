return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = {
      "css",
      "html",
      "go",
      "typescript",
      "javascript",
      "json",
      "lua",
      "yaml",
      "scss",
    }
    opts.ignore_install = { "dart" }
    opts.highlight = {
      disable = { "dart" }
    }
    opts.indent = {
      disable = { "dart" }
    }
  end
}
