
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")  -- Make Esc consistent in terminal mode

vim.g.mapleader = " "  -- Set leader key
vim.keymap.set("n", "<Leader>4", function() vim.lsp.buf.code_action() end)  -- Perform code action
vim.keymap.set("n", "<Leader>7", function() vim.cmd("set spell!") end)  -- Toggle spell check
vim.keymap.set("n", "<Leader>9", ":horizontal terminal<Enter>i")  -- Open terminal window (horizontal)
vim.keymap.set("n", "<Leader>0", ":vertical terminal<Enter>i")  -- Open terminal window (vertical)

