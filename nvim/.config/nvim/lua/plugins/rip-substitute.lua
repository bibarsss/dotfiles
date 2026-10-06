-- return {
--   "chrisgrieser/nvim-rip-substitute",
--   keys = {
--     {
--       "g/",
--       function()
--         require("rip-substitute").sub()
--       end,
--       mode = { "n", "x" },
--       desc = "Rip Substitute",
--     },
--   },
-- }

return {
  {
    "chrisgrieser/nvim-rip-substitute",
    keys = {
      {
        "g/",
        function()
          local mode = vim.fn.mode()

          -- Only convert characterwise Visual mode.
          -- Keep Visual Line mode (V) untouched.
          if mode == "v" then
            vim.cmd("normal! V")
          end

          require("rip-substitute").sub()
        end,
        mode = { "x", "n" },
        desc = "Rip Substitute",
      },
    },
  },
}
