return {
  {
    "maxandron/goplements.nvim",
    name = "goplements",
    ft = "go",
    config = function()
      require("goplements").setup {
        prefix = {
          interface = "implemented by: ",
          struct = "implements: ",
        },
        namespace_name = "goplements",
        display_package = true,
        highlight = "Goplements",
      }
    end,
  },
}
