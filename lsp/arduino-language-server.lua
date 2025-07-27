
local cliConfigPath
if string.sub(vim.loop.os_uname().sysname, 1, 7) == "Windows" then
    cliConfigPath = vim.fn.expand("~/AppData/Local/Arduino15/arduino-cli.yaml")
else
    cliConfigPath = vim.fn.expand("~/.arduino15/arduino-cli.yaml")
end

return {
    capabilities = {
        textDocument = { semanticTokens = vim.NIL, },
        workspace = { semanticTokens = vim.NIL, },
    },
    cmd = {
        "arduino-language-server",
        "-cli-config", cliConfigPath
    },
    filetypes = { "arduino" },
    root_dir = function(bufnr, on_dir)
        on_dir(vim.fn.expand "%:p:h")
    end,
}

