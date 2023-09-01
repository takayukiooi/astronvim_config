return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    require("telescope").load_extension("conventional_commits")

    return opts
  end
}
