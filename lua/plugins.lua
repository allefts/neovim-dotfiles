return {
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "blazkowolf/gruber-darker.nvim" },

	{'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},

	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

	{
	    "nvim-neo-tree/neo-tree.nvim",
	    branch = "v3.x",
	    dependencies = {
		"nvim-lua/plenary.nvim",
	      	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	      	"MunifTanjim/nui.nvim",
	    }
	},

	{'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }},

	{"xiyaowong/transparent.nvim"},

	{'nvim-telescope/telescope-ui-select.nvim'},

	{"nvimtools/none-ls.nvim"},

}


