-- 最小限設定
function require_minimum_plugins()
	return {
		{
			"terryma/vim-multiple-cursors",
		},
		{
			  event = {'BufReadPost', 'BufNewFile'},
			"romgrk/barbar.nvim",
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
		require("share/plugins/lualine").setup_lualine()
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
		{
			"preservim/nerdcommenter",
			config = function()
				require("share/plugins/comment").setup_comment()
			end,
		},
		{
			"Mofiqul/vscode.nvim",
			config = function()
				require("share/plugins/vscode").setup_vscode()
			end
		}
	}
end

-- 通常設定
function require_plugins()
	return vim.list_extend(require_minimum_plugins(), {
		{
			event = "CmdlineEnter",
			"vim-scripts/ScrollColors",
		},

		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
			keys = {
				{
					"<leader>?",
					function()
						require("which-key").show({ global = false })
					end,
					desc = "Buffer Local Keymaps (which-key)",
				},
			},
		},
		--[[ {]]
		--[["RaafatTurki/hex.nvim",]]
		--[[config = function()]]
		--[[require("hex").setup()]]
		--[[end]]
		--[[},]]
		{
			"mason-org/mason.nvim",
			opts = {},
			cmd = "Mason",
			config = function()
				require("mason").setup()
			end,
		},

		{
			"neovim/nvim-lspconfig",
			event = "BufReadPre",
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = { "lua_ls", "gopls" }, -- 必要なLSPをリストアップ
					automatic_enable = true, -- デフォルトで自動有効化（省略可）
				})
			end,
		},
		{
			"williamboman/mason-lspconfig.nvim",
		},

		{
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp", -- LSPソース
				"neovim/nvim-lspconfig", -- LSP設定（既に入れてる前提）
				"hrsh7th/cmp-path", -- ★ パス補完
			},
			config = function()
				local cmp = require("cmp")
				cmp.setup({
					mapping = {
						["<Tab>"] = cmp.mapping.select_next_item(),
						["<S-Tab>"] = cmp.mapping.select_prev_item(),
						["<C-n>"] = cmp.mapping.select_next_item(),
						["<C-p>"] = cmp.mapping.select_prev_item(),
						["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enterで確定
						["<C-Space>"] = cmp.mapping.complete(), -- 手動で補完呼び出し
					},
					sources = {
						{ name = "nvim_lsp" }, -- 既存LSP補完
						{ name = "path" }, -- ★ パス補完追加
						-- 他の補完ソースもここに追加可能
					},
				})
			end,
		},

		-- lazy.nvim
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {
				-- add any options here
			},
			dependencies = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
				-- OPTIONAL:
				--   `nvim-notify` is only needed, if you want to use the notification view.
				--   If not available, we use `mini` as the fallback
				--"rcarriga/nvim-notify",
			},
			config = function()
				require("share/plugins/noice").setup_noice()
			end,
		}, 
	})
end
