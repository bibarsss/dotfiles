-- ============================================================================
-- Explorer
-- ============================================================================

-- remembers explorer's hidden/ignored toggles (alt+h / alt+i) between open/close
local explorer_state = { hidden = false, ignored = false }

-- to not closing when i repeatedly click on <leader>e
vim.keymap.set("n", "<leader>e", function()
  local picker = Snacks.picker.get({ source = "explorer" })[1]

  if picker then
    picker:focus("list")
  else
    Snacks.explorer({
      hidden = explorer_state.hidden,
      ignored = explorer_state.ignored,
      on_close = function(p)
        explorer_state.hidden = p.opts.hidden
        explorer_state.ignored = p.opts.ignored
      end,
    })
  end
end, { desc = "Focus or Open Explorer" })

-- ============================================================================
-- Search
-- ============================================================================

-- alt+/ to clear my search highlights
vim.keymap.set({ "n", "v", "o", "i" }, "<M-/>", "<cmd>nohlsearch<cr>", { desc = "Clear Search Highlight" })

-- ============================================================================
-- Buffers
-- ============================================================================

vim.keymap.set("n", "<leader><delete>", "<cmd>%bd<cr>", { desc = "Close All Buffers" })
vim.keymap.set("n", "<leader><CR>", function()
  Snacks.bufdelete()
end, { desc = "Close Buffer" })

-- ============================================================================
-- Move lines
-- ============================================================================

-- Alt+j/k is byte-identical to a fast Esc,j / Esc,k, so move lines with Alt+Shift+j/k (<A-J>/<A-K>) instead
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")

-- <A-J> is the legacy Esc,J form; <A-S-j> is what the kitty keyboard protocol reports
for _, key in ipairs({ { "<A-J>", "<A-K>" }, { "<A-S-j>", "<A-S-k>" } }) do
  local down, up = key[1], key[2]
  vim.keymap.set("n", down, "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
  vim.keymap.set("n", up, "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
  vim.keymap.set("i", down, "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
  vim.keymap.set("i", up, "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
  vim.keymap.set("v", down, ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
  vim.keymap.set("v", up, ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
end

-- ============================================================================
-- Splits
-- ============================================================================

vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split right" })
vim.keymap.set("n", "<leader>-", "<C-w>s", { desc = "Split down" })
