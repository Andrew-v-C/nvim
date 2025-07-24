
-- Colors used to generate terminal scheme
local colors = {
    ["background"] = "#"..string.format("%x", vim.api.nvim_get_hl(0, { name = "Normal" }).bg),
    ["foreground"] = "#"..string.format("%x", vim.api.nvim_get_hl(0, { name = "Normal" }).fg),
    ["cursor"] = "#"..string.format("%x", vim.api.nvim_get_hl(0, { name = "Normal" }).fg),
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

-- Generate palette for Ptyxis terminal
GeneratePalette = function()
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
        .."Color15="..colors["brightWhite"].."\n"
        file:write(output)
        file:close()
        print("\""..filename.."\" was saved")
    else
        print("Failed to generate palette")
    end
end

-- Generate scheme for Windows Terminal
GenerateScheme = function()
    local output = ""
    .."{\n"
    .."    \"name\" : \"Neovim\",\n"
    .."    \"background\" : \""..colors["background"].."\",\n"
    .."    \"foreground\" : \""..colors["foreground"].."\",\n"
    .."    \"cursorColor\": \""..colors["cursor"].."\",\n"
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
    .."    \"brightWhite\" : \""..colors["brightWhite"].."\",\n"
    .."},"
    print(output)
end

