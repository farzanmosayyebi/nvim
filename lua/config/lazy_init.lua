vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = "config.lazy",
  change_detection = {notify  = true},
})
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
--local plugins = { 
--  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
--  {
--    'nvim-telescope/telescope.nvim', tag = '0.1.8',
--    dependencies = { 'nvim-lua/plenary.nvim' }
--  },
--  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
--	{ "ThePrimeagen/harpoon" },
--	{ "mbbill/undotree" },
--	{ "tpope/vim-fugitive" },
--	{ 'neovim/nvim-lspconfig' },
--	{ 'hrsh7th/cmp-nvim-lsp' },
--	{ 'hrsh7th/nvim-cmp' },
--	{
--    "williamboman/mason.nvim",
--    "williamboman/mason-lspconfig.nvim",
--    "neovim/nvim-lspconfig",
--	},
--	{ "hrsh7th/cmp-buffer" },
--
--}

--local opts = {
--}
--
--require("lazy").setup(plugins, opts)
--
--
--
