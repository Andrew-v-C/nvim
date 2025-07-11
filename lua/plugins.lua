
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
        {
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                    auto_install = true,
                    highlight = {
                        enable = false,
                        additional_vim_regex_highlighting = false,
                    },
                })
            end,
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                vim.lsp.enable("clangd")
                vim.lsp.enable("lua-language-server")
                vim.lsp.enable("arduino-language-server")
            end,
        },
        {
            "mason-org/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },
        {
            "kevinhwang91/promise-async", 
        },
        {
            "kevinhwang91/nvim-ufo",
            config = function()
                require("ufo").setup({
                    provider_selector = function(bufnr, filetype, buftype)
                        return {"treesitter", "indent"}
                    end
                })
                vim.keymap.set("n", "zR", require("ufo").openAllFolds)
                vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
            end,
        },
        {
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

