function set_key_maps()
	-- [[Use Keymaps]]

	-- Ctrl-Sで保存する(Windows)
	vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true })
	-- Space-S二回で保存する(Unix)
	vim.api.nvim_set_keymap("n", "<leader>s", ":w ++ff=unix<CR>", { noremap = true })
	-- Space-tで次のタブに移動
	--vim.api.nvim_set_keymap("n", "<leader>t", ":tabnext<CR>", { noremap = true })
	-- Space-Tで前ののタブに移動
	--vim.api.nvim_set_keymap("n", "<leader>T", ":tabprev<CR>", { noremap = true })


	-- Space-t: 次のバッファに移動
	vim.api.nvim_set_keymap("n", "<leader>t", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })

	-- Space-T: 前のバッファに移動
	vim.api.nvim_set_keymap("n", "<leader>T", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })

	-- Space-qでタブを閉じる
	vim.api.nvim_set_keymap("n", "<leader>q", ":BufferClose<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", "<leader>x", ":bd!<CR>", { noremap = true, silent = true })

	vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope<CR>", { noremap = true })
	--vim.api.nvim_set_keymap('n', '<leader>c', ':call nerdcommenter#Comment("x", "toggle")<CR>', { noremap = true, silent = true })


	vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true })
	--Escapeでターミナルを抜ける
	vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
	vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

	vim.api.nvim_set_keymap("n", "<leader>c", ":call NERDComment('n', 'toggle')<CR>", { noremap = true })
end
