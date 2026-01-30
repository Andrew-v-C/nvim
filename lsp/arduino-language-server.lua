local configFile
if string.sub(vim.loop.os_uname().sysname, 1, 7) == "Windows" then
    configFile = os.getenv("LOCALAPPDATA") .. "\\Arduino15\\arduino-cli.yaml"
else
    configFile = os.getenv("HOME") .. "/.arduino15/arduino-cli.yaml"
end

return {
    cmd = { "arduino-language-server", "-cli-config", configFile },
    filetypes = { "arduino" },
    root_markers = { ".git" },
    capabilities = {
        textDocument = { semanticTokens = vim.NIL },
        workspace = { semanticTokens = vim.NIL },
    },
}
