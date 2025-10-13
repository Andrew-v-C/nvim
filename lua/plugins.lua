
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
local colorscheme = require("colorscheme")
require("lazy").setup({
    spec = {
        -- Add your plugins here
        {  -- nvim-treesitter
            "nvim-treesitter/nvim-treesitter",
            branch = "main",
            lazy = false,
            build = ":TSUpdate",
            opts = {
                install_dir = vim.fn.stdpath("data").."/tree-sitter",
            },
        },
        {  -- blink.cmp
            "Saghen/blink.cmp",
            -- dependencies = { "rafamadriz/friendly-snippets" },
            version = "1.*",
            opts = {
                keymap = { preset = "default" },
                appearance = { nerd_font_variant = "mono", },
                completion = { documentation = { auto_show = false, }, },
                sources = { default = { "lsp", "path", "snippets", "buffer", }, },
                fuzzy = { implementation = "prefer_rust_with_warning", },
            },
            opts_extend = { "sources.default" },
        },
        {  -- nvim-autopairs
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = true,
        },
        {  -- indent-blankline
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = { indent = { char = '▏' }, },
        },
        {  -- color scheme
            colorscheme.path,
            config = function()
                vim.cmd("colorscheme "..colorscheme.name)
            end,
        },
    },
    -- Configure any other settings here; see the documentation for more details
    -- Color scheme that will be used when installing plugins
    install = { colorscheme = { "default" } },
    -- Automatically check for plugin updates
    checker = { enabled = true },
})

