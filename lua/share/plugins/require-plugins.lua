function require_minimum_plugins()
	return {
		"terryma/vim-multiple-cursors",
		"romgrk/barbar.nvim",

		"MunifTanjim/nui.nvim",
		"VonHeikemen/fine-cmdline.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
		},
	}
end
function require_plugins()
	return {
		"terryma/vim-multiple-cursors",
		-- 'preservim/nerdcommenter',
		{
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup({
					-- コメントの設定
					padding = true, -- コメントとコードの間にスペースを入れる
					sticky = true, -- コメントアウト時、カーソル位置を保持する
					ignore = nil, -- コメント化しない行（特に必要なければnilのままで）
					toggler = {
						line = "gcc", -- 行コメントの切り替え
						block = "gbc", -- ブロックコメントの切り替え
					},
					opleader = {
						line = "gc", -- 行コメントのオペレーター
						block = "gb", -- ブロックコメントのオペレーター
					},
					extra = {
						above = "gcO", -- 行の上にコメントを追加
						below = "gco", -- 行の下にコメントを追加
						eol = "gcA", -- 行末にコメントを追加
					},
					mappings = {
						basic = true, -- 基本のマッピング（gcc、gbc、gc[count]{motion}など）
						extra = true, -- 追加のマッピング（gco、gcO、gcAなど）
					},
				})
			end,
		},
		"romgrk/barbar.nvim",
		"rcarriga/nvim-notify",
		"MunifTanjim/nui.nvim",
		"VonHeikemen/fine-cmdline.nvim",
		"vim-scripts/ScrollColors",
		"nvim-treesitter/nvim-treesitter",

		{
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
		},
	}
end
