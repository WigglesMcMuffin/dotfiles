return {
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
    'rgroli/other.nvim',
    lazy = false, -- Important
    config = function()
      require("other-nvim").setup({
        mappings = {
          -- builtin mappings
          "livewire",
          "angular",
          "laravel",
          "rails",
          "golang",
          "python",
          "react",
          "rust",
          "elixir",
          "clojure",
        },
      })
    end,
    keys = {
      { "<leader>a", '<cmd>Other<cr>', desc="edit alternate file" },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {}
  },
}
