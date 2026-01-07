
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")  -- Make Esc behaviour consistent in terminal mode
vim.keymap.set("n", "<F2>", "viw<C-G>")  -- F2 selects word under cursor
vim.keymap.set("n", "<F3>", function() vim.cmd("edit .") end)  -- F3 opens file explorer
vim.keymap.set("n", "<F5>", function() vim.cmd("mode|nohlsearch") end)  -- F5 clears and redraws screen
vim.keymap.set("n", "<F7>", function() vim.cmd("set spell!") end)  -- F7 toggles spell check
vim.keymap.set("n", "<F8>", function() vim.lsp.buf.code_action() end)  -- F8 performs code action
vim.keymap.set("n", "<F12>", ":horizontal terminal<Enter>i")  -- F12 opens terminal window

