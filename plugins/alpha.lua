return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local dashboard = require "alpha.themes.dashboard"
    local button = require("astronvim.utils").alpha_button
    dashboard.section.buttons.val = {
      button("LDR S .", "  Last Session  "),
      button("LDR S f", "  Find Session  "),
      button("LDR f f", "  Find File  "),
      button("LDR f o", "  Find Recent  "),
      button("LDR f w", "  Find Word  "),
      button("LDR m a", "  Bookmarks  "),
    }
    return dashboard
  end,
}
