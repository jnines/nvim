return {
  'natecraddock/workspaces.nvim',
  config = function()
    --** Workspace file location **--
    local ws_file = '~/.local/workspaces'

    local workspaces = require('workspaces')
    workspaces.setup({
      path = vim.fs.normalize(ws_file),
      hooks = {
        open = function()
          local ws_name = workspaces.name()
          local ws_path = workspaces.path()

          vim.notify(
            (' Entered Project: %s\n %s'):format(ws_name, ws_path),
            vim.log.levels.INFO,
            { title = 'Workspace' }
          )
        end,
      },
    })
  end,
}
