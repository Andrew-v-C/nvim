-- Custom status line; must be loaded BEFORE color scheme

-- Declare highlight groups for different modes
local modeNames = {
    ["n"] = "NORMAL",
    ["v"] = "VISUAL",
    ["V"] = "VISUAL LINE",
    [""] = "VISUAL BLOCK",
    ["s"] = "SELECT",
    ["S"] = "SELECT LINE",
    [""] = "SELECT BLOCK",
    ["i"] = "INSERT",
    ["R"] = "REPLACE",
    ["c"] = "COMMAND",
    ["t"] = "TERMINAL",
}
local modeHighlights = {
    ["n"] = "StatusLineNormal",
    ["v"] = "StatusLineVisual",
    ["V"] = "StatusLineVisual",
    [""] = "StatusLineVisual",
    ["s"] = "StatusLineSelect",
    ["S"] = "StatusLineSelect",
    [""] = "StatusLineSelect",
    ["i"] = "StatusLineInsert",
    ["R"] = "StatusLineReplace",
    ["c"] = "StatusLineCommand",
    ["t"] = "StatusLineTerminal",
}
local modeBorderHighlights = {
    ["n"] = "StatusLineBorderNormal",
    ["v"] = "StatusLineBorderVisual",
    ["V"] = "StatusLineBorderVisual",
    [""] = "StatusLineBorderVisual",
    ["s"] = "StatusLineBorderSelect",
    ["S"] = "StatusLineBorderSelect",
    [""] = "StatusLineBorderSelect",
    ["i"] = "StatusLineBorderInsert",
    ["R"] = "StatusLineBorderReplace",
    ["c"] = "StatusLineBorderCommand",
    ["t"] = "StatusLineBorderTerminal",
}

-- Declare function to format status line
MyStatusLine = function()
    local mode = string.sub(vim.api.nvim_get_mode().mode, 1, 1)
    local output = ""
        .. "%#" .. modeHighlights[mode] .. "# " .. modeNames[mode] .. " " -- Current mode
        .. "%#" .. modeBorderHighlights[mode] .. "#" -- Border for current mode
        .. "%## %<%F " -- File path
        .. "%#WarningMsg#%{&modified ? ' ' : ''}" -- Show if file was modified
        .. "%##%=" -- Spacing
    local count = vim.diagnostic.count() -- Diagnostics count
    local signs = vim.diagnostic.config().signs.text
    if count[1] ~= nil then
        output = output .. "%#DiagnosticError# " .. signs[1] .. " " .. count[1] .. " "
    end
    if count[2] ~= nil then
        output = output .. "%#DiagnosticWarn# " .. signs[2] .. " " .. count[2] .. " "
    end
    if count[3] ~= nil then
        output = output .. "%#DiagnosticInfo# " .. signs[3] .. " " .. count[3] .. " "
    end
    if count[4] ~= nil then
        output = output .. "%#DiagnosticHint# " .. signs[4] .. " " .. count[4] .. " "
    end
    return output
end

-- Create auto-command to trigger when color scheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        -- Set highlight groups
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
        -- Format status line
        vim.opt.statusline = "%!v:lua.MyStatusLine()"
    end
})
