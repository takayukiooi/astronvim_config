return {
  n = {
    -- better buffer navigation
    ["]b"] = false,
    ["[b"] = false,
    ["<C-e>"] = "$",
    ["<C-a>"] = "0",
    ["<C-f>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<C-b>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
  },
}
