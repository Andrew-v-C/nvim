-- Add plugins
vim.pack.add({
    {  -- color scheme
        src = "https://github.com/EdenEast/nightfox.nvim",
        name = "nightfox",
    },
    {  -- nvim-treesitter
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
    },
    {  -- nvim-autopairs
        src = "https://github.com/windwp/nvim-autopairs",
    },
    {  -- indent-blankline
        src = "https://github.com/lukas-reineke/indent-blankline.nvim",
        name = "indent-blankline",
    },
    {  -- blink.cmp
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("1.*"),
    },
    {  -- mini.icons (required for oil.nvim)
        src = "https://github.com/nvim-mini/mini.icons",
    },
    {  -- oil.nvim
        src = "https://github.com/stevearc/oil.nvim",
    },
    {  -- GitHub Copilot
        src = "https://github.com/github/copilot.vim",
    },
})

-- Set default color scheme
vim.cmd.colorscheme("duskfox")

-- Install tree-sitter parsers
require("nvim-treesitter").install({ "python", "arduino", "cmake", "markdown", })

-- Set up other plugins
require("nvim-autopairs").setup()
require("ibl").setup({ indent = { char = "▏" }, })
require("blink.cmp").setup()
require("mini.icons").setup()
require("oil").setup()
