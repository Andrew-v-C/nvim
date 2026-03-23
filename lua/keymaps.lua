vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")  -- Make Esc consistent in terminal mode
vim.keymap.set("n", "=", "<NOP>")            -- Disable = key in normal mode

vim.keymap.set("n", "<F7>", function()
    -- Toggle spell check
    vim.cmd("set spell!")
end)

vim.keymap.set("n", "<M-CR>", function()
    -- Perform code action
    vim.lsp.buf.code_action()
end)
