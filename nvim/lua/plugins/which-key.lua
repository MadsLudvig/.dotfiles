return {
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VeryLazy", -- Sets the loading event to 'VimEnter'
    opts = {
      spec = {
        -- Groups
        { lhs = "g", group = "goto" }, -- "g" mappings group
        { lhs = "<leader>b", group = "buffer" }, -- "buffer" group
        { lhs = "<leader>c", group = "code" }, -- "code" group
        { lhs = "<leader>f", group = "file/find" }, -- "file/find" group
        { lhs = "<leader>g", group = "git" }, -- "git" group
        { lhs = "<leader>q", group = "quit/session" }, -- "quit/session" group
        { lhs = "<leader>s", group = "search" }, -- "search" group
        { lhs = "<leader>d", group = "debug" }, -- "debug" group
        { lhs = "<leader>u", group = "ui" }, -- "ui" group
        { lhs = "<leader>w", group = "windows" }, -- "windows" group
        { lhs = "<leader>t", group = "trouble" }, -- "trouble" group
      },
    },
    config = function() -- This is the function that runs, AFTER loading
      require("which-key").setup()
    end,
  },
}
