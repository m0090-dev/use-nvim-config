function set_key_maps()
    vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>s", ":w ++ff=unix<CR>", { noremap = true })

    local has_noplugin = false
    for _, arg in pairs(vim.v.argv) do
        if arg == "--noplugin" then
            has_noplugin = true
            break
        end
    end

    local has_minimum = os.getenv("NVIM_PLUGIN_MINIMUM") == "1"

    if not has_noplugin then
        -- minimum / 通常共通（barbar, nvim-tree, toggleterm は両方にある）
        vim.api.nvim_set_keymap("n", "<leader>t", "<Cmd>BufferNext<CR>",     { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>T", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>q", ":BufferClose<CR>",        { noremap = true })
        vim.api.nvim_set_keymap("n", "<leader>x", ":bd!<CR>",                { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>",     { noremap = true })
        for i = 1, 10 do
            vim.keymap.set("n", "<leader>" .. i, "<cmd>" .. i .. "ToggleTerm<cr>")
        end

        if not has_minimum then
            -- 通常モードのみ（fine-cmdline, Telescope はminimumにない）
            vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope<CR>",          { noremap = true })
            vim.api.nvim_set_keymap("n", ":",          "<cmd>FineCmdline<CR>",    { noremap = true })
        end
    end

    vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
end
