-- A bunch of utility tools for nvim
-- Will definitely need to dig in further
-- As everything is currently unconfigured
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      scratch = { enabled = true },
      input = { enabled = true },
      indent = { enabled = true },
      lazygit = { enabled = true },
      dim = { enabled = true },
      notifier = { enabled = true },
    },
    keys = {
      { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    }
  },
  {
    "nvim-mini/mini.nvim", version = '*'
  },
}
