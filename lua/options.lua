
vim.opt.number = true  -- Show line numbers
--vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.cursorline = true  -- Highlight current line
vim.opt.scrolloff = 999  -- Set scrolling behaviour
vim.opt.list = true  -- Show trailing whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }  -- Set whitespace characters
vim.opt.wrap = false  -- Disable word wrap
vim.opt.splitbelow = true  -- Open new windows below
vim.opt.splitright = true  -- Open new windows to the right
vim.opt.termguicolors = true  -- Enable 24-bit color in TUI

-- Set folding options
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Set tabs/indentation
vim.cmd("autocmd FileType * set expandtab")
vim.cmd("autocmd FileType * set shiftwidth=4")
vim.cmd("autocmd FileType * set tabstop=4")
vim.cmd("autocmd FileType * set softtabstop=4")
vim.cmd("autocmd FileType * set cindent")

vim.cmd("inoremap {<Enter> {<Enter>}<Esc>O")  -- Auto-close braces for blocks
vim.cmd("autocmd FileType * set formatoptions-=cro")  -- Don't auto comment
vim.opt.virtualedit = "block"  -- Use virtual edit in visual block mode

vim.opt.clipboard = "unnamedplus"  -- Sync clipboard between OS and Neovim

