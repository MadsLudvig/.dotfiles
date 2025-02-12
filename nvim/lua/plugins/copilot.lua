return {
  "github/copilot.vim",
  config = function()
    -- Optional: Configure Copilot settings
    vim.g.copilot_no_tab_map = true -- Prevent Copilot from mapping the Tab key
    vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
  end,
}
