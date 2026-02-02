vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")                              -- Make Esc consistent in terminal mode
vim.keymap.set("n", "<M-CR>", function() vim.lsp.buf.code_action() end)  -- Perform code action
vim.keymap.set("n", "<F7>", function() vim.cmd("set spell!") end)        -- Toggle spell check
vim.keymap.set("n", "=", "<NOP>")                                        -- Disable = key in normal mode
