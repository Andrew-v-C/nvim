
-- Custom key mappings / macros
vim.keymap.set("n", "<F2>", "viw<C-G>")  -- F2 selects the word under the cursor
vim.keymap.set("n", "<F4>", function() vim.cmd("edit .") end)  -- F4 opens the file explorer
vim.keymap.set("n", "<F7>", function() vim.cmd("set spell!") end)  -- F7 toggles spell check
vim.keymap.set("n", "<F12>", ":horizontal terminal<Enter>i")  -- F12 enters terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")  -- Make Esc behaviour consistent in terminal mode

