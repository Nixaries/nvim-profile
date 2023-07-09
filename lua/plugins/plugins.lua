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
		'nvim-telescope/telescope.nvim',
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
	'hrsh7th/cmp-nvim-lsp',
	'saadparwaiz1/cmp_luasnip',
	'L3MON4D3/LuaSnip',
	{
		"oxfist/night-owl.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd.colorscheme("night-owl")
		end,
	}
}

local opts = {}

require("lazy").setup(plugins, opts)
