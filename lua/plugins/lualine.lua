return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')
    local lazy_status = require('lazy.status')
    lualine.setup({
      options = {
        theme = 'auto',
        disabled_filetypes = {
          statusline = { 'alpha', 'NvimTree' },
          winbar = {
            'help',
            'alpha',
            'dashboard',
            'neogitstatus',
            'NvimTree',
            'Trouble',
            'lir',
            'Outline',
            'spectre_panel',
            'toggleterm',
          },
          NvimTree = {},
        },
      },
      sections = {
        lualine_c = {
          { 'filesize' },
          { 'filename', path = 3 },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#9c814f' },
          },
          { 'encoding' },
          { 'fileformat' },
          { 'filetype' },
        },
      },
      extensions = { 'lazy' },
    })
  end,
}
