return {
  'windwp/nvim-ts-autotag',
  ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact' },
  config = function()
    local autotag = require('nvim-ts-autotag')
    autotag.setup({})
  end,
}
