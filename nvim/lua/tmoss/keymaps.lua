local minifiles_toggle = function(...)
  MiniFiles = require("mini.files")
  if not MiniFiles.close() then MiniFiles.open(...) end
end
vim.keymap.set("n", "-", minifiles_toggle, { desc = "File Explorer" })

-- LSP
vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, { desc = "LSP: code_action()" })
vim.keymap.set("v", "<leader>la", function() vim.lsp.buf.code_action() end, { desc = "LSP: code_action()" })
vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.rename() end, { desc = "LSP: Rename" })
vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, { desc = "LSP: References" })
vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, { desc = "LSP: Hover" })
vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.definition() end, { desc = "LSP: Definition" })
vim.keymap.set("n", "<leader>lD", function() vim.lsp.buf.document_symbol() end, { desc = "LSP: Document Symbol" })

-- implentation
-- incoming_calls()


--map <C-n> :cnext<CR>
--map <C-m> :cprevious<CR>
--nnoremap <leader>a :cclose<CR>
