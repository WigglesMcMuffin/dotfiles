return {
  {
    "ThePrimeagen/git-worktree.nvim",
    keys = {
      { "<leader>ws", function() require("telescope").extensions.git_worktree.git_worktrees() end, desc = "List worktrees" },
      { "<leader>wc", function() require("telescope").extensions.git_worktree.create_git_worktree() end, desc = "Create new worktree" },
    }
  },
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>tr", "<cmd>Telescope registers<cr>", desc = "Registers" },
    },
    config = function()
      require("telescope").load_extension("git_worktree")
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
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

      vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "Add mark to harpoon list" })
      vim.keymap.set("n", "<leader>hl", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
    end,
  },
}

