vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function(type)
        -- Enable highlighting from tree-sitter
        local lang = vim.treesitter.language.get_lang(type.match)
        if vim.treesitter.language.add(lang) then
            vim.treesitter.start()
        end
        -- Set tab/indentation options
        vim.opt.expandtab = true
        vim.opt.formatoptions = ""
        vim.opt.cindent = true
        -- Set default indent width
        vim.opt.shiftwidth = 4
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "cpp", "cmake" },
    callback = function(type)
        -- Automatically install tree-sitter parsers
        vim.cmd("TSInstall " .. type.match)
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "text" },
    callback = function()
        -- Automatically enable spellcheck for text files
        vim.opt.spell = true
        -- Don't auto indent text files
        vim.opt.autoindent = false
        vim.opt.cindent = false
        vim.opt.smartindent = false
        vim.opt.indentexpr = ""
    end
})

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        -- Set highlight groups for fold column
        vim.api.nvim_set_hl(0, "FoldColumn", { link = "LineNr" })
        vim.api.nvim_set_hl(0, "CursorLineFold", { link = "CursorLineNr" })
        -- Set highlight groups for status line
        local statusbg = "#" .. string.format("%06x", vim.api.nvim_get_hl(0, { name = "StatusLine" }).bg)
        vim.api.nvim_set_hl(0, "StatusLineNormal", { fg = statusbg, bg = vim.g.terminal_color_2, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineVisual", { fg = statusbg, bg = vim.g.terminal_color_4, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineSelect", { fg = statusbg, bg = vim.g.terminal_color_5, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineInsert", { fg = statusbg, bg = vim.g.terminal_color_3, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineReplace", { fg = statusbg, bg = vim.g.terminal_color_1, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineCommand", { fg = statusbg, bg = vim.g.terminal_color_6, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineTerminal", { fg = statusbg, bg = vim.g.terminal_color_7, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineBorderNormal", { fg = vim.g.terminal_color_2, })
        vim.api.nvim_set_hl(0, "StatusLineBorderVisual", { fg = vim.g.terminal_color_4, })
        vim.api.nvim_set_hl(0, "StatusLineBorderSelect", { fg = vim.g.terminal_color_5, })
        vim.api.nvim_set_hl(0, "StatusLineBorderInsert", { fg = vim.g.terminal_color_3, })
        vim.api.nvim_set_hl(0, "StatusLineBorderReplace", { fg = vim.g.terminal_color_1, })
        vim.api.nvim_set_hl(0, "StatusLineBorderCommand", { fg = vim.g.terminal_color_6, })
        vim.api.nvim_set_hl(0, "StatusLineBorderTerminal", { fg = vim.g.terminal_color_7, })
    end
})

vim.api.nvim_create_autocmd("CmdlineEnter", { command = "set cmdheight=1" })  -- Adjust command line height automatically
vim.api.nvim_create_autocmd("CmdlineLeave", { command = "set cmdheight=0" })

vim.api.nvim_create_autocmd("TermEnter", { command = "set nospell" })  -- Don't use spellcheck in terminal mode

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        -- Auto-format using LSP
        vim.lsp.buf.format()
    end
})

vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        -- Revert cursor on exiting Neovim
        vim.opt.guicursor = "a:ver25-blinkon500-blinkoff500-TermCursor"
    end
})
