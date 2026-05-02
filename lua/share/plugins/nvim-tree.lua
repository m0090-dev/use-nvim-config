local M = {}
function M.setup_nvim_tree()
	local git_available = vim.fn.executable("git") == 1
	require("nvim-tree").setup({
		sort_by = "extension",

		view = {
			width = "25%",
			side = "left",
			signcolumn = "no",
		},
		git = {
			enable = git_available,
		},
		filters = {
			dotfiles = false,
			custom = { "node_modules", "\\.cache" },
		},

		renderer = {
			highlight_git = git_available,
			highlight_opened_files = "name",
			icons = {
				glyphs = {
					git = {
						unstaged = "!",
						renamed = "»",
						untracked = "?",
						deleted = "✘",
						staged = "✓",
						unmerged = "",
						ignored = "◌",
					},
				},
			},
		},

		actions = {
			expand_all = {
				max_folder_discovery = 100,
				exclude = { ".git", "target", "build" },
			},
		},

		on_attach = "default",
	})
	vim.api.nvim_create_user_command("Ex", function()
		vim.cmd.NvimTreeToggle()
	end, {})
	--require("nvim-tree.api").tree.toggle(false, true)
end
return M
