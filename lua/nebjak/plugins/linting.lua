return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Function to check if eslint config exists
    local function has_eslint_config()
      local config_files = {
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.json",
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
      }

      for _, config_file in ipairs(config_files) do
        if vim.fn.findfile(config_file, ".;") ~= "" then
          return true
        end
      end

      -- Check package.json for eslintConfig
      local package_json = vim.fn.findfile("package.json", ".;")
      if package_json ~= "" then
        local ok, content = pcall(vim.fn.readfile, package_json)
        if ok and content then
          local package_content = table.concat(content, "\n")
          if package_content:match('"eslintConfig"') then
            return true
          end
        end
      end

      return false
    end

    -- Set up linters conditionally
    lint.linters_by_ft = {}

    -- Only add eslint_d if config exists
    if has_eslint_config() then
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
      }
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        -- Only lint if we have linters configured for this filetype
        local ft = vim.bo.filetype
        if lint.linters_by_ft[ft] and #lint.linters_by_ft[ft] > 0 then
          lint.try_lint()
        end
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      local ft = vim.bo.filetype
      if lint.linters_by_ft[ft] and #lint.linters_by_ft[ft] > 0 then
        lint.try_lint()
      else
        vim.notify("No linters configured for filetype: " .. ft, vim.log.levels.INFO)
      end
    end, { desc = "Trigger linting for current file" })
  end,
}
