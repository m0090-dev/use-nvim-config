local M = {}
function M.setup_nvim_treesitter()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "c", "lua", "vim","heex", "javascript", "html" ,"rust","ruby","nim"},
		highlight = { enable = true },
		incremental_selection = { enable = true },
		indent = { enable = true },
	})
end
return M
