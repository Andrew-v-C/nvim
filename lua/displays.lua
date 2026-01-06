
-- Format status column
vim.opt.signcolumn = "yes"
MyStatusColumn = function()
    local output = "%s %l  "
    return output
end
vim.opt.statuscolumn = "%!v:lua.MyStatusColumn()"

-- Declare highlight groups for different modes (set in auto-commands)
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

-- Format status line
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

