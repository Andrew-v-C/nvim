
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
        {  -- nvim-treesitter
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                    auto_install = true,
                    highlight = {
                        enable = false,
                        additional_vim_regex_highlighting = false,
                    },
                    indent = {
                        enable = false,
                    },
                })
            end,
        },
        {  -- nvim-lspconfig
            "neovim/nvim-lspconfig",
        },
        {  -- mason
            "mason-org/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },
        {  -- mason-lspconfig
            "mason-org/mason-lspconfig.nvim",
            opts = {
                ensure_installed = { "lua_ls", "clangd", },
            },
            dependencies = {
                { "mason-org/mason.nvim", opts = {} },
                "neovim/nvim-lspconfig",
            },
        },
        {  -- indent-blankline
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            ---@module "ibl"
            ---@type ibl.config
            opts = {},
            config = function()
                require("ibl").setup({
                    indent = { char = '▏' },
                })
            end,
        },
        {  -- colorscheme kanagawa
            "rebelot/kanagawa.nvim",
            config = function()
                vim.cmd("colorscheme kanagawa")  -- Set color scheme
            end,
        },
    },
    -- Configure any other settings here; see the documentation for more details
    -- Colorscheme that will be used when installing plugins
    install = { colorscheme = { "kanagawa" } },
    -- Automatically check for plugin updates
    checker = { enabled = true },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = { diagnostics = { globals = { "vim", }, }, },
    },
})

