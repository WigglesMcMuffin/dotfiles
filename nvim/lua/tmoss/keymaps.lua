local minifiles_toggle = function(...)
  MiniFiles = require("mini.files")
  if not MiniFiles.close() then MiniFiles.open(...) end
end
vim.keymap.set("n", "-", minifiles_toggle, { desc = "File Explorer" })

--map <C-n> :cnext<CR>
--map <C-m> :cprevious<CR>
--nnoremap <leader>a :cclose<CR>
