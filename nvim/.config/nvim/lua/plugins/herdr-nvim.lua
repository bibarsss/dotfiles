return {
  "ChmaraX/herdr-nvim",
  cond = not vim.tbl_contains(vim.v.argv, "--headless"),
  opts = {},
}
