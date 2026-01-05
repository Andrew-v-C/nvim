
-- Lines and scrolling
vim.opt.number = true  -- Show line numbers
vim.opt.cursorline = true  -- Highlight current line
vim.opt.scrolloff = 999  -- Set scrolling behaviour
vim.opt.wrap = false  -- Disable word wrap
vim.opt.list = true  -- Show "list" characters
vim.opt.listchars = {  -- Set "list" characters
    tab = '» ',
    trail = '·',
    nbsp = '␣',
    extends = '…',
    precedes = '…',
}

-- Windowing behaviour
vim.opt.splitbelow = true  -- Open new windows below
vim.opt.splitright = true  -- Open new windows to the right

-- Colors and highlighting
vim.opt.termguicolors = true  -- Enable 24-bit color in TUI

-- Set up folding
vim.opt.foldenable = false -- Disabled for now, due to bugs
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "1"
vim.opt.fillchars = {
    fold = ' ',
    foldopen = '',
    foldclose = '',
    foldsep = ' ',
}

-- Format status column
vim.opt.numberwidth = 3
MyStatusColumn = function()
    local output = " %s%l "
    -- if string.sub(vim.treesitter.foldexpr(), 1, 1) == ">" then
    --     output = output.."%C"
    -- else
    --     output = output.." "
    -- end
    output = output.." "
    return output
end
vim.opt.statuscolumn = "%!v:lua.MyStatusColumn()"

-- Format status line (highlight groups are set in autocommands)
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
MyStatusLine = function()
    local mode = string.sub(vim.api.nvim_get_mode().mode, 1, 1)
    local output = ""
    .."%#"..modeHighlights[mode].."# "..modeNames[mode].." "  -- Current mode
    .."%#"..modeBorderHighlights[mode].."#"  -- Border for current mode
    .."%## %<%F "  -- File path
    .."%#WarningMsg#%{&modified ? ' ' : ''}"  -- Show if file was modified
    .."%##%="  -- Spacing
    local count = vim.diagnostic.count()  -- Diagnostics count
    local signs = vim.diagnostic.config().signs.text
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
vim.opt.statusline = "%!v:lua.MyStatusLine()"

-- Set cursor style for each mode
vim.opt.guicursor = "n-v-c-sm:block,"
.."i-ci-ve:ver25,"
.."r-cr-o:hor20,"
.."t:ver25-blinkon500-blinkoff500-TermCursor"

-- Misc.
vim.opt.autochdir = true  -- Change current working directory to match file
vim.opt.virtualedit = "block"  -- Use virtual edit in visual block mode
vim.opt.clipboard = "unnamedplus"  -- Sync clipboard between OS and Neovim
vim.opt.showmode = false  -- Don't show current mode in command line (already shown in status line)
vim.opt.cmdheight = 0 -- Hide command line by default

-- Set shell to use in terminal mode
local shell
if string.sub(vim.loop.os_uname().sysname, 1, 7) == "Windows" then
    shell = "pwsh -NoLogo"
else
    shell = "bash"
end
vim.opt.shell = shell

-- Custom key mappings / macros
vim.keymap.set("n", "<F12>", ":vert term<Enter>i")  -- Press F12 to enter terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")  -- Make Esc behave the same in terminal mode

