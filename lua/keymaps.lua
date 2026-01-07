
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")  -- Make Esc consistent in terminal mode
vim.keymap.set("n", "<F3>", function() vim.cmd("edit .") end)  -- Open file explorer
vim.keymap.set("n", "<F4>", function() vim.lsp.buf.code_action() end)  -- Perform code action
vim.keymap.set("n", "<F7>", function() vim.cmd("set spell!") end)  -- Toggle spell check
vim.keymap.set("n", "<F8>", ":horizontal terminal<Enter>i")  -- Open terminal window (horizontal)
vim.keymap.set("n", "<C-F8>", ":vertical terminal<Enter>i")  -- Open terminal window (vertical)

