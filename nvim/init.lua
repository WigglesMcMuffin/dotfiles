-- THIS NEEDS TO BE SET CORRECTLY
-- set runtimepath+=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after


vim.opt.backspace      = { "indent", "eol", "start" }
vim.opt.display        = "truncate"
vim.opt.fileencodings  = { "ucs-bom", "utf-8", "default", "latin1" }
vim.opt.helplang       = { "en" }
-- Git gutter needs a refresh to draw changes
vim.opt.updatetime     = 500
vim.opt.incsearch      = true
vim.opt.nrformats      = { "bin", "hex", "unsigned" }
vim.opt.foldmethod     = "indent"
vim.opt.foldlevelstart = 99
vim.opt.scrolloff      = 8
vim.opt.showcmd        = true
vim.opt.wildmenu       = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1200
    end,
    opts = {

    }
  },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "junegunn/vim-easy-align",
  "protesilaos/prot16-vim",
  --"airblade/vim-gitgutter",
  "lewis6991/gitsigns.nvim",
  "vim-test/vim-test",
  "mattn/vim-goimports",
  "fatih/vim-go",
  "AndrewRadev/splitjoin.vim",
  "SirVer/ultisnips",
  "folke/neodev.nvim",
  {
    "hoob3rt/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  "nvim-lua/popup.nvim",
  "ThePrimeagen/git-worktree.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "lua", "python", "vim", "vimdoc", "javascript", "html", "go", "hcl" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
  },
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'iceberg_dark',
  }
}

require("telescope").load_extension("git_worktree")

local harpoon = require("harpoon")

harpoon:setup({})

local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

require('gitsigns').setup({})

vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "Add mark to harpoon list" })
vim.keymap.set("n", "<leader>hl", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<leader>ws", function() require("telescope").extensions.git_worktree.git_worktrees() end, { desc = "List worktrees" })
vim.keymap.set("n", "<leader>wc", function() require("telescope").extensions.git_worktree.create_git_worktree() end, { desc = "Create new worktree" })

local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>tg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>tr", builtin.registers, { desc = "Registers" })
vim.keymap.set("n", "-", '<cmd>Explore<cr>', { desc = "File Explorer" })

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
