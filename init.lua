require("share/keymap")
require("share/opt")
require("share/colorscheme")
require("share/plugins/require-plugins")
require("share/command")
require("setup")

local has_minimum = os.getenv("NVIM_PLUGIN_MINIMUM") == "1"

local Setup = SetupBuilder()
local main_setup = Setup.new("MainSetup", require_plugins())
local minimum_setup = Setup.new("MinimumSetup", require_minimum_plugins())

if has_minimum then
	minimum_setup:build()
else
	main_setup:build()
end
setup_commands()
