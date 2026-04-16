-- A bunch of utility tools for nvim
-- Will definitely need to dig in further
-- As everything is currently unconfigured
return {
  {
    "nvim-mini/mini.nvim", version = '*',
    config = function()
      require("mini.cmdline").setup({})
      require("mini.icons").setup({})
      require("mini.cursorword").setup({})
      require("mini.trailspace").setup({})
      require("mini.indentscope").setup({})
      require("mini.splitjoin").setup({})
      require("mini.align").setup({})
      require("mini.jump").setup({})
      require("mini.jump2d").setup({})

      require("mini.pick").setup({})
      require("mini.diff").setup({})
      require("mini.files").setup({})

      require("mini.git").setup({})
      local miniclue = require("mini.clue")
      miniclue.setup({
        triggers = {
          -- Leader chords
          { mode = 'n', keys='<Leader>' },
          { mode = 'x', keys='<Leader>' },

          -- 'g' key
          { mode = 'n', keys='g' },
          { mode = 'x', keys='g' },

          -- 'z' key
          { mode = 'n', keys='z' },
          { mode = 'x', keys='z' },

          -- registers
          { mode = 'n', keys='"' },
          { mode = 'x', keys='"' },

          -- Window editing
          { mode = 'n', keys='<C-w>' },
        },

        clues = {
          { mode = 'n', keys= '<Leader>f', desc= '+ Finders' },
          { mode = 'n', keys= '<Leader>l', desc= '+ LSP' },

          -- Git
          { mode = 'n', keys= '<Leader>g', desc= '+ Git' },
          { mode = 'n', keys= '<Leader>gb', desc= '+ Git Blame' },
          { mode = 'n', keys= '<Leader>gh', desc= '+ Git Hunks' },

	  -- vim-test
          { mode = 'n', keys= '<Leader>t', desc= '+ Test' },

	  -- Scratch
          { mode = 'n', keys= '<Leader>s', desc= '+ Scrach Files' },

          -- Trouble
          { mode = 'n', keys= '<Leader>x', desc= '+ Trouble' },
          miniclue.gen_clues.g(),
          miniclue.gen_clues.z(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.registers(),
        },

        window = {
          delay = 100,
          config = {
            width = 'auto',
            border = 'double',
          }
        }
      })
    end,
    keys = {
      { "<leader>ff", "<cmd>Pick files<cr>", desc = "Mini.pick: Find files in working directory" },
      { "<leader>fg", function()
      	require("mini.pick").builtin.grep_live({}, {
	  --window = { config = { width = vim.o.columns }},
	})
      end, desc = "Mini.pick: Find files in working directory" },
      { "<leader>gd", function() require("mini.diff").toggle_overlay() end, desc = "Toggle git diff display" },
      { "<leader>ga", "<cmd>Git add %<cr>", desc = "Mini.git: Stage file for git" },
    },
  },
}
