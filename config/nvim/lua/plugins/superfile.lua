return {
  "yorukot/superfile",
  lazy = false,
  keys = {
    { "<leader>E", "<cmd>terminal spf<CR>i", desc = "Open superfile" },
    { "<leader>ee", "<cmd>terminal spf %:p:h<CR>i", desc = "Open superfile (current dir)" },
  },
}
