---@diagnostic disable: missing-fields
return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  ---@module 'Gitsigns'
  --- @type Gitsigns.Config
  opts = {
    numhl = true,
    signcolumn = false,
  },
  keys = {
    { '<leader>gb', '<CMD>:Gitsigns toggle_current_line_blame<CR>', desc = 'Git blame toggle' },
    { '<leader>gp', '<CMD>:Gitsigns preview_hunk<CR>', desc = 'Git preview hunk' },
  },
}
