-- セットアップクラス
function SetupBuilder()
	local setup = {}
	setup.__index = setup -- メタテーブルのインデックスを設定

	-- コンストラクタ
	function setup.new(name, plugins)
		local self = setmetatable({}, setup) -- 新しいインスタンスを生成
		self.name = name
		self.plugins = plugins
		set_default_colorscheme()
		set_use_options()
		set_key_maps()
		return self
	end

	function setup:build()
		local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
		if not vim.loop.fs_stat(lazypath) then
			vim.fn.system({
				"git",
				"clone",
				"--filter=blob:none",
				"https://github.com/folke/lazy.nvim.git",
				"--branch=stable", -- latest stable release
				lazypath,
			})
		end
		vim.opt.rtp:prepend(lazypath)
		require("lazy").setup(self.plugins)
	end

	return setup
end
