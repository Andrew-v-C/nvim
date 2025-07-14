
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
    ["n"] = "CurSearch",
    ["v"] = "CurSearch",
    ["V"] = "CurSearch",
    [""]= "CurSearch",
    ["s"] = "CurSearch",
    ["S"] = "CurSearch",
    [""]= "CurSearch",
    ["i"] = "CurSearch",
    ["R"] = "CurSearch",
    ["c"] = "CurSearch",
    ["t"] = "CurSearch",
}
MyStatusLine = function()
    local mode = string.sub(vim.api.nvim_get_mode().mode, 1, 1)
    local output = "%#"..modeHighlights[mode].."# "..modeNames[mode].." %#StatusLine#"
    output = output.." %#StatusLineNC#%F%#StatusLine#"
    output = output.."  %#WarningMsg#%{&modified ? \"modified\" : \"\"}%#StatusLine#%="
    local count = vim.diagnostic.count()
    if count[1] ~= nil then
        output = output.."%#DiagnosticError#"..signs[1].." "..count[1].."  "
    end
    if count[2] ~= nil then
        output = output.."%#DiagnosticWarn#"..signs[2].." "..count[2].."  "
    end
    if count[3] ~= nil then
        output = output.."%#DiagnosticInfo#"..signs[3].." "..count[3].."  "
    end
    if count[4] ~= nil then
        output = output.."%#DiagnosticHint#"..signs[4].." "..count[4].."  "
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

