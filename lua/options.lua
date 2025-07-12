
vim.opt.number = true  -- Show line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.cursorline = true  -- Highlight current line
vim.opt.scrolloff = 999  -- Set scrolling behaviour
vim.opt.list = true  -- Show "list" characters
vim.opt.listchars = {  -- Set "list" characters
    tab = '» ',
    trail = '·',
    nbsp = '␣',
}
vim.opt.wrap = false  -- Disable word wrap
vim.opt.splitbelow = true  -- Open new windows below
vim.opt.splitright = true  -- Open new windows to the right
vim.opt.termguicolors = true  -- Enable 24-bit color in TUI

-- Set tabs/indentation
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function()
        vim.opt.expandtab = true
        vim.opt.shiftwidth = 4
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.cindent = true
        vim.opt.formatoptions = ""
    end,
})

-- Set up folding
vim.opt.foldenable = true
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.fillchars:append({ fold = ' ' })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function()
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.statuscolumn = " %s%l %{len(v:lua.vim.treesitter.foldexpr()) > 1 ? (foldclosed(v:lnum) != -1 ? '' : '') : ' '} "
    end,
})

vim.keymap.set("i", "{<Enter>", "{<Enter>}<Esc>O")  -- Auto-close braces for blocks
vim.keymap.set("n", "<Space>", "za")  -- Use Space to open/close folds

vim.opt.virtualedit = "block"  -- Use virtual edit in visual block mode
vim.opt.clipboard = "unnamedplus"  -- Sync clipboard between OS and Neovim

-- Set up diagnostics
vim.diagnostic.config({
    severity_sort = true,
    virtual_text = { severity = vim.diagnostic.severity.ERROR, },
})

