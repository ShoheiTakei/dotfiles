local transparent = true

local groups = { "Normal", "NormalNC", "NormalFloat", "SignColumn", "FoldColumn" }

local function apply_transparent(enabled)
  transparent = enabled
  if enabled then
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
  else
    vim.cmd.colorscheme(vim.g.colors_name)
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    if transparent then
      vim.schedule(function()
        apply_transparent(true)
      end)
    end
  end,
})

vim.keymap.set("n", "<leader>uT", function()
  apply_transparent(not transparent)
end, { desc = "Toggle Transparent" })

return {}
