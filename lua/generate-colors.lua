
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

local generateWindowsTerminalScheme = function()
    local clipboard = io.popen("clip", "w")
    if clipboard ~= nil then
        local output = ""
        .."{\n"
        .."    \"name\" : \"Neovim\",\n"
        .."    \"background\" : \""..colors["background"].."\",\n"
        .."    \"foreground\" : \""..colors["foreground"].."\",\n"
        .."    \"cursorColor\" : \""..colors["cursor"].."\",\n"
        .."    \"black\" : \""..colors["black"].."\",\n"
        .."    \"red\" : \""..colors["red"].."\",\n"
        .."    \"green\" : \""..colors["green"].."\",\n"
        .."    \"yellow\" : \""..colors["yellow"].."\",\n"
        .."    \"blue\" : \""..colors["blue"].."\",\n"
        .."    \"purple\" : \""..colors["purple"].."\",\n"
        .."    \"cyan\" : \""..colors["cyan"].."\",\n"
        .."    \"white\" : \""..colors["white"].."\",\n"
        .."    \"brightBlack\" : \""..colors["brightBlack"].."\",\n"
        .."    \"brightRed\" : \""..colors["brightRed"].."\",\n"
        .."    \"brightGreen\" : \""..colors["brightGreen"].."\",\n"
        .."    \"brightYellow\" : \""..colors["brightYellow"].."\",\n"
        .."    \"brightBlue\" : \""..colors["brightBlue"].."\",\n"
        .."    \"brightPurple\" : \""..colors["brightPurple"].."\",\n"
        .."    \"brightCyan\" : \""..colors["brightCyan"].."\",\n"
        .."    \"brightWhite\" : \""..colors["brightWhite"].."\"\n"
        .."}"
        clipboard:write(output)
        clipboard:close()
        print("Scheme copied to clipboard")
    else
        print("Failed to generate scheme")
    end
end

local generatePuTTYColors = function()
    local clipboard = io.popen("clip", "w")
    if clipboard ~= nil then
        local output = ""
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
        clipboard:write(output)
        clipboard:close()
        print("Colors copied to clipboard")
    else
        print("Failed to generate colors")
    end
end

local generatePtyxisPalette = function()
    local filename = vim.env.HOME.."/.local/share/org.gnome.Ptyxis/palettes/Neovim.palette"
    local file = io.open(filename, "w")
    if file ~= nil then
        local output = ""
        .."[Palette]\n"
        .."Name=Neovim\n"
        .."Background="..colors["background"].."\n"
        .."Foreground="..colors["foreground"].."\n"
        .."Cursor="..colors["cursor"].."\n"
        .."Color0="..colors["black"].."\n"
        .."Color1="..colors["red"].."\n"
        .."Color2="..colors["green"].."\n"
        .."Color3="..colors["yellow"].."\n"
        .."Color4="..colors["blue"].."\n"
        .."Color5="..colors["purple"].."\n"
        .."Color6="..colors["cyan"].."\n"
        .."Color7="..colors["white"].."\n"
        .."Color8="..colors["brightBlack"].."\n"
        .."Color9="..colors["brightRed"].."\n"
        .."Color10="..colors["brightGreen"].."\n"
        .."Color11="..colors["brightYellow"].."\n"
        .."Color12="..colors["brightBlue"].."\n"
        .."Color13="..colors["brightPurple"].."\n"
        .."Color14="..colors["brightCyan"].."\n"
        .."Color15="..colors["brightWhite"]
        file:write(output)
        file:close()
        print("\""..filename.."\" was saved")
    else
        print("Failed to generate palette")
    end
end

GenerateColors = function(terminal)
    if terminal == "Windows Terminal" then
        generateWindowsTerminalScheme()
    elseif terminal == "PuTTY" then
        generatePuTTYColors()
    elseif terminal == "Ptyxis" then
        generatePtyxisPalette()
    else
        print("Terminal option not found")
    end
end

