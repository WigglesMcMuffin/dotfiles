return {
  { -- Really snazzy git blame interface
    "FabijanZulj/blame.nvim",
    lazy = false,
    opts = {},
    keys = {
      { "<leader>gbv", "<cmd>BlameToggle virtual<cr>", desc = "Blame: Toggle virtual blame" },
      { "<leader>gbb", "<cmd>BlameToggle<cr>", desc = "Blame: Toggle blame window" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
    keys = {
      { "<leader>gbl", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Gitsigns: Toggle blaming singular line" },
      { "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Gitsigns: Stage/Unstage current hunk" },
      { "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Gitsigns: Reset current hunk" },
      { "<leader>ghq", "<cmd>Gitsigns setqflist target=all<cr>", desc = "Gitsigns: Send hunks to quickfix list" },
    },
  },
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required

      -- Git diff changer
      "sindrets/diffview.nvim",        -- optional

      -- For a custom log pager
      "m00qek/baleia.nvim",            -- optional

      -- File picker
      "nvim-mini/mini.pick",           -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit kind=floating<cr>", desc = "Show Neogit UI" }
    }
  },
}
