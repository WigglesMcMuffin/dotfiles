vim.lsp.config['golang'] = {
  cmd = {'gopls'},
  filetypes = {'go'},
  root_markers = {
    { '.go' },
    '.git',
  },
}

vim.lsp.enable('golang')

vim.lsp.config['lua_ls'] = {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {
    { '.lua' },
    '.git',
  },
}

vim.lsp.enable('lua_ls')
