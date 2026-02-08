return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'tree-sitter/tree-sitter-regex',
    'nvim-treesitter/nvim-treesitter-context',
  },
  opts = {
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    ensure_installed = {
      'json',
      'javascript',
      'typescript',
      'tsx',
      'yaml',
      'html',
      'php',
      'css',
      'markdown',
      'markdown_inline',
      'bash',
      'lua',
      'vim',
      'python',
      'dockerfile',
      'gitignore',
      'go',
      'qmljs',
      'qmldir',
      'query',
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-space>',
        node_incremental = '<C-space>',
        scope_incremental = false,
        node_decremental = '<bs>',
      },
    },
  },
  keys = {
    {
      '<leader>gc',
      function()
        require('treesitter-context').go_to_context()
      end,
      desc = 'GoTo context',
      mode = { 'n' },
    },
  },
}
