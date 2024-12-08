vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set number relativenumber")
vim.wo.cursorline = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup('plugins')



-- set the lightline coloscheme
--[[
vim.g.lightline = {
    -- colorscheme = 'tender',
    -- colorscheme = 'wombat',
    colorscheme = 'PaperColor',
    background = 'light',
}
--]]

-- lsp settings
-- start lsp
-- vim.lsp.start()
-- vim.g.inlay_hints_visible = true
-- vim.lsp.inlay_hint.enable(bufnr, true)
-- vim.lsp.inlay_hint.enable(0, not lsp.inlay_hint.is_enabled())
-- vim.lsp.inlay_hint.enable(true);
-- vim.lsp.inlay_hint.enable(0, true);

-- remove built in status line
vim.cmd("set noshowmode")

-- set colorscheme
-- vim.cmd("colorscheme carbonfox")
-- vim.cmd("colorscheme zephyr")
-- vim.cmd("colorscheme monet")
-- vim.cmd("colorscheme tender")
-- vim.cmd("colorscheme sonokai")
-- vim.cmd("colorscheme meadow")
vim.cmd("colorscheme cyberdream")

-- open tree on neovim start
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end
-- custom tree toggle command
vim.cmd([[command Tree NvimTreeToggle]])

-- open minimap when file is opened
-- vim.cmd([[autocmd BufEnter * Minimap]])

-- open tree on neovim start
vim.cmd([[autocmd VimEnter * Tree]])

-- coq COQ Coq settings
-- open COQ on nvim start
-- vim.cmd([[autocmd VimEnter * COQnow --shut-up]])
vim.g.coq_settings = {
    keymap = {
        recommended = false,
    },
}
-- Keybindings
vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap(
  "i",
  "<CR>",
  [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
  { expr = true, silent = true }
)
vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })

-- open toggleterm when alt t is pressed
-- vim.api.nvim_set_keymap('n', '<A-t>', ':ToggleTerm<CR>', { noremap = true, silent = true })
--
-- reset the exit terminal mode keybind
-- vim.keymap.set('t', '<Esc>', [[<C-\><C-n><C-w><C-w><C-w><C-w>]])


-- VimTex Config
vim.g.vimtex_view_method = 'zathura'  -- Use Zathura as PDF viewer
vim.g.vimtex_indent_enabled = 1
vim.g.vimtex_view_general_options = "--synctex-forward @line:@col:@tex"
vim.g.vimtex_compiler_method = 'latexmk'  -- Use latexmk for compilation
vim.g.vimtex_quickfix_mode = 0  -- Disable auto-opening quickfix window on errors
vim.g.tex_flavor = 'latex'  -- Set flavor to LaTeX
vim.g.vimtex_complete_enabled = 1  -- Enable completion

-- Optional: Custom mappings for VimTeX
vim.api.nvim_set_keymap('n', '<leader>ll', '<cmd>VimtexCompile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lv', '<cmd>VimtexView<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lc', '<cmd>VimtexClean<CR>', { noremap = true, silent = true })
