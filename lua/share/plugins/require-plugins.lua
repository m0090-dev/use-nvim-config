-- 最小限設定
function require_minimum_plugins()
	return {
		{
			"terryma/vim-multiple-cursors",
		},

		{
			"romgrk/barbar.nvim",
			event = { "BufReadPost", "BufNewFile" },
			cmd = { "BufferNext", "BufferPrevious" },
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
			"preservim/nerdcommenter",
			config = function()
				require("share/plugins/comment").setup_comment()
			end,
		},
		{
			"Mofiqul/vscode.nvim",
			event = "VimEnter",
			config = function()
				require("share/plugins/vscode").setup_vscode()
			end,
		},
		{
			"akinsho/toggleterm.nvim",
			version = "*",
			config = function()
				require("toggleterm").setup({
					size = 15,
					open_mapping = [[<c-\>]],
					shade_terminals = true,
					direction = "horizontal", -- horizontal | vertical | float | tab
					start_in_insert = true,
					persist_size = true,
					close_on_exit = true,
					shell = vim.o.shell,
				})
			end,
		},
	}
end

-- 通常設定
function require_plugins()
	return vim.list_extend(require_minimum_plugins(), {
	{
			event = "BufReadPost",
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("share/plugins/nvim-treesitter").setup_nvim_treesitter()
			end,
		},

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
					-- ensure_installed = { "lua_ls", "gopls" }, -- 必要なLSPをリストアップ
					-- automatic_enable = true, -- デフォルトで自動有効化（省略可）
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
		{
			"VonHeikemen/fine-cmdline.nvim",
			dependencies = { "MunifTanjim/nui.nvim" },
			config = function()
				require("fine-cmdline").setup({
					cmdline = {
						enable_keymaps = false,
						smart_history = true,
						prompt = ": ",
					},
    hooks = {
    set_keymaps = function(imap, feedkeys)
        local fn = require("fine-cmdline").fn
        imap("<Esc>", fn.close)
        imap("<C-c>", fn.close)
    end,
},
					popup = {
						position = {
							row = "40%", -- ←中央っぽく見える調整値
							col = "50%",
						},
						size = {
							width = "60%",
						},
						border = {
							style = "rounded",
						},
						win_options = {
							winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
						},
					},
				})
			end,
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
			opts = {},
			config = function()
				require("share/plugins/render-markdown").setup_render_markdown()
			end,
			ft = { "markdown" },
			keys = {
				{ "<Space>sm", ":RenderMarkdown toggle<CR>" },
			},
		},
	})
end
