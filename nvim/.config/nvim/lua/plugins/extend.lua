return {
  --to show realtime keys im clicking
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   opts = function(_, opts)
  --     -- "%S" is Neovim's macro/showcmd component
  --     -- This inserts it into the right side (Section X) of your bottom bar
  --     table.insert(opts.sections.lualine_x, 1, {
  --       function()
  --         return "%S"
  --       end,
  --     })
  --   end,
  -- },
  --
  -- to navigate between buffers using counted command
  -- {
  --   "akinsho/bufferline.nvim",
  --   keys = {
  --     {
  --       "L",
  --       function()
  --         vim.cmd("bnext " .. vim.v.count1)
  --       end,
  --       desc = "Next buffer",
  --     },
  --     {
  --       "H",
  --       function()
  --         vim.cmd("bprev " .. vim.v.count1)
  --       end,
  --       desc = "Previous buffer",
  --     },
  --     {
  --       "]b",
  --       function()
  --         vim.cmd("bnext " .. vim.v.count1)
  --       end,
  --       desc = "Next buffer",
  --     },
  --     {
  --       "[b",
  --       function()
  --         vim.cmd("bprev " .. vim.v.count1)
  --       end,
  --       desc = "Previous buffer",
  --     },
  --   },
  -- },
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = true,
      },
      -- picker = {
      --   sources = {
      --     explorer = {
      --       hidden = true, -- Show hidden files (starting with a dot)
      --       ignored = true, -- Show git-ignored files (like .env)
      --     },
      --     files = {
      --       hidden = true,
      --       ignored = true,
      --     },
      --   },
      -- },
    },
  },
}
