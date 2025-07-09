
vim.opt.number = true  -- Show line numbers
vim.opt.list = true  -- Show trailing whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }  -- Set whitespace characters
vim.opt.cursorline = true  -- Highlight current line

-- Set tabs/indentation
vim.cmd('autocmd FileType * set expandtab')
vim.cmd('autocmd FileType * set shiftwidth=4')
vim.cmd('autocmd FileType * set tabstop=4')
vim.cmd('autocmd FileType * set softtabstop=4')
vim.cmd('autocmd FileType * set cindent')

vim.cmd('inoremap {<Enter> {<Enter>}<Esc>O')  -- Auto-close braces for blocks
vim.cmd('autocmd FileType * set formatoptions-=cro')  -- Don't auto comment

