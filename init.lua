
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- Add your plugins here
        "rebelot/kanagawa.nvim"
    },
    -- Configure any other settings here; see the documentation for more details
    -- Colorscheme that will be used when installing plugins
    install = { colorscheme = { "kanagawa" } },
    -- Automatically check for plugin updates
    checker = { enabled = true },
})

vim.opt.number = true  -- Show line numbers
--vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.list = true  -- Show trailing whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }  -- Set whitespace characters
vim.opt.cursorline = true  -- Highlight current line
vim.opt.splitbelow = true  -- Open new windows below
vim.opt.splitright = true  -- Open new windows to the right
vim.opt.scrolloff = 999  -- Set scrolling behaviour
vim.opt.termguicolors = true  -- Enable 24-bit color in TUI
vim.cmd("colorscheme kanagawa")  -- Set color scheme

-- Set tabs/indentation
vim.cmd("autocmd FileType * set expandtab")
vim.cmd("autocmd FileType * set shiftwidth=4")
vim.cmd("autocmd FileType * set tabstop=4")
vim.cmd("autocmd FileType * set softtabstop=4")
vim.cmd("autocmd FileType * set cindent")

vim.cmd("inoremap {<Enter> {<Enter>}<Esc>O")  -- Auto-close braces for blocks
vim.cmd("autocmd FileType * set formatoptions-=cro")  -- Don't auto comment
vim.opt.virtualedit = "block"  -- Use virtual edit in visual block mode

