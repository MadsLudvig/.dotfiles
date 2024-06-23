return {
  "pwntester/octo.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = { "Octo" },
  config = function()
    require("octo").setup()
  end,
  keys = {
    vim.keymap.set("n", "<leader>oa", "<cmd>Octo actions<CR>", { desc = "Octo Action" }),
    vim.keymap.set("n", "<leader>ora", "<cmd>Octo reviewer add<CR>", { desc = "Octo Reviewer Add" }),
    vim.keymap.set("n", "<leader>oca", "<cmd>Octo comment add<CR>", { desc = "Octo Comment Add" }),
    vim.keymap.set("n", "<leader>oaa", "<cmd>Octo assignee add<CR>", { desc = "Octo Comment Add" }),
    vim.keymap.set("n", "<leader>opc", "<cmd>Octo pr create<CR>", { desc = "Octo PR Create" }),
    vim.keymap.set("n", "<leader>opl", "<cmd>Octo pr list<CR>", { desc = "Octo PR List" }),
    vim.keymap.set("n", "<leader>opd", "<cmd>Octo pr draft<CR>", { desc = "Octo PR Draft" }),
  },
}
