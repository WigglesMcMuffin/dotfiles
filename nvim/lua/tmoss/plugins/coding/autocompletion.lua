return {
  {
    "saghen/blink.cmp",
    dependencies = {
    	"rafamadriz/friendly-snippets"
    },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
      	preset = 'default',

	['<C-space>'] = { 'show' },
      },
      completion = { documentation = { auto_show = true } },
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
  },
  {
      -- friendly snippets
  	"rafamadriz/friendly-snippets"
  },
  {
      -- luasnips
  	"L3MON4D3/LuaSnip",
      dependencies = {
      	"rafamadriz/friendly-snippets"
      },
      config = function()
      	require("luasnip.loaders.from_vscode").lazy_load()
      end
  }
}
