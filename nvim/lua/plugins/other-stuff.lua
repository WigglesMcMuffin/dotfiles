return {
  {
    "tpope/vim-fugitive",
    "FabijanZulj/blame.nvim",
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1200
    end,
    opts = {

    },
    config = function()
      local wk = require("which-key")

      wk.register({
        ["<leader>"] = {
          h = {
            name = "+Harpoon"
          },
          w = {
            name = "Worktree"
          },
          t = {
            name = "Telescope Finders"
          }
        }
      })
    end
  },
  { "ThePrimeagen/vim-be-good" },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "junegunn/vim-easy-align",
  {
    "protesilaos/prot16-vim",
    config = function()
      vim.cmd.colorscheme("hyperion_dark")
    end
  },
  --"airblade/vim-gitgutter",
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
  "vim-test/vim-test",
  "mattn/vim-goimports",
  "fatih/vim-go",
  "AndrewRadev/splitjoin.vim",
  "SirVer/ultisnips",
  "nvim-lua/popup.nvim",
  {
    "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
  },
}
