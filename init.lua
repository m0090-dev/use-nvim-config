require("share/keymap")
require("share/opt")
require("share/colorscheme")
require("share/plugins/require-plugins")
require("share/command")
require("setup")

-- --nopluginが指定されたかどうか
local has_noplugin = false
local has_minimum = os.getenv("NVIM_PLUGIN_MINIMUM") == "1"
-- Neovimの引数チェック
for _, arg in pairs(vim.v.argv) do
	if arg == "--noplugin" then
		has_noplugin = true
		break
	end
end

Setup = Setup()
local main_setup = Setup.new("MainSetup", require_plugins())
local minimum_setup = Setup.new("MinimumSetup", require_minimum_plugins())

if has_minimum then
	minimum_setup:build()
else
	main_setup:build()
end
setup_commands()
