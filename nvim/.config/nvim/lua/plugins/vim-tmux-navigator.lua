-- return {
--   "christoomey/vim-tmux-navigator",
--   cmd = {
--     "TmuxNavigateLeft",
--     "TmuxNavigateDown",
--     "TmuxNavigateUp",
--     "TmuxNavigateRight",
--     "TmuxNavigatePrevious",
--     "TmuxNavigatorProcessList",
--   },
--   keys = {
--     { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
--     { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
--     { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
--     { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
--     -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
--   },
-- }
--
return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  config = function()
    -- LazyVim sets its own default <C-h/j/k/l> window-nav keymaps on the
    -- VeryLazy autocmd, which fires after this config() runs and would
    -- otherwise clobber the herdr-aware mapping below. Load it on VeryLazy
    -- too so it registers after LazyVim's and wins.
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      once = true,
      callback = function()
        dofile(vim.fn.expand("~/.config/herdr/vim-herdr-navigation/editor/nvim.lua"))
      end,
    })
  end,
}
