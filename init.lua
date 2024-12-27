
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.clipboard = "unnamedplus"
vim.opt.encoding = "utf-8"
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 10
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.statusline = "%f  %y  %l:%c  %p%%  [%b]"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", 
		lazypath,
	});
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {"nvim-lua/plenary.nvim"},
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}, 
  {"nvim-telescope/telescope.nvim"},
  {"numToStr/Comment.nvim"},
  {"windwp/nvim-autopairs"},
  {"feline-nvim/feline.nvim"},
  {"lewis6991/gitsigns.nvim"},
  {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"},
  {
    "catppuccin/nvim",
    name = "catppuccin",  -- Optional, you can also use this alias
  }
}

require("lazy").setup(plugins)
require("nvim-treesitter.configs").setup{
  ensure_installed = "all",
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true
  },
}


require("Comment").setup()
require("nvim-autopairs").setup()
vim.cmd("colorscheme catppuccin")

-- Optional: Customize the Catppuccin theme if you want
require("catppuccin").setup({
  flavour = "latte",   -- You can use 'latte', 'frappe', 'macchiato', 'mocha'
  background = {
    light = "latte",        -- Light background (for light mode)
    dark = "mocha",         -- Dark background (for dark mode)
  },
  transparent_background = false, -- Optional, set to true for transparent background
  term_colors = true,      -- Enable terminal colors
  dim_inactive = {
    enabled = false,       -- Disable dimming of inactive windows
  },
})
require("bufferline").setup()

require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}

require("feline").setup()
