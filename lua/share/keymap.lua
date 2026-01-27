
function set_key_maps()
    -- [[Use Keymaps]]

    -- Ctrl-Sで保存する(Windows)
    vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true })

    -- Space-sでUnix改行保存
    vim.api.nvim_set_keymap("n", "<leader>s", ":w ++ff=unix<CR>", { noremap = true })

    -- `--noplugin` モード判定（pluginが読み込まれていない＝'loaded_*'がfalse）
    --local is_plugin_mode = vim.tbl_contains(vim.opt.runtimepath:get(), "plugin")

    -- --nopluginが指定されたかどうか
    local has_noplugin = false
    -- Neovimの引数チェック
    for _, arg in pairs(vim.v.argv) do
	if arg == "--noplugin" then
	   has_noplugin = true
	   break
 	end
    end

    if not has_noplugin then
        -- barbar.nvim用：Space-t / Space-T でバッファ移動
        vim.api.nvim_set_keymap("n", "<leader>t", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>T", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })

        -- バッファを閉じる
        vim.api.nvim_set_keymap("n", "<leader>q", ":BufferClose<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<leader>x", ":bd!<CR>", { noremap = true, silent = true })

        -- Telescope起動
        vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope<CR>", { noremap = true })

        -- NvimTreeトグル
        vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true })

        -- コマンドライン補完（fine-cmdline）
        --vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

        -- NERDCommenter
        --vim.api.nvim_set_keymap("n", "<leader>c", ":call NERDComment('n', 'toggle')<CR>", { noremap = true })
        
        for i = 1, 10 do
          vim.keymap.set("n", "<leader>" .. i, "<cmd>" .. i .. "ToggleTerm<cr>")
        end

    end

    -- ターミナルから抜けるキー
    vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
end
