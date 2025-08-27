local M = {}
function M.setup_nvim_tree()
	require('nvim-tree').setup {
  sort_by = 'extension',

  view = {
    width = '25%',
    side = 'left',
    signcolumn = 'no',
  },

  renderer = {
    highlight_git = true,
    highlight_opened_files = 'name',
    icons = {
      glyphs = {
        git = {
          unstaged = '!', renamed = '»', untracked = '?', deleted = '✘',
          staged = '✓', unmerged = '', ignored = '◌',
        },
      },
    },
  },

  actions = {
    expand_all = {
      max_folder_discovery = 100,
      exclude = { '.git', 'target', 'build' },
    },
  },

  on_attach = 'default'
}
vim.api.nvim_create_user_command('Ex', function() vim.cmd.NvimTreeToggle() end, {})
	--require("nvim-tree.api").tree.toggle(false, true)
end
return M
