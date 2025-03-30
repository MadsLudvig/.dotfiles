return {
  {
    keys = {
      {
        "<leader>-",
        function()
          require("stregsystem").stregsystem()
        end,
      },
    },
    dir = "~/github/madsludvig/stregsystem-snacks/",
    config = function()
      require("stregsystem").setup({
        endpoint = "https://stregsystem.fklub.dk/api/",
        username = "sudo",
      })
    end,
    dependencies = {
      {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
          picker = { enabled = true },
        },
      },
    },
  },
}
