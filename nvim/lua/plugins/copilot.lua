return {
  "github/copilot.vim",
  config = function()
    -- Optional: Configure Copilot settings
    vim.g.copilot_no_tab_map = true -- Prevent Copilot from mapping the Tab key
    vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
    vim.g.copilot_model = "claude-3-7-sonnet"
  end,
}
