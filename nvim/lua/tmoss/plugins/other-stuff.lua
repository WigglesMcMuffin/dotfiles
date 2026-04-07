return {
  {
    "folke/neoconf.nvim",
    opts = {},
  },
  "junegunn/vim-easy-align",
  "vim-test/vim-test",
  "AndrewRadev/splitjoin.vim",
  "SirVer/ultisnips",
  "nvim-lua/popup.nvim",
  {
    "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
  },
  "preservim/tagbar",
}
