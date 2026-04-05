return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  keys = {
    { "<leader>gD", "<cmd>DiffviewOpen main<cr>", desc = "Diff against main" },
    { "<leader>gC", "<cmd>DiffviewClose<cr>", desc = "Close Diff View" },
    { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
  },
  config = function()
    require("diffview").setup({
      -- 設定はデフォルトでOK（カスタマイズしたければここに追加）
    })
  end,
}
