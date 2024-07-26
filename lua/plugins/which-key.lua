return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    require("which-key").setup()

    require("which-key").add {
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]ab' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>f', group = "[F]ormat" },
    }
  end
}
