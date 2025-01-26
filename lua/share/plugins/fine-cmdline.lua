function setup_fine_cmdline()
	require("fine-cmdline").setup({
		cmdline = {
			enable_keymaps = true,
			smart_history = true,
			prompt = ": ", -- スタイリッシュなプロンプト
		},
		popup = {
			position = {
				row = "42%", -- 画面中央より少し上で配置
				col = "50%",
			},
			size = {
				width = "50%", -- 適度な幅
			},
			border = {
				style = "rounded", -- スタイリッシュな丸みのあるボーダー
				text = {
					top = " Fine Cmdline ", -- 上部にラベルを表示
					top_align = "center", -- ラベルを中央揃え
				},
			},
			win_options = {
				winhighlight = "Normal:FineNormal,FloatBorder:FineBorder", -- カスタムハイライト
				cursorline = true, -- カーソル行を目立たせる
			},
		},
		hooks = {
			before_mount = function(input)
				-- 必要ならここにカスタムコードを記述
			end,
			after_mount = function(input)
				-- 必要ならここにカスタムコードを記述
			end,
			set_keymaps = function(imap, feedkeys)
				imap("<Esc>", function()
					feedkeys("<Esc>")
				end) -- ESCで終了
			end,
		},
	})

	-- カスタムハイライトグループの設定
	vim.cmd([[
    highlight FineNormal guifg=#E6E6FA guibg=#1E1E2E       " メイン背景とテキスト
    highlight FineBorder guifg=#FF79C6 guibg=#1E1E2E       " ボーダーを近未来的なピンクに
    highlight CursorLine guibg=#333344                      " カーソル行を少し強調
  ]])
end
