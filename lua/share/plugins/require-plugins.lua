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
		{
			"nvim-treesitter/nvim-treesitter-context",
			event = { "BufNewFile", "BufReadPre" },

			config = function()
				require("treesitter-context").setup({
					enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
					multiwindow = false, -- Enable multiwindow support.
					max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
					min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
					line_numbers = true,
					multiline_threshold = 20, -- Maximum number of lines to show for a single context
					trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
					mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
					-- Separator between context and content. Should be a single character string, like '-'.
					-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
					separator = nil,
					zindex = 20, -- The Z-index of the context window
					on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
				})
			end,
		},
		{
			"kevinhwang91/nvim-ufo",

			event = "VeryLazy",
			dependencies = {
				"kevinhwang91/promise-async",
			},
			config = function()
				--require('ufo').setup({})

				local ftMap = {
					vim = "indent",
					python = { "indent" },
					git = "",
				}
				require("ufo").setup({
					open_fold_hl_timeout = 150,
					close_fold_kinds_for_ft = {
						default = { "imports", "comment" },
						json = { "array" },
						c = { "comment", "region" },
					},
					close_fold_current_line_for_ft = {
						default = true,
						c = false,
					},
					preview = {
						win_config = {
							border = { "", "─", "", "", "", "─", "", "" },
							winhighlight = "Normal:Folded",
							winblend = 0,
						},
						mappings = {
							scrollU = "<C-u>",
							scrollD = "<C-d>",
							jumpTop = "[",
							jumpBot = "]",
						},
					},
					provider_selector = function(bufnr, filetype, buftype)
						-- if you prefer treesitter provider rather than lsp,
						-- return ftMap[filetype] or {'treesitter', 'indent'}
						return ftMap[filetype]

						-- refer to ./doc/example.lua for detail
					end,
				})
				vim.keymap.set("n", "zR", require("ufo").openAllFolds)
				vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
				vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
				vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
				vim.keymap.set("n", "K", function()
					local winid = require("ufo").peekFoldedLinesUnderCursor()
					if not winid then
						-- choose one of coc.nvim and nvim lsp
						vim.fn.CocActionAsync("definitionHover") -- coc.nvim
						vim.lsp.buf.hover()
					end
				end)
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
