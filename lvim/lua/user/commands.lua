local createCommand = vim.api.nvim_create_user_command

createCommand("Far", function()
  require('user.plugins.far').findInput()
end, {})
