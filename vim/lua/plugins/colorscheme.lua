-- LazyVim already ships the full catppuccin spec (LSP undercurls, all plugin
-- integrations, and the bufferline highlight patch), so we only override the
-- bits we care about here.
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha, or "auto"
      background = { light = "latte", dark = "mocha" },
      term_colors = true,
    },
  },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
