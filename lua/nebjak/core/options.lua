vim.cmd("let g:netrw_liststyle = 3")

-- Search settings
vim.opt.ignorecase = true -- case insensitive
vim.opt.smartcase = true -- be smart about case
vim.opt.hlsearch = true -- highlight search results
vim.opt.incsearch = true -- makes search act like search in modern browsers

-- For expressions turn magic on
vim.opt.magic = true

-- Enable spell check by default
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- Tabs & indentation
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.tabstop = 2 -- 2 spaces for one tab
vim.opt.expandtab = true -- expand tabs to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- Show list
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", eol = "¬" }

-- Set relative number lines
vim.opt.relativenumber = true

-- Show line numbers
vim.opt.number = true

-- Disable arrow keys
vim.api.nvim_set_keymap("", "<up>", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<down>", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<left>", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<right>", "<nop>", { noremap = true, silent = true })

-- copy
vim.api.nvim_set_keymap("v", "<leader>y", '"*y', { noremap = true, silent = true })
-- paste
vim.api.nvim_set_keymap("v", "<leader>p", '"*p', { noremap = true, silent = true })

-- Colors
vim.opt.termguicolors = true
vim.opt.background = "dark"
