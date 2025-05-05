-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
lvim.builtin.alpha.dashboard.section.header.val = {
  "  ⢀⣀                                                ⣰⣶   ⢀⣤⣄             ",
  "  ⢸⣿                                          ⣀⡀   ⣰⣿⠏   ⠘⠿⠟             ",
  "  ⣿⡟      ⣤⡄   ⣠⣤  ⢠⣤⣀⣤⣤⣤⡀   ⢀⣤⣤⣤⣤⡀   ⢠⣤⢀⣤⣤⣄  ⣿⣿  ⢰⣿⠏  ⣶⣶⣶⣶⡦   ⢠⣶⣦⣴⣦⣠⣴⣦⡀ ",
  " ⢠⣿⡇     ⢠⣿⠇   ⣿⡇  ⣿⡿⠉ ⠈⣿⣧  ⠰⠿⠋  ⢹⣿   ⣿⡿⠋ ⠹⠿  ⢻⣿⡇⢠⣿⡟   ⠈⠉⢹⣿⡇   ⢸⣿⡏⢹⣿⡏⢹⣿⡇ ",
  " ⢸⣿      ⢸⣿   ⢰⣿⠃ ⢠⣿⡇   ⣿⡇  ⣠⣴⡶⠶⠶⣿⣿  ⢠⣿⡇      ⢸⣿⣇⣿⡿      ⣿⣿⠁   ⣿⣿ ⣾⣿ ⣾⣿⠁ ",
  " ⣿⣟      ⢻⣿⡀ ⢀⣼⣿  ⢸⣿   ⢰⣿⠇ ⢰⣿⣇  ⣠⣿⡏  ⢸⣿       ⢸⣿⣿⣿⠁   ⣀⣀⣠⣿⣿⣀⡀ ⢠⣿⡟⢠⣿⡟⢀⣿⡿  ",
  " ⠛⠛⠛⠛⠛⠛⠁ ⠈⠛⠿⠟⠋⠛⠃  ⠛⠛   ⠘⠛   ⠙⠿⠿⠛⠙⠛⠃  ⠚⠛       ⠘⠿⠿⠃    ⠿⠿⠿⠿⠿⠿⠿ ⠸⠿⠇⠸⠿⠇⠸⠿⠇  ",
}


-- KEYBINDINGS
lvim.keys.normal_mode["<leader>bd"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<leader>z"] = ":ZenMode<CR>"

-- MAP q TO RECORD MACRO BECAUSE ???
vim.api.nvim_set_keymap('n', 'q', 'q', { noremap = true, silent = false })
vim.api.nvim_create_autocmd({"RecordingEnter", "RecordingLeave"}, {
  callback = function(event)
    if event.event == "RecordingEnter" then
      print("Recording macro @" .. vim.fn.reg_recording())
    elseif event.event == "RecordingLeave" then
      vim.defer_fn(function()
        print("") -- Clear the message after a short delay
      end, 500) -- 1000ms = 1 second
    end
  end,
})

-- WHICH KEY MAPPINGS
lvim.builtin.which_key.mappings["y"] = {
  "<cmd>Yazi<CR>", "Open Yazi"
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Open terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  h = { "<cmd>ToggleTerm direction=horizontal size=10<cr>", "Horizontal terminal"},
  v = { "<cmd>ToggleTerm direction=vertical size=50<cr>", "Vertical terminal"},
}
lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  f = { "<cmd>Telescope find_files<cr>", "Find files" },
  g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
}
lvim.builtin.which_key.mappings["b"] = {
  name = "Buffers",
  n = { "<cmd>enew<cr>", "New buffer" },
  d = { "<cmd>BufferKill<cr>", "Destroy buffer" },
}

lvim.builtin.which_key.mappings["sg"] = {
  "<cmd>Telescope live_grep<CR>", "Live grep"
}
lvim.builtin.which_key.mappings["z"] = {
  "<cmd>ZenMode<CR>", "Toggle Zen mode"
}

lvim.builtin.which_key.mappings["v"] = {
  name = "Virtual environment",
  s = { "<cmd>VenvSelect<cr>", "Venv select" },
}

lvim.builtin.which_key.mappings["bd"] = {
  "<cmd>BufferKill<cr>", "Destroy buffer",
}

lvim.builtin.which_key.mappings["bn"] = {
  "<cmd>enew<cr>", "New buffer",
}

-- COLOR SCHEME
lvim.colorscheme = "dracula"

-- PLUGINS
lvim.plugins = {
  {
  "binhtran432k/dracula.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  },
  -- Lua
{
  "folke/zen-mode.nvim",
  opts = {
  }
},
  {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
},
{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},
{
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>y",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
},
  {
  "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
  lazy = false,
  branch = "regexp", -- This is the regexp branch, use this for the new version
  config = function()
      require("venv-selector").setup()
    end,
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
    },
},
}

