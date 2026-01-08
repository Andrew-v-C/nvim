
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")  -- Make Esc consistent in terminal mode
vim.keymap.set("n", "<F4>", function() vim.lsp.buf.code_action() end)  -- Perform code action
vim.keymap.set("n", "<F7>", function() vim.cmd("set spell!") end)  -- Toggle spell check
vim.keymap.set("n", "<F12>", ":horizontal terminal<Enter>i")  -- Open terminal window (horizontal)
vim.keymap.set("n", "<C-F12>", ":vertical terminal<Enter>i")  -- Open terminal window (vertical)

