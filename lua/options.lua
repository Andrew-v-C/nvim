
-- Lines and scrolling
vim.opt.number = true  -- Show line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.cursorline = true  -- Highlight current line
vim.opt.scrolloff = 999  -- Set scrolling behaviour
vim.opt.wrap = false  -- Disable word wrap
vim.opt.list = true  -- Show "list" characters
vim.opt.listchars = {  -- Set "list" characters
    tab = '» ',
    trail = '·',
    nbsp = '␣',
}

-- Windowing behaviour
vim.opt.splitbelow = true  -- Open new windows below
vim.opt.splitright = true  -- Open new windows to the right
-- Colors and highlighting
vim.opt.termguicolors = true  -- Enable 24-bit color in TUI
vim.api.nvim_create_autocmd("FileType", {  -- Enable highlighting from tree-sitter
    -- TODO: See if there's a cleaner way to do this;
    -- pattern = { "*" } throws an error from tree-sitter or blink.cmp
    pattern = { "lua", "c", "cpp", "python", "java", "arduino" },
    callback = function() vim.treesitter.start() end,
})

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
vim.opt.fillchars = { fold = ' ' }
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function()
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.statuscolumn = " %s%l "  -- Configure status column
        .."%{len(v:lua.vim.treesitter.foldexpr()) > 1 ? (foldclosed(v:lnum) == -1 ? '' : '') : ' '} "
    end,
})

-- Configure diagnostics
vim.diagnostic.config({
    severity_sort = true,
    virtual_text = { severity = vim.diagnostic.severity.ERROR, },
    signs = { text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
    }, },
})

-- Format status line
local modeNames = {
    ["n"] = "NORMAL",
    ["v"] = "VISUAL",
    ["V"] = "VISUAL LINE",
    [""]= "VISUAL BLOCK",
    ["s"] = "SELECT",
    ["S"] = "SELECT LINE",
    [""]= "SELECT BLOCK",
    ["i"] = "INSERT",
    ["R"] = "REPLACE",
    ["c"] = "COMMAND",
    ["t"] = "TERMINAL",
}
local modeHighlights = {
    ["n"] = "StatusLineNormal",
    ["v"] = "StatusLineVisual",
    ["V"] = "StatusLineVisual",
    [""]= "StatusLineVisual",
    ["s"] = "StatusLineSelect",
    ["S"] = "StatusLineSelect",
    [""]= "StatusLineSelect",
    ["i"] = "StatusLineInsert",
    ["R"] = "StatusLineReplace",
    ["c"] = "StatusLineCommand",
    ["t"] = "StatusLineTerminal",
}
local modeBorderHighlights = {
    ["n"] = "StatusLineBorderNormal",
    ["v"] = "StatusLineBorderVisual",
    ["V"] = "StatusLineBorderVisual",
    [""]= "StatusLineBorderVisual",
    ["s"] = "StatusLineBorderSelect",
    ["S"] = "StatusLineBorderSelect",
    [""]= "StatusLineBorderSelect",
    ["i"] = "StatusLineBorderInsert",
    ["R"] = "StatusLineBorderReplace",
    ["c"] = "StatusLineBorderCommand",
    ["t"] = "StatusLineBorderTerminal",
}
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "StatusLineNormal", { fg = vim.g.terminal_color_0, bg = vim.g.terminal_color_2, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineVisual", { fg = vim.g.terminal_color_0, bg = vim.g.terminal_color_4, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineSelect", { fg = vim.g.terminal_color_0, bg = vim.g.terminal_color_5, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineInsert", { fg = vim.g.terminal_color_0, bg = vim.g.terminal_color_3, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineReplace", { fg = vim.g.terminal_color_0, bg = vim.g.terminal_color_1, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineCommand", { fg = vim.g.terminal_color_0, bg = vim.g.terminal_color_6, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineTerminal", { fg = vim.g.terminal_color_0, bg = vim.g.terminal_color_7, bold = true, })
        vim.api.nvim_set_hl(0, "StatusLineBorderNormal", { fg = vim.g.terminal_color_2, })
        vim.api.nvim_set_hl(0, "StatusLineBorderVisual", { fg = vim.g.terminal_color_4, })
        vim.api.nvim_set_hl(0, "StatusLineBorderSelect", { fg = vim.g.terminal_color_5, })
        vim.api.nvim_set_hl(0, "StatusLineBorderInsert", { fg = vim.g.terminal_color_3, })
        vim.api.nvim_set_hl(0, "StatusLineBorderReplace", { fg = vim.g.terminal_color_1, })
        vim.api.nvim_set_hl(0, "StatusLineBorderCommand", { fg = vim.g.terminal_color_6, })
        vim.api.nvim_set_hl(0, "StatusLineBorderTerminal", { fg = vim.g.terminal_color_7, })
    end
})
MyStatusLine = function()
    local mode = string.sub(vim.api.nvim_get_mode().mode, 1, 1)
    local output = ""
    .."%#"..modeHighlights[mode].."# "..modeNames[mode].." "  -- Current mode
    .."%#"..modeBorderHighlights[mode].."#"  -- Border for current mode
    .."%#StatusLine# %<%F "  -- File path
    .."%#WarningMsg#%{&modified ? '[+]' : ''}"  -- Show if file was modified
    .."%#StatusLine#%="  -- Spacing
    local count = vim.diagnostic.count()  -- Diagnostics count
    local signs = vim.diagnostic.config().signs.text
    if count[1] ~= nil then
        output = output.."%#DiagnosticSignError# "..signs[1].." "..count[1].." "
    end
    if count[2] ~= nil then
        output = output.."%#DiagnosticSignWarn# "..signs[2].." "..count[2].." "
    end
    if count[3] ~= nil then
        output = output.."%#DiagnosticSignInfo# "..signs[3].." "..count[3].." "
    end
    if count[4] ~= nil then
        output = output.."%#DiagnosticSignHint# "..signs[4].." "..count[4].." "
    end
    return output
end
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function()
        vim.opt.statusline = "%!v:lua.MyStatusLine()"
    end,
})

-- Misc.
vim.opt.autochdir = true  -- Change current working directory to match file
vim.opt.virtualedit = "block"  -- Use virtual edit in visual block mode
vim.opt.clipboard = "unnamedplus"  -- Sync clipboard between OS and Neovim
vim.api.nvim_create_autocmd("TermEnter", { -- Don't use spellcheck in terminal mode
    callback = function() vim.opt.spell = false end
})
vim.opt.showmode = false  -- Don't show current mode in command line (already shown in status line)
vim.opt.cmdheight = 0 -- Hide command line by default
vim.api.nvim_create_autocmd("CmdlineEnter", {
    command = "set cmdheight=1"
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
    command = "set cmdheight=0"
})

-- Custom key mappings / macros
vim.keymap.set("i", "{<Enter>", "{<Enter>}<Esc>O")  -- Auto-close braces for blocks
vim.keymap.set("n", "<Space>", "za")  -- Use Space to open/close folds
vim.keymap.set("n", "<F12>", ":vert term<Enter>i")  -- Enter terminal mode

