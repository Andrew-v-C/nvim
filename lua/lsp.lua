
-- Include lsp directory in path
package.path = package.path..";"..vim.fn.stdpath("config").."/lsp/?.lua"

-- Load configs and enable servers
local server
for key, value in pairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
    server = vim.fn.fnamemodify(value, ":t:r")
    vim.lsp.config[server] = require(server)
    vim.lsp.enable(server)
end

-- Configure diagnostics
vim.diagnostic.config({
    severity_sort = true,
    virtual_text = { severity = vim.diagnostic.severity.ERROR, },
    signs = { text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
    }, },
})

