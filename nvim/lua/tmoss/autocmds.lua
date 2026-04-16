-- Track down and exterminate all trailing whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    local trailspace = require("mini.trailspace")
    trailspace.trim()
    trailspace.trim_last_lines()
  end
})

-- Highlight spaces dangling off the end of lines
-- vim.cmd('hi HiTabs ctermbg=gray')
-- vim.cmd('match HiTabs /\\t/'

-- In case I swap color schemes, reapply highlight
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function(args)
    vim.cmd('hi HiTabs ctermbg=gray')
  end
})

-- Setup nvim if an lsp attaches
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(ev)
    -- Keybinds
    vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, { desc = "LSP: code_action()" })
    vim.keymap.set("v", "<leader>la", function() vim.lsp.buf.code_action() end, { desc = "LSP: code_action()" })
    vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.rename() end, { desc = "LSP: Rename" })
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, { desc = "LSP: References" })
    vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, { desc = "LSP: Hover" })
    vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.definition() end, { desc = "LSP: Definition" })
    vim.keymap.set("n", "<leader>lD", function() vim.lsp.buf.document_symbol() end, { desc = "LSP: Document Symbol" })

    vim.diagnostic.config({
      virtual_lines = {
        current_line = true,
      }
    })

    -- implentation
    -- incoming_calls()
  end,
})

-- Map keys when opening go files
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "go",
--  callback = function(args)
--    vim.keymap.set('n', '<leader>r', "<Plug>(go-run)", { desc = "Run go module"})
--    vim.keymap.set('n', '<leader>t', "<Plug>(go-test)", { desc = "Test go module"})
--    vim.keymap.set('n', '<leader>c', "<Plug>(go-coverage-toggle)", { desc = "Show go coverage"})
--    vim.keymap.set('n', '<leader>f', "<Plug>(go-alternate)", { desc = "Uhhhh"})
--    --vim.keymap.set('n', '<leader>b', ":<C-u>call <SID>build_go_files()<CR>", { desc = ""})
--    vim.g.go_fmt_command = "gofmt"
--    vim.g.go_auto_type_info = 1
--    vim.g.go_auto_sameids = 1
--  end
--})

--" vim-go keybinds
--function! s:build_go_files()
--  let l:file = expand('%')
--  if l:file =~# '^\f\+_test\.go$'
--    call go#test#Test(0, 1)
--  elseif l:file =~# '^\f\+\.go$'
--    call go#cmd#Build(0)
--  endif
--endfunction
