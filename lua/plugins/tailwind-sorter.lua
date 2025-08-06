return {
  'laytan/tailwind-sorter.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
  build = 'cd formatter && pnpm i && pnpm run build',
  ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact' },
  config = function()
    local twsort = require('tailwind-sorter')
    twsort.setup({
      on_save_enabled = true,
    })
  end,
}
