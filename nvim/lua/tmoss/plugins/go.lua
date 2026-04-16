return {
  --{ "fatih/vim-go", enabled=true },
  {
    "fredrikaverpil/godoc.nvim",
    version = "*",
    dependencies = {
      { "nvim-telescope/telescope.nvim", },
      { "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate godoc go",
        config = function()
          require("nvim-treesitter.parsers").godoc = {
            install_info = {
              url = "https://github.com/fredrikaverpil/tree-sitter-godoc",
              files = { "src/parser.c" },
              version = "*",
            },
            filetype = "godoc",
          }

          vim.treesitter.language.register('godoc', 'godoc')

          vim.api.nvim_create_autocmd("User", {
            pattern = "TSUpdate",
            callback = function()
              require("nvim-treesitter.parsers").godoc = parser_config
            end,
          })

          vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
            pattern = ".gocod",
            callback = function()
              vim.bo.filetype = "godoc"
            end,
          })
        end,
      },
    },
    cmd = { "GoDoc" },
    ft = "godoc",
    opts = {
      adapters = {
        {
          name = "go",
          opts = {
            get_syntax_info = function()
              return {
                filetype = "godoc",
                language = "godoc",
              }
            end,
          },
        },
      },
    }
  }
}
