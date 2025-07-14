
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
vim.api.nvim_create_autocmd("FileType", {  -- Enable highlighting from treesitter
    pattern = { "lua", "c", "cpp", "python", "java", "arduino", },  -- TODO: See if there's a cleaner way to do this
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

-- Format status column
MyStatusCol = function()
    local output = " %s%l "
    if string.sub(vim.treesitter.foldexpr(), 1, 1) == ">" then
        if vim.fn.foldclosed(vim.v.lnum) == -1 then
            output = output..""
        else
            output = output..""
        end
    else
        output = output.." "
    end
    output = output.." "
    return output
end

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
        vim.opt.statuscolumn = "%!v:lua.MyStatusCol()"
    end,
})

-- Configure diagnostics
local signs = { "", "", "", "", }  -- Also used in status line
vim.diagnostic.config({
    severity_sort = true,
    virtual_text = { severity = vim.diagnostic.severity.ERROR, },
    signs = { text = {
        [vim.diagnostic.severity.ERROR] = signs[1],
        [vim.diagnostic.severity.WARN] = signs[2],
        [vim.diagnostic.severity.INFO] = signs[3],
        [vim.diagnostic.severity.HINT] = signs[4],
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
    ["n"] = "StatuslineNormal",
    ["v"] = "StatuslineVisual",
    ["V"] = "StatuslineVisual",
    [""]= "StatuslineVisual",
    ["s"] = "StatuslineSelect",
    ["S"] = "StatuslineSelect",
    [""]= "StatuslineSelect",
    ["i"] = "StatuslineInsert",
    ["R"] = "StatuslineReplace",
    ["c"] = "StatuslineCommand",
    ["t"] = "StatuslineTerminal",
}
local modeBorderHighlights = {
    ["n"] = "StatuslineBorderNormal",
    ["v"] = "StatuslineBorderVisual",
    ["V"] = "StatuslineBorderVisual",
    [""]= "StatuslineBorderVisual",
    ["s"] = "StatuslineBorderSelect",
    ["S"] = "StatuslineBorderSelect",
    [""]= "StatuslineBorderSelect",
    ["i"] = "StatuslineBorderInsert",
    ["R"] = "StatuslineBorderReplace",
    ["c"] = "StatuslineBorderCommand",
    ["t"] = "StatuslineBorderTerminal",
}
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local termColors = {
            ["black"] = vim.g.terminal_color_0,
            ["red"] = vim.g.terminal_color_1,
            ["green"] = vim.g.terminal_color_2,
            ["yellow"] = vim.g.terminal_color_3,
            ["blue"] = vim.g.terminal_color_4,
            ["purple"] = vim.g.terminal_color_5,
            ["cyan"] = vim.g.terminal_color_6,
            ["white"] = vim.g.terminal_color_7,
            ["bright black"] = vim.g.terminal_color_8,
            ["bright red"] = vim.g.terminal_color_9,
            ["bright green"] = vim.g.terminal_color_10,
            ["bright yellow"] = vim.g.terminal_color_11,
            ["bright blue"] = vim.g.terminal_color_12,
            ["bright purple"] = vim.g.terminal_color_13,
            ["bright cyan"] = vim.g.terminal_color_14,
            ["bright white"] = vim.g.terminal_color_15,
        }
        vim.api.nvim_set_hl(0, "StatuslineNormal",   { fg = termColors["black"], bg = termColors["green"], bold = true, })
        vim.api.nvim_set_hl(0, "StatuslineVisual",   { fg = termColors["black"], bg = termColors["blue"], bold = true, })
        vim.api.nvim_set_hl(0, "StatuslineSelect",   { fg = termColors["black"], bg = termColors["purple"], bold = true, })
        vim.api.nvim_set_hl(0, "StatuslineInsert",   { fg = termColors["black"], bg = termColors["yellow"], bold = true, })
        vim.api.nvim_set_hl(0, "StatuslineReplace",  { fg = termColors["black"], bg = termColors["red"], bold = true, })
        vim.api.nvim_set_hl(0, "StatuslineCommand",  { fg = termColors["black"], bg = termColors["cyan"], bold = true, })
        vim.api.nvim_set_hl(0, "StatuslineTerminal", { fg = termColors["black"], bg = termColors["cyan"], bold = true, })
        vim.api.nvim_set_hl(0, "StatuslineBorderNormal",   { fg = termColors["green"], })
        vim.api.nvim_set_hl(0, "StatuslineBorderVisual",   { fg = termColors["blue"], })
        vim.api.nvim_set_hl(0, "StatuslineBorderSelect",   { fg = termColors["purple"], })
        vim.api.nvim_set_hl(0, "StatuslineBorderInsert",   { fg = termColors["yellow"], })
        vim.api.nvim_set_hl(0, "StatuslineBorderReplace",  { fg = termColors["red"], })
        vim.api.nvim_set_hl(0, "StatuslineBorderCommand",  { fg = termColors["cyan"], })
        vim.api.nvim_set_hl(0, "StatuslineBorderTerminal", { fg = termColors["cyan"], })
    end
})
MyStatusLine = function()
    local mode = string.sub(vim.api.nvim_get_mode().mode, 1, 1)
    local output = ""
    .."%#"..modeHighlights[mode].."# "..modeNames[mode].." "  -- Current mode
    .."%#"..modeBorderHighlights[mode].."#"  -- Border for current mode
    .."%#StatusLine# %<%F "  -- File path
    .." %#WarningMsg#%{&modified ? \"modified\" : \"\"} "  -- Show if file was modified
    .."%#StatusLine#%="  -- Spacing
    local count = vim.diagnostic.count()  -- Diagnostics count
    if count[1] ~= nil then
        output = output.."%#DiagnosticError# "..signs[1].." "..count[1].." "
    end
    if count[2] ~= nil then
        output = output.."%#DiagnosticWarn# "..signs[2].." "..count[2].." "
    end
    if count[3] ~= nil then
        output = output.."%#DiagnosticInfo# "..signs[3].." "..count[3].." "
    end
    if count[4] ~= nil then
        output = output.."%#DiagnosticHint# "..signs[4].." "..count[4].." "
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
vim.opt.virtualedit = "block"  -- Use virtual edit in visual block mode
vim.opt.clipboard = "unnamedplus"  -- Sync clipboard between OS and Neovim
vim.opt.showmode = false  -- Don't show current mode in command line (already shown in status line)
vim.opt.cmdheight = 0 -- Hide command line by default

-- Custom key mappings
vim.keymap.set("i", "{<Enter>", "{<Enter>}<Esc>O")  -- Auto-close braces for blocks
vim.keymap.set("n", "<Space>", "za")  -- Use Space to open/close folds

