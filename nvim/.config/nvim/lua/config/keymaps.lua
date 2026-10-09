-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- to not closing when i repeatedly click on <leader>e
vim.keymap.set("n", "<leader>e", function()
  local picker = Snacks.picker.get({ source = "explorer" })[1]

  if picker then
    picker:focus("list")
  else
    Snacks.explorer()
  end
end, { desc = "Focus or Open Explorer" })

-- alt+/ to clear my search highlights
vim.keymap.set({ "n", "v", "o", "i" }, "<M-/>", "<cmd>nohlsearch<cr>", { desc = "Clear Search Highlight" })

vim.keymap.set("n", "<leader><delete>", "<cmd>%bd<cr>", { desc = "Close All Buffers" })

vim.keymap.set("n", "<leader><CR>", function()
  Snacks.bufdelete()
end, { desc = "Close Buffer" })

vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
