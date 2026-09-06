return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true, -- show dotfiles (toggle at runtime with H)
          ignored = true, -- show gitignored files (toggle at runtime with I)
        },
      },
    },
  },
}
