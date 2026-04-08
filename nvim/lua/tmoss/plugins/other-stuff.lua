return {
  {
    "folke/neoconf.nvim",
    opts = {},
  },
  {
    "vim-test/vim-test",
    keys={
      { "<leader>tn",  "<cmd>TestNearest<cr>", desc = "vim-test: Test Nearest" },
      { "<leader>tf",  "<cmd>TestFile<cr>", desc = "vim-test: Test File" },
      { "<leader>ts",  "<cmd>TestSuite<cr>", desc = "vim-test: Test Suite" },
      { "<leader>tl",  "<cmd>TestLast<cr>", desc = "vim-test: Test Last" },
    },
  },
  "nvim-lua/popup.nvim",
  "preservim/tagbar",
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {}
  },
}
