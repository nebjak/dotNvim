return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot", -- lazy-load on :Copilot command
  event = "InsertEnter", -- or "BufReadPre" to load sooner
  config = function()
    require("copilot").setup({
      copilot_model = "claude-4.5",
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-h>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
        help = false,
        gitcommit = true,
        gitrebase = false,
        ["*"] = true, -- enable for all other filetypes
      },
    })
  end,
}
