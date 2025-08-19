local M = {}
function M.setup_noice()
	require("noice").setup({
		-- 通知(notify)をminiビューで表示する設定
		routes = {
			{
				filter = {
					event = "notify",
				},
				view = "mini",
			},
		},

		-- lspに関する設定はそのまま
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},

		-- presetsは使わないか、必要なものだけにする
		presets = {
			bottom_search = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
	})
end

return M
