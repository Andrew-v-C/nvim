-- Normal mode
vim.keymap.set("n", "=", "<NOP>")  -- Disable "=" key

vim.keymap.set("n", "<F7>", function()
    -- Toggle spell check
    vim.cmd("set spell!")
end)

vim.keymap.set("n", "<M-CR>", function()
    -- Perform code action
    vim.lsp.buf.code_action()
end)

-- Terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")       -- Make Esc consistent
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")  -- Allow Ctrl+W to switch windows
