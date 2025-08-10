
local colors = {}
LoadColors = function()
    colors = {
        ["background"] = "#"..string.format("%06x", vim.api.nvim_get_hl(0, { name = "Normal" }).bg),
        ["foreground"] = "#"..string.format("%06x", vim.api.nvim_get_hl(0, { name = "Normal" }).fg),
        ["cursor"] = "#"..string.format("%06x", vim.api.nvim_get_hl(0, { name = "Normal" }).fg),
        ["black"] = vim.g.terminal_color_0,
        ["red"] = vim.g.terminal_color_1,
        ["green"] = vim.g.terminal_color_2,
        ["yellow"] = vim.g.terminal_color_3,
        ["blue"] = vim.g.terminal_color_4,
        ["purple"] = vim.g.terminal_color_5,
        ["cyan"] = vim.g.terminal_color_6,
        ["white"] = vim.g.terminal_color_7,
        ["brightBlack"] = vim.g.terminal_color_8,
        ["brightRed"] = vim.g.terminal_color_9,
        ["brightGreen"] = vim.g.terminal_color_10,
        ["brightYellow"] = vim.g.terminal_color_11,
        ["brightBlue"] = vim.g.terminal_color_12,
        ["brightPurple"] = vim.g.terminal_color_13,
        ["brightCyan"] = vim.g.terminal_color_14,
        ["brightWhite"] = vim.g.terminal_color_15,
    }
end

local hexToRGB = function(hexval)
    local red = tonumber(string.sub(hexval, 2, 3), 16)
    local green = tonumber(string.sub(hexval, 4, 5), 16)
    local blue = tonumber(string.sub(hexval, 6, 7), 16)
    return red..","..green..","..blue
end

local generateColors_PuTTY = function()
    local filename = vim.fn.expand("~/Downloads/Neovim_PuTTY_colours.reg")
    local file = io.open(filename, "w")
    if file ~= nil then
        local output = ""
        .."Windows Registry Editor Version 5.00\n"
        .."\n"
        .."[HKEY_CURRENT_USER\\Software\\SimonTatham\\PuTTY\\Sessions\\Default%20Settings]\n"
        .."\"Colour0\"=\""..hexToRGB(colors["foreground"]).."\"\n"
        .."\"Colour1\"=\""..hexToRGB(colors["foreground"]).."\"\n"
        .."\"Colour2\"=\""..hexToRGB(colors["background"]).."\"\n"
        .."\"Colour3\"=\""..hexToRGB(colors["background"]).."\"\n"
        .."\"Colour4\"=\""..hexToRGB(colors["cursor"]).."\"\n"
        .."\"Colour5\"=\""..hexToRGB(colors["cursor"]).."\"\n"
        .."\"Colour6\"=\""..hexToRGB(colors["black"]).."\"\n"
        .."\"Colour7\"=\""..hexToRGB(colors["brightBlack"]).."\"\n"
        .."\"Colour8\"=\""..hexToRGB(colors["red"]).."\"\n"
        .."\"Colour9\"=\""..hexToRGB(colors["brightRed"]).."\"\n"
        .."\"Colour10\"=\""..hexToRGB(colors["green"]).."\"\n"
        .."\"Colour11\"=\""..hexToRGB(colors["brightGreen"]).."\"\n"
        .."\"Colour12\"=\""..hexToRGB(colors["yellow"]).."\"\n"
        .."\"Colour13\"=\""..hexToRGB(colors["brightYellow"]).."\"\n"
        .."\"Colour14\"=\""..hexToRGB(colors["blue"]).."\"\n"
        .."\"Colour15\"=\""..hexToRGB(colors["brightBlue"]).."\"\n"
        .."\"Colour16\"=\""..hexToRGB(colors["purple"]).."\"\n"
        .."\"Colour17\"=\""..hexToRGB(colors["brightPurple"]).."\"\n"
        .."\"Colour18\"=\""..hexToRGB(colors["cyan"]).."\"\n"
        .."\"Colour19\"=\""..hexToRGB(colors["brightCyan"]).."\"\n"
        .."\"Colour20\"=\""..hexToRGB(colors["white"]).."\"\n"
        .."\"Colour21\"=\""..hexToRGB(colors["brightWhite"]).."\""
        file:write(output)
        file:close()
        print("\""..filename.."\" was saved")
    else
        print("Failed to generate PuTTY colours")
    end
end

GenerateColors = function(terminal)
    if terminal == "PuTTY" then
        generateColors_PuTTY()
    else
        print("Terminal option not found")
    end
end

