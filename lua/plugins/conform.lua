return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      css = { 'prettier' },
      html = { 'prettier' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },
      bash = { 'shfmt' },
      sh = { 'shfmt' },
      zsh = { 'shfmt' },
      lua = { 'stylua' },
      golang = { 'gofumpt' },
      python = { 'isort', 'black' },
    },

    format_on_save = function(bufnr)
      if vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 1000, lsp_format = 'fallback' }
    end,

    formatters = {
      prettier = {
        prepend_args = { '--single-quote', '--jsx-single-quote' },
      },
      shfmt = {
        args = { '-bn' },
      },
    },
  },
  keys = {
    {
      '<leader>,',
      function()
        require('conform').format({ timeout_ms = 1000, lsp_fallback = true, async = false })
      end,
      { desc = 'Format file' },
    },
  },
}
