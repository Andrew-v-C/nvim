
vim.keymap.set("n", "<F2>", "viw<C-G>")  -- F2 selects word under cursor
vim.keymap.set("n", "<F4>", function() vim.cmd("edit .") end)  -- F4 opens file explorer
vim.keymap.set("n", "<F5>", function() vim.cmd("mode|nohlsearch") end)  -- F5 clears and redraws screen
vim.keymap.set("n", "<F6>", function() vim.lsp.buf.code_action() end)  -- F6 performs code action
vim.keymap.set("n", "<F7>", function() vim.cmd("set spell!") end)  -- F7 toggles spell check
vim.keymap.set("n", "<F12>", ":horizontal terminal<Enter>i")  -- F12 opens terminal window
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")  -- Make Esc behaviour consistent in terminal mode

