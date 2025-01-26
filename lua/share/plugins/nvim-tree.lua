function setup_nvim_tree()
	require("nvim-tree").setup({
 		respect_buf_cwd = true,
		sort_by = "case_sensitive",
		view = {
			adaptive_size = true,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
	})
	require("nvim-tree.api").tree.toggle(false, true)
end
