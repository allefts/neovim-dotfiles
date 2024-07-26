local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.number = true
vim.g.mapleader = " "

local opts = {}

--require("vim-options")
require("lazy").setup("plugins", opts)

local builtin = require("telescope.builtin")

local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = { "c", "lua", "query", "elixir", "heex", "javascript", "html" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})

require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "deps",
      "_build",
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  }
}
require("telescope").load_extension("ui-select")

require('lualine').setup({ options = { theme = "ayu_dark" } })

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
  }
})

vim.cmd.colorscheme "moonfly"

-- Telescope
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal toggle current<CR>", {})

-- LSP
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "[G]o [D]eclaration" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "[G]o [D]efinition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "[G]o [I]mplementations" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[G]o [C]ode [A]ction" })

vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "[F]ormat [F]ile" })

-- TABS
vim.keymap.set("n", "<leader>tt", ":tabnew<CR>", { desc = "New [T]ab" })
vim.keymap.set("n", "<leader>te", ":tabclose<CR>", { desc = "[T]ab [E]xit" })
vim.keymap.set("n", "+", ":tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "_", ":tabprevious<CR>", { desc = "Previous Tab" })
