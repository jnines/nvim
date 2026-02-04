return {
  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
    keys = {
      { '<leader>M', '<CMD>Mason<CR>', desc = 'Mason', mode = { 'n' } },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'bashls',
        'html',
        'ts_ls',
        'cssls',
        'tailwindcss',
        'graphql',
        'emmet_ls',
        'pyright',
        'jsonls',
        'yamlls',
        'lua_ls',
        'marksman',
        'gopls',
        'taplo',
      },
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'prettier',
        'eslint',
        'shfmt',
        'jsonlint',
        'stylua',
        'isort',
        'black',
        'pylint',
        'yamllint',
        'markdownlint',
        'golangci-lint',
        'gofumpt',
      },
    },
  },
}
