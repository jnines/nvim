return {
  'mfussenegger/nvim-lint',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    linters_by_ft = {
      markdown = { 'markdownlint' },
      php = { 'php' },
      yaml = { 'yamllint' },
      javascript = { 'eslint' },
      json = { 'jsonlint' },
      typescript = { 'eslint' },
      javascriptreact = { 'eslint' },
      typescriptreact = { 'eslint' },
      bash = { 'shellcheck' },
      go = { 'golangcilint' },
      python = { 'flake8' },
      lua = { 'luacheck' },
    },

    linter_args = {
      luacheck_args = {
        '--formatter',
        'plain',
        '--codes',
        '--ranges',
        '--globals = vim',
        '-',
      },
    },
  },

  config = function(_, opts)
    local lint = require('lint')
    lint.linters_by_ft = opts.linters_by_ft
    lint.linters.luacheck.args = opts.luacheck_args

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        return require('lint').try_lint()
      end,
    })
  end,
  keys = {
    {
      '<leader>.',
      function()
        return require('lint').try_lint()
      end,
      desc = 'Lint current file',
      mode = { 'n' },
    },
  },
}
