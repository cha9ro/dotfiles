return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        group_empty_dirs = true,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            modified = "\\U+F040",
            untracked = "\\U+F059",
          },
        },
      },
    },
  },
}
