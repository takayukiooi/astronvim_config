return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")
    opts.sources = {
      null_ls.builtins.formatting.prettier.with {
        condition = function(utils)
          return utils.has_file { ".prettierrc", ".prettierrc.js" }
        end,
        prefer_local = "node_modules/.bin",
      },
    }
  end
}
