-- Add plugins
vim.pack.add({
    { -- color scheme
        src = "https://github.com/EdenEast/nightfox.nvim",
        name = "nightfox",
    },
    { -- nvim-treesitter
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
    },
    { -- nvim-autopairs
        src = "https://github.com/windwp/nvim-autopairs",
    },
    { -- indent-blankline
        src = "https://github.com/lukas-reineke/indent-blankline.nvim",
        name = "indent-blankline",
    },
    { -- blink.cmp
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("*"),
    },
    { -- mini.icons (required for oil.nvim)
        src = "https://github.com/nvim-mini/mini.icons",
    },
    { -- oil.nvim
        src = "https://github.com/stevearc/oil.nvim",
    }
})

-- Set up color scheme
vim.cmd.colorscheme("duskfox")

-- Set up nvim-treesitter
require("nvim-treesitter").install({ "python", "cpp", "cmake", })

-- Set up nvim-autopairs
require("nvim-autopairs").setup({
    event = "InsertEnter",
})

-- Set up indent-blankline
require("ibl").setup({
    indent = { char = "▏" },
})

-- Set up blink.cmp
require("blink.cmp").setup()

-- Set up mini.icons
require("mini.icons").setup()

-- Set up oil.nvim
require("oil").setup()
