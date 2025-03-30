return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = { "<leader>" },
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>g", group = "goto" }, -- group
        { "<leader>o", group = "octo" }, -- group
        { "<leader>b", group = "buffer" }, -- group
        { "<leader>c", group = "code" }, -- group
        { "<leader>f", group = "file/find" }, -- group
        { "<leader>g", group = "git" }, -- group
        { "<leader>q", group = "quit/session" }, -- group
        { "<leader>s", group = "search" }, -- group
        { "<leader>d", group = "debug" }, -- group
        { "<leader>u", group = "ui" }, -- group
        { "<leader>w", group = "windows" }, -- group
        { "<leader>t", group = "trouble" }, -- group
      })
      wk.setup()
    end,
  },
}
