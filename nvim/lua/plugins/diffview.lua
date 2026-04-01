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
    { "<leader>gd", "<cmd>DiffviewOpen main<cr>", desc = "Diff against main" },
    { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diff View" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
  },
  config = function()
    require("diffview").setup({
      -- 設定はデフォルトでOK（カスタマイズしたければここに追加）
    })
  end,
}
