-- 最小限設定
function require_minimum_plugins()
	return {
		{
			"terryma/vim-multiple-cursors",
		},
		{
			event = "VimEnter",
			"romgrk/barbar.nvim",
		},
		{
			event = "VimEnter",
			"VonHeikemen/fine-cmdline.nvim",
			dependencies = {
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require("share/plugins/fine-cmdline").setup_fine_cmdline()
			end,
		},
		{
			event = "BufReadPost",
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("share/plugins/nvim-treesitter").setup_nvim_treesitter()
			end,
		},
		{
			event = "VimEnter",
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("share/plugins/nvim-tree").setup_nvim_tree()
			end,
		},
		{
			event = "BufReadPost",
			"nvim-lualine/lualine.nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("share/plugins/lualine/lualine").setup_lualine()
			end,
		},
		{
			"nvim-telescope/telescope.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			event = "VimEnter",
			config = function()
				require("telescope").setup({})
			end,
		},
	}
end

-- 通常設定
function require_plugins()
	return vim.list_extend(require_minimum_plugins(), {
		{
			"numToStr/Comment.nvim",
			config = function()
				require("share/plugins/comment").setup_comment()
			end,
		},
		{
			"rcarriga/nvim-notify",
		},
		{
			event = "CmdlineEnter",
			"vim-scripts/ScrollColors",
		},
	})
end
