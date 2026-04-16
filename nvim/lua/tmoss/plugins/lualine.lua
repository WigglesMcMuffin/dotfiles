return {
  {
    "hoob3rt/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'iceberg_dark',
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { {"filename", path=1} },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = {},
            lualine_z = { "location" },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { {"filename", path=1} },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "lsp_status", "progress" },
            lualine_z = { "location" }
        }
      }
    end,
  },
}
