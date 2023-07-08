local lazypath = vim.fn.stdpath("data") .. "./lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	'nvim-treesitter/nvim-treesitter',
	{
		'ThePrimeagen/harpoon',
		dependencies = {
			{
				'nvim-lua/plenary.nvim'
			}
		}
	},
	{
		'neovim/nvim-lspconfig',
		lazy = false
	},
	{
	    "williamboman/mason.nvim",
	    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	    lazy = false
	},
	'hrsh7th/nvim-cmp',
	'hrsh7th/vim-vsnip'
}

local opts = {}

require("lazy").setup(plugins, opts)
