return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    name = "kanagawa",
    config = function()
      require("kanagawa").setup({})
      vim.cmd("colorscheme kanagawa")
    end,
  },
  -- {
  --   "rose-pine/neovim",
  --   priority = 1000,
  --   name = "rose-pine",
  --   config = function()
  --     require("rose-pine").setup({})
  --     vim.cmd("colorscheme rose-pine")
  --   end,
  -- },
  -- {
  --   "navarasu/onedark.nvim",
  --   priority = 1000,
  --   name = "onedark",
  --   config = function()
  --     require("onedark").setup({
  --       style = "darker",
  --     })
  --     require("onedark").load()
  --     vim.cmd("colorscheme onedark")
  --   end,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   priority = 1000,
  --   name = "catppuccin",
  --   config = function()
  --     -- local color = "#14141f"
  --     require("catppuccin").setup({
  --       -- color_overrides = {
  --       --   mocha = {
  --       --     base = color,
  --       --     mantle = color,
  --       --     crust = color,
  --       --   },
  --       -- },
  --     })
  --     vim.cmd("colorscheme catppuccin")
  -- },
  --   end,
}
