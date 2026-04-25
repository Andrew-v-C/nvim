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
                    call_arg_parentheses = "always",
                    quote_style = "double",
                    space_after_comment_dash = "true",
                    space_before_inline_comment = "2",
                    trailing_table_separator = "smart",
                },
            },
        },
    },
}
