return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".git" },
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            format = {
                defaultConfig = {
                    quote_style = "double",
                    call_arg_parentheses = "always",
                    space_after_comment_dash = "true",
                },
            },
        },
    },
}
