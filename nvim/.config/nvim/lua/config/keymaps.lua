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

-- Alt+j/k is byte-identical to a fast Esc,j / Esc,k, so move lines with Ctrl+Shift+j/k instead
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")

vim.keymap.set("n", "<C-S-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<C-S-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<C-S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<C-S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<C-S-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<C-S-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split right" })
vim.keymap.set("n", "<leader>-", "<C-w>s", { desc = "Split down" })
