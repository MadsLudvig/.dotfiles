return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      "nvim-telescope/telescope-ui-select.nvim",
      {
        -- dir = "~/Documents/Github/telescope-stregsystem",
        "madsludvig/telescope-stregsystem",
        dependencies = {
          "rcarriga/nvim-notify",
        },
      },
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },

    cmd = { "Telescope" },

    -- stylua: ignore
    keys = {
      vim.keymap.set("n", "<leader><leader>", function() require("telescope.builtin").buffers() end, { desc = "[ ] Find buffers" }),
      vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "[F]ind [F]iles" }),
      vim.keymap.set("n", "<leader>fc", function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") }) end, { desc = "[F]ind [C]onfig Files" }),
      vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").git_files() end, { desc = "[F]ind [G]it Files" }),
      vim.keymap.set("n", "<leader>fr", function() require("telescope.builtin").oldfiles() end, { desc = "[F]ind [R]ecent Files" }),
      vim.keymap.set("n", "<leader>gc", function() require("telescope.builtin").git_commits() end, { desc = "[G]it [C]ommits" }),
      vim.keymap.set("n", "<leader>gs", function() require("telescope.builtin").git_status() end, { desc = "[G]it [S]tatus" }),
      vim.keymap.set("n", "<leader>sh", function() require("telescope.builtin").help_tags() end, { desc = "[S]earch [H]elp" }),
      vim.keymap.set("n", "<leader>sk", function() require("telescope.builtin").keymaps() end, { desc = "[S]earch [K]eymaps" }),
      vim.keymap.set("n", "<leader>sf", function() require("telescope.builtin").find_files() end, { desc = "[S]earch [F]iles" }),
      vim.keymap.set("n", "<leader>sb", function() require("telescope.builtin").builtin() end, { desc = "[S]earch [B]uiltin telescope.builtin" }),
      vim.keymap.set("n", "<leader>sw", function() require("telescope.builtin").grep_string() end, { desc = "[S]earch current [W]ord" }),
      vim.keymap.set("n", "<leader>sg", function() require("telescope.builtin").live_grep() end, { desc = "[S]earch by [G]rep" }),
      vim.keymap.set("n", "<leader>sd", function() require("telescope.builtin").diagnostics() end, { desc = "[S]earch [D]iagnostics" }),
      vim.keymap.set("n", "<leader>sr", function() require("telescope.builtin").oldfiles() end, { desc = "[S]earch [R]ecent Files" }),
      vim.keymap.set("n", "<leader>uc", function() require("telescope.builtin").colorscheme({ enable_preview = true }) end, { desc = "Change Colorscheme" }),
      vim.keymap.set("n", "<leader>-", "<cmd>Telescope stregsystem<CR>", { desc = "[-]StregSystem" }),
      vim.keymap.set("n", "<leader>/", function()
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "[/] Fuzzily search in current buffer" }),

      vim.keymap.set("n", "<leader>s/", function()
        require("telescope.builtin").live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end, { desc = "[S]earch [/] in Open Files" }),
    },

    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
          ["stregsystem"] = {
            username = "test",
          },
        },
      })

      -- Enable telescope extensions, if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")
      pcall(require("telescope").load_extension, "stregsystem")
    end,
  },
}
