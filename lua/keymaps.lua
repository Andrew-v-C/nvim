
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")  -- Make Esc consistent in terminal mode
vim.keymap.set("n", "<M-CR>", function() vim.lsp.buf.code_action() end)  -- Perform code action

