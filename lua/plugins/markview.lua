return {
  'OXY2DEV/markview.nvim',
  lazy = false,

  vim.keymap.set('n', '<leader>mp', ':Markview toggle<CR>', { desc = 'Markdown Preview' }),

  config = function()
    local mkv = require('markview')

    mkv.setup({
      experimental = {
        check_rtp_message = false,
      },
    })
  end,
}
