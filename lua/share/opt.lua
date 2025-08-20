function set_use_options()
	if vim.fn.has('gui_running') == 1 then
  		vim.o.guifont = "Cica:h14"
	end
	vim.opt.fileencodings = { "ucs-bom", "utf-8", "cp932", "latin1" }
	--vim.opt.shell = 'powershell.exe' -- windows向け
	vim.opt.backup = false -- バックアップファイルを作成しない
	vim.opt.writebackup = false -- 書き込み中にバックアップを作成しない
	vim.opt.swapfile = false -- スワップファイルを作成しない

	vim.g.netrw_liststyle = 1
	vim.g.netrw_banner = 0
	vim.g.netrw_sizestyle = "H"
	vim.g.netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S"
	vim.g.netrw_preview = 1
	vim.did_install_default_menus = 1
	vim.did_install_syntax_menu = 1
	vim.did_indent_on = 1
	vim.did_load_filetypes = 1
	vim.did_load_ftplugin = 1
	vim.loaded_2html_plugin = 1
	vim.loaded_gzip = 1
	vim.loaded_man = 1
	vim.loaded_matchit = 1
	vim.loaded_matchparen = 1
	vim.loaded_netrwPlugin = 1
	vim.loaded_remote_plugins = 1
	vim.loaded_shada_plugin = 1
	vim.loaded_spellfile_plugin = 1
	vim.loaded_tarPlugin = 1
	vim.loaded_tutor_mode_plugin = 1
	vim.loaded_zipPlugin = 1
	vim.skip_loading_mswin = 1
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	-- [[ Setting options ]]
	-- See `:help vim.o`
	-- NOTE: You can change these options as you wish!

	-- Set highlight on search
	vim.o.hlsearch = false

	-- Make line numbers default
	vim.wo.number = true

	-- Enable mouse mode
	vim.o.mouse = "a"

	-- Sync clipboard between OS and Neovim.
	--  Remove this option if you want your OS clipboard to remain independent.
	--  See `:help 'clipboard'`
	vim.o.clipboard = "unnamedplus"

	-- Enable break indent
	vim.o.breakindent = true

	-- Save undo history
	vim.o.undofile = true

	-- Case-insensitive searching UNLESS \C or capital in search
	vim.o.ignorecase = true
	vim.o.smartcase = true

	-- Keep signcolumn on by default
	vim.wo.signcolumn = "yes"

	-- Decrease update time
	vim.o.updatetime = 250
	vim.o.timeoutlen = 300

	-- Set completeopt to have a better completion experience
	vim.o.completeopt = "menuone,noselect"

	-- NOTE: You should make sure your terminal supports this
	vim.o.termguicolors = true

	vim.api.nvim_set_var('loaded_netrw', 1)
	vim.api.nvim_set_var('loaded_netrwPlugin', 1)

	vim.cmd("filetype plugin on")
end
