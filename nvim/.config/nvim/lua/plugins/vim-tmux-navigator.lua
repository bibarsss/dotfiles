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

        -- Snacks explorer renders its list/input as floating windows nested
        -- inside a box split. `wincmd h` from there doesn't reliably report
        -- "no window to the left" (it can bounce into the preview split
        -- instead), so the editor-side nav() never detects the edge and
        -- never hands off to herdr. Cross out directly for these filetypes.
        local function cross_left()
          local pane = vim.env.HERDR_PANE_ID
          if not pane or pane == "" then
            return
          end
          local herdr = vim.env.HERDR_BIN_PATH
          if herdr == nil or herdr == "" then
            herdr = "herdr"
          end
          vim.fn.system({ herdr, "pane", "focus", "--direction", "left", "--pane", pane })
        end

        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "snacks_picker_list", "snacks_picker_input" },
          callback = function(ev)
            vim.keymap.set("n", "<C-h>", cross_left, {
              buffer = ev.buf,
              silent = true,
              noremap = true,
              desc = "Navigate left (vim/herdr)",
            })
          end,
        })
      end,
    })
  end,
}
