
vim.lsp.config["lua-language-server"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".git" },
    settings = { Lua = { diagnostics = { globals = { "vim" } } } },
}
vim.lsp.enable("lua-language-server")

vim.lsp.config["clangd"] = {
    cmd = { "clangd" },
    filetypes = { "c", "cpp" },
    root_markers = { ".git" },
}
vim.lsp.enable("clangd")

vim.lsp.config["arduino-language-server"] = {
    capabilities = {
        textDocument = { semanticTokens = vim.NIL, },
        workspace = { semanticTokens = vim.NIL, },
    },
    cmd = {
        "arduino-language-server",
        "-cli-config", vim.fn.expand("~/AppData/Local/Arduino15/arduino-cli.yaml"),
    },
    filetypes = { "arduino" },
    root_dir = function(bufnr, on_dir)
        on_dir(vim.fn.expand "%:p:h")
    end,
}
vim.lsp.enable("arduino-language-server")

