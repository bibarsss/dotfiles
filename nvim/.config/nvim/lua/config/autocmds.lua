-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- herdr-nvim sidebar: the sidebar is a UI attached to a headless nvim daemon that
-- normally outlives the sidebar. Quit the daemon when its last UI detaches
-- (:q in the sidebar, or toggling it closed) so it doesn't linger or get stuck.
if (vim.v.servername or ""):find("/herdr%-nvim/") then
  vim.api.nvim_create_autocmd("UILeave", {
    group = vim.api.nvim_create_augroup("herdr_nvim_daemon_quit", { clear = true }),
    callback = function()
      vim.schedule(function()
        if #vim.api.nvim_list_uis() == 0 then
          -- plain :qa so unsaved buffers keep the daemon alive instead of losing work
          pcall(vim.cmd, "qa")
        end
      end)
    end,
  })
end
