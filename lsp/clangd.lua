return {
    cmd = { "clangd" },
    filetypes = { "c", "cpp" },
    root_dir = function(bufnr, cb)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        if vim.fs.root(fname, { "sketch.yaml" }) then return end
        local root = vim.fs.root(fname, {
            ".clangd",
            "CMakeLists.txt",
            "Makefile",
            "compile_commands.json",
        })
        if root then cb(root) end
    end,
}
