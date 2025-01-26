local function convert_backslash_to_slash(path)
  if type(path) ~= "string" then
    error("Invalid input: path must be a string", 2)
  end
  return path:gsub("\\", "/")
end
function setup_commands()

--print(vim.inspect(vim.loop.os_environ()))
local user_profile = os.getenv("USERPROFILE") 
--print(use_profile)
-- init.luaを再読み込みするコマンド
vim.cmd("command! -nargs=0 InitRestart :luafile ~/.config/nvim/init.lua")
-- WSLをターミナルとして起動するコマンド
vim.cmd("command! -nargs=0 WTerm :set shell=wsl.exe |:term")
-- PowerShellをターミナルとして起動するコマンド
vim.cmd("command! -nargs=0 PTerm :set shell=powershell.exe |:term")

vim.cmd("command! -nargs=0 CustomTermC :set shell=" .. convert_backslash_to_slash(user_profile) .. "/Desktop/env_exec_cmd.bat |:term")
vim.cmd("command! -nargs=0 CustomTermP :set shell=" .. convert_backslash_to_slash(user_profile) .. "/Desktop/env_exec_shell.bat |:term")





vim.cmd([[

function! StartDevCmd()
  let cmd = 'cmd.exe /k "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat" -startdir=none -arch=x64 -host_arch=x64'
  execute 'terminal' cmd
endfunction
]]
)
vim.cmd([[
function! StartDevShell()
  let cmd =  'powershell.exe -NoExit -Command "&{Import-Module """C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"""; Enter-VsDevShell be5ce74d -SkipAutomaticLocation -DevCmdArguments """-arch=x64 -host_arch=x64"""}"'
  execute 'terminal' cmd
endfunction
]]
)



-- Visual Studio Developer Command Promptを起動するコマンド
vim.cmd("command! -nargs=0 DevCmd call StartDevCmd()")
-- Visual Studio Developer Power Shellを起動するコマンド
vim.cmd("command! -nargs=0 DevShell call StartDevShell()")
end
