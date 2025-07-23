
-- Generate palette for Ptyxis terminal
GeneratePalette = function()
    local filename = "/home/andrew/.local/share/org.gnome.Ptyxis/palettes/0-Neovim.palette"
    local palette = io.open(filename, "w")
    if palette ~= nil then
        local background = "#"..string.format("%x", vim.api.nvim_get_hl(0, { name = "Normal" }).bg)
        local foreground = "#"..string.format("%x", vim.api.nvim_get_hl(0, { name = "Normal" }).fg)
        local cursor = "#"..string.format("%x", vim.api.nvim_get_hl(0, { name = "Normal" }).fg)
        palette:write("[Palette]\n")
        palette:write("Name=0-Neovim\n")
        palette:write("Background="..background.."\n")
        palette:write("Foreground="..foreground.."\n")
        palette:write("Cursor="..cursor.."\n")
        palette:write("Color0="..vim.g.terminal_color_0.."\n")    -- Black
        palette:write("Color1="..vim.g.terminal_color_1.."\n")    -- Red
        palette:write("Color2="..vim.g.terminal_color_2.."\n")    -- Green
        palette:write("Color3="..vim.g.terminal_color_3.."\n")    -- Yellow
        palette:write("Color4="..vim.g.terminal_color_4.."\n")    -- Blue
        palette:write("Color5="..vim.g.terminal_color_5.."\n")    -- Purple
        palette:write("Color6="..vim.g.terminal_color_6.."\n")    -- Cyan
        palette:write("Color7="..vim.g.terminal_color_7.."\n")    -- White
        palette:write("Color8="..vim.g.terminal_color_8.."\n")    -- Bright Black
        palette:write("Color9="..vim.g.terminal_color_9.."\n")    -- Bright Red
        palette:write("Color10="..vim.g.terminal_color_10.."\n")  -- Bright Green
        palette:write("Color11="..vim.g.terminal_color_11.."\n")  -- Bright Yellow
        palette:write("Color12="..vim.g.terminal_color_12.."\n")  -- Bright Blue
        palette:write("Color13="..vim.g.terminal_color_13.."\n")  -- Bright Purple
        palette:write("Color14="..vim.g.terminal_color_14.."\n")  -- Bright Cyan
        palette:write("Color15="..vim.g.terminal_color_15.."\n")  -- Bright White
        palette:close()
        print("\""..filename.."\" was saved")
    else
        print("Failed to generate palette")
    end
end

