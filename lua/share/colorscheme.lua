function set_default_colorscheme()
	vim.cmd([[
try
  colorscheme evening
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
end
