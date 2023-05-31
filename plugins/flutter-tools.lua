return {
  {
    "akinsho/flutter-tools.nvim",
    name = "flutter-tools",
    lazy = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "stevearc/dressing.nvim" },
    },
    config = function()
      require("flutter-tools").setup {
        fvm = true,
        widget_guides = {
          enabled = true
        },
        outline = {
          auto_open = true
        },
      }
    end
  },
}
