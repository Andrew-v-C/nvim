-- Lines and scrolling
vim.opt.number = true     -- Show line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.scrolloff = 999   -- Set scrolling behaviour
vim.opt.wrap = false      -- Disable word wrap
vim.opt.list = true       -- Show "list" characters
vim.opt.listchars = {     -- Set "list" characters
    tab = "» ",
    trail = "·",
    nbsp = "␣",
    extends = "…",
    precedes = "…",
}

-- Set cursor style for each mode
vim.opt.guicursor = ""
    .. "n-v-c:block,"                               -- normal/visual/command: block
    .. "i-ci:ver25,"                                -- insert/command-insert: vertical line
    .. "r-cr-o:hor20,"                              -- replace/command-replace/operator-pending: horizontal line
    .. "t:ver25-blinkon500-blinkoff500-TermCursor," -- terminal: blinking vertical line

-- Windowing behaviour
vim.opt.splitbelow = true     -- Open new windows below
vim.opt.splitright = true     -- Open new windows to the right
vim.opt.winborder = "rounded" -- Set border for floating windows

-- Set shell to use in terminal mode
local shell
if string.sub(vim.loop.os_uname().sysname, 1, 7) == "Windows" then
    shell = "pwsh -NoLogo"
else
    shell = "bash"
end
vim.opt.shell = shell

-- Set up folding
vim.opt.foldenable = false -- Disabled for now, due to bugs
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "1"
vim.opt.fillchars = {
    fold = " ",
    foldopen = "",
    foldclose = "",
    foldsep = " ",
}

-- Misc.
vim.opt.autochdir = true          -- Change current working directory to match file
vim.opt.virtualedit = "block"     -- Use virtual edit in visual block mode
vim.opt.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim
vim.opt.showmode = false          -- Don't show current mode in command line (already shown in status line)
vim.opt.cmdheight = 0             -- Hide command line by default
vim.opt.mouse = ""                -- Disable mouse
