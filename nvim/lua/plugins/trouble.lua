return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>tx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>tX", "<cmd>Trouble diagnostics", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>tL", "<cmd>Trouble loclist<cr>", desc = "Location List (Trouble)" },
      { "<leader>tQ", "<cmd>Trouble qflist togggle<cr>", desc = "Quickfix List (Trouble)" },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  },
}
