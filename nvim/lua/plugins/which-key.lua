return {
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VeryLazy", -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require("which-key").setup()

      -- Document existing key chains
      require("which-key").register({
        ["g"] = { name = "+goto", _ = "which_key_ignore" },
        ["<leader>b"] = { name = "+buffer", _ = "which_key_ignore" },
        ["<leader>c"] = { name = "+code", _ = "which_key_ignore" },
        ["<leader>f"] = { name = "+file/find", _ = "which_key_ignore" },
        ["<leader>g"] = { name = "+git", _ = "which_key_ignore" },
        ["<leader>q"] = { name = "+quit/session", _ = "which_key_ignore" },
        ["<leader>s"] = { name = "+search", _ = "which_key_ignore" },
        ["<leader>d"] = { name = "+debug", _ = "which_key_ignore" },
        ["<leader>u"] = { name = "+ui", _ = "which_key_ignore" },
        ["<leader>w"] = { name = "+windows", _ = "which_key_ignore" },
        ["<leader>t"] = { name = "+trouble", _ = "which_key_ignore" },
      })
    end,
  },
}
