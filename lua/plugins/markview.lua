---@diagnostic disable: missing-fields
return {
  'OXY2DEV/markview.nvim',
  lazy = false,

  opts = {
    experimental = {
      check_rtp_message = false,
    },
  },
  keys = {
    { '<leader>mp', ':Markview toggle<CR>', desc = 'Markdown Preview', mode = { 'n' } },
  },
}
