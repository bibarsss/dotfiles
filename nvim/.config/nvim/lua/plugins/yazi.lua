return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- Customize your preferred keymap to open Yazi
      {
        "<leader>y",
        function()
          require("yazi").yazi()
        end,
        desc = "Open yazi at the current file",
      },
      {
        -- Open yazi in the current working directory
        "<leader>Y",
        function()
          require("yazi").yazi(nil, vim.loop.cwd())
        end,
        desc = "Open yazi in cwd",
      },
    },
    opts = {
      change_neovim_cwd_on_close = true,
      -- open file in a horizontal split, vertical split, or new tab
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },
}
