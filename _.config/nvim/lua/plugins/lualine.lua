return {
  {
    "hoob3rt/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'iceberg_dark',
        }
      }
    end,
  },
}
