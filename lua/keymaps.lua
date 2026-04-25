-- Function keys (Normal mode)
vim.keymap.set("n", "<F3>", function() vim.cmd("edit .") end)          -- Open file explorer
vim.keymap.set("n", "<F4>", ":vert term<Enter>i")                      -- Open terminal in vertical split
vim.keymap.set("n", "<F6>", function() vim.lsp.buf.code_action() end)  -- Perform code action
vim.keymap.set("n", "<F7>", function() vim.cmd("set spell!") end)      -- Toggle spell check
vim.keymap.set("n", "<F8>", function()                                 -- Toggle highlighted column at 80 characters
    if vim.api.nvim_get_option_value("colorcolumn", {}) == "80" then
        vim.opt.colorcolumn = ""
    else
        vim.opt.colorcolumn = "80"
    end
end)

-- Normal mode
vim.keymap.set("n", "=", "<NOP>")  -- Disable "=" key

-- Terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")       -- Make Esc consistent
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")  -- Allow Ctrl+W to switch windows
