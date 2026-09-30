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
