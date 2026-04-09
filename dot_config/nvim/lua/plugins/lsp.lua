return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {},
        ty = {},
        copilot = {
          settings = {
            telemetry = {
              telemetryLevel = "off",
            }
          }
        }
      },
    },
  },
}
