return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- explorer (サイドバー) の設定を上書き
      opts.explorer = vim.tbl_deep_extend("force", opts.explorer or {}, {
        hidden = true,
        ignored = true,
      })
      -- picker (検索画面) も同様にしたい場合
      opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      })
    end,
  },
}
