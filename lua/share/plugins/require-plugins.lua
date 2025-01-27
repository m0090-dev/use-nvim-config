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
			event = "CmdlineEnter",
			"VonHeikemen/fine-cmdline.nvim",
			dependencies = {
				"MunifTanjim/nui.nvim",
			},
		},
		{
			event = "BufReadPost",
			"nvim-treesitter/nvim-treesitter",
		},
		{
			event = "VimEnter",
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
		},
		{
			event = "BufReadPost",
			"nvim-lualine/lualine.nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
		},
	}
end

-- 通常設定
function require_plugins()
	return vim.list_extend(require_minimum_plugins(), {
		{
			"numToStr/Comment.nvim",
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
